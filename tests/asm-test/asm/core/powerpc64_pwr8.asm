asm_test::fetch_nand::u8::acqrel:
        lwsync
0:
        lbarx             5, 0, 3
        nand              6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_nand::u8::seqcst:
        sync
0:
        lbarx             5, 0, 3
        nand              6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_nand::u8::acquire:
        mr                5, 3
0:
        lbarx             3, 0, 5
        nand              6, 4, 3
        stbcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_nand::u8::relaxed:
0:
        lbarx             5, 0, 3
        nand              6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_nand::u8::release:
        lwsync
0:
        lbarx             5, 0, 3
        nand              6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_nand::u16::acqrel:
        lwsync
0:
        lharx             5, 0, 3
        nand              6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_nand::u16::seqcst:
        sync
0:
        lharx             5, 0, 3
        nand              6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_nand::u16::acquire:
        mr                5, 3
0:
        lharx             3, 0, 5
        nand              6, 4, 3
        sthcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_nand::u16::relaxed:
0:
        lharx             5, 0, 3
        nand              6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_nand::u16::release:
        lwsync
0:
        lharx             5, 0, 3
        nand              6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_nand::u32::acqrel:
        lwsync
0:
        lwarx             5, 0, 3
        nand              6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_nand::u32::seqcst:
        sync
0:
        lwarx             5, 0, 3
        nand              6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_nand::u32::acquire:
        mr                5, 3
0:
        lwarx             3, 0, 5
        nand              6, 4, 3
        stwcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_nand::u32::relaxed:
0:
        lwarx             5, 0, 3
        nand              6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_nand::u32::release:
        lwsync
0:
        lwarx             5, 0, 3
        nand              6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_nand::u64::acqrel:
        lwsync
0:
        ldarx             5, 0, 3
        nand              6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_nand::u64::seqcst:
        sync
0:
        ldarx             5, 0, 3
        nand              6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_nand::u64::acquire:
        mr                5, 3
0:
        ldarx             3, 0, 5
        nand              6, 4, 3
        stdcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_nand::u64::relaxed:
0:
        ldarx             5, 0, 3
        nand              6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_nand::u64::release:
        lwsync
0:
        ldarx             5, 0, 3
        nand              6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_nand::u128::acqrel:
        lwsync
0:
        lqarx             6, 0, 3
        nand              9, 5, 7
        nand              8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_nand::u128::seqcst:
        sync
0:
        lqarx             6, 0, 3
        nand              9, 5, 7
        nand              8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_nand::u128::acquire:
0:
        lqarx             6, 0, 3
        nand              9, 5, 7
        nand              8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_nand::u128::relaxed:
0:
        lqarx             6, 0, 3
        nand              9, 5, 7
        nand              8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_nand::u128::release:
        lwsync
0:
        lqarx             6, 0, 3
        nand              9, 5, 7
        nand              8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_umax::u8::acqrel:
        lwsync
0:
        lbarx             5, 0, 3
        cmplw             5, 4
        bt                1, 1f
        stbcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umax::u8::seqcst:
        sync
0:
        lbarx             5, 0, 3
        cmplw             5, 4
        bt                1, 1f
        stbcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umax::u8::acquire:
        mr                5, 3
0:
        lbarx             3, 0, 5
        cmplw             3, 4
        bt                1, 1f
        stbcx.            4, 0, 5
        bf                2, 0b
1:
        lwsync
        blr

asm_test::fetch_umax::u8::relaxed:
0:
        lbarx             5, 0, 3
        cmplw             5, 4
        bt                1, 1f
        stbcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umax::u8::release:
        lwsync
0:
        lbarx             5, 0, 3
        cmplw             5, 4
        bt                1, 1f
        stbcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umax::u16::acqrel:
        lwsync
0:
        lharx             5, 0, 3
        cmplw             5, 4
        bt                1, 1f
        sthcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umax::u16::seqcst:
        sync
0:
        lharx             5, 0, 3
        cmplw             5, 4
        bt                1, 1f
        sthcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umax::u16::acquire:
        mr                5, 3
0:
        lharx             3, 0, 5
        cmplw             3, 4
        bt                1, 1f
        sthcx.            4, 0, 5
        bf                2, 0b
1:
        lwsync
        blr

asm_test::fetch_umax::u16::relaxed:
0:
        lharx             5, 0, 3
        cmplw             5, 4
        bt                1, 1f
        sthcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umax::u16::release:
        lwsync
0:
        lharx             5, 0, 3
        cmplw             5, 4
        bt                1, 1f
        sthcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umax::u32::acqrel:
        lwsync
0:
        lwarx             5, 0, 3
        cmplw             5, 4
        bt                1, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umax::u32::seqcst:
        sync
0:
        lwarx             5, 0, 3
        cmplw             5, 4
        bt                1, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umax::u32::acquire:
        mr                5, 3
0:
        lwarx             3, 0, 5
        cmplw             3, 4
        bt                1, 1f
        stwcx.            4, 0, 5
        bf                2, 0b
1:
        lwsync
        blr

asm_test::fetch_umax::u32::relaxed:
0:
        lwarx             5, 0, 3
        cmplw             5, 4
        bt                1, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umax::u32::release:
        lwsync
0:
        lwarx             5, 0, 3
        cmplw             5, 4
        bt                1, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umax::u64::acqrel:
        lwsync
0:
        ldarx             5, 0, 3
        cmpld             5, 4
        bt                1, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umax::u64::seqcst:
        sync
0:
        ldarx             5, 0, 3
        cmpld             5, 4
        bt                1, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umax::u64::acquire:
        mr                5, 3
0:
        ldarx             3, 0, 5
        cmpld             3, 4
        bt                1, 1f
        stdcx.            4, 0, 5
        bf                2, 0b
1:
        lwsync
        blr

asm_test::fetch_umax::u64::relaxed:
0:
        ldarx             5, 0, 3
        cmpld             5, 4
        bt                1, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umax::u64::release:
        lwsync
0:
        ldarx             5, 0, 3
        cmpld             5, 4
        bt                1, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umax::u128::acqrel:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpld             1, 5, 7
        lwsync
        crandc            20, 1, 2
        mr                9, 6
        crand             21, 2, 5
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_umax::u128::seqcst:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpld             1, 5, 7
        sync
        crandc            20, 1, 2
        mr                9, 6
        crand             21, 2, 5
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_umax::u128::acquire:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpld             1, 5, 7
        crandc            20, 1, 2
        mr                9, 6
        crand             21, 2, 5
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_umax::u128::relaxed:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpld             1, 5, 7
        crandc            20, 1, 2
        mr                9, 6
        crand             21, 2, 5
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_umax::u128::release:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpld             1, 5, 7
        lwsync
        crandc            20, 1, 2
        mr                9, 6
        crand             21, 2, 5
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_umin::u8::acqrel:
        lwsync
0:
        lbarx             5, 0, 3
        cmplw             5, 4
        bt                0, 1f
        stbcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umin::u8::seqcst:
        sync
0:
        lbarx             5, 0, 3
        cmplw             5, 4
        bt                0, 1f
        stbcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umin::u8::acquire:
        mr                5, 3
0:
        lbarx             3, 0, 5
        cmplw             3, 4
        bt                0, 1f
        stbcx.            4, 0, 5
        bf                2, 0b
1:
        lwsync
        blr

asm_test::fetch_umin::u8::relaxed:
0:
        lbarx             5, 0, 3
        cmplw             5, 4
        bt                0, 1f
        stbcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umin::u8::release:
        lwsync
0:
        lbarx             5, 0, 3
        cmplw             5, 4
        bt                0, 1f
        stbcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umin::u16::acqrel:
        lwsync
0:
        lharx             5, 0, 3
        cmplw             5, 4
        bt                0, 1f
        sthcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umin::u16::seqcst:
        sync
0:
        lharx             5, 0, 3
        cmplw             5, 4
        bt                0, 1f
        sthcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umin::u16::acquire:
        mr                5, 3
0:
        lharx             3, 0, 5
        cmplw             3, 4
        bt                0, 1f
        sthcx.            4, 0, 5
        bf                2, 0b
1:
        lwsync
        blr

asm_test::fetch_umin::u16::relaxed:
0:
        lharx             5, 0, 3
        cmplw             5, 4
        bt                0, 1f
        sthcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umin::u16::release:
        lwsync
0:
        lharx             5, 0, 3
        cmplw             5, 4
        bt                0, 1f
        sthcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umin::u32::acqrel:
        lwsync
0:
        lwarx             5, 0, 3
        cmplw             5, 4
        bt                0, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umin::u32::seqcst:
        sync
0:
        lwarx             5, 0, 3
        cmplw             5, 4
        bt                0, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umin::u32::acquire:
        mr                5, 3
0:
        lwarx             3, 0, 5
        cmplw             3, 4
        bt                0, 1f
        stwcx.            4, 0, 5
        bf                2, 0b
1:
        lwsync
        blr

asm_test::fetch_umin::u32::relaxed:
0:
        lwarx             5, 0, 3
        cmplw             5, 4
        bt                0, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umin::u32::release:
        lwsync
0:
        lwarx             5, 0, 3
        cmplw             5, 4
        bt                0, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umin::u64::acqrel:
        lwsync
0:
        ldarx             5, 0, 3
        cmpld             5, 4
        bt                0, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umin::u64::seqcst:
        sync
0:
        ldarx             5, 0, 3
        cmpld             5, 4
        bt                0, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_umin::u64::acquire:
        mr                5, 3
0:
        ldarx             3, 0, 5
        cmpld             3, 4
        bt                0, 1f
        stdcx.            4, 0, 5
        bf                2, 0b
1:
        lwsync
        blr

asm_test::fetch_umin::u64::relaxed:
0:
        ldarx             5, 0, 3
        cmpld             5, 4
        bt                0, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umin::u64::release:
        lwsync
0:
        ldarx             5, 0, 3
        cmpld             5, 4
        bt                0, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_umin::u128::acqrel:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpld             1, 5, 7
        lwsync
        crandc            20, 0, 2
        mr                9, 6
        crand             21, 2, 4
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_umin::u128::seqcst:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpld             1, 5, 7
        sync
        crandc            20, 0, 2
        mr                9, 6
        crand             21, 2, 4
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_umin::u128::acquire:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpld             1, 5, 7
        crandc            20, 0, 2
        mr                9, 6
        crand             21, 2, 4
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_umin::u128::relaxed:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpld             1, 5, 7
        crandc            20, 0, 2
        mr                9, 6
        crand             21, 2, 4
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_umin::u128::release:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpld             1, 5, 7
        lwsync
        crandc            20, 0, 2
        mr                9, 6
        crand             21, 2, 4
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::compare_exchange::u8::acqrel_seqcst:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        clrlwi            5, 5, 24
        nop
        nop
0:
        stbcx.            5, 0, 3
        bt                2, 2f
        lbarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::seqcst_seqcst:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sync
        clrlwi            5, 5, 24
        nop
        nop
0:
        stbcx.            5, 0, 3
        bt                2, 2f
        lbarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::acqrel_acquire:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        clrlwi            5, 5, 24
        nop
        nop
0:
        stbcx.            5, 0, 3
        bt                2, 2f
        lbarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::acqrel_relaxed:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        clrlwi            5, 5, 24
        nop
        nop
0:
        stbcx.            5, 0, 3
        bt                2, 2f
        lbarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::acquire_seqcst:
        clrlwi            5, 5, 24
        clrlwi            6, 4, 24
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::relaxed_seqcst:
        clrlwi            5, 5, 24
        clrlwi            6, 4, 24
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::release_seqcst:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        clrlwi            5, 5, 24
        nop
        nop
0:
        stbcx.            5, 0, 3
        bt                2, 2f
        lbarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::seqcst_acquire:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sync
        clrlwi            5, 5, 24
        nop
        nop
0:
        stbcx.            5, 0, 3
        bt                2, 2f
        lbarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::seqcst_relaxed:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sync
        clrlwi            5, 5, 24
        nop
        nop
0:
        stbcx.            5, 0, 3
        bt                2, 2f
        lbarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::acquire_acquire:
        clrlwi            5, 5, 24
        clrlwi            6, 4, 24
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::acquire_relaxed:
        clrlwi            5, 5, 24
        clrlwi            6, 4, 24
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::relaxed_acquire:
        clrlwi            5, 5, 24
        clrlwi            6, 4, 24
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::relaxed_relaxed:
        clrlwi            5, 5, 24
        clrlwi            6, 4, 24
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::release_acquire:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        clrlwi            5, 5, 24
        nop
        nop
0:
        stbcx.            5, 0, 3
        bt                2, 2f
        lbarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u8::release_relaxed:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        clrlwi            5, 5, 24
        nop
        nop
0:
        stbcx.            5, 0, 3
        bt                2, 2f
        lbarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::acqrel_seqcst:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        clrlwi            5, 5, 16
        nop
        nop
0:
        sthcx.            5, 0, 3
        bt                2, 2f
        lharx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::seqcst_seqcst:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sync
        clrlwi            5, 5, 16
        nop
        nop
0:
        sthcx.            5, 0, 3
        bt                2, 2f
        lharx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::acqrel_acquire:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        clrlwi            5, 5, 16
        nop
        nop
0:
        sthcx.            5, 0, 3
        bt                2, 2f
        lharx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::acqrel_relaxed:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        clrlwi            5, 5, 16
        nop
        nop
0:
        sthcx.            5, 0, 3
        bt                2, 2f
        lharx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::acquire_seqcst:
        clrlwi            5, 5, 16
        clrlwi            6, 4, 16
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::relaxed_seqcst:
        clrlwi            5, 5, 16
        clrlwi            6, 4, 16
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::release_seqcst:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        clrlwi            5, 5, 16
        nop
        nop
0:
        sthcx.            5, 0, 3
        bt                2, 2f
        lharx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::seqcst_acquire:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sync
        clrlwi            5, 5, 16
        nop
        nop
0:
        sthcx.            5, 0, 3
        bt                2, 2f
        lharx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::seqcst_relaxed:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sync
        clrlwi            5, 5, 16
        nop
        nop
0:
        sthcx.            5, 0, 3
        bt                2, 2f
        lharx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::acquire_acquire:
        clrlwi            5, 5, 16
        clrlwi            6, 4, 16
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::acquire_relaxed:
        clrlwi            5, 5, 16
        clrlwi            6, 4, 16
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::relaxed_acquire:
        clrlwi            5, 5, 16
        clrlwi            6, 4, 16
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::relaxed_relaxed:
        clrlwi            5, 5, 16
        clrlwi            6, 4, 16
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::release_acquire:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        clrlwi            5, 5, 16
        nop
        nop
0:
        sthcx.            5, 0, 3
        bt                2, 2f
        lharx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u16::release_relaxed:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        clrlwi            5, 5, 16
        nop
        nop
0:
        sthcx.            5, 0, 3
        bt                2, 2f
        lharx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::acqrel_seqcst:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        nop
        nop
        nop
0:
        stwcx.            5, 0, 3
        bt                2, 2f
        lwarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::seqcst_seqcst:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sync
        nop
        nop
        nop
0:
        stwcx.            5, 0, 3
        bt                2, 2f
        lwarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::acqrel_acquire:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        nop
        nop
        nop
0:
        stwcx.            5, 0, 3
        bt                2, 2f
        lwarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::acqrel_relaxed:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        nop
        nop
        nop
0:
        stwcx.            5, 0, 3
        bt                2, 2f
        lwarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::acquire_seqcst:
        mr                6, 4
        nop
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        stwcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::relaxed_seqcst:
        mr                6, 4
        nop
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        stwcx.            5, 0, 3
        bf                2, 0b
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::release_seqcst:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        nop
        nop
        nop
0:
        stwcx.            5, 0, 3
        bt                2, 2f
        lwarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::seqcst_acquire:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sync
        nop
        nop
        nop
0:
        stwcx.            5, 0, 3
        bt                2, 2f
        lwarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::seqcst_relaxed:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        sync
        nop
        nop
        nop
0:
        stwcx.            5, 0, 3
        bt                2, 2f
        lwarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::acquire_acquire:
        mr                6, 4
        nop
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        stwcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::acquire_relaxed:
        mr                6, 4
        nop
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        stwcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::relaxed_acquire:
        mr                6, 4
        nop
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        stwcx.            5, 0, 3
        bf                2, 0b
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::relaxed_relaxed:
        mr                6, 4
        nop
        nop
        nop
        nop
        nop
        nop
        nop
0:
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        stwcx.            5, 0, 3
        bf                2, 0b
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::release_acquire:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        nop
        nop
        nop
0:
        stwcx.            5, 0, 3
        bt                2, 2f
        lwarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u32::release_relaxed:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 1f
        lwsync
        nop
        nop
        nop
0:
        stwcx.            5, 0, 3
        bt                2, 2f
        lwarx             4, 0, 3
        cmplw             4, 6
        bt                2, 0b
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::acqrel_seqcst:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        lwsync
        nop
        nop
        nop
0:
        stdcx.            5, 0, 3
        bt                2, 2f
        ldarx             4, 0, 3
        cmpld             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::seqcst_seqcst:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        sync
        nop
        nop
        nop
0:
        stdcx.            5, 0, 3
        bt                2, 2f
        ldarx             4, 0, 3
        cmpld             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::acqrel_acquire:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        lwsync
        nop
        nop
        nop
0:
        stdcx.            5, 0, 3
        bt                2, 2f
        ldarx             4, 0, 3
        cmpld             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::acqrel_relaxed:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        lwsync
        nop
        nop
        nop
0:
        stdcx.            5, 0, 3
        bt                2, 2f
        ldarx             4, 0, 3
        cmpld             4, 6
        bt                2, 0b
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::acquire_seqcst:
        mr                6, 4
        nop
        nop
        nop
        nop
        nop
        nop
        nop
0:
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        stdcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::relaxed_seqcst:
        mr                6, 4
        nop
        nop
        nop
        nop
        nop
        nop
        nop
0:
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        stdcx.            5, 0, 3
        bf                2, 0b
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::release_seqcst:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        lwsync
        nop
        nop
        nop
0:
        stdcx.            5, 0, 3
        bt                2, 2f
        ldarx             4, 0, 3
        cmpld             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::seqcst_acquire:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        sync
        nop
        nop
        nop
0:
        stdcx.            5, 0, 3
        bt                2, 2f
        ldarx             4, 0, 3
        cmpld             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::seqcst_relaxed:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        sync
        nop
        nop
        nop
0:
        stdcx.            5, 0, 3
        bt                2, 2f
        ldarx             4, 0, 3
        cmpld             4, 6
        bt                2, 0b
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::acquire_acquire:
        mr                6, 4
        nop
        nop
        nop
        nop
        nop
        nop
        nop
0:
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        stdcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::acquire_relaxed:
        mr                6, 4
        nop
        nop
        nop
        nop
        nop
        nop
        nop
0:
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        stdcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::relaxed_acquire:
        mr                6, 4
        nop
        nop
        nop
        nop
        nop
        nop
        nop
0:
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        stdcx.            5, 0, 3
        bf                2, 0b
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::relaxed_relaxed:
        mr                6, 4
        nop
        nop
        nop
        nop
        nop
        nop
        nop
0:
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        stdcx.            5, 0, 3
        bf                2, 0b
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::release_acquire:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        lwsync
        nop
        nop
        nop
0:
        stdcx.            5, 0, 3
        bt                2, 2f
        ldarx             4, 0, 3
        cmpld             4, 6
        bt                2, 0b
1:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u64::release_relaxed:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 1f
        lwsync
        nop
        nop
        nop
0:
        stdcx.            5, 0, 3
        bt                2, 2f
        ldarx             4, 0, 3
        cmpld             4, 6
        bt                2, 0b
1:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
2:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange::u128::acqrel_seqcst:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::seqcst_seqcst:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::acqrel_acquire:
        std               28, -32(1)
        std               29, -24(1)
        lwsync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::acqrel_relaxed:
        std               28, -32(1)
        std               29, -24(1)
        lwsync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::acquire_seqcst:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::relaxed_seqcst:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::release_seqcst:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::seqcst_acquire:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::seqcst_relaxed:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::acquire_acquire:
        std               28, -32(1)
        std               29, -24(1)
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::acquire_relaxed:
        std               28, -32(1)
        std               29, -24(1)
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::relaxed_acquire:
        std               28, -32(1)
        std               29, -24(1)
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::relaxed_relaxed:
        std               28, -32(1)
        std               29, -24(1)
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::release_acquire:
        std               28, -32(1)
        std               29, -24(1)
        lwsync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange::u128::release_relaxed:
        std               28, -32(1)
        std               29, -24(1)
        lwsync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        lwsync
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        sync
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        lwsync
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        crclr             20
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        lwsync
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::release_seqcst:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        lwsync
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        sync
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        crclr             20
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        sync
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::acquire_acquire:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        crclr             20
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::release_acquire:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        lwsync
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u8::release_relaxed:
        clrlwi            6, 4, 24
        lbarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 24
        lwsync
        stbcx.            5, 0, 3
        bt                2, 1f
0:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        lwsync
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        sync
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        lwsync
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        crclr             20
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        lwsync
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::release_seqcst:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        lwsync
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        sync
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        crclr             20
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        sync
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::acquire_acquire:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        crclr             20
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::release_acquire:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        lwsync
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u16::release_relaxed:
        clrlwi            6, 4, 16
        lharx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        clrlwi            5, 5, 16
        lwsync
        sthcx.            5, 0, 3
        bt                2, 1f
0:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        lwsync
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        sync
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        lwsync
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        mr                6, 4
        lwarx             4, 0, 3
        crclr             20
        cmplw             4, 6
        bf                2, 0f
        lwsync
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::release_seqcst:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        lwsync
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        sync
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        mr                6, 4
        lwarx             4, 0, 3
        crclr             20
        cmplw             4, 6
        bf                2, 0f
        sync
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::acquire_acquire:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        mr                6, 4
        lwarx             4, 0, 3
        crclr             20
        cmplw             4, 6
        bf                2, 0f
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::release_acquire:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        lwsync
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u32::release_relaxed:
        mr                6, 4
        lwarx             4, 0, 3
        cmplw             4, 6
        bf                2, 0f
        lwsync
        stwcx.            5, 0, 3
        bt                2, 1f
0:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 0f
        lwsync
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 0f
        sync
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 0f
        lwsync
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        mr                6, 4
        ldarx             4, 0, 3
        crclr             20
        cmpld             4, 6
        bf                2, 0f
        lwsync
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 0f
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 0f
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::release_seqcst:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 0f
        lwsync
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 0f
        sync
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        mr                6, 4
        ldarx             4, 0, 3
        crclr             20
        cmpld             4, 6
        bf                2, 0f
        sync
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::acquire_acquire:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 0f
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        mr                6, 4
        ldarx             4, 0, 3
        crclr             20
        cmpld             4, 6
        bf                2, 0f
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        lwsync
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 0f
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 0f
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::release_acquire:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 0f
        lwsync
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        lwsync
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u64::release_relaxed:
        mr                6, 4
        ldarx             4, 0, 3
        cmpld             4, 6
        bf                2, 0f
        lwsync
        stdcx.            5, 0, 3
        bt                2, 1f
0:
        crclr             20
        li                3, 1
        isel              3, 0, 3, 20
        blr
1:
        crset             20
        li                3, 1
        isel              3, 0, 3, 20
        blr

asm_test::compare_exchange_weak::u128::acqrel_seqcst:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::seqcst_seqcst:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::acqrel_acquire:
        std               28, -32(1)
        std               29, -24(1)
        lwsync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::acqrel_relaxed:
        std               28, -32(1)
        std               29, -24(1)
        lwsync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::acquire_seqcst:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::relaxed_seqcst:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::release_seqcst:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::seqcst_acquire:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::seqcst_relaxed:
        std               28, -32(1)
        std               29, -24(1)
        sync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::acquire_acquire:
        std               28, -32(1)
        std               29, -24(1)
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::acquire_relaxed:
        std               28, -32(1)
        std               29, -24(1)
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::relaxed_acquire:
        std               28, -32(1)
        std               29, -24(1)
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::relaxed_relaxed:
        std               28, -32(1)
        std               29, -24(1)
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::release_acquire:
        std               28, -32(1)
        std               29, -24(1)
        lwsync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        lwsync
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::compare_exchange_weak::u128::release_relaxed:
        std               28, -32(1)
        std               29, -24(1)
        lwsync
0:
        lqarx             10, 0, 4
        xor               29, 11, 6
        xor               28, 10, 5
        or.               29, 29, 28
        bf                2, 1f
        mr                29, 8
        mr                28, 7
        stqcx.            28, 0, 4
        bf                2, 0b
1:
        ld                29, -24(1)
        ld                28, -32(1)
        xor               4, 5, 10
        xor               5, 6, 11
        std               11, 24(3)
        std               10, 16(3)
        or                4, 5, 4
        addic             5, 4, -1
        subfe             4, 5, 4
        li                5, 0
        std               5, 0(3)
        std               4, 8(3)
        blr

asm_test::load::u8::seqcst:
        sync
        lbz               3, 0(3)
        cmpd              7, 3, 3
        bf-               30, 0f
0:
        isync
        blr

asm_test::load::u8::acquire:
        lbz               3, 0(3)
        cmpd              7, 3, 3
        bf-               30, 0f
0:
        isync
        blr

asm_test::load::u8::relaxed:
        lbz               3, 0(3)
        blr

asm_test::load::u16::seqcst:
        sync
        lhz               3, 0(3)
        cmpd              7, 3, 3
        bf-               30, 0f
0:
        isync
        blr

asm_test::load::u16::acquire:
        lhz               3, 0(3)
        cmpd              7, 3, 3
        bf-               30, 0f
0:
        isync
        blr

asm_test::load::u16::relaxed:
        lhz               3, 0(3)
        blr

asm_test::load::u32::seqcst:
        sync
        lwz               3, 0(3)
        cmpd              7, 3, 3
        bf-               30, 0f
0:
        isync
        blr

asm_test::load::u32::acquire:
        lwz               3, 0(3)
        cmpd              7, 3, 3
        bf-               30, 0f
0:
        isync
        blr

asm_test::load::u32::relaxed:
        lwz               3, 0(3)
        blr

asm_test::load::u64::seqcst:
        sync
        ld                3, 0(3)
        cmpd              7, 3, 3
        bf-               30, 0f
0:
        isync
        blr

asm_test::load::u64::acquire:
        ld                3, 0(3)
        cmpd              7, 3, 3
        bf-               30, 0f
0:
        isync
        blr

asm_test::load::u64::relaxed:
        ld                3, 0(3)
        blr

asm_test::load::u128::seqcst:
        sync
        lq                4, 0(3)
        cmpd              7, 5, 5
        mr                3, 4
        bf-               30, 0f
0:
        isync
        mr                4, 5
        blr

asm_test::load::u128::acquire:
        lq                4, 0(3)
        cmpd              7, 5, 5
        mr                3, 4
        mr                4, 5
        bf-               30, 0f
0:
        isync
        blr

asm_test::load::u128::relaxed:
        lq                4, 0(3)
        mr                3, 4
        mr                4, 5
        blr

asm_test::swap::u8::acqrel:
        lwsync
0:
        lbarx             5, 0, 3
        stbcx.            4, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::swap::u8::seqcst:
        sync
0:
        lbarx             5, 0, 3
        stbcx.            4, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::swap::u8::acquire:
        mr                5, 3
0:
        lbarx             3, 0, 5
        stbcx.            4, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::swap::u8::relaxed:
0:
        lbarx             5, 0, 3
        stbcx.            4, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::swap::u8::release:
        lwsync
0:
        lbarx             5, 0, 3
        stbcx.            4, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::swap::u16::acqrel:
        lwsync
0:
        lharx             5, 0, 3
        sthcx.            4, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::swap::u16::seqcst:
        sync
0:
        lharx             5, 0, 3
        sthcx.            4, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::swap::u16::acquire:
        mr                5, 3
0:
        lharx             3, 0, 5
        sthcx.            4, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::swap::u16::relaxed:
0:
        lharx             5, 0, 3
        sthcx.            4, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::swap::u16::release:
        lwsync
0:
        lharx             5, 0, 3
        sthcx.            4, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::swap::u32::acqrel:
        lwsync
0:
        lwarx             5, 0, 3
        stwcx.            4, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::swap::u32::seqcst:
        sync
0:
        lwarx             5, 0, 3
        stwcx.            4, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::swap::u32::acquire:
        mr                5, 3
0:
        lwarx             3, 0, 5
        stwcx.            4, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::swap::u32::relaxed:
0:
        lwarx             5, 0, 3
        stwcx.            4, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::swap::u32::release:
        lwsync
0:
        lwarx             5, 0, 3
        stwcx.            4, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::swap::u64::acqrel:
        lwsync
0:
        ldarx             5, 0, 3
        stdcx.            4, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::swap::u64::seqcst:
        sync
0:
        ldarx             5, 0, 3
        stdcx.            4, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::swap::u64::acquire:
        mr                5, 3
0:
        ldarx             3, 0, 5
        stdcx.            4, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::swap::u64::relaxed:
0:
        ldarx             5, 0, 3
        stdcx.            4, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::swap::u64::release:
        lwsync
0:
        ldarx             5, 0, 3
        stdcx.            4, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::swap::u128::acqrel:
        lwsync
0:
        lqarx             6, 0, 3
        mr                9, 5
        mr                8, 4
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::swap::u128::seqcst:
        sync
0:
        lqarx             6, 0, 3
        mr                9, 5
        mr                8, 4
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::swap::u128::acquire:
0:
        lqarx             6, 0, 3
        mr                9, 5
        mr                8, 4
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::swap::u128::relaxed:
0:
        lqarx             6, 0, 3
        mr                9, 5
        mr                8, 4
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::swap::u128::release:
        lwsync
0:
        lqarx             6, 0, 3
        mr                9, 5
        mr                8, 4
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::store::u8::seqcst:
        sync
        stb               4, 0(3)
        blr

asm_test::store::u8::relaxed:
        stb               4, 0(3)
        blr

asm_test::store::u8::release:
        lwsync
        stb               4, 0(3)
        blr

asm_test::store::u16::seqcst:
        sync
        sth               4, 0(3)
        blr

asm_test::store::u16::relaxed:
        sth               4, 0(3)
        blr

asm_test::store::u16::release:
        lwsync
        sth               4, 0(3)
        blr

asm_test::store::u32::seqcst:
        sync
        stw               4, 0(3)
        blr

asm_test::store::u32::relaxed:
        stw               4, 0(3)
        blr

asm_test::store::u32::release:
        lwsync
        stw               4, 0(3)
        blr

asm_test::store::u64::seqcst:
        sync
        std               4, 0(3)
        blr

asm_test::store::u64::relaxed:
        std               4, 0(3)
        blr

asm_test::store::u64::release:
        lwsync
        std               4, 0(3)
        blr

asm_test::store::u128::seqcst:
        sync
        stq               4, 0(3)
        blr

asm_test::store::u128::relaxed:
        stq               4, 0(3)
        blr

asm_test::store::u128::release:
        lwsync
        stq               4, 0(3)
        blr

asm_test::fetch_or::u8::acqrel:
        lwsync
0:
        lbarx             5, 0, 3
        or                6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_or::u8::seqcst:
        sync
0:
        lbarx             5, 0, 3
        or                6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_or::u8::acquire:
        mr                5, 3
0:
        lbarx             3, 0, 5
        or                6, 4, 3
        stbcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_or::u8::relaxed:
0:
        lbarx             5, 0, 3
        or                6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_or::u8::release:
        lwsync
0:
        lbarx             5, 0, 3
        or                6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_or::u16::acqrel:
        lwsync
0:
        lharx             5, 0, 3
        or                6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_or::u16::seqcst:
        sync
0:
        lharx             5, 0, 3
        or                6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_or::u16::acquire:
        mr                5, 3
0:
        lharx             3, 0, 5
        or                6, 4, 3
        sthcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_or::u16::relaxed:
0:
        lharx             5, 0, 3
        or                6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_or::u16::release:
        lwsync
0:
        lharx             5, 0, 3
        or                6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_or::u32::acqrel:
        lwsync
0:
        lwarx             5, 0, 3
        or                6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_or::u32::seqcst:
        sync
0:
        lwarx             5, 0, 3
        or                6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_or::u32::acquire:
        mr                5, 3
0:
        lwarx             3, 0, 5
        or                6, 4, 3
        stwcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_or::u32::relaxed:
0:
        lwarx             5, 0, 3
        or                6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_or::u32::release:
        lwsync
0:
        lwarx             5, 0, 3
        or                6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_or::u64::acqrel:
        lwsync
0:
        ldarx             5, 0, 3
        or                6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_or::u64::seqcst:
        sync
0:
        ldarx             5, 0, 3
        or                6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_or::u64::acquire:
        mr                5, 3
0:
        ldarx             3, 0, 5
        or                6, 4, 3
        stdcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_or::u64::relaxed:
0:
        ldarx             5, 0, 3
        or                6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_or::u64::release:
        lwsync
0:
        ldarx             5, 0, 3
        or                6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_or::u128::acqrel:
        lwsync
0:
        lqarx             6, 0, 3
        or                9, 5, 7
        or                8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_or::u128::seqcst:
        sync
0:
        lqarx             6, 0, 3
        or                9, 5, 7
        or                8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_or::u128::acquire:
0:
        lqarx             6, 0, 3
        or                9, 5, 7
        or                8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_or::u128::relaxed:
0:
        lqarx             6, 0, 3
        or                9, 5, 7
        or                8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_or::u128::release:
        lwsync
0:
        lqarx             6, 0, 3
        or                9, 5, 7
        or                8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_add::u8::acqrel:
        lwsync
0:
        lbarx             5, 0, 3
        add               6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_add::u8::seqcst:
        sync
0:
        lbarx             5, 0, 3
        add               6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_add::u8::acquire:
        mr                5, 3
0:
        lbarx             3, 0, 5
        add               6, 4, 3
        stbcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_add::u8::relaxed:
0:
        lbarx             5, 0, 3
        add               6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_add::u8::release:
        lwsync
0:
        lbarx             5, 0, 3
        add               6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_add::u16::acqrel:
        lwsync
0:
        lharx             5, 0, 3
        add               6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_add::u16::seqcst:
        sync
0:
        lharx             5, 0, 3
        add               6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_add::u16::acquire:
        mr                5, 3
0:
        lharx             3, 0, 5
        add               6, 4, 3
        sthcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_add::u16::relaxed:
0:
        lharx             5, 0, 3
        add               6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_add::u16::release:
        lwsync
0:
        lharx             5, 0, 3
        add               6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_add::u32::acqrel:
        lwsync
0:
        lwarx             5, 0, 3
        add               6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_add::u32::seqcst:
        sync
0:
        lwarx             5, 0, 3
        add               6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_add::u32::acquire:
        mr                5, 3
0:
        lwarx             3, 0, 5
        add               6, 4, 3
        stwcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_add::u32::relaxed:
0:
        lwarx             5, 0, 3
        add               6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_add::u32::release:
        lwsync
0:
        lwarx             5, 0, 3
        add               6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_add::u64::acqrel:
        lwsync
0:
        ldarx             5, 0, 3
        add               6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_add::u64::seqcst:
        sync
0:
        ldarx             5, 0, 3
        add               6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_add::u64::acquire:
        mr                5, 3
0:
        ldarx             3, 0, 5
        add               6, 4, 3
        stdcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_add::u64::relaxed:
0:
        ldarx             5, 0, 3
        add               6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_add::u64::release:
        lwsync
0:
        ldarx             5, 0, 3
        add               6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_add::u128::acqrel:
        lwsync
0:
        lqarx             6, 0, 3
        addc              9, 5, 7
        adde              8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_add::u128::seqcst:
        sync
0:
        lqarx             6, 0, 3
        addc              9, 5, 7
        adde              8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_add::u128::acquire:
0:
        lqarx             6, 0, 3
        addc              9, 5, 7
        adde              8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_add::u128::relaxed:
0:
        lqarx             6, 0, 3
        addc              9, 5, 7
        adde              8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_add::u128::release:
        lwsync
0:
        lqarx             6, 0, 3
        addc              9, 5, 7
        adde              8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_and::u8::acqrel:
        lwsync
0:
        lbarx             5, 0, 3
        and               6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_and::u8::seqcst:
        sync
0:
        lbarx             5, 0, 3
        and               6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_and::u8::acquire:
        mr                5, 3
0:
        lbarx             3, 0, 5
        and               6, 4, 3
        stbcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_and::u8::relaxed:
0:
        lbarx             5, 0, 3
        and               6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_and::u8::release:
        lwsync
0:
        lbarx             5, 0, 3
        and               6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_and::u16::acqrel:
        lwsync
0:
        lharx             5, 0, 3
        and               6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_and::u16::seqcst:
        sync
0:
        lharx             5, 0, 3
        and               6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_and::u16::acquire:
        mr                5, 3
0:
        lharx             3, 0, 5
        and               6, 4, 3
        sthcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_and::u16::relaxed:
0:
        lharx             5, 0, 3
        and               6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_and::u16::release:
        lwsync
0:
        lharx             5, 0, 3
        and               6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_and::u32::acqrel:
        lwsync
0:
        lwarx             5, 0, 3
        and               6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_and::u32::seqcst:
        sync
0:
        lwarx             5, 0, 3
        and               6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_and::u32::acquire:
        mr                5, 3
0:
        lwarx             3, 0, 5
        and               6, 4, 3
        stwcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_and::u32::relaxed:
0:
        lwarx             5, 0, 3
        and               6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_and::u32::release:
        lwsync
0:
        lwarx             5, 0, 3
        and               6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_and::u64::acqrel:
        lwsync
0:
        ldarx             5, 0, 3
        and               6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_and::u64::seqcst:
        sync
0:
        ldarx             5, 0, 3
        and               6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_and::u64::acquire:
        mr                5, 3
0:
        ldarx             3, 0, 5
        and               6, 4, 3
        stdcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_and::u64::relaxed:
0:
        ldarx             5, 0, 3
        and               6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_and::u64::release:
        lwsync
0:
        ldarx             5, 0, 3
        and               6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_and::u128::acqrel:
        lwsync
0:
        lqarx             6, 0, 3
        and               9, 5, 7
        and               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_and::u128::seqcst:
        sync
0:
        lqarx             6, 0, 3
        and               9, 5, 7
        and               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_and::u128::acquire:
0:
        lqarx             6, 0, 3
        and               9, 5, 7
        and               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_and::u128::relaxed:
0:
        lqarx             6, 0, 3
        and               9, 5, 7
        and               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_and::u128::release:
        lwsync
0:
        lqarx             6, 0, 3
        and               9, 5, 7
        and               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_max::i8::acqrel:
        lwsync
        extsb             5, 4
0:
        lbarx             4, 0, 3
        extsb             6, 4
        cmpw              6, 5
        bt                1, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 4
        blr

asm_test::fetch_max::i8::seqcst:
        sync
        extsb             5, 4
0:
        lbarx             4, 0, 3
        extsb             6, 4
        cmpw              6, 5
        bt                1, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 4
        blr

asm_test::fetch_max::i8::acquire:
        extsb             5, 4
0:
        lbarx             4, 0, 3
        extsb             6, 4
        cmpw              6, 5
        bt                1, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 4
        blr

asm_test::fetch_max::i8::relaxed:
        extsb             5, 4
0:
        lbarx             4, 0, 3
        extsb             6, 4
        cmpw              6, 5
        bt                1, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
1:
        mr                3, 4
        blr

asm_test::fetch_max::i8::release:
        lwsync
        extsb             5, 4
0:
        lbarx             4, 0, 3
        extsb             6, 4
        cmpw              6, 5
        bt                1, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
1:
        mr                3, 4
        blr

asm_test::fetch_max::i16::acqrel:
        lwsync
        extsh             5, 4
0:
        lharx             4, 0, 3
        extsh             6, 4
        cmpw              6, 5
        bt                1, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 4
        blr

asm_test::fetch_max::i16::seqcst:
        sync
        extsh             5, 4
0:
        lharx             4, 0, 3
        extsh             6, 4
        cmpw              6, 5
        bt                1, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 4
        blr

asm_test::fetch_max::i16::acquire:
        extsh             5, 4
0:
        lharx             4, 0, 3
        extsh             6, 4
        cmpw              6, 5
        bt                1, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 4
        blr

asm_test::fetch_max::i16::relaxed:
        extsh             5, 4
0:
        lharx             4, 0, 3
        extsh             6, 4
        cmpw              6, 5
        bt                1, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
1:
        mr                3, 4
        blr

asm_test::fetch_max::i16::release:
        lwsync
        extsh             5, 4
0:
        lharx             4, 0, 3
        extsh             6, 4
        cmpw              6, 5
        bt                1, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
1:
        mr                3, 4
        blr

asm_test::fetch_max::i32::acqrel:
        lwsync
0:
        lwarx             5, 0, 3
        cmpw              5, 4
        bt                1, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_max::i32::seqcst:
        sync
0:
        lwarx             5, 0, 3
        cmpw              5, 4
        bt                1, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_max::i32::acquire:
        mr                5, 3
0:
        lwarx             3, 0, 5
        cmpw              3, 4
        bt                1, 1f
        stwcx.            4, 0, 5
        bf                2, 0b
1:
        lwsync
        blr

asm_test::fetch_max::i32::relaxed:
0:
        lwarx             5, 0, 3
        cmpw              5, 4
        bt                1, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_max::i32::release:
        lwsync
0:
        lwarx             5, 0, 3
        cmpw              5, 4
        bt                1, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_max::i64::acqrel:
        lwsync
0:
        ldarx             5, 0, 3
        cmpd              5, 4
        bt                1, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_max::i64::seqcst:
        sync
0:
        ldarx             5, 0, 3
        cmpd              5, 4
        bt                1, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_max::i64::acquire:
        mr                5, 3
0:
        ldarx             3, 0, 5
        cmpd              3, 4
        bt                1, 1f
        stdcx.            4, 0, 5
        bf                2, 0b
1:
        lwsync
        blr

asm_test::fetch_max::i64::relaxed:
0:
        ldarx             5, 0, 3
        cmpd              5, 4
        bt                1, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_max::i64::release:
        lwsync
0:
        ldarx             5, 0, 3
        cmpd              5, 4
        bt                1, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_max::i128::acqrel:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpd              1, 4, 6
        lwsync
        crandc            20, 5, 2
        cmpld             1, 5, 7
        mr                9, 6
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        crand             21, 2, 5
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_max::i128::seqcst:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpd              1, 4, 6
        sync
        crandc            20, 5, 2
        cmpld             1, 5, 7
        mr                9, 6
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        crand             21, 2, 5
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_max::i128::acquire:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpd              1, 4, 6
        crandc            20, 5, 2
        cmpld             1, 5, 7
        crand             21, 2, 5
        mr                9, 6
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_max::i128::relaxed:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpd              1, 4, 6
        crandc            20, 5, 2
        cmpld             1, 5, 7
        crand             21, 2, 5
        mr                9, 6
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_max::i128::release:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpd              1, 4, 6
        lwsync
        crandc            20, 5, 2
        cmpld             1, 5, 7
        mr                9, 6
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        crand             21, 2, 5
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_min::i8::acqrel:
        lwsync
        extsb             5, 4
0:
        lbarx             4, 0, 3
        extsb             6, 4
        cmpw              6, 5
        bt                0, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 4
        blr

asm_test::fetch_min::i8::seqcst:
        sync
        extsb             5, 4
0:
        lbarx             4, 0, 3
        extsb             6, 4
        cmpw              6, 5
        bt                0, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 4
        blr

asm_test::fetch_min::i8::acquire:
        extsb             5, 4
0:
        lbarx             4, 0, 3
        extsb             6, 4
        cmpw              6, 5
        bt                0, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 4
        blr

asm_test::fetch_min::i8::relaxed:
        extsb             5, 4
0:
        lbarx             4, 0, 3
        extsb             6, 4
        cmpw              6, 5
        bt                0, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
1:
        mr                3, 4
        blr

asm_test::fetch_min::i8::release:
        lwsync
        extsb             5, 4
0:
        lbarx             4, 0, 3
        extsb             6, 4
        cmpw              6, 5
        bt                0, 1f
        stbcx.            5, 0, 3
        bf                2, 0b
1:
        mr                3, 4
        blr

asm_test::fetch_min::i16::acqrel:
        lwsync
        extsh             5, 4
0:
        lharx             4, 0, 3
        extsh             6, 4
        cmpw              6, 5
        bt                0, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 4
        blr

asm_test::fetch_min::i16::seqcst:
        sync
        extsh             5, 4
0:
        lharx             4, 0, 3
        extsh             6, 4
        cmpw              6, 5
        bt                0, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 4
        blr

asm_test::fetch_min::i16::acquire:
        extsh             5, 4
0:
        lharx             4, 0, 3
        extsh             6, 4
        cmpw              6, 5
        bt                0, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 4
        blr

asm_test::fetch_min::i16::relaxed:
        extsh             5, 4
0:
        lharx             4, 0, 3
        extsh             6, 4
        cmpw              6, 5
        bt                0, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
1:
        mr                3, 4
        blr

asm_test::fetch_min::i16::release:
        lwsync
        extsh             5, 4
0:
        lharx             4, 0, 3
        extsh             6, 4
        cmpw              6, 5
        bt                0, 1f
        sthcx.            5, 0, 3
        bf                2, 0b
1:
        mr                3, 4
        blr

asm_test::fetch_min::i32::acqrel:
        lwsync
0:
        lwarx             5, 0, 3
        cmpw              5, 4
        bt                0, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_min::i32::seqcst:
        sync
0:
        lwarx             5, 0, 3
        cmpw              5, 4
        bt                0, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_min::i32::acquire:
        mr                5, 3
0:
        lwarx             3, 0, 5
        cmpw              3, 4
        bt                0, 1f
        stwcx.            4, 0, 5
        bf                2, 0b
1:
        lwsync
        blr

asm_test::fetch_min::i32::relaxed:
0:
        lwarx             5, 0, 3
        cmpw              5, 4
        bt                0, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_min::i32::release:
        lwsync
0:
        lwarx             5, 0, 3
        cmpw              5, 4
        bt                0, 1f
        stwcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_min::i64::acqrel:
        lwsync
0:
        ldarx             5, 0, 3
        cmpd              5, 4
        bt                0, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_min::i64::seqcst:
        sync
0:
        ldarx             5, 0, 3
        cmpd              5, 4
        bt                0, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        lwsync
        mr                3, 5
        blr

asm_test::fetch_min::i64::acquire:
        mr                5, 3
0:
        ldarx             3, 0, 5
        cmpd              3, 4
        bt                0, 1f
        stdcx.            4, 0, 5
        bf                2, 0b
1:
        lwsync
        blr

asm_test::fetch_min::i64::relaxed:
0:
        ldarx             5, 0, 3
        cmpd              5, 4
        bt                0, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_min::i64::release:
        lwsync
0:
        ldarx             5, 0, 3
        cmpd              5, 4
        bt                0, 1f
        stdcx.            4, 0, 3
        bf                2, 0b
1:
        mr                3, 5
        blr

asm_test::fetch_min::i128::acqrel:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpd              1, 4, 6
        lwsync
        crandc            20, 4, 2
        cmpld             1, 5, 7
        mr                9, 6
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        crand             21, 2, 4
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_min::i128::seqcst:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpd              1, 4, 6
        sync
        crandc            20, 4, 2
        cmpld             1, 5, 7
        mr                9, 6
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        crand             21, 2, 4
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_min::i128::acquire:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpd              1, 4, 6
        crandc            20, 4, 2
        cmpld             1, 5, 7
        crand             21, 2, 4
        mr                9, 6
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_min::i128::relaxed:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpd              1, 4, 6
        crandc            20, 4, 2
        cmpld             1, 5, 7
        crand             21, 2, 4
        mr                9, 6
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_min::i128::release:
        std               26, -48(1)
        std               27, -40(1)
        std               28, -32(1)
        std               29, -24(1)
        lq                6, 0(3)
        nop
        nop
        nop
0:
        cmpld             4, 6
        cmpd              1, 4, 6
        lwsync
        crandc            20, 4, 2
        cmpld             1, 5, 7
        mr                9, 6
        mr                8, 7
        ori               10, 9, 0
        or                10, 10, 9
        crand             21, 2, 4
        cror              20, 21, 20
        isel              6, 5, 7, 20
        isel              7, 4, 9, 20
        ori               11, 7, 0
        or                7, 11, 7
1:
        lqarx             28, 0, 3
        xor               27, 29, 8
        xor               26, 28, 10
        or.               27, 27, 26
        bf                2, 2f
        mr                27, 6
        mr                26, 7
        stqcx.            26, 0, 3
        bf                2, 1b
2:
        mr                6, 28
        ori               7, 29, 0
        xor               9, 9, 6
        xor               8, 8, 7
        or.               8, 8, 9
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        ld                29, -24(1)
        ld                28, -32(1)
        ld                27, -40(1)
        ld                26, -48(1)
        blr

asm_test::fetch_neg::u8::acqrel:
        lbz               4, 0(3)
        b                 2f
        nop
        nop
0:
        mr                4, 5
1:
        bt                20, 3f
2:
        lbarx             5, 0, 3
        clrlwi            6, 4, 24
        crclr             20
        cmplw             5, 6
        bf                2, 0b
        neg               4, 4
        lwsync
        clrlwi            4, 4, 24
        stbcx.            4, 0, 3
        mr                4, 5
        bf                2, 1b
        lwsync
        crset             20
        b                 0b
3:
        mr                3, 4
        blr

asm_test::fetch_neg::u8::seqcst:
        lbz               4, 0(3)
        b                 2f
        nop
        nop
0:
        mr                4, 5
1:
        bt                20, 3f
2:
        lbarx             5, 0, 3
        clrlwi            6, 4, 24
        crclr             20
        cmplw             5, 6
        bf                2, 0b
        neg               4, 4
        sync
        clrlwi            4, 4, 24
        stbcx.            4, 0, 3
        mr                4, 5
        bf                2, 1b
        lwsync
        crset             20
        b                 0b
3:
        mr                3, 4
        blr

asm_test::fetch_neg::u8::acquire:
        lbz               4, 0(3)
        b                 2f
        nop
        nop
0:
        mr                4, 5
1:
        bt                20, 3f
2:
        lbarx             5, 0, 3
        clrlwi            6, 4, 24
        crclr             20
        cmplw             5, 6
        bf                2, 0b
        neg               4, 4
        clrlwi            4, 4, 24
        stbcx.            4, 0, 3
        mr                4, 5
        bf                2, 1b
        lwsync
        crset             20
        b                 0b
3:
        mr                3, 4
        blr

asm_test::fetch_neg::u8::relaxed:
        lbz               4, 0(3)
        b                 1f
        nop
        nop
0:
        mr                4, 5
1:
        lbarx             5, 0, 3
        clrlwi            6, 4, 24
        cmplw             5, 6
        bf                2, 0b
        neg               4, 4
        clrlwi            4, 4, 24
        stbcx.            4, 0, 3
        bf                2, 0b
        mr                4, 5
        mr                3, 4
        blr

asm_test::fetch_neg::u8::release:
        lbz               4, 0(3)
        b                 1f
        nop
        nop
0:
        mr                4, 5
1:
        lbarx             5, 0, 3
        clrlwi            6, 4, 24
        cmplw             5, 6
        bf                2, 0b
        neg               4, 4
        lwsync
        clrlwi            4, 4, 24
        stbcx.            4, 0, 3
        bf                2, 0b
        mr                4, 5
        mr                3, 4
        blr

asm_test::fetch_neg::u16::acqrel:
        lhz               4, 0(3)
        b                 2f
        nop
        nop
0:
        mr                4, 5
1:
        bt                20, 3f
2:
        lharx             5, 0, 3
        clrlwi            6, 4, 16
        crclr             20
        cmplw             5, 6
        bf                2, 0b
        neg               4, 4
        lwsync
        clrlwi            4, 4, 16
        sthcx.            4, 0, 3
        mr                4, 5
        bf                2, 1b
        lwsync
        crset             20
        b                 0b
3:
        mr                3, 4
        blr

asm_test::fetch_neg::u16::seqcst:
        lhz               4, 0(3)
        b                 2f
        nop
        nop
0:
        mr                4, 5
1:
        bt                20, 3f
2:
        lharx             5, 0, 3
        clrlwi            6, 4, 16
        crclr             20
        cmplw             5, 6
        bf                2, 0b
        neg               4, 4
        sync
        clrlwi            4, 4, 16
        sthcx.            4, 0, 3
        mr                4, 5
        bf                2, 1b
        lwsync
        crset             20
        b                 0b
3:
        mr                3, 4
        blr

asm_test::fetch_neg::u16::acquire:
        lhz               4, 0(3)
        b                 2f
        nop
        nop
0:
        mr                4, 5
1:
        bt                20, 3f
2:
        lharx             5, 0, 3
        clrlwi            6, 4, 16
        crclr             20
        cmplw             5, 6
        bf                2, 0b
        neg               4, 4
        clrlwi            4, 4, 16
        sthcx.            4, 0, 3
        mr                4, 5
        bf                2, 1b
        lwsync
        crset             20
        b                 0b
3:
        mr                3, 4
        blr

asm_test::fetch_neg::u16::relaxed:
        lhz               4, 0(3)
        b                 1f
        nop
        nop
0:
        mr                4, 5
1:
        lharx             5, 0, 3
        clrlwi            6, 4, 16
        cmplw             5, 6
        bf                2, 0b
        neg               4, 4
        clrlwi            4, 4, 16
        sthcx.            4, 0, 3
        bf                2, 0b
        mr                4, 5
        mr                3, 4
        blr

asm_test::fetch_neg::u16::release:
        lhz               4, 0(3)
        b                 1f
        nop
        nop
0:
        mr                4, 5
1:
        lharx             5, 0, 3
        clrlwi            6, 4, 16
        cmplw             5, 6
        bf                2, 0b
        neg               4, 4
        lwsync
        clrlwi            4, 4, 16
        sthcx.            4, 0, 3
        bf                2, 0b
        mr                4, 5
        mr                3, 4
        blr

asm_test::fetch_neg::u32::acqrel:
        mr                4, 3
        lwz               3, 0(3)
        b                 1f
        nop
0:
        bclr              12, 20
1:
        mr                5, 3
        lwarx             3, 0, 4
        crclr             20
        cmplw             3, 5
        bf                2, 0b
        neg               5, 5
        lwsync
        stwcx.            5, 0, 4
        bf                2, 0b
        lwsync
        crset             20
        b                 0b

asm_test::fetch_neg::u32::seqcst:
        mr                4, 3
        lwz               3, 0(3)
        b                 1f
        nop
0:
        bclr              12, 20
1:
        mr                5, 3
        lwarx             3, 0, 4
        crclr             20
        cmplw             3, 5
        bf                2, 0b
        neg               5, 5
        sync
        stwcx.            5, 0, 4
        bf                2, 0b
        lwsync
        crset             20
        b                 0b

asm_test::fetch_neg::u32::acquire:
        mr                4, 3
        lwz               3, 0(3)
        b                 1f
        nop
0:
        bclr              12, 20
1:
        mr                5, 3
        lwarx             3, 0, 4
        crclr             20
        cmplw             3, 5
        bf                2, 0b
        neg               5, 5
        stwcx.            5, 0, 4
        bf                2, 0b
        lwsync
        crset             20
        b                 0b

asm_test::fetch_neg::u32::relaxed:
        lwz               5, 0(3)
        b                 1f
        nop
        nop
0:
        mr                5, 4
1:
        lwarx             4, 0, 3
        cmplw             4, 5
        bf                2, 0b
        neg               5, 5
        stwcx.            5, 0, 3
        bf                2, 0b
        mr                5, 4
        mr                3, 4
        blr

asm_test::fetch_neg::u32::release:
        lwz               5, 0(3)
        b                 1f
        nop
        nop
0:
        mr                5, 4
1:
        lwarx             4, 0, 3
        cmplw             4, 5
        bf                2, 0b
        neg               5, 5
        lwsync
        stwcx.            5, 0, 3
        bf                2, 0b
        mr                5, 4
        mr                3, 4
        blr

asm_test::fetch_neg::u64::acqrel:
        ld                4, 0(3)
        b                 1f
        nop
        nop
0:
        bt                20, 2f
1:
        mr                5, 4
        ldarx             4, 0, 3
        crclr             20
        cmpld             4, 5
        bf                2, 0b
        neg               5, 5
        lwsync
        stdcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        b                 0b
2:
        mr                3, 4
        blr

asm_test::fetch_neg::u64::seqcst:
        ld                4, 0(3)
        b                 1f
        nop
        nop
0:
        bt                20, 2f
1:
        mr                5, 4
        ldarx             4, 0, 3
        crclr             20
        cmpld             4, 5
        bf                2, 0b
        neg               5, 5
        sync
        stdcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        b                 0b
2:
        mr                3, 4
        blr

asm_test::fetch_neg::u64::acquire:
        ld                4, 0(3)
        b                 1f
        nop
        nop
0:
        bt                20, 2f
1:
        mr                5, 4
        ldarx             4, 0, 3
        crclr             20
        cmpld             4, 5
        bf                2, 0b
        neg               5, 5
        stdcx.            5, 0, 3
        bf                2, 0b
        lwsync
        crset             20
        b                 0b
2:
        mr                3, 4
        blr

asm_test::fetch_neg::u64::relaxed:
        ld                5, 0(3)
        b                 1f
        nop
        nop
0:
        mr                5, 4
1:
        ldarx             4, 0, 3
        cmpld             4, 5
        bf                2, 0b
        neg               5, 5
        stdcx.            5, 0, 3
        bf                2, 0b
        mr                5, 4
        mr                3, 4
        blr

asm_test::fetch_neg::u64::release:
        ld                5, 0(3)
        b                 1f
        nop
        nop
0:
        mr                5, 4
1:
        ldarx             4, 0, 3
        cmpld             4, 5
        bf                2, 0b
        neg               5, 5
        lwsync
        stdcx.            5, 0, 3
        bf                2, 0b
        mr                5, 4
        mr                3, 4
        blr

asm_test::fetch_neg::u128::acqrel:
        std               28, -32(1)
        std               29, -24(1)
        lq                4, 0(3)
        nop
0:
        mr                7, 4
        subfic            4, 5, 0
        mr                6, 5
        lwsync
        subfze            5, 7
        ori               8, 7, 0
        ori               9, 5, 0
        or                8, 8, 7
        or                5, 9, 5
1:
        lqarx             10, 0, 3
        xor               29, 11, 6
        xor               28, 10, 8
        or.               29, 29, 28
        bf                2, 2f
        mr                29, 4
        mr                28, 5
        stqcx.            28, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                4, 10
        ori               5, 11, 0
        xor               7, 7, 4
        xor               6, 6, 5
        or.               6, 6, 7
        bf                2, 0b
        mr                3, 4
        mr                4, 5
        ld                29, -24(1)
        ld                28, -32(1)
        blr

asm_test::fetch_neg::u128::seqcst:
        std               28, -32(1)
        std               29, -24(1)
        lq                4, 0(3)
        nop
0:
        mr                7, 4
        subfic            4, 5, 0
        mr                6, 5
        sync
        subfze            5, 7
        ori               8, 7, 0
        ori               9, 5, 0
        or                8, 8, 7
        or                5, 9, 5
1:
        lqarx             10, 0, 3
        xor               29, 11, 6
        xor               28, 10, 8
        or.               29, 29, 28
        bf                2, 2f
        mr                29, 4
        mr                28, 5
        stqcx.            28, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                4, 10
        ori               5, 11, 0
        xor               7, 7, 4
        xor               6, 6, 5
        or.               6, 6, 7
        bf                2, 0b
        mr                3, 4
        mr                4, 5
        ld                29, -24(1)
        ld                28, -32(1)
        blr

asm_test::fetch_neg::u128::acquire:
        std               28, -32(1)
        std               29, -24(1)
        lq                4, 0(3)
        nop
0:
        mr                7, 4
        subfic            4, 5, 0
        mr                6, 5
        subfze            5, 7
        ori               8, 7, 0
        ori               9, 5, 0
        or                8, 8, 7
        or                5, 9, 5
1:
        lqarx             10, 0, 3
        xor               29, 11, 6
        xor               28, 10, 8
        or.               29, 29, 28
        bf                2, 2f
        mr                29, 4
        mr                28, 5
        stqcx.            28, 0, 3
        bf                2, 1b
2:
        lwsync
        mr                4, 10
        ori               5, 11, 0
        xor               7, 7, 4
        xor               6, 6, 5
        or.               6, 6, 7
        bf                2, 0b
        mr                3, 4
        mr                4, 5
        ld                29, -24(1)
        ld                28, -32(1)
        blr

asm_test::fetch_neg::u128::relaxed:
        std               28, -32(1)
        std               29, -24(1)
        lq                4, 0(3)
        nop
0:
        mr                7, 4
        subfic            4, 5, 0
        mr                6, 5
        subfze            5, 7
        ori               8, 7, 0
        ori               9, 5, 0
        or                8, 8, 7
        or                5, 9, 5
1:
        lqarx             10, 0, 3
        xor               29, 11, 6
        xor               28, 10, 8
        or.               29, 29, 28
        bf                2, 2f
        mr                29, 4
        mr                28, 5
        stqcx.            28, 0, 3
        bf                2, 1b
2:
        mr                4, 10
        ori               5, 11, 0
        xor               7, 7, 4
        xor               6, 6, 5
        or.               6, 6, 7
        bf                2, 0b
        mr                3, 4
        mr                4, 5
        ld                29, -24(1)
        ld                28, -32(1)
        blr

asm_test::fetch_neg::u128::release:
        std               28, -32(1)
        std               29, -24(1)
        lq                4, 0(3)
        nop
0:
        mr                7, 4
        subfic            4, 5, 0
        mr                6, 5
        lwsync
        subfze            5, 7
        ori               8, 7, 0
        ori               9, 5, 0
        or                8, 8, 7
        or                5, 9, 5
1:
        lqarx             10, 0, 3
        xor               29, 11, 6
        xor               28, 10, 8
        or.               29, 29, 28
        bf                2, 2f
        mr                29, 4
        mr                28, 5
        stqcx.            28, 0, 3
        bf                2, 1b
2:
        mr                4, 10
        ori               5, 11, 0
        xor               7, 7, 4
        xor               6, 6, 5
        or.               6, 6, 7
        bf                2, 0b
        mr                3, 4
        mr                4, 5
        ld                29, -24(1)
        ld                28, -32(1)
        blr

asm_test::fetch_not::u8::acqrel:
        lwsync
        li                5, -1
0:
        lbarx             4, 0, 3
        xor               6, 5, 4
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 4
        blr

asm_test::fetch_not::u8::seqcst:
        sync
        li                5, -1
0:
        lbarx             4, 0, 3
        xor               6, 5, 4
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 4
        blr

asm_test::fetch_not::u8::acquire:
        mr                4, 3
        li                5, -1
0:
        lbarx             3, 0, 4
        xor               6, 5, 3
        stbcx.            6, 0, 4
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_not::u8::relaxed:
        li                5, -1
0:
        lbarx             4, 0, 3
        xor               6, 5, 4
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 4
        blr

asm_test::fetch_not::u8::release:
        lwsync
        li                5, -1
0:
        lbarx             4, 0, 3
        xor               6, 5, 4
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 4
        blr

asm_test::fetch_not::u16::acqrel:
        lwsync
        li                5, -1
0:
        lharx             4, 0, 3
        xor               6, 5, 4
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 4
        blr

asm_test::fetch_not::u16::seqcst:
        sync
        li                5, -1
0:
        lharx             4, 0, 3
        xor               6, 5, 4
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 4
        blr

asm_test::fetch_not::u16::acquire:
        mr                4, 3
        li                5, -1
0:
        lharx             3, 0, 4
        xor               6, 5, 3
        sthcx.            6, 0, 4
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_not::u16::relaxed:
        li                5, -1
0:
        lharx             4, 0, 3
        xor               6, 5, 4
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 4
        blr

asm_test::fetch_not::u16::release:
        lwsync
        li                5, -1
0:
        lharx             4, 0, 3
        xor               6, 5, 4
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 4
        blr

asm_test::fetch_not::u32::acqrel:
        lwsync
        li                5, -1
0:
        lwarx             4, 0, 3
        xor               6, 5, 4
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 4
        blr

asm_test::fetch_not::u32::seqcst:
        sync
        li                5, -1
0:
        lwarx             4, 0, 3
        xor               6, 5, 4
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 4
        blr

asm_test::fetch_not::u32::acquire:
        mr                4, 3
        li                5, -1
0:
        lwarx             3, 0, 4
        xor               6, 5, 3
        stwcx.            6, 0, 4
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_not::u32::relaxed:
        li                5, -1
0:
        lwarx             4, 0, 3
        xor               6, 5, 4
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 4
        blr

asm_test::fetch_not::u32::release:
        lwsync
        li                5, -1
0:
        lwarx             4, 0, 3
        xor               6, 5, 4
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 4
        blr

asm_test::fetch_not::u64::acqrel:
        lwsync
        li                5, -1
0:
        ldarx             4, 0, 3
        xor               6, 5, 4
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 4
        blr

asm_test::fetch_not::u64::seqcst:
        sync
        li                5, -1
0:
        ldarx             4, 0, 3
        xor               6, 5, 4
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 4
        blr

asm_test::fetch_not::u64::acquire:
        li                5, -1
0:
        ldarx             4, 0, 3
        xor               6, 5, 4
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 4
        blr

asm_test::fetch_not::u64::relaxed:
        li                5, -1
0:
        ldarx             4, 0, 3
        xor               6, 5, 4
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 4
        blr

asm_test::fetch_not::u64::release:
        lwsync
        li                5, -1
0:
        ldarx             4, 0, 3
        xor               6, 5, 4
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 4
        blr

asm_test::fetch_not::u128::acqrel:
        li                4, -1
        lwsync
0:
        lqarx             6, 0, 3
        xor               9, 4, 7
        xor               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_not::u128::seqcst:
        li                4, -1
        sync
0:
        lqarx             6, 0, 3
        xor               9, 4, 7
        xor               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_not::u128::acquire:
        li                4, -1
0:
        lqarx             6, 0, 3
        xor               9, 4, 7
        xor               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_not::u128::relaxed:
        li                4, -1
0:
        lqarx             6, 0, 3
        xor               9, 4, 7
        xor               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_not::u128::release:
        li                4, -1
        lwsync
0:
        lqarx             6, 0, 3
        xor               9, 4, 7
        xor               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_sub::u8::acqrel:
        lwsync
0:
        lbarx             5, 0, 3
        sub               6, 5, 4
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_sub::u8::seqcst:
        sync
0:
        lbarx             5, 0, 3
        sub               6, 5, 4
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_sub::u8::acquire:
        mr                5, 3
0:
        lbarx             3, 0, 5
        sub               6, 3, 4
        stbcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_sub::u8::relaxed:
0:
        lbarx             5, 0, 3
        sub               6, 5, 4
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_sub::u8::release:
        lwsync
0:
        lbarx             5, 0, 3
        sub               6, 5, 4
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_sub::u16::acqrel:
        lwsync
0:
        lharx             5, 0, 3
        sub               6, 5, 4
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_sub::u16::seqcst:
        sync
0:
        lharx             5, 0, 3
        sub               6, 5, 4
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_sub::u16::acquire:
        mr                5, 3
0:
        lharx             3, 0, 5
        sub               6, 3, 4
        sthcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_sub::u16::relaxed:
0:
        lharx             5, 0, 3
        sub               6, 5, 4
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_sub::u16::release:
        lwsync
0:
        lharx             5, 0, 3
        sub               6, 5, 4
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_sub::u32::acqrel:
        lwsync
0:
        lwarx             5, 0, 3
        sub               6, 5, 4
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_sub::u32::seqcst:
        sync
0:
        lwarx             5, 0, 3
        sub               6, 5, 4
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_sub::u32::acquire:
        mr                5, 3
0:
        lwarx             3, 0, 5
        sub               6, 3, 4
        stwcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_sub::u32::relaxed:
0:
        lwarx             5, 0, 3
        sub               6, 5, 4
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_sub::u32::release:
        lwsync
0:
        lwarx             5, 0, 3
        sub               6, 5, 4
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_sub::u64::acqrel:
        lwsync
0:
        ldarx             5, 0, 3
        sub               6, 5, 4
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_sub::u64::seqcst:
        sync
0:
        ldarx             5, 0, 3
        sub               6, 5, 4
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_sub::u64::acquire:
        mr                5, 3
0:
        ldarx             3, 0, 5
        sub               6, 3, 4
        stdcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_sub::u64::relaxed:
0:
        ldarx             5, 0, 3
        sub               6, 5, 4
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_sub::u64::release:
        lwsync
0:
        ldarx             5, 0, 3
        sub               6, 5, 4
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_sub::u128::acqrel:
        lwsync
0:
        lqarx             6, 0, 3
        subc              9, 7, 5
        subfe             8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_sub::u128::seqcst:
        sync
0:
        lqarx             6, 0, 3
        subc              9, 7, 5
        subfe             8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_sub::u128::acquire:
0:
        lqarx             6, 0, 3
        subc              9, 7, 5
        subfe             8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_sub::u128::relaxed:
0:
        lqarx             6, 0, 3
        subc              9, 7, 5
        subfe             8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_sub::u128::release:
        lwsync
0:
        lqarx             6, 0, 3
        subc              9, 7, 5
        subfe             8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_xor::u8::acqrel:
        lwsync
0:
        lbarx             5, 0, 3
        xor               6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_xor::u8::seqcst:
        sync
0:
        lbarx             5, 0, 3
        xor               6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_xor::u8::acquire:
        mr                5, 3
0:
        lbarx             3, 0, 5
        xor               6, 4, 3
        stbcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_xor::u8::relaxed:
0:
        lbarx             5, 0, 3
        xor               6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_xor::u8::release:
        lwsync
0:
        lbarx             5, 0, 3
        xor               6, 4, 5
        stbcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_xor::u16::acqrel:
        lwsync
0:
        lharx             5, 0, 3
        xor               6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_xor::u16::seqcst:
        sync
0:
        lharx             5, 0, 3
        xor               6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_xor::u16::acquire:
        mr                5, 3
0:
        lharx             3, 0, 5
        xor               6, 4, 3
        sthcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_xor::u16::relaxed:
0:
        lharx             5, 0, 3
        xor               6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_xor::u16::release:
        lwsync
0:
        lharx             5, 0, 3
        xor               6, 4, 5
        sthcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_xor::u32::acqrel:
        lwsync
0:
        lwarx             5, 0, 3
        xor               6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_xor::u32::seqcst:
        sync
0:
        lwarx             5, 0, 3
        xor               6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_xor::u32::acquire:
        mr                5, 3
0:
        lwarx             3, 0, 5
        xor               6, 4, 3
        stwcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_xor::u32::relaxed:
0:
        lwarx             5, 0, 3
        xor               6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_xor::u32::release:
        lwsync
0:
        lwarx             5, 0, 3
        xor               6, 4, 5
        stwcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_xor::u64::acqrel:
        lwsync
0:
        ldarx             5, 0, 3
        xor               6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_xor::u64::seqcst:
        sync
0:
        ldarx             5, 0, 3
        xor               6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 5
        blr

asm_test::fetch_xor::u64::acquire:
        mr                5, 3
0:
        ldarx             3, 0, 5
        xor               6, 4, 3
        stdcx.            6, 0, 5
        bf                2, 0b
        lwsync
        blr

asm_test::fetch_xor::u64::relaxed:
0:
        ldarx             5, 0, 3
        xor               6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_xor::u64::release:
        lwsync
0:
        ldarx             5, 0, 3
        xor               6, 4, 5
        stdcx.            6, 0, 3
        bf                2, 0b
        mr                3, 5
        blr

asm_test::fetch_xor::u128::acqrel:
        lwsync
0:
        lqarx             6, 0, 3
        xor               9, 5, 7
        xor               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_xor::u128::seqcst:
        sync
0:
        lqarx             6, 0, 3
        xor               9, 5, 7
        xor               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_xor::u128::acquire:
0:
        lqarx             6, 0, 3
        xor               9, 5, 7
        xor               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        lwsync
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_xor::u128::relaxed:
0:
        lqarx             6, 0, 3
        xor               9, 5, 7
        xor               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr

asm_test::fetch_xor::u128::release:
        lwsync
0:
        lqarx             6, 0, 3
        xor               9, 5, 7
        xor               8, 4, 6
        stqcx.            8, 0, 3
        bf                2, 0b
        mr                3, 6
        mr                4, 7
        blr


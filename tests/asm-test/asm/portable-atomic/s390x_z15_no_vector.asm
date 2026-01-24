asm_test::fetch_nand::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        xilf              %r5,4278190080
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_nand::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        xilf              %r5,4278190080
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_nand::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        xilf              %r5,4278190080
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_nand::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        xilf              %r5,4278190080
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_nand::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        xilf              %r5,4278190080
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_nand::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        xilf              %r5,4294901760
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_nand::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        xilf              %r5,4294901760
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_nand::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        xilf              %r5,4294901760
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_nand::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        xilf              %r5,4294901760
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_nand::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        xilf              %r5,4294901760
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_nand::u32::acqrel:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        nnrk              %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u32::seqcst:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        nnrk              %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u32::acquire:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        nnrk              %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u32::relaxed:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        nnrk              %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u32::release:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        nnrk              %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u64::acqrel:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        nngrk             %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u64::seqcst:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        nngrk             %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u64::acquire:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        nngrk             %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u64::relaxed:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        nngrk             %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u64::release:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        nngrk             %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::bool::acqrel:
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        cije              %r3,0,1f
        l                 %r0,0(%r1)
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,16777216
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        j                 3f
1:
        l                 %r0,0(%r1)
        lcr               %r3,%r2
        lhi               %r4,1
2:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r4,32,39,24
        rll               %r5,%r5,0(%r3)
        cs                %r0,%r5,0(%r1)
        jl                2b
3:
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_nand::bool::seqcst:
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        cije              %r3,0,1f
        l                 %r0,0(%r1)
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,16777216
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        j                 3f
1:
        l                 %r0,0(%r1)
        lcr               %r3,%r2
        lhi               %r4,1
2:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r4,32,39,24
        rll               %r5,%r5,0(%r3)
        cs                %r0,%r5,0(%r1)
        jl                2b
3:
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_nand::bool::acquire:
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        cije              %r3,0,1f
        l                 %r0,0(%r1)
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,16777216
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        j                 3f
1:
        l                 %r0,0(%r1)
        lcr               %r3,%r2
        lhi               %r4,1
2:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r4,32,39,24
        rll               %r5,%r5,0(%r3)
        cs                %r0,%r5,0(%r1)
        jl                2b
3:
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_nand::bool::relaxed:
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        cije              %r3,0,1f
        l                 %r0,0(%r1)
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,16777216
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        j                 3f
1:
        l                 %r0,0(%r1)
        lcr               %r3,%r2
        lhi               %r4,1
2:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r4,32,39,24
        rll               %r5,%r5,0(%r3)
        cs                %r0,%r5,0(%r1)
        jl                2b
3:
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_nand::bool::release:
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        cije              %r3,0,1f
        l                 %r0,0(%r1)
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,16777216
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        j                 3f
1:
        l                 %r0,0(%r1)
        lcr               %r3,%r2
        lhi               %r4,1
2:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r4,32,39,24
        rll               %r5,%r5,0(%r3)
        cs                %r0,%r5,0(%r1)
        jl                2b
3:
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_nand::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        nngrk             %r13,%r1,%r4
        nngrk             %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_nand::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        nngrk             %r13,%r1,%r4
        nngrk             %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_nand::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        nngrk             %r13,%r1,%r4
        nngrk             %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_nand::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        nngrk             %r13,%r1,%r4
        nngrk             %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_nand::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        nngrk             %r13,%r1,%r4
        nngrk             %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_umax::u8::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u8::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u8::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u8::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u8::release:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u16::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u16::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u16::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u16::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u16::release:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u32::acqrel:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        selrh             %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u32::seqcst:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        selrh             %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u32::acquire:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        selrh             %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u32::relaxed:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        selrh             %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u32::release:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        selrh             %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u64::acqrel:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        selgrh            %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u64::seqcst:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        selgrh            %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u64::acquire:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        selgrh            %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u64::relaxed:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        selgrh            %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u64::release:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        selgrh            %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrh            %r14,%r1,%r4
        clgr              %r0,%r5
        selgrh            %r12,%r0,%r5
        selgrh            %r13,%r1,%r4
        cgr               %r0,%r5
        locgre            %r13,%r14
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_umax::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrh            %r14,%r1,%r4
        clgr              %r0,%r5
        selgrh            %r12,%r0,%r5
        selgrh            %r13,%r1,%r4
        cgr               %r0,%r5
        locgre            %r13,%r14
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_umax::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrh            %r14,%r1,%r4
        clgr              %r0,%r5
        selgrh            %r12,%r0,%r5
        selgrh            %r13,%r1,%r4
        cgr               %r0,%r5
        locgre            %r13,%r14
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_umax::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrh            %r14,%r1,%r4
        clgr              %r0,%r5
        selgrh            %r12,%r0,%r5
        selgrh            %r13,%r1,%r4
        cgr               %r0,%r5
        locgre            %r13,%r14
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_umax::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrh            %r14,%r1,%r4
        clgr              %r0,%r5
        selgrh            %r12,%r0,%r5
        selgrh            %r13,%r1,%r4
        cgr               %r0,%r5
        locgre            %r13,%r14
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_umin::u8::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u8::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u8::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u8::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u8::release:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u16::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u16::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u16::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u16::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u16::release:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u32::acqrel:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        selrle            %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u32::seqcst:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        selrle            %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u32::acquire:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        selrle            %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u32::relaxed:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        selrle            %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u32::release:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        selrle            %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u64::acqrel:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        selgrle           %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u64::seqcst:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        selgrle           %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u64::acquire:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        selgrle           %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u64::relaxed:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        selgrle           %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u64::release:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        selgrle           %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrl            %r14,%r1,%r4
        clgr              %r0,%r5
        selgrl            %r12,%r0,%r5
        selgrl            %r13,%r1,%r4
        cgr               %r0,%r5
        locgre            %r13,%r14
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_umin::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrl            %r14,%r1,%r4
        clgr              %r0,%r5
        selgrl            %r12,%r0,%r5
        selgrl            %r13,%r1,%r4
        cgr               %r0,%r5
        locgre            %r13,%r14
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_umin::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrl            %r14,%r1,%r4
        clgr              %r0,%r5
        selgrl            %r12,%r0,%r5
        selgrl            %r13,%r1,%r4
        cgr               %r0,%r5
        locgre            %r13,%r14
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_umin::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrl            %r14,%r1,%r4
        clgr              %r0,%r5
        selgrl            %r12,%r0,%r5
        selgrl            %r13,%r1,%r4
        cgr               %r0,%r5
        locgre            %r13,%r14
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_umin::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrl            %r14,%r1,%r4
        clgr              %r0,%r5
        selgrl            %r12,%r0,%r5
        selgrl            %r13,%r1,%r4
        cgr               %r0,%r5
        locgre            %r13,%r14
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u8::acqrel_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::seqcst_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::acqrel_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::acqrel_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::acquire_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::relaxed_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::release_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::seqcst_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::seqcst_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::acquire_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::acquire_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::relaxed_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::relaxed_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::release_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::release_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::acqrel_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::seqcst_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::acqrel_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::acqrel_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::acquire_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::relaxed_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::release_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::seqcst_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::seqcst_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::acquire_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::acquire_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::relaxed_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::relaxed_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::release_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::release_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u32::acqrel_seqcst:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::seqcst_seqcst:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::acqrel_acquire:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::acqrel_relaxed:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::acquire_seqcst:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::relaxed_seqcst:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::release_seqcst:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::seqcst_acquire:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::seqcst_relaxed:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::acquire_acquire:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::acquire_relaxed:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::relaxed_acquire:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::relaxed_relaxed:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::release_acquire:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::release_relaxed:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u64::acqrel_seqcst:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::seqcst_seqcst:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::acqrel_acquire:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::acqrel_relaxed:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::acquire_seqcst:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::relaxed_seqcst:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::release_seqcst:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::seqcst_acquire:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::seqcst_relaxed:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::acquire_acquire:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::acquire_relaxed:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::relaxed_acquire:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::relaxed_relaxed:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::release_acquire:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::release_relaxed:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::bool::acqrel_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::seqcst_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::acqrel_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::acqrel_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::acquire_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::relaxed_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::release_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::seqcst_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::seqcst_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::acquire_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::acquire_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::relaxed_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::relaxed_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::release_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::bool::release_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u128::acqrel_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::seqcst_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::acqrel_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::acqrel_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::acquire_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::relaxed_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::release_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::seqcst_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::seqcst_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::acquire_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::acquire_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::relaxed_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::relaxed_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::release_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::release_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::release_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::acquire_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::release_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::release_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llcr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,8(%r2)
        risbg             %r4,%r3,32,55
        llcr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::release_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::acquire_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::release_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::release_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r14,0(%r1)
        sll               %r2,3
        llhr              %r0,%r3
        lcr               %r5,%r2
0:
        rll               %r3,%r14,16(%r2)
        risbg             %r4,%r3,32,47
        llhr              %r3,%r3
        cr                %r3,%r0
        jlh               1f
        rll               %r13,%r4,-16(%r5)
        cs                %r14,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::release_seqcst:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::acquire_acquire:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::release_acquire:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::release_relaxed:
        cs                %r3,%r4,0(%r2)
        lhi               %r2,0
        lochie            %r2,1
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::release_seqcst:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::acquire_acquire:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::release_acquire:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::release_relaxed:
        csg               %r3,%r4,0(%r2)
        lhi               %r0,0
        lochie            %r0,1
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::release_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::acquire_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::release_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::bool::release_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r5,%r2
0:
        rll               %r14,%r0,8(%r2)
        risbg             %r4,%r14,32,55
        llcr              %r14,%r14
        cr                %r14,%r3
        jlh               1f
        rll               %r13,%r4,-8(%r5)
        cs                %r0,%r13,0(%r1)
        jl                0b
1:
        lhi               %r2,0
        lochie            %r2,1
        lhi               %r3,0
        xilf              %r2,1
        tmll              %r14,255
        lochine           %r3,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::acqrel_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::seqcst_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::acqrel_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::acqrel_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::acquire_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::relaxed_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::release_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::seqcst_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::seqcst_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::acquire_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::acquire_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::relaxed_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::relaxed_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::release_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::release_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,0(%r4)
        lg                %r1,8(%r4)
        lg                %r12,0(%r5)
        lg                %r13,8(%r5)
        cdsg              %r0,%r12,0(%r3)
        ipm               %r3
        algfi             %r3,4026531840
        lcgr              %r3,%r3
        aghi              %r3,-1
        risbgnz           %r3,%r3,63,63,33
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::or::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::or::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::or::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::or::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::or::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::or::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::or::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::or::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::or::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::or::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::or::u32::acqrel:
        lao               %r0,%r3,0(%r2)
        br                %r14

asm_test::or::u32::seqcst:
        lao               %r0,%r3,0(%r2)
        br                %r14

asm_test::or::u32::acquire:
        lao               %r0,%r3,0(%r2)
        br                %r14

asm_test::or::u32::relaxed:
        lao               %r0,%r3,0(%r2)
        br                %r14

asm_test::or::u32::release:
        lao               %r0,%r3,0(%r2)
        br                %r14

asm_test::or::u64::acqrel:
        laog              %r0,%r3,0(%r2)
        br                %r14

asm_test::or::u64::seqcst:
        laog              %r0,%r3,0(%r2)
        br                %r14

asm_test::or::u64::acquire:
        laog              %r0,%r3,0(%r2)
        br                %r14

asm_test::or::u64::relaxed:
        laog              %r0,%r3,0(%r2)
        br                %r14

asm_test::or::u64::release:
        laog              %r0,%r3,0(%r2)
        br                %r14

asm_test::or::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        ogrk              %r13,%r1,%r3
        ogrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::or::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        ogrk              %r13,%r1,%r3
        ogrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::or::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        ogrk              %r13,%r1,%r3
        ogrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::or::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        ogrk              %r13,%r1,%r3
        ogrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::or::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        ogrk              %r13,%r1,%r3
        ogrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::add::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::add::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::add::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::add::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::add::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::add::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::add::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::add::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::add::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::add::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::add::u32::acqrel:
        laa               %r0,%r3,0(%r2)
        br                %r14

asm_test::add::u32::seqcst:
        laa               %r0,%r3,0(%r2)
        br                %r14

asm_test::add::u32::acquire:
        laa               %r0,%r3,0(%r2)
        br                %r14

asm_test::add::u32::relaxed:
        laa               %r0,%r3,0(%r2)
        br                %r14

asm_test::add::u32::release:
        laa               %r0,%r3,0(%r2)
        br                %r14

asm_test::add::u64::acqrel:
        laag              %r0,%r3,0(%r2)
        br                %r14

asm_test::add::u64::seqcst:
        laag              %r0,%r3,0(%r2)
        br                %r14

asm_test::add::u64::acquire:
        laag              %r0,%r3,0(%r2)
        br                %r14

asm_test::add::u64::relaxed:
        laag              %r0,%r3,0(%r2)
        br                %r14

asm_test::add::u64::release:
        laag              %r0,%r3,0(%r2)
        br                %r14

asm_test::add::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        algrk             %r13,%r1,%r3
        lgr               %r12,%r0
        alcgr             %r12,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::add::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        algrk             %r13,%r1,%r3
        lgr               %r12,%r0
        alcgr             %r12,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::add::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        algrk             %r13,%r1,%r3
        lgr               %r12,%r0
        alcgr             %r12,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::add::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        algrk             %r13,%r1,%r3
        lgr               %r12,%r0
        alcgr             %r12,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::add::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        algrk             %r13,%r1,%r3
        lgr               %r12,%r0
        alcgr             %r12,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::and::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::and::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::and::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::and::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::and::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::and::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::and::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::and::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::and::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::and::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::and::u32::acqrel:
        lan               %r0,%r3,0(%r2)
        br                %r14

asm_test::and::u32::seqcst:
        lan               %r0,%r3,0(%r2)
        br                %r14

asm_test::and::u32::acquire:
        lan               %r0,%r3,0(%r2)
        br                %r14

asm_test::and::u32::relaxed:
        lan               %r0,%r3,0(%r2)
        br                %r14

asm_test::and::u32::release:
        lan               %r0,%r3,0(%r2)
        br                %r14

asm_test::and::u64::acqrel:
        lang              %r0,%r3,0(%r2)
        br                %r14

asm_test::and::u64::seqcst:
        lang              %r0,%r3,0(%r2)
        br                %r14

asm_test::and::u64::acquire:
        lang              %r0,%r3,0(%r2)
        br                %r14

asm_test::and::u64::relaxed:
        lang              %r0,%r3,0(%r2)
        br                %r14

asm_test::and::u64::release:
        lang              %r0,%r3,0(%r2)
        br                %r14

asm_test::and::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        ngrk              %r13,%r1,%r3
        ngrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::and::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        ngrk              %r13,%r1,%r3
        ngrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::and::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        ngrk              %r13,%r1,%r3
        ngrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::and::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        ngrk              %r13,%r1,%r3
        ngrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::and::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        ngrk              %r13,%r1,%r3
        ngrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::neg::u8::acqrel:
        stmg              %r13,%r15,104(%r15)
        lb                %r4,0(%r2)
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        lcr               %r3,%r2
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r1)
        lcr               %r5,%r4
        llcr              %r4,%r4
2:
        rll               %r0,%r14,8(%r2)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r4
        jlh               3f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
4:
        rll               %r4,%r14,8(%r2)
        risbg             %r5,%r4,32,55
        llcr              %r4,%r4
        cr                %r4,%r0
        jlh               5f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                4b
5:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r4
6:
        rll               %r0,%r14,8(%r2)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r4
        jlh               7f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                6b
7:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
8:
        rll               %r4,%r14,8(%r2)
        risbg             %r5,%r4,32,55
        llcr              %r4,%r4
        cr                %r4,%r0
        jlh               0b
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::neg::u8::seqcst:
        stmg              %r13,%r15,104(%r15)
        lb                %r4,0(%r2)
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        lcr               %r3,%r2
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r1)
        lcr               %r5,%r4
        llcr              %r4,%r4
2:
        rll               %r0,%r14,8(%r2)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r4
        jlh               3f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
4:
        rll               %r4,%r14,8(%r2)
        risbg             %r5,%r4,32,55
        llcr              %r4,%r4
        cr                %r4,%r0
        jlh               5f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                4b
5:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r4
6:
        rll               %r0,%r14,8(%r2)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r4
        jlh               7f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                6b
7:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
8:
        rll               %r4,%r14,8(%r2)
        risbg             %r5,%r4,32,55
        llcr              %r4,%r4
        cr                %r4,%r0
        jlh               0b
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::neg::u8::acquire:
        stmg              %r13,%r15,104(%r15)
        lb                %r4,0(%r2)
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        lcr               %r3,%r2
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r1)
        lcr               %r5,%r4
        llcr              %r4,%r4
2:
        rll               %r0,%r14,8(%r2)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r4
        jlh               3f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
4:
        rll               %r4,%r14,8(%r2)
        risbg             %r5,%r4,32,55
        llcr              %r4,%r4
        cr                %r4,%r0
        jlh               5f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                4b
5:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r4
6:
        rll               %r0,%r14,8(%r2)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r4
        jlh               7f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                6b
7:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
8:
        rll               %r4,%r14,8(%r2)
        risbg             %r5,%r4,32,55
        llcr              %r4,%r4
        cr                %r4,%r0
        jlh               0b
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::neg::u8::relaxed:
        stmg              %r13,%r15,104(%r15)
        lb                %r4,0(%r2)
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        lcr               %r3,%r2
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r1)
        lcr               %r5,%r4
        llcr              %r4,%r4
2:
        rll               %r0,%r14,8(%r2)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r4
        jlh               3f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
4:
        rll               %r4,%r14,8(%r2)
        risbg             %r5,%r4,32,55
        llcr              %r4,%r4
        cr                %r4,%r0
        jlh               5f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                4b
5:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r4
6:
        rll               %r0,%r14,8(%r2)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r4
        jlh               7f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                6b
7:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
8:
        rll               %r4,%r14,8(%r2)
        risbg             %r5,%r4,32,55
        llcr              %r4,%r4
        cr                %r4,%r0
        jlh               0b
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::neg::u8::release:
        stmg              %r13,%r15,104(%r15)
        lb                %r4,0(%r2)
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        lcr               %r3,%r2
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r1)
        lcr               %r5,%r4
        llcr              %r4,%r4
2:
        rll               %r0,%r14,8(%r2)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r4
        jlh               3f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
4:
        rll               %r4,%r14,8(%r2)
        risbg             %r5,%r4,32,55
        llcr              %r4,%r4
        cr                %r4,%r0
        jlh               5f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                4b
5:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r4
6:
        rll               %r0,%r14,8(%r2)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r4
        jlh               7f
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                6b
7:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
8:
        rll               %r4,%r14,8(%r2)
        risbg             %r5,%r4,32,55
        llcr              %r4,%r4
        cr                %r4,%r0
        jlh               0b
        rll               %r13,%r5,-8(%r3)
        cs                %r14,%r13,0(%r1)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::neg::u16::acqrel:
        stmg              %r13,%r15,104(%r15)
        lh                %r4,0(%r2)
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        lcr               %r3,%r2
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r1)
        lcr               %r5,%r4
        llhr              %r4,%r4
2:
        rll               %r0,%r14,16(%r2)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r4
        jlh               3f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
4:
        rll               %r4,%r14,16(%r2)
        risbg             %r5,%r4,32,47
        llhr              %r4,%r4
        cr                %r4,%r0
        jlh               5f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                4b
5:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r4
6:
        rll               %r0,%r14,16(%r2)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r4
        jlh               7f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                6b
7:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
8:
        rll               %r4,%r14,16(%r2)
        risbg             %r5,%r4,32,47
        llhr              %r4,%r4
        cr                %r4,%r0
        jlh               0b
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::neg::u16::seqcst:
        stmg              %r13,%r15,104(%r15)
        lh                %r4,0(%r2)
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        lcr               %r3,%r2
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r1)
        lcr               %r5,%r4
        llhr              %r4,%r4
2:
        rll               %r0,%r14,16(%r2)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r4
        jlh               3f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
4:
        rll               %r4,%r14,16(%r2)
        risbg             %r5,%r4,32,47
        llhr              %r4,%r4
        cr                %r4,%r0
        jlh               5f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                4b
5:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r4
6:
        rll               %r0,%r14,16(%r2)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r4
        jlh               7f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                6b
7:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
8:
        rll               %r4,%r14,16(%r2)
        risbg             %r5,%r4,32,47
        llhr              %r4,%r4
        cr                %r4,%r0
        jlh               0b
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::neg::u16::acquire:
        stmg              %r13,%r15,104(%r15)
        lh                %r4,0(%r2)
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        lcr               %r3,%r2
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r1)
        lcr               %r5,%r4
        llhr              %r4,%r4
2:
        rll               %r0,%r14,16(%r2)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r4
        jlh               3f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
4:
        rll               %r4,%r14,16(%r2)
        risbg             %r5,%r4,32,47
        llhr              %r4,%r4
        cr                %r4,%r0
        jlh               5f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                4b
5:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r4
6:
        rll               %r0,%r14,16(%r2)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r4
        jlh               7f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                6b
7:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
8:
        rll               %r4,%r14,16(%r2)
        risbg             %r5,%r4,32,47
        llhr              %r4,%r4
        cr                %r4,%r0
        jlh               0b
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::neg::u16::relaxed:
        stmg              %r13,%r15,104(%r15)
        lh                %r4,0(%r2)
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        lcr               %r3,%r2
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r1)
        lcr               %r5,%r4
        llhr              %r4,%r4
2:
        rll               %r0,%r14,16(%r2)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r4
        jlh               3f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
4:
        rll               %r4,%r14,16(%r2)
        risbg             %r5,%r4,32,47
        llhr              %r4,%r4
        cr                %r4,%r0
        jlh               5f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                4b
5:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r4
6:
        rll               %r0,%r14,16(%r2)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r4
        jlh               7f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                6b
7:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
8:
        rll               %r4,%r14,16(%r2)
        risbg             %r5,%r4,32,47
        llhr              %r4,%r4
        cr                %r4,%r0
        jlh               0b
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::neg::u16::release:
        stmg              %r13,%r15,104(%r15)
        lh                %r4,0(%r2)
        risbgnz           %r1,%r2,0,61
        sll               %r2,3
        lcr               %r3,%r2
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r1)
        lcr               %r5,%r4
        llhr              %r4,%r4
2:
        rll               %r0,%r14,16(%r2)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r4
        jlh               3f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
4:
        rll               %r4,%r14,16(%r2)
        risbg             %r5,%r4,32,47
        llhr              %r4,%r4
        cr                %r4,%r0
        jlh               5f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                4b
5:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r4
6:
        rll               %r0,%r14,16(%r2)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r4
        jlh               7f
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                6b
7:
        je                9f
        l                 %r14,0(%r1)
        lcr               %r5,%r0
8:
        rll               %r4,%r14,16(%r2)
        risbg             %r5,%r4,32,47
        llhr              %r4,%r4
        cr                %r4,%r0
        jlh               0b
        rll               %r13,%r5,-16(%r3)
        cs                %r14,%r13,0(%r1)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::neg::u32::acqrel:
        l                 %r0,0(%r2)
0:
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        jl                0b
1:
        br                %r14

asm_test::neg::u32::seqcst:
        l                 %r0,0(%r2)
0:
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        jl                0b
1:
        br                %r14

asm_test::neg::u32::acquire:
        l                 %r0,0(%r2)
0:
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        jl                0b
1:
        br                %r14

asm_test::neg::u32::relaxed:
        l                 %r0,0(%r2)
0:
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        jl                0b
1:
        br                %r14

asm_test::neg::u32::release:
        l                 %r0,0(%r2)
0:
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        je                1f
        lcr               %r1,%r0
        cs                %r0,%r1,0(%r2)
        jl                0b
1:
        br                %r14

asm_test::neg::u64::acqrel:
        lg                %r0,0(%r2)
0:
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        jl                0b
1:
        br                %r14

asm_test::neg::u64::seqcst:
        lg                %r0,0(%r2)
0:
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        jl                0b
1:
        br                %r14

asm_test::neg::u64::acquire:
        lg                %r0,0(%r2)
0:
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        jl                0b
1:
        br                %r14

asm_test::neg::u64::relaxed:
        lg                %r0,0(%r2)
0:
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        jl                0b
1:
        br                %r14

asm_test::neg::u64::release:
        lg                %r0,0(%r2)
0:
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        je                1f
        lcgr              %r1,%r0
        csg               %r0,%r1,0(%r2)
        jl                0b
1:
        br                %r14

asm_test::neg::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lghi              %r3,0
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        slgrk             %r13,%r3,%r1
        lghi              %r12,0
        slbgr             %r12,%r0
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::neg::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lghi              %r3,0
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        slgrk             %r13,%r3,%r1
        lghi              %r12,0
        slbgr             %r12,%r0
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::neg::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lghi              %r3,0
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        slgrk             %r13,%r3,%r1
        lghi              %r12,0
        slbgr             %r12,%r0
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::neg::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lghi              %r3,0
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        slgrk             %r13,%r3,%r1
        lghi              %r12,0
        slbgr             %r12,%r0
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::neg::u128::release:
        stmg              %r12,%r15,96(%r15)
        lghi              %r3,0
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        slgrk             %r13,%r3,%r1
        lghi              %r12,0
        slbgr             %r12,%r0
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::not::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4278190080
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        br                %r14

asm_test::not::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4278190080
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        br                %r14

asm_test::not::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4278190080
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        br                %r14

asm_test::not::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4278190080
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        br                %r14

asm_test::not::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4278190080
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        br                %r14

asm_test::not::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4294901760
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        br                %r14

asm_test::not::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4294901760
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        br                %r14

asm_test::not::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4294901760
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        br                %r14

asm_test::not::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4294901760
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        br                %r14

asm_test::not::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4294901760
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        br                %r14

asm_test::not::u32::acqrel:
        lhi               %r0,-1
        lax               %r0,%r0,0(%r2)
        br                %r14

asm_test::not::u32::seqcst:
        lhi               %r0,-1
        lax               %r0,%r0,0(%r2)
        br                %r14

asm_test::not::u32::acquire:
        lhi               %r0,-1
        lax               %r0,%r0,0(%r2)
        br                %r14

asm_test::not::u32::relaxed:
        lhi               %r0,-1
        lax               %r0,%r0,0(%r2)
        br                %r14

asm_test::not::u32::release:
        lhi               %r0,-1
        lax               %r0,%r0,0(%r2)
        br                %r14

asm_test::not::u64::acqrel:
        lghi              %r0,-1
        laxg              %r0,%r0,0(%r2)
        br                %r14

asm_test::not::u64::seqcst:
        lghi              %r0,-1
        laxg              %r0,%r0,0(%r2)
        br                %r14

asm_test::not::u64::acquire:
        lghi              %r0,-1
        laxg              %r0,%r0,0(%r2)
        br                %r14

asm_test::not::u64::relaxed:
        lghi              %r0,-1
        laxg              %r0,%r0,0(%r2)
        br                %r14

asm_test::not::u64::release:
        lghi              %r0,-1
        laxg              %r0,%r0,0(%r2)
        br                %r14

asm_test::not::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        lcgr              %r13,%r1
        aghi              %r13,-1
        lcgr              %r12,%r0
        aghi              %r12,-1
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::not::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        lcgr              %r13,%r1
        aghi              %r13,-1
        lcgr              %r12,%r0
        aghi              %r12,-1
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::not::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        lcgr              %r13,%r1
        aghi              %r13,-1
        lcgr              %r12,%r0
        aghi              %r12,-1
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::not::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        lcgr              %r13,%r1
        aghi              %r13,-1
        lcgr              %r12,%r0
        aghi              %r12,-1
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::not::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        lcgr              %r13,%r1
        aghi              %r13,-1
        lcgr              %r12,%r0
        aghi              %r12,-1
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::sub::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::sub::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::sub::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::sub::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::sub::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::sub::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::sub::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::sub::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::sub::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::sub::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::sub::u32::acqrel:
        lcr               %r0,%r3
        laa               %r0,%r0,0(%r2)
        br                %r14

asm_test::sub::u32::seqcst:
        lcr               %r0,%r3
        laa               %r0,%r0,0(%r2)
        br                %r14

asm_test::sub::u32::acquire:
        lcr               %r0,%r3
        laa               %r0,%r0,0(%r2)
        br                %r14

asm_test::sub::u32::relaxed:
        lcr               %r0,%r3
        laa               %r0,%r0,0(%r2)
        br                %r14

asm_test::sub::u32::release:
        lcr               %r0,%r3
        laa               %r0,%r0,0(%r2)
        br                %r14

asm_test::sub::u64::acqrel:
        lcgr              %r0,%r3
        laag              %r0,%r0,0(%r2)
        br                %r14

asm_test::sub::u64::seqcst:
        lcgr              %r0,%r3
        laag              %r0,%r0,0(%r2)
        br                %r14

asm_test::sub::u64::acquire:
        lcgr              %r0,%r3
        laag              %r0,%r0,0(%r2)
        br                %r14

asm_test::sub::u64::relaxed:
        lcgr              %r0,%r3
        laag              %r0,%r0,0(%r2)
        br                %r14

asm_test::sub::u64::release:
        lcgr              %r0,%r3
        laag              %r0,%r0,0(%r2)
        br                %r14

asm_test::sub::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        slgrk             %r13,%r1,%r3
        lgr               %r12,%r0
        slbgr             %r12,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::sub::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        slgrk             %r13,%r1,%r3
        lgr               %r12,%r0
        slbgr             %r12,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::sub::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        slgrk             %r13,%r1,%r3
        lgr               %r12,%r0
        slbgr             %r12,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::sub::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        slgrk             %r13,%r1,%r3
        lgr               %r12,%r0
        slbgr             %r12,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::sub::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        slgrk             %r13,%r1,%r3
        lgr               %r12,%r0
        slbgr             %r12,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::xor::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::xor::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::xor::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::xor::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::xor::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::xor::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::xor::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::xor::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::xor::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::xor::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        br                %r14

asm_test::xor::u32::acqrel:
        lax               %r0,%r3,0(%r2)
        br                %r14

asm_test::xor::u32::seqcst:
        lax               %r0,%r3,0(%r2)
        br                %r14

asm_test::xor::u32::acquire:
        lax               %r0,%r3,0(%r2)
        br                %r14

asm_test::xor::u32::relaxed:
        lax               %r0,%r3,0(%r2)
        br                %r14

asm_test::xor::u32::release:
        lax               %r0,%r3,0(%r2)
        br                %r14

asm_test::xor::u64::acqrel:
        laxg              %r0,%r3,0(%r2)
        br                %r14

asm_test::xor::u64::seqcst:
        laxg              %r0,%r3,0(%r2)
        br                %r14

asm_test::xor::u64::acquire:
        laxg              %r0,%r3,0(%r2)
        br                %r14

asm_test::xor::u64::relaxed:
        laxg              %r0,%r3,0(%r2)
        br                %r14

asm_test::xor::u64::release:
        laxg              %r0,%r3,0(%r2)
        br                %r14

asm_test::xor::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        xgrk              %r13,%r1,%r3
        xgrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::xor::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        xgrk              %r13,%r1,%r3
        xgrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::xor::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        xgrk              %r13,%r1,%r3
        xgrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::xor::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        xgrk              %r13,%r1,%r3
        xgrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::xor::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r4,0(%r3)
        lg                %r3,8(%r3)
        lg                %r0,8(%r2)
        lg                %r1,0(%r2)
0:
        xgrk              %r13,%r1,%r3
        xgrk              %r12,%r0,%r4
        cdsg              %r0,%r12,0(%r2)
        jl                0b
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::load::u8::seqcst:
        lb                %r2,0(%r2)
        br                %r14

asm_test::load::u8::acquire:
        lb                %r2,0(%r2)
        br                %r14

asm_test::load::u8::relaxed:
        lb                %r2,0(%r2)
        br                %r14

asm_test::load::u16::seqcst:
        lh                %r2,0(%r2)
        br                %r14

asm_test::load::u16::acquire:
        lh                %r2,0(%r2)
        br                %r14

asm_test::load::u16::relaxed:
        lh                %r2,0(%r2)
        br                %r14

asm_test::load::u32::seqcst:
        l                 %r2,0(%r2)
        br                %r14

asm_test::load::u32::acquire:
        l                 %r2,0(%r2)
        br                %r14

asm_test::load::u32::relaxed:
        l                 %r2,0(%r2)
        br                %r14

asm_test::load::u64::seqcst:
        lg                %r2,0(%r2)
        br                %r14

asm_test::load::u64::acquire:
        lg                %r2,0(%r2)
        br                %r14

asm_test::load::u64::relaxed:
        lg                %r2,0(%r2)
        br                %r14

asm_test::load::bool::seqcst:
        tm                0(%r2),255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::load::bool::acquire:
        tm                0(%r2),255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::load::bool::relaxed:
        tm                0(%r2),255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::load::u128::seqcst:
        lpq               %r0,0(%r3)
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        br                %r14

asm_test::load::u128::acquire:
        lpq               %r0,0(%r3)
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        br                %r14

asm_test::load::u128::relaxed:
        lpq               %r0,0(%r3)
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        br                %r14

asm_test::swap::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,39,24
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::swap::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,39,24
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::swap::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,39,24
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::swap::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,39,24
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::swap::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,39,24
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::swap::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,47,16
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::swap::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,47,16
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::swap::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,47,16
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::swap::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,47,16
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::swap::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,47,16
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::swap::u32::acqrel:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cs                %r2,%r3,0(%r1)
        jl                0b
        br                %r14

asm_test::swap::u32::seqcst:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cs                %r2,%r3,0(%r1)
        jl                0b
        br                %r14

asm_test::swap::u32::acquire:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cs                %r2,%r3,0(%r1)
        jl                0b
        br                %r14

asm_test::swap::u32::relaxed:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cs                %r2,%r3,0(%r1)
        jl                0b
        br                %r14

asm_test::swap::u32::release:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cs                %r2,%r3,0(%r1)
        jl                0b
        br                %r14

asm_test::swap::u64::acqrel:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        csg               %r2,%r3,0(%r1)
        jl                0b
        br                %r14

asm_test::swap::u64::seqcst:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        csg               %r2,%r3,0(%r1)
        jl                0b
        br                %r14

asm_test::swap::u64::acquire:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        csg               %r2,%r3,0(%r1)
        jl                0b
        br                %r14

asm_test::swap::u64::relaxed:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        csg               %r2,%r3,0(%r1)
        jl                0b
        br                %r14

asm_test::swap::u64::release:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        csg               %r2,%r3,0(%r1)
        jl                0b
        br                %r14

asm_test::swap::bool::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,39,24
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::swap::bool::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,39,24
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::swap::bool::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,39,24
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::swap::bool::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,39,24
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::swap::bool::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        risbg             %r5,%r3,32,39,24
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::swap::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r12,0(%r4)
        lg                %r13,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::swap::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r12,0(%r4)
        lg                %r13,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::swap::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r12,0(%r4)
        lg                %r13,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::swap::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r12,0(%r4)
        lg                %r13,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::swap::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r12,0(%r4)
        lg                %r13,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::store::u8::seqcst:
        stc               %r3,0(%r2)
        bnor              %r0
        br                %r14

asm_test::store::u8::relaxed:
        stc               %r3,0(%r2)
        br                %r14

asm_test::store::u8::release:
        stc               %r3,0(%r2)
        br                %r14

asm_test::store::u16::seqcst:
        sth               %r3,0(%r2)
        bnor              %r0
        br                %r14

asm_test::store::u16::relaxed:
        sth               %r3,0(%r2)
        br                %r14

asm_test::store::u16::release:
        sth               %r3,0(%r2)
        br                %r14

asm_test::store::u32::seqcst:
        st                %r3,0(%r2)
        bnor              %r0
        br                %r14

asm_test::store::u32::relaxed:
        st                %r3,0(%r2)
        br                %r14

asm_test::store::u32::release:
        st                %r3,0(%r2)
        br                %r14

asm_test::store::u64::seqcst:
        stg               %r3,0(%r2)
        bnor              %r0
        br                %r14

asm_test::store::u64::relaxed:
        stg               %r3,0(%r2)
        br                %r14

asm_test::store::u64::release:
        stg               %r3,0(%r2)
        br                %r14

asm_test::store::bool::seqcst:
        stc               %r3,0(%r2)
        bnor              %r0
        br                %r14

asm_test::store::bool::relaxed:
        stc               %r3,0(%r2)
        br                %r14

asm_test::store::bool::release:
        stc               %r3,0(%r2)
        br                %r14

asm_test::store::u128::seqcst:
        lg                %r0,0(%r3)
        lg                %r1,8(%r3)
        stpq              %r0,0(%r2)
        bnor              %r0
        br                %r14

asm_test::store::u128::relaxed:
        lg                %r0,0(%r3)
        lg                %r1,8(%r3)
        stpq              %r0,0(%r2)
        br                %r14

asm_test::store::u128::release:
        lg                %r0,0(%r3)
        lg                %r1,8(%r3)
        stpq              %r0,0(%r2)
        br                %r14

asm_test::fetch_or::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_or::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_or::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_or::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_or::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_or::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_or::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_or::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_or::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_or::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_or::u32::acqrel:
        lao               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_or::u32::seqcst:
        lao               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_or::u32::acquire:
        lao               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_or::u32::relaxed:
        lao               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_or::u32::release:
        lao               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_or::u64::acqrel:
        laog              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_or::u64::seqcst:
        laog              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_or::u64::acquire:
        laog              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_or::u64::relaxed:
        laog              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_or::u64::release:
        laog              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_or::bool::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_or::bool::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_or::bool::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_or::bool::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_or::bool::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        or                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_or::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        ogrk              %r13,%r1,%r4
        ogrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_or::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        ogrk              %r13,%r1,%r4
        ogrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_or::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        ogrk              %r13,%r1,%r4
        ogrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_or::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        ogrk              %r13,%r1,%r4
        ogrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_or::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        ogrk              %r13,%r1,%r4
        ogrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_add::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_add::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_add::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_add::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_add::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_add::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_add::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_add::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_add::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_add::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        ar                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_add::u32::acqrel:
        laa               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_add::u32::seqcst:
        laa               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_add::u32::acquire:
        laa               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_add::u32::relaxed:
        laa               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_add::u32::release:
        laa               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_add::u64::acqrel:
        laag              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_add::u64::seqcst:
        laag              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_add::u64::acquire:
        laag              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_add::u64::relaxed:
        laag              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_add::u64::release:
        laag              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_add::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        algrk             %r13,%r1,%r4
        lgr               %r12,%r0
        alcgr             %r12,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_add::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        algrk             %r13,%r1,%r4
        lgr               %r12,%r0
        alcgr             %r12,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_add::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        algrk             %r13,%r1,%r4
        lgr               %r12,%r0
        alcgr             %r12,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_add::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        algrk             %r13,%r1,%r4
        lgr               %r12,%r0
        alcgr             %r12,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_add::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        algrk             %r13,%r1,%r4
        lgr               %r12,%r0
        alcgr             %r12,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_and::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_and::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_and::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_and::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_and::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,24
        sll               %r2,3
        oilf              %r3,16777215
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_and::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_and::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_and::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_and::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_and::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r3,16
        sll               %r2,3
        oill              %r3,65535
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_and::u32::acqrel:
        lan               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_and::u32::seqcst:
        lan               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_and::u32::acquire:
        lan               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_and::u32::relaxed:
        lan               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_and::u32::release:
        lan               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_and::u64::acqrel:
        lang              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_and::u64::seqcst:
        lang              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_and::u64::acquire:
        lang              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_and::u64::relaxed:
        lang              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_and::u64::release:
        lang              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_and::bool::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
        oilf              %r3,16777215
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_and::bool::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
        oilf              %r3,16777215
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_and::bool::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
        oilf              %r3,16777215
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_and::bool::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
        oilf              %r3,16777215
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_and::bool::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
        oilf              %r3,16777215
0:
        rll               %r5,%r0,0(%r2)
        nr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_and::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        ngrk              %r13,%r1,%r4
        ngrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_and::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        ngrk              %r13,%r1,%r4
        ngrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_and::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        ngrk              %r13,%r1,%r4
        ngrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_and::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        ngrk              %r13,%r1,%r4
        ngrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_and::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        ngrk              %r13,%r1,%r4
        ngrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_max::i8::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i8::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i8::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i8::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i8::release:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i16::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i16::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i16::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i16::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i16::release:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrl             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i32::acqrel:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        selrh             %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i32::seqcst:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        selrh             %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i32::acquire:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        selrh             %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i32::relaxed:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        selrh             %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i32::release:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        selrh             %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i64::acqrel:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        selgrh            %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i64::seqcst:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        selgrh            %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i64::acquire:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        selgrh            %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i64::relaxed:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        selgrh            %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i64::release:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        selgrh            %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrh            %r12,%r1,%r4
        cgr               %r0,%r5
        selgrh            %r13,%r1,%r4
        locgre            %r13,%r12
        selgrh            %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_max::i128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrh            %r12,%r1,%r4
        cgr               %r0,%r5
        selgrh            %r13,%r1,%r4
        locgre            %r13,%r12
        selgrh            %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_max::i128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrh            %r12,%r1,%r4
        cgr               %r0,%r5
        selgrh            %r13,%r1,%r4
        locgre            %r13,%r12
        selgrh            %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_max::i128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrh            %r12,%r1,%r4
        cgr               %r0,%r5
        selgrh            %r13,%r1,%r4
        locgre            %r13,%r12
        selgrh            %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_max::i128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrh            %r12,%r1,%r4
        cgr               %r0,%r5
        selgrh            %r13,%r1,%r4
        locgre            %r13,%r12
        selgrh            %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_min::i8::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i8::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i8::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i8::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i8::release:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i16::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i16::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i16::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i16::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i16::release:
        stmg              %r14,%r15,112(%r15)
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrh             %r5,%r14
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i32::acqrel:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        selrle            %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i32::seqcst:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        selrle            %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i32::acquire:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        selrle            %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i32::relaxed:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        selrle            %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i32::release:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        selrle            %r0,%r2,%r3
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i64::acqrel:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        selgrle           %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i64::seqcst:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        selgrle           %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i64::acquire:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        selgrle           %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i64::relaxed:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        selgrle           %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i64::release:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        selgrle           %r0,%r2,%r3
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrl            %r12,%r1,%r4
        cgr               %r0,%r5
        selgrl            %r13,%r1,%r4
        locgre            %r13,%r12
        selgrl            %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_min::i128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrl            %r12,%r1,%r4
        cgr               %r0,%r5
        selgrl            %r13,%r1,%r4
        locgre            %r13,%r12
        selgrl            %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_min::i128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrl            %r12,%r1,%r4
        cgr               %r0,%r5
        selgrl            %r13,%r1,%r4
        locgre            %r13,%r12
        selgrl            %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_min::i128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrl            %r12,%r1,%r4
        cgr               %r0,%r5
        selgrl            %r13,%r1,%r4
        locgre            %r13,%r12
        selgrl            %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_min::i128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        clgr              %r1,%r4
        selgrl            %r12,%r1,%r4
        cgr               %r0,%r5
        selgrl            %r13,%r1,%r4
        locgre            %r13,%r12
        selgrl            %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_neg::u8::acqrel:
        stmg              %r13,%r15,104(%r15)
        lgr               %r1,%r2
        lb                %r2,0(%r2)
        risbgnz           %r3,%r1,0,61
        sll               %r1,3
        lcr               %r4,%r1
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r3)
        lcr               %r0,%r2
        llcr              %r5,%r2
2:
        rll               %r2,%r14,8(%r1)
        risbg             %r0,%r2,32,55
        llcr              %r2,%r2
        cr                %r2,%r5
        jlh               3f
        rll               %r13,%r0,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r3)
        lcr               %r5,%r2
4:
        rll               %r0,%r14,8(%r1)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r2
        jlh               5f
        rll               %r13,%r5,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                4b
5:
        je                10f
        l                 %r14,0(%r3)
        lcr               %r2,%r0
6:
        rll               %r5,%r14,8(%r1)
        risbg             %r2,%r5,32,55
        llcr              %r5,%r5
        cr                %r5,%r0
        jlh               7f
        rll               %r13,%r2,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                6b
7:
        je                11f
        l                 %r14,0(%r3)
        lcr               %r0,%r5
8:
        rll               %r2,%r14,8(%r1)
        risbg             %r0,%r2,32,55
        llcr              %r2,%r2
        cr                %r2,%r5
        jlh               0b
        rll               %r13,%r0,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14
10:
        lr                %r2,%r0
        lmg               %r13,%r15,104(%r15)
        br                %r14
11:
        lr                %r2,%r5
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::fetch_neg::u8::seqcst:
        stmg              %r13,%r15,104(%r15)
        lgr               %r1,%r2
        lb                %r2,0(%r2)
        risbgnz           %r3,%r1,0,61
        sll               %r1,3
        lcr               %r4,%r1
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r3)
        lcr               %r0,%r2
        llcr              %r5,%r2
2:
        rll               %r2,%r14,8(%r1)
        risbg             %r0,%r2,32,55
        llcr              %r2,%r2
        cr                %r2,%r5
        jlh               3f
        rll               %r13,%r0,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r3)
        lcr               %r5,%r2
4:
        rll               %r0,%r14,8(%r1)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r2
        jlh               5f
        rll               %r13,%r5,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                4b
5:
        je                10f
        l                 %r14,0(%r3)
        lcr               %r2,%r0
6:
        rll               %r5,%r14,8(%r1)
        risbg             %r2,%r5,32,55
        llcr              %r5,%r5
        cr                %r5,%r0
        jlh               7f
        rll               %r13,%r2,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                6b
7:
        je                11f
        l                 %r14,0(%r3)
        lcr               %r0,%r5
8:
        rll               %r2,%r14,8(%r1)
        risbg             %r0,%r2,32,55
        llcr              %r2,%r2
        cr                %r2,%r5
        jlh               0b
        rll               %r13,%r0,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14
10:
        lr                %r2,%r0
        lmg               %r13,%r15,104(%r15)
        br                %r14
11:
        lr                %r2,%r5
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::fetch_neg::u8::acquire:
        stmg              %r13,%r15,104(%r15)
        lgr               %r1,%r2
        lb                %r2,0(%r2)
        risbgnz           %r3,%r1,0,61
        sll               %r1,3
        lcr               %r4,%r1
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r3)
        lcr               %r0,%r2
        llcr              %r5,%r2
2:
        rll               %r2,%r14,8(%r1)
        risbg             %r0,%r2,32,55
        llcr              %r2,%r2
        cr                %r2,%r5
        jlh               3f
        rll               %r13,%r0,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r3)
        lcr               %r5,%r2
4:
        rll               %r0,%r14,8(%r1)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r2
        jlh               5f
        rll               %r13,%r5,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                4b
5:
        je                10f
        l                 %r14,0(%r3)
        lcr               %r2,%r0
6:
        rll               %r5,%r14,8(%r1)
        risbg             %r2,%r5,32,55
        llcr              %r5,%r5
        cr                %r5,%r0
        jlh               7f
        rll               %r13,%r2,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                6b
7:
        je                11f
        l                 %r14,0(%r3)
        lcr               %r0,%r5
8:
        rll               %r2,%r14,8(%r1)
        risbg             %r0,%r2,32,55
        llcr              %r2,%r2
        cr                %r2,%r5
        jlh               0b
        rll               %r13,%r0,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14
10:
        lr                %r2,%r0
        lmg               %r13,%r15,104(%r15)
        br                %r14
11:
        lr                %r2,%r5
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::fetch_neg::u8::relaxed:
        stmg              %r13,%r15,104(%r15)
        lgr               %r1,%r2
        lb                %r2,0(%r2)
        risbgnz           %r3,%r1,0,61
        sll               %r1,3
        lcr               %r4,%r1
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r3)
        lcr               %r0,%r2
        llcr              %r5,%r2
2:
        rll               %r2,%r14,8(%r1)
        risbg             %r0,%r2,32,55
        llcr              %r2,%r2
        cr                %r2,%r5
        jlh               3f
        rll               %r13,%r0,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r3)
        lcr               %r5,%r2
4:
        rll               %r0,%r14,8(%r1)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r2
        jlh               5f
        rll               %r13,%r5,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                4b
5:
        je                10f
        l                 %r14,0(%r3)
        lcr               %r2,%r0
6:
        rll               %r5,%r14,8(%r1)
        risbg             %r2,%r5,32,55
        llcr              %r5,%r5
        cr                %r5,%r0
        jlh               7f
        rll               %r13,%r2,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                6b
7:
        je                11f
        l                 %r14,0(%r3)
        lcr               %r0,%r5
8:
        rll               %r2,%r14,8(%r1)
        risbg             %r0,%r2,32,55
        llcr              %r2,%r2
        cr                %r2,%r5
        jlh               0b
        rll               %r13,%r0,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14
10:
        lr                %r2,%r0
        lmg               %r13,%r15,104(%r15)
        br                %r14
11:
        lr                %r2,%r5
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::fetch_neg::u8::release:
        stmg              %r13,%r15,104(%r15)
        lgr               %r1,%r2
        lb                %r2,0(%r2)
        risbgnz           %r3,%r1,0,61
        sll               %r1,3
        lcr               %r4,%r1
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r3)
        lcr               %r0,%r2
        llcr              %r5,%r2
2:
        rll               %r2,%r14,8(%r1)
        risbg             %r0,%r2,32,55
        llcr              %r2,%r2
        cr                %r2,%r5
        jlh               3f
        rll               %r13,%r0,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r3)
        lcr               %r5,%r2
4:
        rll               %r0,%r14,8(%r1)
        risbg             %r5,%r0,32,55
        llcr              %r0,%r0
        cr                %r0,%r2
        jlh               5f
        rll               %r13,%r5,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                4b
5:
        je                10f
        l                 %r14,0(%r3)
        lcr               %r2,%r0
6:
        rll               %r5,%r14,8(%r1)
        risbg             %r2,%r5,32,55
        llcr              %r5,%r5
        cr                %r5,%r0
        jlh               7f
        rll               %r13,%r2,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                6b
7:
        je                11f
        l                 %r14,0(%r3)
        lcr               %r0,%r5
8:
        rll               %r2,%r14,8(%r1)
        risbg             %r0,%r2,32,55
        llcr              %r2,%r2
        cr                %r2,%r5
        jlh               0b
        rll               %r13,%r0,-8(%r4)
        cs                %r14,%r13,0(%r3)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14
10:
        lr                %r2,%r0
        lmg               %r13,%r15,104(%r15)
        br                %r14
11:
        lr                %r2,%r5
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::fetch_neg::u16::acqrel:
        stmg              %r13,%r15,104(%r15)
        lgr               %r1,%r2
        lh                %r2,0(%r2)
        risbgnz           %r3,%r1,0,61
        sll               %r1,3
        lcr               %r4,%r1
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r3)
        lcr               %r0,%r2
        llhr              %r5,%r2
2:
        rll               %r2,%r14,16(%r1)
        risbg             %r0,%r2,32,47
        llhr              %r2,%r2
        cr                %r2,%r5
        jlh               3f
        rll               %r13,%r0,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r3)
        lcr               %r5,%r2
4:
        rll               %r0,%r14,16(%r1)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r2
        jlh               5f
        rll               %r13,%r5,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                4b
5:
        je                10f
        l                 %r14,0(%r3)
        lcr               %r2,%r0
6:
        rll               %r5,%r14,16(%r1)
        risbg             %r2,%r5,32,47
        llhr              %r5,%r5
        cr                %r5,%r0
        jlh               7f
        rll               %r13,%r2,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                6b
7:
        je                11f
        l                 %r14,0(%r3)
        lcr               %r0,%r5
8:
        rll               %r2,%r14,16(%r1)
        risbg             %r0,%r2,32,47
        llhr              %r2,%r2
        cr                %r2,%r5
        jlh               0b
        rll               %r13,%r0,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14
10:
        lr                %r2,%r0
        lmg               %r13,%r15,104(%r15)
        br                %r14
11:
        lr                %r2,%r5
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::fetch_neg::u16::seqcst:
        stmg              %r13,%r15,104(%r15)
        lgr               %r1,%r2
        lh                %r2,0(%r2)
        risbgnz           %r3,%r1,0,61
        sll               %r1,3
        lcr               %r4,%r1
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r3)
        lcr               %r0,%r2
        llhr              %r5,%r2
2:
        rll               %r2,%r14,16(%r1)
        risbg             %r0,%r2,32,47
        llhr              %r2,%r2
        cr                %r2,%r5
        jlh               3f
        rll               %r13,%r0,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r3)
        lcr               %r5,%r2
4:
        rll               %r0,%r14,16(%r1)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r2
        jlh               5f
        rll               %r13,%r5,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                4b
5:
        je                10f
        l                 %r14,0(%r3)
        lcr               %r2,%r0
6:
        rll               %r5,%r14,16(%r1)
        risbg             %r2,%r5,32,47
        llhr              %r5,%r5
        cr                %r5,%r0
        jlh               7f
        rll               %r13,%r2,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                6b
7:
        je                11f
        l                 %r14,0(%r3)
        lcr               %r0,%r5
8:
        rll               %r2,%r14,16(%r1)
        risbg             %r0,%r2,32,47
        llhr              %r2,%r2
        cr                %r2,%r5
        jlh               0b
        rll               %r13,%r0,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14
10:
        lr                %r2,%r0
        lmg               %r13,%r15,104(%r15)
        br                %r14
11:
        lr                %r2,%r5
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::fetch_neg::u16::acquire:
        stmg              %r13,%r15,104(%r15)
        lgr               %r1,%r2
        lh                %r2,0(%r2)
        risbgnz           %r3,%r1,0,61
        sll               %r1,3
        lcr               %r4,%r1
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r3)
        lcr               %r0,%r2
        llhr              %r5,%r2
2:
        rll               %r2,%r14,16(%r1)
        risbg             %r0,%r2,32,47
        llhr              %r2,%r2
        cr                %r2,%r5
        jlh               3f
        rll               %r13,%r0,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r3)
        lcr               %r5,%r2
4:
        rll               %r0,%r14,16(%r1)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r2
        jlh               5f
        rll               %r13,%r5,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                4b
5:
        je                10f
        l                 %r14,0(%r3)
        lcr               %r2,%r0
6:
        rll               %r5,%r14,16(%r1)
        risbg             %r2,%r5,32,47
        llhr              %r5,%r5
        cr                %r5,%r0
        jlh               7f
        rll               %r13,%r2,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                6b
7:
        je                11f
        l                 %r14,0(%r3)
        lcr               %r0,%r5
8:
        rll               %r2,%r14,16(%r1)
        risbg             %r0,%r2,32,47
        llhr              %r2,%r2
        cr                %r2,%r5
        jlh               0b
        rll               %r13,%r0,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14
10:
        lr                %r2,%r0
        lmg               %r13,%r15,104(%r15)
        br                %r14
11:
        lr                %r2,%r5
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::fetch_neg::u16::relaxed:
        stmg              %r13,%r15,104(%r15)
        lgr               %r1,%r2
        lh                %r2,0(%r2)
        risbgnz           %r3,%r1,0,61
        sll               %r1,3
        lcr               %r4,%r1
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r3)
        lcr               %r0,%r2
        llhr              %r5,%r2
2:
        rll               %r2,%r14,16(%r1)
        risbg             %r0,%r2,32,47
        llhr              %r2,%r2
        cr                %r2,%r5
        jlh               3f
        rll               %r13,%r0,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r3)
        lcr               %r5,%r2
4:
        rll               %r0,%r14,16(%r1)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r2
        jlh               5f
        rll               %r13,%r5,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                4b
5:
        je                10f
        l                 %r14,0(%r3)
        lcr               %r2,%r0
6:
        rll               %r5,%r14,16(%r1)
        risbg             %r2,%r5,32,47
        llhr              %r5,%r5
        cr                %r5,%r0
        jlh               7f
        rll               %r13,%r2,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                6b
7:
        je                11f
        l                 %r14,0(%r3)
        lcr               %r0,%r5
8:
        rll               %r2,%r14,16(%r1)
        risbg             %r0,%r2,32,47
        llhr              %r2,%r2
        cr                %r2,%r5
        jlh               0b
        rll               %r13,%r0,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14
10:
        lr                %r2,%r0
        lmg               %r13,%r15,104(%r15)
        br                %r14
11:
        lr                %r2,%r5
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::fetch_neg::u16::release:
        stmg              %r13,%r15,104(%r15)
        lgr               %r1,%r2
        lh                %r2,0(%r2)
        risbgnz           %r3,%r1,0,61
        sll               %r1,3
        lcr               %r4,%r1
        j                 1f
0:
        je                9f
1:
        l                 %r14,0(%r3)
        lcr               %r0,%r2
        llhr              %r5,%r2
2:
        rll               %r2,%r14,16(%r1)
        risbg             %r0,%r2,32,47
        llhr              %r2,%r2
        cr                %r2,%r5
        jlh               3f
        rll               %r13,%r0,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                2b
3:
        je                9f
        l                 %r14,0(%r3)
        lcr               %r5,%r2
4:
        rll               %r0,%r14,16(%r1)
        risbg             %r5,%r0,32,47
        llhr              %r0,%r0
        cr                %r0,%r2
        jlh               5f
        rll               %r13,%r5,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                4b
5:
        je                10f
        l                 %r14,0(%r3)
        lcr               %r2,%r0
6:
        rll               %r5,%r14,16(%r1)
        risbg             %r2,%r5,32,47
        llhr              %r5,%r5
        cr                %r5,%r0
        jlh               7f
        rll               %r13,%r2,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                6b
7:
        je                11f
        l                 %r14,0(%r3)
        lcr               %r0,%r5
8:
        rll               %r2,%r14,16(%r1)
        risbg             %r0,%r2,32,47
        llhr              %r2,%r2
        cr                %r2,%r5
        jlh               0b
        rll               %r13,%r0,-16(%r4)
        cs                %r14,%r13,0(%r3)
        jl                8b
        j                 0b
9:
        lmg               %r13,%r15,104(%r15)
        br                %r14
10:
        lr                %r2,%r0
        lmg               %r13,%r15,104(%r15)
        br                %r14
11:
        lr                %r2,%r5
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::fetch_neg::u32::acqrel:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
1:
        br                %r14

asm_test::fetch_neg::u32::seqcst:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
1:
        br                %r14

asm_test::fetch_neg::u32::acquire:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
1:
        br                %r14

asm_test::fetch_neg::u32::relaxed:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
1:
        br                %r14

asm_test::fetch_neg::u32::release:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        je                1f
        lcr               %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
1:
        br                %r14

asm_test::fetch_neg::u64::acqrel:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
1:
        br                %r14

asm_test::fetch_neg::u64::seqcst:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
1:
        br                %r14

asm_test::fetch_neg::u64::acquire:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
1:
        br                %r14

asm_test::fetch_neg::u64::relaxed:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
1:
        br                %r14

asm_test::fetch_neg::u64::release:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        je                1f
        lcgr              %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
1:
        br                %r14

asm_test::fetch_neg::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lghi              %r4,0
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        slgrk             %r13,%r4,%r1
        lghi              %r12,0
        slbgr             %r12,%r0
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_neg::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lghi              %r4,0
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        slgrk             %r13,%r4,%r1
        lghi              %r12,0
        slbgr             %r12,%r0
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_neg::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lghi              %r4,0
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        slgrk             %r13,%r4,%r1
        lghi              %r12,0
        slbgr             %r12,%r0
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_neg::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lghi              %r4,0
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        slgrk             %r13,%r4,%r1
        lghi              %r12,0
        slbgr             %r12,%r0
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_neg::u128::release:
        stmg              %r12,%r15,96(%r15)
        lghi              %r4,0
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        slgrk             %r13,%r4,%r1
        lghi              %r12,0
        slbgr             %r12,%r0
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_not::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4278190080
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_not::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4278190080
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_not::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4278190080
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_not::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4278190080
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_not::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4278190080
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_not::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4294901760
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_not::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4294901760
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_not::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4294901760
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_not::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4294901760
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_not::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,4294901760
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_not::u32::acqrel:
        lhi               %r0,-1
        lax               %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_not::u32::seqcst:
        lhi               %r0,-1
        lax               %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_not::u32::acquire:
        lhi               %r0,-1
        lax               %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_not::u32::relaxed:
        lhi               %r0,-1
        lax               %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_not::u32::release:
        lhi               %r0,-1
        lax               %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_not::u64::acqrel:
        lghi              %r0,-1
        laxg              %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_not::u64::seqcst:
        lghi              %r0,-1
        laxg              %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_not::u64::acquire:
        lghi              %r0,-1
        laxg              %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_not::u64::relaxed:
        lghi              %r0,-1
        laxg              %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_not::u64::release:
        lghi              %r0,-1
        laxg              %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_not::bool::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,16777216
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_not::bool::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,16777216
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_not::bool::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,16777216
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_not::bool::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,16777216
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_not::bool::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        lcr               %r3,%r2
0:
        rll               %r4,%r0,0(%r2)
        xilf              %r4,16777216
        rll               %r4,%r4,0(%r3)
        cs                %r0,%r4,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_not::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        lcgr              %r13,%r1
        aghi              %r13,-1
        lcgr              %r12,%r0
        aghi              %r12,-1
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_not::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        lcgr              %r13,%r1
        aghi              %r13,-1
        lcgr              %r12,%r0
        aghi              %r12,-1
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_not::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        lcgr              %r13,%r1
        aghi              %r13,-1
        lcgr              %r12,%r0
        aghi              %r12,-1
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_not::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        lcgr              %r13,%r1
        aghi              %r13,-1
        lcgr              %r12,%r0
        aghi              %r12,-1
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_not::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        lcgr              %r13,%r1
        aghi              %r13,-1
        lcgr              %r12,%r0
        aghi              %r12,-1
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_sub::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_sub::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_sub::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_sub::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_sub::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_sub::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_sub::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_sub::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_sub::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_sub::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        sr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_sub::u32::acqrel:
        lcr               %r0,%r3
        laa               %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_sub::u32::seqcst:
        lcr               %r0,%r3
        laa               %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_sub::u32::acquire:
        lcr               %r0,%r3
        laa               %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_sub::u32::relaxed:
        lcr               %r0,%r3
        laa               %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_sub::u32::release:
        lcr               %r0,%r3
        laa               %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_sub::u64::acqrel:
        lcgr              %r0,%r3
        laag              %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_sub::u64::seqcst:
        lcgr              %r0,%r3
        laag              %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_sub::u64::acquire:
        lcgr              %r0,%r3
        laag              %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_sub::u64::relaxed:
        lcgr              %r0,%r3
        laag              %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_sub::u64::release:
        lcgr              %r0,%r3
        laag              %r2,%r0,0(%r2)
        br                %r14

asm_test::fetch_sub::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        slgrk             %r13,%r1,%r4
        lgr               %r12,%r0
        slbgr             %r12,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_sub::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        slgrk             %r13,%r1,%r4
        lgr               %r12,%r0
        slbgr             %r12,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_sub::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        slgrk             %r13,%r1,%r4
        lgr               %r12,%r0
        slbgr             %r12,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_sub::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        slgrk             %r13,%r1,%r4
        lgr               %r12,%r0
        slbgr             %r12,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_sub::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        slgrk             %r13,%r1,%r4
        lgr               %r12,%r0
        slbgr             %r12,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_xor::u8::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_xor::u8::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_xor::u8::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_xor::u8::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_xor::u8::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        br                %r14

asm_test::fetch_xor::u16::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_xor::u16::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_xor::u16::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_xor::u16::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_xor::u16::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        br                %r14

asm_test::fetch_xor::u32::acqrel:
        lax               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_xor::u32::seqcst:
        lax               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_xor::u32::acquire:
        lax               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_xor::u32::relaxed:
        lax               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_xor::u32::release:
        lax               %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_xor::u64::acqrel:
        laxg              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_xor::u64::seqcst:
        laxg              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_xor::u64::acquire:
        laxg              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_xor::u64::relaxed:
        laxg              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_xor::u64::release:
        laxg              %r2,%r3,0(%r2)
        br                %r14

asm_test::fetch_xor::bool::acqrel:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_xor::bool::seqcst:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_xor::bool::acquire:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_xor::bool::relaxed:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_xor::bool::release:
        risbgnz           %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        xr                %r5,%r3
        rll               %r5,%r5,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r0,%r0,8(%r2)
        tmll              %r0,255
        lghi              %r2,0
        locghine          %r2,1
        br                %r14

asm_test::fetch_xor::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        xgrk              %r13,%r1,%r4
        xgrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_xor::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        xgrk              %r13,%r1,%r4
        xgrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_xor::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        xgrk              %r13,%r1,%r4
        xgrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_xor::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        xgrk              %r13,%r1,%r4
        xgrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_xor::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r5,0(%r4)
        lg                %r4,8(%r4)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        xgrk              %r13,%r1,%r4
        xgrk              %r12,%r0,%r5
        cdsg              %r0,%r12,0(%r3)
        jl                0b
        stg               %r1,8(%r2)
        stg               %r0,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14


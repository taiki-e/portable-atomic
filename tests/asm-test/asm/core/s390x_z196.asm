asm_test::fetch_nand::u8::acqrel:
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        nrk               %r0,%r2,%r3
        xilf              %r0,4294967295
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u32::seqcst:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        nrk               %r0,%r2,%r3
        xilf              %r0,4294967295
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u32::acquire:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        nrk               %r0,%r2,%r3
        xilf              %r0,4294967295
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u32::relaxed:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        nrk               %r0,%r2,%r3
        xilf              %r0,4294967295
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u32::release:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        nrk               %r0,%r2,%r3
        xilf              %r0,4294967295
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u64::acqrel:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        ngrk              %r0,%r2,%r3
        lcgr              %r0,%r0
        aghi              %r0,-1
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u64::seqcst:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        ngrk              %r0,%r2,%r3
        lcgr              %r0,%r0
        aghi              %r0,-1
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u64::acquire:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        ngrk              %r0,%r2,%r3
        lcgr              %r0,%r0
        aghi              %r0,-1
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u64::relaxed:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        ngrk              %r0,%r2,%r3
        lcgr              %r0,%r0
        aghi              %r0,-1
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u64::release:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        ngrk              %r0,%r2,%r3
        lcgr              %r0,%r0
        aghi              %r0,-1
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_nand::u128::acqrel:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ngrk              %r14,%r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        ngr               %r4,%r0
        lcgr              %r10,%r14
        aghi              %r10,-1
        lcgr              %r11,%r4
        aghi              %r11,-1
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_nand::u128::seqcst:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ngrk              %r14,%r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        ngr               %r4,%r0
        lcgr              %r10,%r14
        aghi              %r10,-1
        lcgr              %r11,%r4
        aghi              %r11,-1
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_nand::u128::acquire:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ngrk              %r14,%r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        ngr               %r4,%r0
        lcgr              %r10,%r14
        aghi              %r10,-1
        lcgr              %r11,%r4
        aghi              %r11,-1
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_nand::u128::relaxed:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ngrk              %r14,%r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        ngr               %r4,%r0
        lcgr              %r10,%r14
        aghi              %r10,-1
        lcgr              %r11,%r4
        aghi              %r11,-1
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_nand::u128::release:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ngrk              %r14,%r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        ngr               %r4,%r0
        lcgr              %r10,%r14
        aghi              %r10,-1
        lcgr              %r11,%r4
        aghi              %r11,-1
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_umax::u8::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u8::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u8::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u8::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u8::release:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u16::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u16::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u16::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u16::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umax::u16::release:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
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
        lr                %r0,%r3
        locrh             %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u32::seqcst:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        lr                %r0,%r3
        locrh             %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u32::acquire:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        lr                %r0,%r3
        locrh             %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u32::relaxed:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        lr                %r0,%r3
        locrh             %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u32::release:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        lr                %r0,%r3
        locrh             %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u64::acqrel:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        lgr               %r0,%r3
        locgrh            %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u64::seqcst:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        lgr               %r0,%r3
        locgrh            %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u64::acquire:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        lgr               %r0,%r3
        locgrh            %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u64::relaxed:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        lgr               %r0,%r3
        locgrh            %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u64::release:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        lgr               %r0,%r3
        locgrh            %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umax::u128::acqrel:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r5,%r1
        lgr               %r10,%r5
        ipm               %r14
        clgr              %r4,%r0
        risblgz           %r14,%r14,31,31,35
        ipm               %r13
        risblgz           %r13,%r13,31,31,35
        cgr               %r5,%r1
        locrlh            %r13,%r14
        chi               %r13,0
        lgr               %r11,%r4
        locgre            %r4,%r0
        locgre            %r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_umax::u128::seqcst:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r5,%r1
        lgr               %r10,%r5
        ipm               %r14
        clgr              %r4,%r0
        risblgz           %r14,%r14,31,31,35
        ipm               %r13
        risblgz           %r13,%r13,31,31,35
        cgr               %r5,%r1
        locrlh            %r13,%r14
        chi               %r13,0
        lgr               %r11,%r4
        locgre            %r4,%r0
        locgre            %r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_umax::u128::acquire:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r5,%r1
        lgr               %r10,%r5
        ipm               %r14
        clgr              %r4,%r0
        risblgz           %r14,%r14,31,31,35
        ipm               %r13
        risblgz           %r13,%r13,31,31,35
        cgr               %r5,%r1
        locrlh            %r13,%r14
        chi               %r13,0
        lgr               %r11,%r4
        locgre            %r4,%r0
        locgre            %r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_umax::u128::relaxed:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r5,%r1
        lgr               %r10,%r5
        ipm               %r14
        clgr              %r4,%r0
        risblgz           %r14,%r14,31,31,35
        ipm               %r13
        risblgz           %r13,%r13,31,31,35
        cgr               %r5,%r1
        locrlh            %r13,%r14
        chi               %r13,0
        lgr               %r11,%r4
        locgre            %r4,%r0
        locgre            %r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_umax::u128::release:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r5,%r1
        lgr               %r10,%r5
        ipm               %r14
        clgr              %r4,%r0
        risblgz           %r14,%r14,31,31,35
        ipm               %r13
        risblgz           %r13,%r13,31,31,35
        cgr               %r5,%r1
        locrlh            %r13,%r14
        chi               %r13,0
        lgr               %r11,%r4
        locgre            %r4,%r0
        locgre            %r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_umin::u8::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u8::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u8::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u8::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u8::release:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        clr               %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u16::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u16::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u16::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u16::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_umin::u16::release:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        clr               %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
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
        lr                %r0,%r3
        locrle            %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u32::seqcst:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        lr                %r0,%r3
        locrle            %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u32::acquire:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        lr                %r0,%r3
        locrle            %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u32::relaxed:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        lr                %r0,%r3
        locrle            %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u32::release:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        clr               %r2,%r3
        lr                %r0,%r3
        locrle            %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u64::acqrel:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        lgr               %r0,%r3
        locgrle           %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u64::seqcst:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        lgr               %r0,%r3
        locgrle           %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u64::acquire:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        lgr               %r0,%r3
        locgrle           %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u64::relaxed:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        lgr               %r0,%r3
        locgrle           %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u64::release:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        clgr              %r2,%r3
        lgr               %r0,%r3
        locgrle           %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_umin::u128::acqrel:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r5,%r1
        lgr               %r10,%r5
        ipm               %r14
        afi               %r14,-536870912
        clgr              %r4,%r0
        ipm               %r13
        afi               %r13,-536870912
        srl               %r14,31
        srl               %r13,31
        cgr               %r5,%r1
        lgr               %r11,%r4
        locrlh            %r13,%r14
        chi               %r13,0
        locgre            %r4,%r0
        locgre            %r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_umin::u128::seqcst:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r5,%r1
        lgr               %r10,%r5
        ipm               %r14
        afi               %r14,-536870912
        clgr              %r4,%r0
        ipm               %r13
        afi               %r13,-536870912
        srl               %r14,31
        srl               %r13,31
        cgr               %r5,%r1
        lgr               %r11,%r4
        locrlh            %r13,%r14
        chi               %r13,0
        locgre            %r4,%r0
        locgre            %r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_umin::u128::acquire:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r5,%r1
        lgr               %r10,%r5
        ipm               %r14
        afi               %r14,-536870912
        clgr              %r4,%r0
        ipm               %r13
        afi               %r13,-536870912
        srl               %r14,31
        srl               %r13,31
        cgr               %r5,%r1
        lgr               %r11,%r4
        locrlh            %r13,%r14
        chi               %r13,0
        locgre            %r4,%r0
        locgre            %r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_umin::u128::relaxed:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r5,%r1
        lgr               %r10,%r5
        ipm               %r14
        afi               %r14,-536870912
        clgr              %r4,%r0
        ipm               %r13
        afi               %r13,-536870912
        srl               %r14,31
        srl               %r13,31
        cgr               %r5,%r1
        lgr               %r11,%r4
        locrlh            %r13,%r14
        chi               %r13,0
        locgre            %r4,%r0
        locgre            %r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_umin::u128::release:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r5,%r1
        lgr               %r10,%r5
        ipm               %r14
        afi               %r14,-536870912
        clgr              %r4,%r0
        ipm               %r13
        afi               %r13,-536870912
        srl               %r14,31
        srl               %r13,31
        cgr               %r5,%r1
        lgr               %r11,%r4
        locrlh            %r13,%r14
        chi               %r13,0
        locgre            %r4,%r0
        locgre            %r5,%r1
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::compare_exchange::u8::acqrel_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::seqcst_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::acqrel_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::acqrel_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::acquire_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::relaxed_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::release_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::seqcst_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::seqcst_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::acquire_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::acquire_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::relaxed_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::relaxed_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::release_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u8::release_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::acqrel_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::seqcst_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::acqrel_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::acqrel_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::acquire_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::relaxed_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::release_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::seqcst_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::seqcst_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::acquire_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::acquire_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::relaxed_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::relaxed_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::release_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u16::release_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange::u32::acqrel_seqcst:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::seqcst_seqcst:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::acqrel_acquire:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::acqrel_relaxed:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::acquire_seqcst:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::relaxed_seqcst:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::release_seqcst:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::seqcst_acquire:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::seqcst_relaxed:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::acquire_acquire:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::acquire_relaxed:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::relaxed_acquire:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::relaxed_relaxed:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::release_acquire:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u32::release_relaxed:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange::u64::acqrel_seqcst:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::seqcst_seqcst:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::acqrel_acquire:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::acqrel_relaxed:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::acquire_seqcst:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::relaxed_seqcst:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::release_seqcst:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::seqcst_acquire:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::seqcst_relaxed:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::acquire_acquire:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::acquire_relaxed:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::relaxed_acquire:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::relaxed_relaxed:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::release_acquire:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u64::release_relaxed:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange::u128::acqrel_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::seqcst_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::acqrel_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::acqrel_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::acquire_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::relaxed_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::release_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::seqcst_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::seqcst_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::acquire_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::acquire_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::relaxed_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::relaxed_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::release_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange::u128::release_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::release_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::acquire_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::release_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u8::release_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::release_seqcst:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::acquire_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::release_acquire:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u16::release_relaxed:
        stmg              %r13,%r15,104(%r15)
        risbgz            %r1,%r2,0,61
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
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        lmg               %r13,%r15,104(%r15)
        br                %r14

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::release_seqcst:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::acquire_acquire:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::release_acquire:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u32::release_relaxed:
        cs                %r3,%r4,0(%r2)
        ipm               %r2
        afi               %r2,-268435456
        srl               %r2,31
        xilf              %r2,1
        br                %r14

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::release_seqcst:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::acquire_acquire:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::release_acquire:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u64::release_relaxed:
        csg               %r3,%r4,0(%r2)
        ipm               %r0
        afi               %r0,-268435456
        srl               %r0,31
        xilf              %r0,1
        llgfr             %r2,%r0
        br                %r14

asm_test::compare_exchange_weak::u128::acqrel_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::seqcst_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::acqrel_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::acqrel_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::acquire_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::relaxed_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::release_seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::seqcst_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::seqcst_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::acquire_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::acquire_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::relaxed_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::relaxed_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::release_acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::compare_exchange_weak::u128::release_relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r13,8(%r5)
        lg                %r12,0(%r5)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        cdsg              %r0,%r12,0(%r3)
        stg               %r1,16(%r2)
        stg               %r0,8(%r2)
        ipm               %r3
        afi               %r3,-268435456
        srl               %r3,31
        xilf              %r3,1
        llgfr             %r3,%r3
        stg               %r3,0(%r2)
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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

asm_test::swap::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r12,%r0,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::swap::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r12,%r0,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::swap::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r12,%r0,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::swap::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r12,%r0,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::swap::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r1,8(%r4)
        lg                %r0,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        lgr               %r12,%r5
        lgr               %r13,%r4
        cdsg              %r12,%r0,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
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

asm_test::store::u128::seqcst:
        lg                %r1,8(%r3)
        lg                %r0,0(%r3)
        stpq              %r0,0(%r2)
        bnor              %r0
        br                %r14

asm_test::store::u128::relaxed:
        lg                %r1,8(%r3)
        lg                %r0,0(%r3)
        stpq              %r0,0(%r2)
        br                %r14

asm_test::store::u128::release:
        lg                %r1,8(%r3)
        lg                %r0,0(%r3)
        stpq              %r0,0(%r2)
        br                %r14

asm_test::fetch_or::u8::acqrel:
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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

asm_test::fetch_or::u128::acqrel:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ogrk              %r12,%r5,%r1
        ogrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_or::u128::seqcst:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ogrk              %r12,%r5,%r1
        ogrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_or::u128::acquire:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ogrk              %r12,%r5,%r1
        ogrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_or::u128::relaxed:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ogrk              %r12,%r5,%r1
        ogrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_or::u128::release:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ogrk              %r12,%r5,%r1
        ogrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_add::u8::acqrel:
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        algrk             %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        alcgr             %r5,%r1
        lgr               %r12,%r5
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_add::u128::seqcst:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        algrk             %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        alcgr             %r5,%r1
        lgr               %r12,%r5
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_add::u128::acquire:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        algrk             %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        alcgr             %r5,%r1
        lgr               %r12,%r5
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_add::u128::relaxed:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        algrk             %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        alcgr             %r5,%r1
        lgr               %r12,%r5
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_add::u128::release:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        algrk             %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        alcgr             %r5,%r1
        lgr               %r12,%r5
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_and::u8::acqrel:
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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

asm_test::fetch_and::u128::acqrel:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ngrk              %r12,%r5,%r1
        ngrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_and::u128::seqcst:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ngrk              %r12,%r5,%r1
        ngrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_and::u128::acquire:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ngrk              %r12,%r5,%r1
        ngrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_and::u128::relaxed:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ngrk              %r12,%r5,%r1
        ngrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_and::u128::release:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        ngrk              %r12,%r5,%r1
        ngrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_max::i8::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i8::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i8::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i8::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i8::release:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i16::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i16::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i16::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i16::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_max::i16::release:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrhe            %r14,%r5
        rll               %r5,%r14,0(%r4)
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
        lr                %r0,%r3
        locrh             %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i32::seqcst:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        lr                %r0,%r3
        locrh             %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i32::acquire:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        lr                %r0,%r3
        locrh             %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i32::relaxed:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        lr                %r0,%r3
        locrh             %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i32::release:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        lr                %r0,%r3
        locrh             %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i64::acqrel:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        lgr               %r0,%r3
        locgrh            %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i64::seqcst:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        lgr               %r0,%r3
        locgrh            %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i64::acquire:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        lgr               %r0,%r3
        locgrh            %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i64::relaxed:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        lgr               %r0,%r3
        locgrh            %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i64::release:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        lgr               %r0,%r3
        locgrh            %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_max::i128::acqrel:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r4,%r0
        ipm               %r14
        cgr               %r5,%r1
        risblgz           %r14,%r14,31,31,35
        ipm               %r13
        risblgz           %r13,%r13,31,31,35
        locrlh            %r14,%r13
        chi               %r14,0
        lgr               %r12,%r5
        locgre            %r5,%r1
        lgr               %r13,%r4
        lgr               %r10,%r5
        locgre            %r4,%r0
        lgr               %r11,%r4
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_max::i128::seqcst:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r4,%r0
        ipm               %r14
        cgr               %r5,%r1
        risblgz           %r14,%r14,31,31,35
        ipm               %r13
        risblgz           %r13,%r13,31,31,35
        locrlh            %r14,%r13
        chi               %r14,0
        lgr               %r12,%r5
        locgre            %r5,%r1
        lgr               %r13,%r4
        lgr               %r10,%r5
        locgre            %r4,%r0
        lgr               %r11,%r4
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_max::i128::acquire:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r4,%r0
        ipm               %r14
        cgr               %r5,%r1
        risblgz           %r14,%r14,31,31,35
        ipm               %r13
        risblgz           %r13,%r13,31,31,35
        locrlh            %r14,%r13
        chi               %r14,0
        lgr               %r12,%r5
        locgre            %r5,%r1
        lgr               %r13,%r4
        lgr               %r10,%r5
        locgre            %r4,%r0
        lgr               %r11,%r4
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_max::i128::relaxed:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r4,%r0
        ipm               %r14
        cgr               %r5,%r1
        risblgz           %r14,%r14,31,31,35
        ipm               %r13
        risblgz           %r13,%r13,31,31,35
        locrlh            %r14,%r13
        chi               %r14,0
        lgr               %r12,%r5
        locgre            %r5,%r1
        lgr               %r13,%r4
        lgr               %r10,%r5
        locgre            %r4,%r0
        lgr               %r11,%r4
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_max::i128::release:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r4,%r0
        ipm               %r14
        cgr               %r5,%r1
        risblgz           %r14,%r14,31,31,35
        ipm               %r13
        risblgz           %r13,%r13,31,31,35
        locrlh            %r14,%r13
        chi               %r14,0
        lgr               %r12,%r5
        locgre            %r5,%r1
        lgr               %r13,%r4
        lgr               %r10,%r5
        locgre            %r4,%r0
        lgr               %r11,%r4
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_min::i8::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i8::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i8::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i8::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i8::release:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,24
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,39
        cr                %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,8(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i16::acqrel:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i16::seqcst:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i16::acquire:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i16::relaxed:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
        cs                %r0,%r5,0(%r1)
        jl                0b
        rll               %r2,%r0,16(%r2)
        lmg               %r14,%r15,112(%r15)
        br                %r14

asm_test::fetch_min::i16::release:
        stmg              %r14,%r15,112(%r15)
        risbgz            %r1,%r2,0,61
        l                 %r0,0(%r1)
        sll               %r2,3
        sll               %r3,16
        lcr               %r4,%r2
0:
        rll               %r5,%r0,0(%r2)
        lr                %r14,%r5
        risbg             %r14,%r3,32,47
        cr                %r5,%r3
        locrle            %r14,%r5
        rll               %r5,%r14,0(%r4)
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
        lr                %r0,%r3
        locrle            %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i32::seqcst:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        lr                %r0,%r3
        locrle            %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i32::acquire:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        lr                %r0,%r3
        locrle            %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i32::relaxed:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        lr                %r0,%r3
        locrle            %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i32::release:
        lgr               %r1,%r2
        l                 %r2,0(%r2)
0:
        cr                %r2,%r3
        lr                %r0,%r3
        locrle            %r0,%r2
        cs                %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i64::acqrel:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        lgr               %r0,%r3
        locgrle           %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i64::seqcst:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        lgr               %r0,%r3
        locgrle           %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i64::acquire:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        lgr               %r0,%r3
        locgrle           %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i64::relaxed:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        lgr               %r0,%r3
        locgrle           %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i64::release:
        lgr               %r1,%r2
        lg                %r2,0(%r2)
0:
        cgr               %r2,%r3
        lgr               %r0,%r3
        locgrle           %r0,%r2
        csg               %r2,%r0,0(%r1)
        jl                0b
        br                %r14

asm_test::fetch_min::i128::acqrel:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r4,%r0
        ipm               %r14
        afi               %r14,-536870912
        cgr               %r5,%r1
        ipm               %r13
        afi               %r13,-536870912
        cgr               %r5,%r1
        srl               %r13,31
        srl               %r14,31
        locrlh            %r14,%r13
        chi               %r14,0
        lgr               %r12,%r5
        locgre            %r5,%r1
        lgr               %r13,%r4
        lgr               %r10,%r5
        locgre            %r4,%r0
        lgr               %r11,%r4
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_min::i128::seqcst:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r4,%r0
        ipm               %r14
        afi               %r14,-536870912
        cgr               %r5,%r1
        ipm               %r13
        afi               %r13,-536870912
        cgr               %r5,%r1
        srl               %r13,31
        srl               %r14,31
        locrlh            %r14,%r13
        chi               %r14,0
        lgr               %r12,%r5
        locgre            %r5,%r1
        lgr               %r13,%r4
        lgr               %r10,%r5
        locgre            %r4,%r0
        lgr               %r11,%r4
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_min::i128::acquire:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r4,%r0
        ipm               %r14
        afi               %r14,-536870912
        cgr               %r5,%r1
        ipm               %r13
        afi               %r13,-536870912
        cgr               %r5,%r1
        srl               %r13,31
        srl               %r14,31
        locrlh            %r14,%r13
        chi               %r14,0
        lgr               %r12,%r5
        locgre            %r5,%r1
        lgr               %r13,%r4
        lgr               %r10,%r5
        locgre            %r4,%r0
        lgr               %r11,%r4
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_min::i128::relaxed:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r4,%r0
        ipm               %r14
        afi               %r14,-536870912
        cgr               %r5,%r1
        ipm               %r13
        afi               %r13,-536870912
        cgr               %r5,%r1
        srl               %r13,31
        srl               %r14,31
        locrlh            %r14,%r13
        chi               %r14,0
        lgr               %r12,%r5
        locgre            %r5,%r1
        lgr               %r13,%r4
        lgr               %r10,%r5
        locgre            %r4,%r0
        lgr               %r11,%r4
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_min::i128::release:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        clgr              %r4,%r0
        ipm               %r14
        afi               %r14,-536870912
        cgr               %r5,%r1
        ipm               %r13
        afi               %r13,-536870912
        cgr               %r5,%r1
        srl               %r13,31
        srl               %r14,31
        locrlh            %r14,%r13
        chi               %r14,0
        lgr               %r12,%r5
        locgre            %r5,%r1
        lgr               %r13,%r4
        lgr               %r10,%r5
        locgre            %r4,%r0
        lgr               %r11,%r4
        cdsg              %r12,%r10,0(%r3)
        lgr               %r4,%r13
        lgr               %r5,%r12
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_neg::u8::acqrel:
        stmg              %r13,%r15,104(%r15)
        lgr               %r1,%r2
        lb                %r2,0(%r2)
        risbgz            %r3,%r1,0,61
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
        risbgz            %r3,%r1,0,61
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
        risbgz            %r3,%r1,0,61
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
        risbgz            %r3,%r1,0,61
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
        risbgz            %r3,%r1,0,61
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
        risbgz            %r3,%r1,0,61
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
        risbgz            %r3,%r1,0,61
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
        risbgz            %r3,%r1,0,61
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
        risbgz            %r3,%r1,0,61
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
        risbgz            %r3,%r1,0,61
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
        stmg              %r10,%r15,80(%r15)
        lpq               %r4,0(%r3)
        lghi              %r0,0
        lgr               %r13,%r5
        lgr               %r12,%r4
0:
        slgrk             %r11,%r0,%r13
        lghi              %r10,0
        lgr               %r4,%r12
        slbgr             %r10,%r12
        lgr               %r5,%r13
        cdsg              %r4,%r10,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r12,%r4
        lgr               %r13,%r5
        lgr               %r1,%r4
        lgr               %r14,%r5
        jl                0b
1:
        stg               %r1,0(%r2)
        stg               %r14,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_neg::u128::seqcst:
        stmg              %r10,%r15,80(%r15)
        lpq               %r4,0(%r3)
        lghi              %r0,0
        lgr               %r13,%r5
        lgr               %r12,%r4
0:
        slgrk             %r11,%r0,%r13
        lghi              %r10,0
        lgr               %r4,%r12
        slbgr             %r10,%r12
        lgr               %r5,%r13
        cdsg              %r4,%r10,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r12,%r4
        lgr               %r13,%r5
        lgr               %r1,%r4
        lgr               %r14,%r5
        jl                0b
1:
        stg               %r1,0(%r2)
        stg               %r14,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_neg::u128::acquire:
        stmg              %r10,%r15,80(%r15)
        lpq               %r4,0(%r3)
        lghi              %r0,0
        lgr               %r13,%r5
        lgr               %r12,%r4
0:
        slgrk             %r11,%r0,%r13
        lghi              %r10,0
        lgr               %r4,%r12
        slbgr             %r10,%r12
        lgr               %r5,%r13
        cdsg              %r4,%r10,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r12,%r4
        lgr               %r13,%r5
        lgr               %r1,%r4
        lgr               %r14,%r5
        jl                0b
1:
        stg               %r1,0(%r2)
        stg               %r14,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_neg::u128::relaxed:
        stmg              %r10,%r15,80(%r15)
        lpq               %r4,0(%r3)
        lghi              %r0,0
        lgr               %r13,%r5
        lgr               %r12,%r4
0:
        slgrk             %r11,%r0,%r13
        lghi              %r10,0
        lgr               %r4,%r12
        slbgr             %r10,%r12
        lgr               %r5,%r13
        cdsg              %r4,%r10,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r12,%r4
        lgr               %r13,%r5
        lgr               %r1,%r4
        lgr               %r14,%r5
        jl                0b
1:
        stg               %r1,0(%r2)
        stg               %r14,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_neg::u128::release:
        stmg              %r10,%r15,80(%r15)
        lpq               %r4,0(%r3)
        lghi              %r0,0
        lgr               %r13,%r5
        lgr               %r12,%r4
0:
        slgrk             %r11,%r0,%r13
        lghi              %r10,0
        lgr               %r4,%r12
        slbgr             %r10,%r12
        lgr               %r5,%r13
        cdsg              %r4,%r10,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r14,%r5
        lgr               %r1,%r4
        je                1f
        slgrk             %r13,%r0,%r14
        lghi              %r12,0
        slbgr             %r12,%r1
        cdsg              %r4,%r12,0(%r3)
        lgr               %r12,%r4
        lgr               %r13,%r5
        lgr               %r1,%r4
        lgr               %r14,%r5
        jl                0b
1:
        stg               %r1,0(%r2)
        stg               %r14,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_not::u8::acqrel:
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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

asm_test::fetch_not::u128::acqrel:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        lcgr              %r4,%r1
        aghi              %r4,-1
        lcgr              %r5,%r0
        lgr               %r12,%r1
        lgr               %r13,%r0
        aghi              %r5,-1
        cdsg              %r12,%r4,0(%r3)
        lgr               %r0,%r13
        lgr               %r1,%r12
        jl                0b
        stg               %r1,0(%r2)
        stg               %r0,8(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_not::u128::seqcst:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        lcgr              %r4,%r1
        aghi              %r4,-1
        lcgr              %r5,%r0
        lgr               %r12,%r1
        lgr               %r13,%r0
        aghi              %r5,-1
        cdsg              %r12,%r4,0(%r3)
        lgr               %r0,%r13
        lgr               %r1,%r12
        jl                0b
        stg               %r1,0(%r2)
        stg               %r0,8(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_not::u128::acquire:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        lcgr              %r4,%r1
        aghi              %r4,-1
        lcgr              %r5,%r0
        lgr               %r12,%r1
        lgr               %r13,%r0
        aghi              %r5,-1
        cdsg              %r12,%r4,0(%r3)
        lgr               %r0,%r13
        lgr               %r1,%r12
        jl                0b
        stg               %r1,0(%r2)
        stg               %r0,8(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_not::u128::relaxed:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        lcgr              %r4,%r1
        aghi              %r4,-1
        lcgr              %r5,%r0
        lgr               %r12,%r1
        lgr               %r13,%r0
        aghi              %r5,-1
        cdsg              %r12,%r4,0(%r3)
        lgr               %r0,%r13
        lgr               %r1,%r12
        jl                0b
        stg               %r1,0(%r2)
        stg               %r0,8(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_not::u128::release:
        stmg              %r12,%r15,96(%r15)
        lg                %r0,8(%r3)
        lg                %r1,0(%r3)
0:
        lcgr              %r4,%r1
        aghi              %r4,-1
        lcgr              %r5,%r0
        lgr               %r12,%r1
        lgr               %r13,%r0
        aghi              %r5,-1
        cdsg              %r12,%r4,0(%r3)
        lgr               %r0,%r13
        lgr               %r1,%r12
        jl                0b
        stg               %r1,0(%r2)
        stg               %r0,8(%r2)
        lmg               %r12,%r15,96(%r15)
        br                %r14

asm_test::fetch_sub::u8::acqrel:
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        slgrk             %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        slbgr             %r5,%r1
        lgr               %r12,%r5
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_sub::u128::seqcst:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        slgrk             %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        slbgr             %r5,%r1
        lgr               %r12,%r5
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_sub::u128::acquire:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        slgrk             %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        slbgr             %r5,%r1
        lgr               %r12,%r5
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_sub::u128::relaxed:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        slgrk             %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        slbgr             %r5,%r1
        lgr               %r12,%r5
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_sub::u128::release:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        slgrk             %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        slbgr             %r5,%r1
        lgr               %r12,%r5
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_xor::u8::acqrel:
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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
        risbgz            %r1,%r2,0,61
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

asm_test::fetch_xor::u128::acqrel:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        xgrk              %r12,%r5,%r1
        xgrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_xor::u128::seqcst:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        xgrk              %r12,%r5,%r1
        xgrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_xor::u128::acquire:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        xgrk              %r12,%r5,%r1
        xgrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_xor::u128::relaxed:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        xgrk              %r12,%r5,%r1
        xgrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14

asm_test::fetch_xor::u128::release:
        stmg              %r10,%r15,80(%r15)
        lg                %r0,8(%r4)
        lg                %r1,0(%r4)
        lg                %r4,8(%r3)
        lg                %r5,0(%r3)
0:
        xgrk              %r12,%r5,%r1
        xgrk              %r13,%r4,%r0
        lgr               %r10,%r5
        lgr               %r11,%r4
        cdsg              %r10,%r12,0(%r3)
        lgr               %r4,%r11
        lgr               %r5,%r10
        jl                0b
        stg               %r5,0(%r2)
        stg               %r4,8(%r2)
        lmg               %r10,%r15,80(%r15)
        br                %r14


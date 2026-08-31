asm_test::fence::acqrel:
        ret

asm_test::fence::seqcst:
        ret

asm_test::fence::acquire:
        ret

asm_test::fence::release:
        ret

asm_test::bit_toggle::u8::acqrel:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        xor.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_toggle::u8::seqcst:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        xor.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_toggle::u8::acquire:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        xor.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_toggle::u8::relaxed:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        xor.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_toggle::u8::release:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        xor.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_toggle::u16::acqrel:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        xor               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_toggle::u16::seqcst:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        xor               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_toggle::u16::acquire:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        xor               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_toggle::u16::relaxed:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        xor               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_toggle::u16::release:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        xor               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_nand::u8::acqrel_all:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             r13,	r15	;
        xor.b             #-1,	r15	;r3 As==11
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_nand::u8::seqcst_all:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             r13,	r15	;
        xor.b             #-1,	r15	;r3 As==11
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_nand::u8::acqrel_zero:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_nand::u8::acquire_all:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             r13,	r15	;
        xor.b             #-1,	r15	;r3 As==11
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_nand::u8::relaxed_all:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             r13,	r15	;
        xor.b             #-1,	r15	;r3 As==11
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_nand::u8::release_all:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             r13,	r15	;
        xor.b             #-1,	r15	;r3 As==11
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_nand::u8::seqcst_zero:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_nand::u8::acquire_zero:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_nand::u8::relaxed_zero:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_nand::u8::release_zero:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_nand::u8::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        and.b             r14,	r13	;
        xor.b             #-1,	r13	;r3 As==11
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_nand::u8::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        and.b             r14,	r13	;
        xor.b             #-1,	r13	;r3 As==11
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_nand::u8::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        and.b             r14,	r13	;
        xor.b             #-1,	r13	;r3 As==11
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_nand::u8::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        and.b             r14,	r13	;
        xor.b             #-1,	r13	;r3 As==11
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_nand::u8::release:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        and.b             r14,	r13	;
        xor.b             #-1,	r13	;r3 As==11
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_nand::u16::acqrel_all:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               r13,	r15	;
        inv               r15		;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::u16::seqcst_all:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               r13,	r15	;
        inv               r15		;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::u16::acqrel_zero:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::u16::acquire_all:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               r13,	r15	;
        inv               r15		;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::u16::relaxed_all:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               r13,	r15	;
        inv               r15		;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::u16::release_all:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               r13,	r15	;
        inv               r15		;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::u16::seqcst_zero:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::u16::acquire_zero:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::u16::relaxed_zero:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::u16::release_zero:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::u16::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        and               r14,	r13	;
        inv               r13		;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_nand::u16::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        and               r14,	r13	;
        inv               r13		;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_nand::u16::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        and               r14,	r13	;
        inv               r13		;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_nand::u16::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        and               r14,	r13	;
        inv               r13		;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_nand::u16::release:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        and               r14,	r13	;
        inv               r13		;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_nand::bool::acqrel_true:
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        ret

asm_test::fetch_nand::bool::seqcst_true:
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        ret

asm_test::fetch_nand::bool::acqrel_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::bool::acquire_true:
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        ret

asm_test::fetch_nand::bool::relaxed_true:
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        ret

asm_test::fetch_nand::bool::release_true:
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        ret

asm_test::fetch_nand::bool::seqcst_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::bool::acquire_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::bool::relaxed_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::bool::release_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_nand::bool::acqrel:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret
0:
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_nand::bool::seqcst:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret
0:
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_nand::bool::acquire:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret
0:
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_nand::bool::relaxed:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret
0:
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_nand::bool::release:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret
0:
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_umax::u8::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r13,	r14	;
        jnc               0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_umax::u8::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r13,	r14	;
        jnc               0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_umax::u8::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r13,	r14	;
        jnc               0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_umax::u8::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r13,	r14	;
        jnc               0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_umax::u8::release:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r13,	r14	;
        jnc               0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_umax::u16::acqrel:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r13,	r12	;
        jnc               0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_umax::u16::seqcst:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r13,	r12	;
        jnc               0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_umax::u16::acquire:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r13,	r12	;
        jnc               0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_umax::u16::relaxed:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r13,	r12	;
        jnc               0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_umax::u16::release:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r13,	r12	;
        jnc               0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_umin::u8::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r14,	r13	;
        jnc               0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_umin::u8::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r14,	r13	;
        jnc               0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_umin::u8::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r14,	r13	;
        jnc               0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_umin::u8::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r14,	r13	;
        jnc               0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_umin::u8::release:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r14,	r13	;
        jnc               0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_umin::u16::acqrel:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r12,	r13	;
        jnc               0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_umin::u16::seqcst:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r12,	r13	;
        jnc               0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_umin::u16::acquire:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r12,	r13	;
        jnc               0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_umin::u16::relaxed:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r12,	r13	;
        jnc               0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_umin::u16::release:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r12,	r13	;
        jnc               0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::release_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::release_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u8::release_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::release_seqcst:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::release_acquire:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::u16::release_relaxed:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange::bool::acqrel_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::release_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::release_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::release_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::release_seqcst_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::release_acquire_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::release_relaxed_true_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #1,	r13	;r3 As==01
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::release_seqcst_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::release_seqcst_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::release_acquire_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::release_acquire_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::release_relaxed_false_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #0,	r13	;r3 As==00
        jz                0f
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret

asm_test::compare_exchange::bool::release_relaxed_true_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             #1,	r13	;r3 As==01
        jnz               0f
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r14,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange::bool::release_seqcst_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::release_acquire_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::release_relaxed_false_false:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r13	;r3 As==00
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        nop
        mov               r11,	r2	;
        nop
        cmp.b             r15,	r13	;
        mov               r2,	r14	;
        rra               r14		;
        mov               #1,	r12	;r3 As==01
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        push              r10		;
        mov               r13,	r11	;
        mov               r12,	r15	;
        mov               #1,	r12	;r3 As==01
        mov               r2,	r10	;
        dint
        nop
        mov               0(r15),	r13	;
        cmp               r11,	r13	;
        jnz               0f
        mov               r14,	0(r15)	;
        clr               r12		;
0:
        nop
        mov               r10,	r2	;
        nop
        pop               r10		;
        ret

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        mov               r13,	r15	;
        mov               r2,	r11	;
        dint
        nop
        mov.b             0(r12),	r13	;
        cmp.b             r15,	r13	;
        jnz               0f
        mov.b             r14,	0(r12)	;
        nop
        mov               r11,	r2	;
        nop
        clr.b             r12		;
        ret
0:
        nop
        mov               r11,	r2	;
        nop
        mov.b             #1,	r12	;r3 As==01
        ret

asm_test::or::u8::acqrel_all:
        mov.b             #-1,	r13	;r3 As==11
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::seqcst_all:
        mov.b             #-1,	r13	;r3 As==11
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::acqrel_zero:
        clr.b             r13		;
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::acquire_all:
        mov.b             #-1,	r13	;r3 As==11
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::relaxed_all:
        mov.b             #-1,	r13	;r3 As==11
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::release_all:
        mov.b             #-1,	r13	;r3 As==11
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::seqcst_zero:
        clr.b             r13		;
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::acquire_zero:
        clr.b             r13		;
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::relaxed_zero:
        clr.b             r13		;
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::release_zero:
        clr.b             r13		;
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::acqrel:
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::seqcst:
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::acquire:
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::relaxed:
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u8::release:
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::u16::acqrel_all:
        mov               #-1,	r13	;r3 As==11
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::seqcst_all:
        mov               #-1,	r13	;r3 As==11
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::acqrel_zero:
        clr               r13		;
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::acquire_all:
        mov               #-1,	r13	;r3 As==11
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::relaxed_all:
        mov               #-1,	r13	;r3 As==11
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::release_all:
        mov               #-1,	r13	;r3 As==11
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::seqcst_zero:
        clr               r13		;
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::acquire_zero:
        clr               r13		;
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::relaxed_zero:
        clr               r13		;
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::release_zero:
        clr               r13		;
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::acqrel:
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::seqcst:
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::acquire:
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::relaxed:
        bis               r13,	0(r12)	;
        ret

asm_test::or::u16::release:
        bis               r13,	0(r12)	;
        ret

asm_test::or::bool::acqrel_true:
        mov.b             #1,	r13	;r3 As==01
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::seqcst_true:
        mov.b             #1,	r13	;r3 As==01
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::acqrel_false:
        clr.b             r13		;
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::acquire_true:
        mov.b             #1,	r13	;r3 As==01
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::relaxed_true:
        mov.b             #1,	r13	;r3 As==01
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::release_true:
        mov.b             #1,	r13	;r3 As==01
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::seqcst_false:
        clr.b             r13		;
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::acquire_false:
        clr.b             r13		;
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::relaxed_false:
        clr.b             r13		;
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::release_false:
        clr.b             r13		;
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::acqrel:
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::seqcst:
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::acquire:
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::relaxed:
        bis.b             r13,	0(r12)	;
        ret

asm_test::or::bool::release:
        bis.b             r13,	0(r12)	;
        ret

asm_test::add::u8::acqrel_zero:
        clr.b             r13		;
        add.b             r13,	0(r12)	;
        ret

asm_test::add::u8::seqcst_zero:
        clr.b             r13		;
        add.b             r13,	0(r12)	;
        ret

asm_test::add::u8::acquire_zero:
        clr.b             r13		;
        add.b             r13,	0(r12)	;
        ret

asm_test::add::u8::relaxed_zero:
        clr.b             r13		;
        add.b             r13,	0(r12)	;
        ret

asm_test::add::u8::release_zero:
        clr.b             r13		;
        add.b             r13,	0(r12)	;
        ret

asm_test::add::u8::acqrel:
        add.b             r13,	0(r12)	;
        ret

asm_test::add::u8::seqcst:
        add.b             r13,	0(r12)	;
        ret

asm_test::add::u8::acquire:
        add.b             r13,	0(r12)	;
        ret

asm_test::add::u8::relaxed:
        add.b             r13,	0(r12)	;
        ret

asm_test::add::u8::release:
        add.b             r13,	0(r12)	;
        ret

asm_test::add::u16::acqrel_zero:
        clr               r13		;
        add               r13,	0(r12)	;
        ret

asm_test::add::u16::seqcst_zero:
        clr               r13		;
        add               r13,	0(r12)	;
        ret

asm_test::add::u16::acquire_zero:
        clr               r13		;
        add               r13,	0(r12)	;
        ret

asm_test::add::u16::relaxed_zero:
        clr               r13		;
        add               r13,	0(r12)	;
        ret

asm_test::add::u16::release_zero:
        clr               r13		;
        add               r13,	0(r12)	;
        ret

asm_test::add::u16::acqrel:
        add               r13,	0(r12)	;
        ret

asm_test::add::u16::seqcst:
        add               r13,	0(r12)	;
        ret

asm_test::add::u16::acquire:
        add               r13,	0(r12)	;
        ret

asm_test::add::u16::relaxed:
        add               r13,	0(r12)	;
        ret

asm_test::add::u16::release:
        add               r13,	0(r12)	;
        ret

asm_test::and::u8::acqrel_all:
        mov.b             #-1,	r13	;r3 As==11
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::seqcst_all:
        mov.b             #-1,	r13	;r3 As==11
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::acqrel_zero:
        clr.b             r13		;
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::acquire_all:
        mov.b             #-1,	r13	;r3 As==11
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::relaxed_all:
        mov.b             #-1,	r13	;r3 As==11
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::release_all:
        mov.b             #-1,	r13	;r3 As==11
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::seqcst_zero:
        clr.b             r13		;
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::acquire_zero:
        clr.b             r13		;
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::relaxed_zero:
        clr.b             r13		;
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::release_zero:
        clr.b             r13		;
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::acqrel:
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::seqcst:
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::acquire:
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::relaxed:
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u8::release:
        and.b             r13,	0(r12)	;
        ret

asm_test::and::u16::acqrel_all:
        mov               #-1,	r13	;r3 As==11
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::seqcst_all:
        mov               #-1,	r13	;r3 As==11
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::acqrel_zero:
        clr               r13		;
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::acquire_all:
        mov               #-1,	r13	;r3 As==11
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::relaxed_all:
        mov               #-1,	r13	;r3 As==11
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::release_all:
        mov               #-1,	r13	;r3 As==11
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::seqcst_zero:
        clr               r13		;
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::acquire_zero:
        clr               r13		;
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::relaxed_zero:
        clr               r13		;
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::release_zero:
        clr               r13		;
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::acqrel:
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::seqcst:
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::acquire:
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::relaxed:
        and               r13,	0(r12)	;
        ret

asm_test::and::u16::release:
        and               r13,	0(r12)	;
        ret

asm_test::and::bool::acqrel_true:
        mov.b             #1,	r13	;r3 As==01
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::seqcst_true:
        mov.b             #1,	r13	;r3 As==01
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::acqrel_false:
        clr.b             r13		;
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::acquire_true:
        mov.b             #1,	r13	;r3 As==01
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::relaxed_true:
        mov.b             #1,	r13	;r3 As==01
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::release_true:
        mov.b             #1,	r13	;r3 As==01
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::seqcst_false:
        clr.b             r13		;
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::acquire_false:
        clr.b             r13		;
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::relaxed_false:
        clr.b             r13		;
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::release_false:
        clr.b             r13		;
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::acqrel:
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::seqcst:
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::acquire:
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::relaxed:
        and.b             r13,	0(r12)	;
        ret

asm_test::and::bool::release:
        and.b             r13,	0(r12)	;
        ret

asm_test::neg::u8::acqrel:
        mov               r2,	r13	;
        dint
        nop
        clr.b             r14		;
        sub.b             0(r12),	r14	;
        mov.b             r14,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::neg::u8::seqcst:
        mov               r2,	r13	;
        dint
        nop
        clr.b             r14		;
        sub.b             0(r12),	r14	;
        mov.b             r14,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::neg::u8::acquire:
        mov               r2,	r13	;
        dint
        nop
        clr.b             r14		;
        sub.b             0(r12),	r14	;
        mov.b             r14,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::neg::u8::relaxed:
        mov               r2,	r13	;
        dint
        nop
        clr.b             r14		;
        sub.b             0(r12),	r14	;
        mov.b             r14,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::neg::u8::release:
        mov               r2,	r13	;
        dint
        nop
        clr.b             r14		;
        sub.b             0(r12),	r14	;
        mov.b             r14,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::neg::u16::acqrel:
        mov               r2,	r13	;
        dint
        nop
        clr               r14		;
        sub               0(r12),	r14	;
        mov               r14,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::neg::u16::seqcst:
        mov               r2,	r13	;
        dint
        nop
        clr               r14		;
        sub               0(r12),	r14	;
        mov               r14,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::neg::u16::acquire:
        mov               r2,	r13	;
        dint
        nop
        clr               r14		;
        sub               0(r12),	r14	;
        mov               r14,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::neg::u16::relaxed:
        mov               r2,	r13	;
        dint
        nop
        clr               r14		;
        sub               0(r12),	r14	;
        mov               r14,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::neg::u16::release:
        mov               r2,	r13	;
        dint
        nop
        clr               r14		;
        sub               0(r12),	r14	;
        mov               r14,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::not::u8::acqrel:
        xor.b             #-1,	0(r12)	;r3 As==11
        ret

asm_test::not::u8::seqcst:
        xor.b             #-1,	0(r12)	;r3 As==11
        ret

asm_test::not::u8::acquire:
        xor.b             #-1,	0(r12)	;r3 As==11
        ret

asm_test::not::u8::relaxed:
        xor.b             #-1,	0(r12)	;r3 As==11
        ret

asm_test::not::u8::release:
        xor.b             #-1,	0(r12)	;r3 As==11
        ret

asm_test::not::u16::acqrel:
        xor               #-1,	0(r12)	;r3 As==11
        ret

asm_test::not::u16::seqcst:
        xor               #-1,	0(r12)	;r3 As==11
        ret

asm_test::not::u16::acquire:
        xor               #-1,	0(r12)	;r3 As==11
        ret

asm_test::not::u16::relaxed:
        xor               #-1,	0(r12)	;r3 As==11
        ret

asm_test::not::u16::release:
        xor               #-1,	0(r12)	;r3 As==11
        ret

asm_test::not::bool::acqrel:
        xor.b             #1,	0(r12)	;r3 As==01
        ret

asm_test::not::bool::seqcst:
        xor.b             #1,	0(r12)	;r3 As==01
        ret

asm_test::not::bool::acquire:
        xor.b             #1,	0(r12)	;r3 As==01
        ret

asm_test::not::bool::relaxed:
        xor.b             #1,	0(r12)	;r3 As==01
        ret

asm_test::not::bool::release:
        xor.b             #1,	0(r12)	;r3 As==01
        ret

asm_test::sub::u8::acqrel_zero:
        clr.b             r13		;
        sub.b             r13,	0(r12)	;
        ret

asm_test::sub::u8::seqcst_zero:
        clr.b             r13		;
        sub.b             r13,	0(r12)	;
        ret

asm_test::sub::u8::acquire_zero:
        clr.b             r13		;
        sub.b             r13,	0(r12)	;
        ret

asm_test::sub::u8::relaxed_zero:
        clr.b             r13		;
        sub.b             r13,	0(r12)	;
        ret

asm_test::sub::u8::release_zero:
        clr.b             r13		;
        sub.b             r13,	0(r12)	;
        ret

asm_test::sub::u8::acqrel:
        sub.b             r13,	0(r12)	;
        ret

asm_test::sub::u8::seqcst:
        sub.b             r13,	0(r12)	;
        ret

asm_test::sub::u8::acquire:
        sub.b             r13,	0(r12)	;
        ret

asm_test::sub::u8::relaxed:
        sub.b             r13,	0(r12)	;
        ret

asm_test::sub::u8::release:
        sub.b             r13,	0(r12)	;
        ret

asm_test::sub::u16::acqrel_zero:
        clr               r13		;
        sub               r13,	0(r12)	;
        ret

asm_test::sub::u16::seqcst_zero:
        clr               r13		;
        sub               r13,	0(r12)	;
        ret

asm_test::sub::u16::acquire_zero:
        clr               r13		;
        sub               r13,	0(r12)	;
        ret

asm_test::sub::u16::relaxed_zero:
        clr               r13		;
        sub               r13,	0(r12)	;
        ret

asm_test::sub::u16::release_zero:
        clr               r13		;
        sub               r13,	0(r12)	;
        ret

asm_test::sub::u16::acqrel:
        sub               r13,	0(r12)	;
        ret

asm_test::sub::u16::seqcst:
        sub               r13,	0(r12)	;
        ret

asm_test::sub::u16::acquire:
        sub               r13,	0(r12)	;
        ret

asm_test::sub::u16::relaxed:
        sub               r13,	0(r12)	;
        ret

asm_test::sub::u16::release:
        sub               r13,	0(r12)	;
        ret

asm_test::xor::u8::acqrel_zero:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::u8::seqcst_zero:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::u8::acquire_zero:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::u8::relaxed_zero:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::u8::release_zero:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::u8::acqrel:
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::u8::seqcst:
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::u8::acquire:
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::u8::relaxed:
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::u8::release:
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::u16::acqrel_zero:
        clr               r13		;
        xor               r13,	0(r12)	;
        ret

asm_test::xor::u16::seqcst_zero:
        clr               r13		;
        xor               r13,	0(r12)	;
        ret

asm_test::xor::u16::acquire_zero:
        clr               r13		;
        xor               r13,	0(r12)	;
        ret

asm_test::xor::u16::relaxed_zero:
        clr               r13		;
        xor               r13,	0(r12)	;
        ret

asm_test::xor::u16::release_zero:
        clr               r13		;
        xor               r13,	0(r12)	;
        ret

asm_test::xor::u16::acqrel:
        xor               r13,	0(r12)	;
        ret

asm_test::xor::u16::seqcst:
        xor               r13,	0(r12)	;
        ret

asm_test::xor::u16::acquire:
        xor               r13,	0(r12)	;
        ret

asm_test::xor::u16::relaxed:
        xor               r13,	0(r12)	;
        ret

asm_test::xor::u16::release:
        xor               r13,	0(r12)	;
        ret

asm_test::xor::bool::acqrel_true:
        mov.b             #1,	r13	;r3 As==01
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::seqcst_true:
        mov.b             #1,	r13	;r3 As==01
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::acqrel_false:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::acquire_true:
        mov.b             #1,	r13	;r3 As==01
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::relaxed_true:
        mov.b             #1,	r13	;r3 As==01
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::release_true:
        mov.b             #1,	r13	;r3 As==01
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::seqcst_false:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::acquire_false:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::relaxed_false:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::release_false:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::acqrel:
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::seqcst:
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::acquire:
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::relaxed:
        xor.b             r13,	0(r12)	;
        ret

asm_test::xor::bool::release:
        xor.b             r13,	0(r12)	;
        ret

asm_test::load::u8::seqcst:
        mov.b             @r12,	r12	;
        ret

asm_test::load::u8::acquire:
        mov.b             @r12,	r12	;
        ret

asm_test::load::u8::relaxed:
        mov.b             @r12,	r12	;
        ret

asm_test::load::u16::seqcst:
        mov               @r12,	r12	;
        ret

asm_test::load::u16::acquire:
        mov               @r12,	r12	;
        ret

asm_test::load::u16::relaxed:
        mov               @r12,	r12	;
        ret

asm_test::load::bool::seqcst:
        mov.b             @r12,	r12	;
        ret

asm_test::load::bool::acquire:
        mov.b             @r12,	r12	;
        ret

asm_test::load::bool::relaxed:
        mov.b             @r12,	r12	;
        ret

asm_test::swap::u8::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::swap::u8::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::swap::u8::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::swap::u8::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::swap::u8::release:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::swap::u16::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::swap::u16::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::swap::u16::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::swap::u16::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::swap::u16::release:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::swap::bool::acqrel_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::swap::bool::seqcst_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::swap::bool::acqrel_false:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::swap::bool::acquire_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::swap::bool::relaxed_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::swap::bool::release_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::swap::bool::seqcst_false:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::swap::bool::acquire_false:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::swap::bool::relaxed_false:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::swap::bool::release_false:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::swap::bool::acqrel:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret
0:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::swap::bool::seqcst:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret
0:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::swap::bool::acquire:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret
0:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::swap::bool::relaxed:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret
0:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::swap::bool::release:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret
0:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::store::u8::seqcst:
        mov.b             r13,	0(r12)	;
        ret

asm_test::store::u8::relaxed:
        mov.b             r13,	0(r12)	;
        ret

asm_test::store::u8::release:
        mov.b             r13,	0(r12)	;
        ret

asm_test::store::u16::seqcst:
        mov               r13,	0(r12)	;
        ret

asm_test::store::u16::relaxed:
        mov               r13,	0(r12)	;
        ret

asm_test::store::u16::release:
        mov               r13,	0(r12)	;
        ret

asm_test::store::bool::seqcst:
        mov.b             r13,	0(r12)	;
        ret

asm_test::store::bool::relaxed:
        mov.b             r13,	0(r12)	;
        ret

asm_test::store::bool::release:
        mov.b             r13,	0(r12)	;
        ret

asm_test::bit_set::u8::acqrel:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        bis.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_set::u8::seqcst:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        bis.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_set::u8::acquire:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        bis.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_set::u8::relaxed:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        bis.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_set::u8::release:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        bis.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_set::u16::acqrel:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        bis               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_set::u16::seqcst:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        bis               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_set::u16::acquire:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        bis               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_set::u16::relaxed:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        bis               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_set::u16::release:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        bis               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_or::u8::acqrel_all:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_or::u8::seqcst_all:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_or::u8::acqrel_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_or::u8::acquire_all:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_or::u8::relaxed_all:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_or::u8::release_all:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_or::u8::seqcst_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_or::u8::acquire_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_or::u8::relaxed_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_or::u8::release_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_or::u8::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        bis.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_or::u8::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        bis.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_or::u8::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        bis.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_or::u8::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        bis.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_or::u8::release:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        bis.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_or::u16::acqrel_all:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_or::u16::seqcst_all:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_or::u16::acqrel_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_or::u16::acquire_all:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_or::u16::relaxed_all:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_or::u16::release_all:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #-1,	0(r12)	;r3 As==11
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_or::u16::seqcst_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_or::u16::acquire_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_or::u16::relaxed_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_or::u16::release_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_or::u16::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        bis               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_or::u16::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        bis               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_or::u16::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        bis               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_or::u16::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        bis               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_or::u16::release:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        bis               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_or::bool::acqrel_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_or::bool::seqcst_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_or::bool::acqrel_false:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_or::bool::acquire_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_or::bool::relaxed_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_or::bool::release_true:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_or::bool::seqcst_false:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_or::bool::acquire_false:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_or::bool::relaxed_false:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_or::bool::release_false:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_or::bool::acqrel:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret
0:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_or::bool::seqcst:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret
0:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_or::bool::acquire:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret
0:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_or::bool::relaxed:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret
0:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_or::bool::release:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov               r2,	r13	;
        dint
        nop
        mov               r12,	r14	;
        mov.b             0(r14),	r12	;
        mov.b             #1,	0(r14)	;r3 As==01
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret
0:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_clear::u8::acqrel:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        bic.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_clear::u8::seqcst:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        bic.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_clear::u8::acquire:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        bic.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_clear::u8::relaxed:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        bic.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_clear::u8::release:
        and.b             #7,	r13	;
        mov.b             #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla.b             r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r15	;
        mov.b             r15,	r11	;
        bic.b             r14,	r11	;
        mov.b             r11,	0(r12)	;
        bit.b             r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_clear::u16::acqrel:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        bic               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_clear::u16::seqcst:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        bic               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_clear::u16::acquire:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        bic               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_clear::u16::relaxed:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        bic               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::bit_clear::u16::release:
        and.b             #15,	r13	;#0x000f
        mov               #1,	r14	;r3 As==01
        cmp.b             #0,	r13	;
        jz                1f
0:
        rla               r14		;
        sub.b             #1,	r13	;
        jnz               0b
1:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r15	;
        mov               r15,	r11	;
        bic               r14,	r11	;
        mov               r11,	0(r12)	;
        bit               r14,	r15	;
        mov               r2,	r12	;
        nop
        mov               r13,	r2	;
        nop
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_add::u8::acqrel_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_add::u8::seqcst_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_add::u8::acquire_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_add::u8::relaxed_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_add::u8::release_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_add::u8::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        add.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_add::u8::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        add.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_add::u8::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        add.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_add::u8::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        add.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_add::u8::release:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        add.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_add::u16::acqrel_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_add::u16::seqcst_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_add::u16::acquire_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_add::u16::relaxed_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_add::u16::release_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_add::u16::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        add               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_add::u16::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        add               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_add::u16::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        add               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_add::u16::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        add               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_add::u16::release:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        add               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_and::u8::acqrel_all:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_and::u8::seqcst_all:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_and::u8::acqrel_zero:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_and::u8::acquire_all:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_and::u8::relaxed_all:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_and::u8::release_all:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_and::u8::seqcst_zero:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_and::u8::acquire_zero:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_and::u8::relaxed_zero:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_and::u8::release_zero:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_and::u8::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        and.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_and::u8::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        and.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_and::u8::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        and.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_and::u8::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        and.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_and::u8::release:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        and.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_and::u16::acqrel_all:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_and::u16::seqcst_all:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_and::u16::acqrel_zero:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_and::u16::acquire_all:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_and::u16::relaxed_all:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_and::u16::release_all:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_and::u16::seqcst_zero:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_and::u16::acquire_zero:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_and::u16::relaxed_zero:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_and::u16::release_zero:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               #0,	0(r12)	;r3 As==00
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_and::u16::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        and               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_and::u16::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        and               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_and::u16::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        and               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_and::u16::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        and               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_and::u16::release:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        and               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_and::bool::acqrel_true:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::seqcst_true:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::acqrel_false:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::acquire_true:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::relaxed_true:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::release_true:
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::seqcst_false:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::acquire_false:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::relaxed_false:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::release_false:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::acqrel:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret
0:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::seqcst:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret
0:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::acquire:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret
0:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::relaxed:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret
0:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_and::bool::release:
        cmp               #0,	r13	;r3 As==00
        jz                0f
        and.b             #1,	0(r12)	;r3 As==01
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret
0:
        rra.b             0(r12)		;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_max::i8::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r13,	r14	;
        jl                0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_max::i8::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r13,	r14	;
        jl                0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_max::i8::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r13,	r14	;
        jl                0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_max::i8::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r13,	r14	;
        jl                0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_max::i8::release:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r13,	r14	;
        jl                0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_max::i16::acqrel:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r13,	r12	;
        jl                0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_max::i16::seqcst:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r13,	r12	;
        jl                0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_max::i16::acquire:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r13,	r12	;
        jl                0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_max::i16::relaxed:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r13,	r12	;
        jl                0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_max::i16::release:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r13,	r12	;
        jl                0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_min::i8::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r14,	r13	;
        jl                0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_min::i8::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r14,	r13	;
        jl                0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_min::i8::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r14,	r13	;
        jl                0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_min::i8::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r14,	r13	;
        jl                0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_min::i8::release:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp.b             r14,	r13	;
        jl                0f
        mov.b             r14,	r13	;
0:
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_min::i16::acqrel:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r12,	r13	;
        jl                0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_min::i16::seqcst:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r12,	r13	;
        jl                0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_min::i16::acquire:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r12,	r13	;
        jl                0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_min::i16::relaxed:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r12,	r13	;
        jl                0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_min::i16::release:
        mov               r12,	r14	;
        mov               r2,	r15	;
        dint
        nop
        mov               0(r14),	r12	;
        cmp               r12,	r13	;
        jl                0f
        mov               r12,	r13	;
0:
        mov               r13,	0(r14)	;
        nop
        mov               r15,	r2	;
        nop
        ret

asm_test::fetch_neg::u8::acqrel:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        clr.b             r15		;
        sub.b             r13,	r15	;
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_neg::u8::seqcst:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        clr.b             r15		;
        sub.b             r13,	r15	;
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_neg::u8::acquire:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        clr.b             r15		;
        sub.b             r13,	r15	;
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_neg::u8::relaxed:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        clr.b             r15		;
        sub.b             r13,	r15	;
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_neg::u8::release:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        clr.b             r15		;
        sub.b             r13,	r15	;
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_neg::u16::acqrel:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        clr               r15		;
        sub               r13,	r15	;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_neg::u16::seqcst:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        clr               r15		;
        sub               r13,	r15	;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_neg::u16::acquire:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        clr               r15		;
        sub               r13,	r15	;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_neg::u16::relaxed:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        clr               r15		;
        sub               r13,	r15	;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_neg::u16::release:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        clr               r15		;
        sub               r13,	r15	;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_not::u8::acqrel:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             r13,	r15	;
        xor.b             #-1,	r15	;r3 As==11
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_not::u8::seqcst:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             r13,	r15	;
        xor.b             #-1,	r15	;r3 As==11
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_not::u8::acquire:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             r13,	r15	;
        xor.b             #-1,	r15	;r3 As==11
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_not::u8::relaxed:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             r13,	r15	;
        xor.b             #-1,	r15	;r3 As==11
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_not::u8::release:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r13	;
        mov.b             r13,	r15	;
        xor.b             #-1,	r15	;r3 As==11
        mov.b             r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov.b             r13,	r12	;
        ret

asm_test::fetch_not::u16::acqrel:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               r13,	r15	;
        inv               r15		;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_not::u16::seqcst:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               r13,	r15	;
        inv               r15		;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_not::u16::acquire:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               r13,	r15	;
        inv               r15		;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_not::u16::relaxed:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               r13,	r15	;
        inv               r15		;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_not::u16::release:
        mov               r2,	r14	;
        dint
        nop
        mov               0(r12),	r13	;
        mov               r13,	r15	;
        inv               r15		;
        mov               r15,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        mov               r13,	r12	;
        ret

asm_test::fetch_not::bool::acqrel:
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        ret

asm_test::fetch_not::bool::seqcst:
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        ret

asm_test::fetch_not::bool::acquire:
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        ret

asm_test::fetch_not::bool::relaxed:
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        ret

asm_test::fetch_not::bool::release:
        xor.b             #1,	0(r12)	;r3 As==01
        mov               #1,	r12	;r3 As==01
        bic               r2,	r12	;
        ret

asm_test::fetch_sub::u8::acqrel_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_sub::u8::seqcst_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_sub::u8::acquire_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_sub::u8::relaxed_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_sub::u8::release_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_sub::u8::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r14,	r11	;
        sub.b             r13,	r11	;
        mov.b             r11,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_sub::u8::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r14,	r11	;
        sub.b             r13,	r11	;
        mov.b             r11,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_sub::u8::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r14,	r11	;
        sub.b             r13,	r11	;
        mov.b             r11,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_sub::u8::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r14,	r11	;
        sub.b             r13,	r11	;
        mov.b             r11,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_sub::u8::release:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r14,	r11	;
        sub.b             r13,	r11	;
        mov.b             r11,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_sub::u16::acqrel_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_sub::u16::seqcst_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_sub::u16::acquire_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_sub::u16::relaxed_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_sub::u16::release_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_sub::u16::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        mov               r14,	r11	;
        sub               r13,	r11	;
        mov               r11,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_sub::u16::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        mov               r14,	r11	;
        sub               r13,	r11	;
        mov               r11,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_sub::u16::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        mov               r14,	r11	;
        sub               r13,	r11	;
        mov               r11,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_sub::u16::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        mov               r14,	r11	;
        sub               r13,	r11	;
        mov               r11,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_sub::u16::release:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        mov               r14,	r11	;
        sub               r13,	r11	;
        mov               r11,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_xor::u8::acqrel_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_xor::u8::seqcst_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_xor::u8::acquire_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_xor::u8::relaxed_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_xor::u8::release_zero:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_xor::u8::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        xor.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_xor::u8::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        xor.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_xor::u8::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        xor.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_xor::u8::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        xor.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_xor::u8::release:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        xor.b             r14,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov.b             r14,	r12	;
        ret

asm_test::fetch_xor::u16::acqrel_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_xor::u16::seqcst_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_xor::u16::acquire_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_xor::u16::relaxed_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_xor::u16::release_zero:
        mov               r2,	r13	;
        dint
        nop
        mov               0(r12),	r12	;
        nop
        mov               r13,	r2	;
        nop
        ret

asm_test::fetch_xor::u16::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        xor               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_xor::u16::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        xor               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_xor::u16::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        xor               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_xor::u16::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        xor               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_xor::u16::release:
        mov               r2,	r15	;
        dint
        nop
        mov               0(r12),	r14	;
        xor               r14,	r13	;
        mov               r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        mov               r14,	r12	;
        ret

asm_test::fetch_xor::bool::acqrel_true:
        mov.b             #1,	r13	;r3 As==01
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        xor.b             #-1,	r12	;r3 As==11
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::seqcst_true:
        mov.b             #1,	r13	;r3 As==01
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        xor.b             #-1,	r12	;r3 As==11
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::acqrel_false:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::acquire_true:
        mov.b             #1,	r13	;r3 As==01
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        xor.b             #-1,	r12	;r3 As==11
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::relaxed_true:
        mov.b             #1,	r13	;r3 As==01
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        xor.b             #-1,	r12	;r3 As==11
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::release_true:
        mov.b             #1,	r13	;r3 As==01
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        xor.b             #-1,	r12	;r3 As==11
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::seqcst_false:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::acquire_false:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::relaxed_false:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::release_false:
        clr.b             r13		;
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::acqrel:
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        xor.b             r13,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::seqcst:
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        xor.b             r13,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::acquire:
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        xor.b             r13,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::relaxed:
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        xor.b             r13,	r12	;
        and               #1,	r12	;r3 As==01
        ret

asm_test::fetch_xor::bool::release:
        xor.b             r13,	0(r12)	;
        mov               r2,	r12	;
        xor.b             r13,	r12	;
        and               #1,	r12	;r3 As==01
        ret

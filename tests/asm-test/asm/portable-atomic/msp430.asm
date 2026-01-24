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

asm_test::fetch_nand::bool::acqrel:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov.b             r14,	r13	;
        xor.b             #1,	r13	;r3 As==01
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        jmp               1f
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r15,	r2	;
        nop
1:
        cmp.b             #0,	r14	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_nand::bool::seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov.b             r14,	r13	;
        xor.b             #1,	r13	;r3 As==01
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        jmp               1f
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r15,	r2	;
        nop
1:
        cmp.b             #0,	r14	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_nand::bool::acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov.b             r14,	r13	;
        xor.b             #1,	r13	;r3 As==01
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        jmp               1f
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r15,	r2	;
        nop
1:
        cmp.b             #0,	r14	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_nand::bool::relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov.b             r14,	r13	;
        xor.b             #1,	r13	;r3 As==01
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        jmp               1f
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r15,	r2	;
        nop
1:
        cmp.b             #0,	r14	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_nand::bool::release:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r14	;
        cmp               #0,	r13	;r3 As==00
        jz                0f
        mov.b             r14,	r13	;
        xor.b             #1,	r13	;r3 As==01
        mov.b             r13,	0(r12)	;
        nop
        mov               r15,	r2	;
        nop
        jmp               1f
0:
        mov.b             #1,	0(r12)	;r3 As==01
        nop
        mov               r15,	r2	;
        nop
1:
        cmp.b             #0,	r14	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
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
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::release_seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::release_acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange::bool::release_relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
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
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        mov               r2,	r15	;
        dint
        nop
        mov.b             0(r12),	r11	;
        cmp.b             r13,	r11	;
        jnz               0f
        mov.b             r14,	0(r12)	;
0:
        cmp.b             r13,	r11	;
        mov               r2,	r14	;
        cmp.b             #0,	r11	;r3 As==00
        mov               r2,	r11	;
        nop
        mov               r15,	r2	;
        nop
        rra               r11		;
        mov               #1,	r12	;r3 As==01
        mov               #1,	r13	;r3 As==01
        bic               r11,	r13	;
        rra               r14		;
        bic               r14,	r12	;
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
        cmp.b             #0,	r12	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::load::bool::acquire:
        mov.b             @r12,	r12	;
        cmp.b             #0,	r12	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::load::bool::relaxed:
        mov.b             @r12,	r12	;
        cmp.b             #0,	r12	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
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

asm_test::swap::bool::acqrel:
        mov               r2,	r14	;
        dint
        nop
        cmp.b             #0,	0(r12)	;r3 As==00
        mov               r2,	r15	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        rra               r15		;
        mov               #1,	r12	;r3 As==01
        bic               r15,	r12	;
        ret

asm_test::swap::bool::seqcst:
        mov               r2,	r14	;
        dint
        nop
        cmp.b             #0,	0(r12)	;r3 As==00
        mov               r2,	r15	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        rra               r15		;
        mov               #1,	r12	;r3 As==01
        bic               r15,	r12	;
        ret

asm_test::swap::bool::acquire:
        mov               r2,	r14	;
        dint
        nop
        cmp.b             #0,	0(r12)	;r3 As==00
        mov               r2,	r15	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        rra               r15		;
        mov               #1,	r12	;r3 As==01
        bic               r15,	r12	;
        ret

asm_test::swap::bool::relaxed:
        mov               r2,	r14	;
        dint
        nop
        cmp.b             #0,	0(r12)	;r3 As==00
        mov               r2,	r15	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        rra               r15		;
        mov               #1,	r12	;r3 As==01
        bic               r15,	r12	;
        ret

asm_test::swap::bool::release:
        mov               r2,	r14	;
        dint
        nop
        cmp.b             #0,	0(r12)	;r3 As==00
        mov               r2,	r15	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        rra               r15		;
        mov               #1,	r12	;r3 As==01
        bic               r15,	r12	;
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

asm_test::fetch_or::bool::acqrel:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        bis.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_or::bool::seqcst:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        bis.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_or::bool::acquire:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        bis.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_or::bool::relaxed:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        bis.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_or::bool::release:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        bis.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
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

asm_test::fetch_and::bool::acqrel:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        and.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_and::bool::seqcst:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        and.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_and::bool::acquire:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        and.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_and::bool::relaxed:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        and.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_and::bool::release:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        and.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
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
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r14,	r15	;
        xor.b             #1,	r15	;r3 As==01
        mov.b             r15,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        cmp.b             #0,	r14	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_not::bool::seqcst:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r14,	r15	;
        xor.b             #1,	r15	;r3 As==01
        mov.b             r15,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        cmp.b             #0,	r14	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_not::bool::acquire:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r14,	r15	;
        xor.b             #1,	r15	;r3 As==01
        mov.b             r15,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        cmp.b             #0,	r14	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_not::bool::relaxed:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r14,	r15	;
        xor.b             #1,	r15	;r3 As==01
        mov.b             r15,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        cmp.b             #0,	r14	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_not::bool::release:
        mov               r2,	r13	;
        dint
        nop
        mov.b             0(r12),	r14	;
        mov.b             r14,	r15	;
        xor.b             #1,	r15	;r3 As==01
        mov.b             r15,	0(r12)	;
        nop
        mov               r13,	r2	;
        nop
        cmp.b             #0,	r14	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
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

asm_test::fetch_xor::bool::acqrel:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        xor.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_xor::bool::seqcst:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        xor.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_xor::bool::acquire:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        xor.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_xor::bool::relaxed:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        xor.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret

asm_test::fetch_xor::bool::release:
        mov               r2,	r14	;
        dint
        nop
        mov.b             0(r12),	r15	;
        xor.b             r15,	r13	;
        mov.b             r13,	0(r12)	;
        nop
        mov               r14,	r2	;
        nop
        cmp.b             #0,	r15	;r3 As==00
        mov               r2,	r13	;
        rra               r13		;
        mov               #1,	r12	;r3 As==01
        bic               r13,	r12	;
        ret


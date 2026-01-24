asm_test::fetch_nand::u8::acqrel:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        not               r8b
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_nand::u8::seqcst:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        not               r8b
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_nand::u8::acquire:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        not               r8b
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_nand::u8::relaxed:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        not               r8b
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_nand::u8::release:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        not               r8b
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_nand::u16::acqrel:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        not               r8d
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_nand::u16::seqcst:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        not               r8d
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_nand::u16::acquire:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        not               r8d
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_nand::u16::relaxed:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        not               r8d
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_nand::u16::release:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        not               r8d
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_nand::u32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        not               r8d
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_nand::u32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        not               r8d
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_nand::u32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        not               r8d
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_nand::u32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        not               r8d
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_nand::u32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        not               r8d
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_nand::u64::acqrel:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        and               r8, rdx
        not               r8
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_nand::u64::seqcst:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        and               r8, rdx
        not               r8
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_nand::u64::acquire:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        and               r8, rdx
        not               r8
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_nand::u64::relaxed:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        and               r8, rdx
        not               r8
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_nand::u64::release:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        and               r8, rdx
        not               r8
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_nand::u128::acqrel:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, rdx
        and               rcx, r8
        mov               rbx, rax
        and               rbx, r9
        not               rbx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_nand::u128::seqcst:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, rdx
        and               rcx, r8
        mov               rbx, rax
        and               rbx, r9
        not               rbx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_nand::u128::acquire:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, rdx
        and               rcx, r8
        mov               rbx, rax
        and               rbx, r9
        not               rbx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_nand::u128::relaxed:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, rdx
        and               rcx, r8
        mov               rbx, rax
        and               rbx, r9
        not               rbx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_nand::u128::release:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, rdx
        and               rcx, r8
        mov               rbx, rax
        and               rbx, r9
        not               rbx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_umax::u8::acqrel:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_umax::u8::seqcst:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_umax::u8::acquire:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_umax::u8::relaxed:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_umax::u8::release:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_umax::u16::acqrel:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_umax::u16::seqcst:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_umax::u16::acquire:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_umax::u16::relaxed:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_umax::u16::release:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_umax::u32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_umax::u32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_umax::u32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_umax::u32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_umax::u32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmova             r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_umax::u64::acqrel:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmova             r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_umax::u64::seqcst:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmova             r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_umax::u64::acquire:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmova             r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_umax::u64::relaxed:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmova             r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_umax::u64::release:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmova             r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_umax::u128::acqrel:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovb             rcx, rdx
        mov               rbx, r9
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_umax::u128::seqcst:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovb             rcx, rdx
        mov               rbx, r9
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_umax::u128::acquire:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovb             rcx, rdx
        mov               rbx, r9
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_umax::u128::relaxed:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovb             rcx, rdx
        mov               rbx, r9
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_umax::u128::release:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovb             rcx, rdx
        mov               rbx, r9
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_umin::u8::acqrel:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_umin::u8::seqcst:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_umin::u8::acquire:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_umin::u8::relaxed:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_umin::u8::release:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_umin::u16::acqrel:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_umin::u16::seqcst:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_umin::u16::acquire:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_umin::u16::relaxed:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_umin::u16::release:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_umin::u32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_umin::u32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_umin::u32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_umin::u32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_umin::u32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovbe            r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_umin::u64::acqrel:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovbe            r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_umin::u64::seqcst:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovbe            r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_umin::u64::acquire:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovbe            r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_umin::u64::relaxed:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovbe            r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_umin::u64::release:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovbe            r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_umin::u128::acqrel:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovae            rcx, rdx
        mov               rbx, r9
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_umin::u128::seqcst:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovae            rcx, rdx
        mov               rbx, r9
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_umin::u128::acquire:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovae            rcx, rdx
        mov               rbx, r9
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_umin::u128::relaxed:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovae            rcx, rdx
        mov               rbx, r9
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_umin::u128::release:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovae            rcx, rdx
        mov               rbx, r9
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::release_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::release_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::release_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::release_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::release_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u16::release_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::release_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::acquire_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::release_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u32::release_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange::u64::acqrel_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::seqcst_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::acqrel_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::acqrel_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::acquire_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::relaxed_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::release_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::seqcst_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::seqcst_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::acquire_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::acquire_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::relaxed_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::relaxed_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::release_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u64::release_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange::u128::acqrel_seqcst:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::seqcst_seqcst:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::acqrel_acquire:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::acqrel_relaxed:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::acquire_seqcst:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::relaxed_seqcst:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::release_seqcst:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::seqcst_acquire:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::seqcst_relaxed:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::acquire_acquire:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::acquire_relaxed:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::relaxed_acquire:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::relaxed_relaxed:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::release_acquire:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange::u128::release_relaxed:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      word ptr [rcx], r8w
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        mov               eax, edx
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        mov               ecx, eax
        setne             dl
        mov               eax, edx
        mov               edx, ecx
        ret

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::release_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::acquire_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::release_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u64::release_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        mov               rcx, rax
        setne             dl
        mov               rax, rdx
        mov               rdx, rcx
        ret

asm_test::compare_exchange_weak::u128::acqrel_seqcst:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::seqcst_seqcst:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::acqrel_acquire:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::acqrel_relaxed:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::acquire_seqcst:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::relaxed_seqcst:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::release_seqcst:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::seqcst_acquire:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::seqcst_relaxed:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::acquire_acquire:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::acquire_relaxed:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::relaxed_acquire:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::relaxed_relaxed:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::release_acquire:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::compare_exchange_weak::u128::release_relaxed:
        push              rbx
        mov               rax, r8
        mov               r8, rdx
        mov               r10, rcx
        mov               rbx, qword ptr [rsp + 0x30]
        mov               rcx, qword ptr [rsp + 0x38]
        xor               r11d, r11d
        mov               rdx, r9
        lock cmpxchg16b   xmmword ptr [r8]
        setne             r11b
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10], r11
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        pop               rbx
        ret

asm_test::load::u8::seqcst:
        movzx             eax, byte ptr [rcx]
        ret

asm_test::load::u8::acquire:
        movzx             eax, byte ptr [rcx]
        ret

asm_test::load::u8::relaxed:
        movzx             eax, byte ptr [rcx]
        ret

asm_test::load::u16::seqcst:
        movzx             eax, word ptr [rcx]
        ret

asm_test::load::u16::acquire:
        movzx             eax, word ptr [rcx]
        ret

asm_test::load::u16::relaxed:
        movzx             eax, word ptr [rcx]
        ret

asm_test::load::u32::seqcst:
        mov               eax, dword ptr [rcx]
        ret

asm_test::load::u32::acquire:
        mov               eax, dword ptr [rcx]
        ret

asm_test::load::u32::relaxed:
        mov               eax, dword ptr [rcx]
        ret

asm_test::load::u64::seqcst:
        mov               rax, qword ptr [rcx]
        ret

asm_test::load::u64::acquire:
        mov               rax, qword ptr [rcx]
        ret

asm_test::load::u64::relaxed:
        mov               rax, qword ptr [rcx]
        ret

asm_test::load::u128::seqcst:
        push              rbx
        mov               r8, rcx
        xor               eax, eax
        xor               edx, edx
        xor               ecx, ecx
        xor               ebx, ebx
        lock cmpxchg16b   xmmword ptr [r8]
        pop               rbx
        ret

asm_test::load::u128::acquire:
        push              rbx
        mov               r8, rcx
        xor               eax, eax
        xor               edx, edx
        xor               ecx, ecx
        xor               ebx, ebx
        lock cmpxchg16b   xmmword ptr [r8]
        pop               rbx
        ret

asm_test::load::u128::relaxed:
        push              rbx
        mov               r8, rcx
        xor               eax, eax
        xor               edx, edx
        xor               ecx, ecx
        xor               ebx, ebx
        lock cmpxchg16b   xmmword ptr [r8]
        pop               rbx
        ret

asm_test::swap::u8::acqrel:
        mov               eax, edx
        xchg              byte ptr [rcx], al
        ret

asm_test::swap::u8::seqcst:
        mov               eax, edx
        xchg              byte ptr [rcx], al
        ret

asm_test::swap::u8::acquire:
        mov               eax, edx
        xchg              byte ptr [rcx], al
        ret

asm_test::swap::u8::relaxed:
        mov               eax, edx
        xchg              byte ptr [rcx], al
        ret

asm_test::swap::u8::release:
        mov               eax, edx
        xchg              byte ptr [rcx], al
        ret

asm_test::swap::u16::acqrel:
        mov               eax, edx
        xchg              word ptr [rcx], ax
        ret

asm_test::swap::u16::seqcst:
        mov               eax, edx
        xchg              word ptr [rcx], ax
        ret

asm_test::swap::u16::acquire:
        mov               eax, edx
        xchg              word ptr [rcx], ax
        ret

asm_test::swap::u16::relaxed:
        mov               eax, edx
        xchg              word ptr [rcx], ax
        ret

asm_test::swap::u16::release:
        mov               eax, edx
        xchg              word ptr [rcx], ax
        ret

asm_test::swap::u32::acqrel:
        mov               eax, edx
        xchg              dword ptr [rcx], eax
        ret

asm_test::swap::u32::seqcst:
        mov               eax, edx
        xchg              dword ptr [rcx], eax
        ret

asm_test::swap::u32::acquire:
        mov               eax, edx
        xchg              dword ptr [rcx], eax
        ret

asm_test::swap::u32::relaxed:
        mov               eax, edx
        xchg              dword ptr [rcx], eax
        ret

asm_test::swap::u32::release:
        mov               eax, edx
        xchg              dword ptr [rcx], eax
        ret

asm_test::swap::u64::acqrel:
        mov               rax, rdx
        xchg              qword ptr [rcx], rax
        ret

asm_test::swap::u64::seqcst:
        mov               rax, rdx
        xchg              qword ptr [rcx], rax
        ret

asm_test::swap::u64::acquire:
        mov               rax, rdx
        xchg              qword ptr [rcx], rax
        ret

asm_test::swap::u64::relaxed:
        mov               rax, rdx
        xchg              qword ptr [rcx], rax
        ret

asm_test::swap::u64::release:
        mov               rax, rdx
        xchg              qword ptr [rcx], rax
        ret

asm_test::swap::u128::acqrel:
        push              rbx
        mov               rbx, rdx
        mov               r9, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, r8
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        pop               rbx
        ret

asm_test::swap::u128::seqcst:
        push              rbx
        mov               rbx, rdx
        mov               r9, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, r8
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        pop               rbx
        ret

asm_test::swap::u128::acquire:
        push              rbx
        mov               rbx, rdx
        mov               r9, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, r8
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        pop               rbx
        ret

asm_test::swap::u128::relaxed:
        push              rbx
        mov               rbx, rdx
        mov               r9, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, r8
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        pop               rbx
        ret

asm_test::swap::u128::release:
        push              rbx
        mov               rbx, rdx
        mov               r9, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, r8
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        pop               rbx
        ret

asm_test::store::u8::seqcst:
        xchg              byte ptr [rcx], dl
        ret

asm_test::store::u8::relaxed:
        mov               byte ptr [rcx], dl
        ret

asm_test::store::u8::release:
        mov               byte ptr [rcx], dl
        ret

asm_test::store::u16::seqcst:
        xchg              word ptr [rcx], dx
        ret

asm_test::store::u16::relaxed:
        mov               word ptr [rcx], dx
        ret

asm_test::store::u16::release:
        mov               word ptr [rcx], dx
        ret

asm_test::store::u32::seqcst:
        xchg              dword ptr [rcx], edx
        ret

asm_test::store::u32::relaxed:
        mov               dword ptr [rcx], edx
        ret

asm_test::store::u32::release:
        mov               dword ptr [rcx], edx
        ret

asm_test::store::u64::seqcst:
        xchg              qword ptr [rcx], rdx
        ret

asm_test::store::u64::relaxed:
        mov               qword ptr [rcx], rdx
        ret

asm_test::store::u64::release:
        mov               qword ptr [rcx], rdx
        ret

asm_test::store::u128::seqcst:
        push              rbx
        mov               rbx, rdx
        mov               r9, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, r8
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        pop               rbx
        ret

asm_test::store::u128::relaxed:
        push              rbx
        mov               rbx, rdx
        mov               r9, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, r8
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        pop               rbx
        ret

asm_test::store::u128::release:
        push              rbx
        mov               rbx, rdx
        mov               r9, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rcx, r8
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_or::u8::acqrel:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_or::u8::seqcst:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_or::u8::acquire:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_or::u8::relaxed:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_or::u8::release:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_or::u16::acqrel:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_or::u16::seqcst:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_or::u16::acquire:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_or::u16::relaxed:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_or::u16::release:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_or::u32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_or::u32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_or::u32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_or::u32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_or::u32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_or::u64::acqrel:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        or                r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_or::u64::seqcst:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        or                r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_or::u64::acquire:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        or                r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_or::u64::relaxed:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        or                r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_or::u64::release:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        or                r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_or::u128::acqrel:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        or                rbx, r9
        mov               rcx, rdx
        or                rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_or::u128::seqcst:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        or                rbx, r9
        mov               rcx, rdx
        or                rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_or::u128::acquire:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        or                rbx, r9
        mov               rcx, rdx
        or                rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_or::u128::relaxed:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        or                rbx, r9
        mov               rcx, rdx
        or                rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_or::u128::release:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        or                rbx, r9
        mov               rcx, rdx
        or                rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_add::u8::acqrel:
        mov               eax, edx
        lock xadd         byte ptr [rcx], al
        ret

asm_test::fetch_add::u8::seqcst:
        mov               eax, edx
        lock xadd         byte ptr [rcx], al
        ret

asm_test::fetch_add::u8::acquire:
        mov               eax, edx
        lock xadd         byte ptr [rcx], al
        ret

asm_test::fetch_add::u8::relaxed:
        mov               eax, edx
        lock xadd         byte ptr [rcx], al
        ret

asm_test::fetch_add::u8::release:
        mov               eax, edx
        lock xadd         byte ptr [rcx], al
        ret

asm_test::fetch_add::u16::acqrel:
        mov               eax, edx
        lock xadd         word ptr [rcx], ax
        ret

asm_test::fetch_add::u16::seqcst:
        mov               eax, edx
        lock xadd         word ptr [rcx], ax
        ret

asm_test::fetch_add::u16::acquire:
        mov               eax, edx
        lock xadd         word ptr [rcx], ax
        ret

asm_test::fetch_add::u16::relaxed:
        mov               eax, edx
        lock xadd         word ptr [rcx], ax
        ret

asm_test::fetch_add::u16::release:
        mov               eax, edx
        lock xadd         word ptr [rcx], ax
        ret

asm_test::fetch_add::u32::acqrel:
        mov               eax, edx
        lock xadd         dword ptr [rcx], eax
        ret

asm_test::fetch_add::u32::seqcst:
        mov               eax, edx
        lock xadd         dword ptr [rcx], eax
        ret

asm_test::fetch_add::u32::acquire:
        mov               eax, edx
        lock xadd         dword ptr [rcx], eax
        ret

asm_test::fetch_add::u32::relaxed:
        mov               eax, edx
        lock xadd         dword ptr [rcx], eax
        ret

asm_test::fetch_add::u32::release:
        mov               eax, edx
        lock xadd         dword ptr [rcx], eax
        ret

asm_test::fetch_add::u64::acqrel:
        mov               rax, rdx
        lock xadd         qword ptr [rcx], rax
        ret

asm_test::fetch_add::u64::seqcst:
        mov               rax, rdx
        lock xadd         qword ptr [rcx], rax
        ret

asm_test::fetch_add::u64::acquire:
        mov               rax, rdx
        lock xadd         qword ptr [rcx], rax
        ret

asm_test::fetch_add::u64::relaxed:
        mov               rax, rdx
        lock xadd         qword ptr [rcx], rax
        ret

asm_test::fetch_add::u64::release:
        mov               rax, rdx
        lock xadd         qword ptr [rcx], rax
        ret

asm_test::fetch_add::u128::acqrel:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        add               rbx, r9
        mov               rcx, rdx
        adc               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_add::u128::seqcst:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        add               rbx, r9
        mov               rcx, rdx
        adc               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_add::u128::acquire:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        add               rbx, r9
        mov               rcx, rdx
        adc               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_add::u128::relaxed:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        add               rbx, r9
        mov               rcx, rdx
        adc               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_add::u128::release:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        add               rbx, r9
        mov               rcx, rdx
        adc               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_and::u8::acqrel:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_and::u8::seqcst:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_and::u8::acquire:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_and::u8::relaxed:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_and::u8::release:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_and::u16::acqrel:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_and::u16::seqcst:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_and::u16::acquire:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_and::u16::relaxed:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_and::u16::release:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_and::u32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_and::u32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_and::u32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_and::u32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_and::u32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_and::u64::acqrel:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        and               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_and::u64::seqcst:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        and               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_and::u64::acquire:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        and               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_and::u64::relaxed:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        and               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_and::u64::release:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        and               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_and::u128::acqrel:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        and               rbx, r9
        mov               rcx, rdx
        and               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_and::u128::seqcst:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        and               rbx, r9
        mov               rcx, rdx
        and               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_and::u128::acquire:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        and               rbx, r9
        mov               rcx, rdx
        and               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_and::u128::relaxed:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        and               rbx, r9
        mov               rcx, rdx
        and               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_and::u128::release:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        and               rbx, r9
        mov               rcx, rdx
        and               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_max::i8::acqrel:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_max::i8::seqcst:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_max::i8::acquire:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_max::i8::relaxed:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_max::i8::release:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_max::i16::acqrel:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_max::i16::seqcst:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_max::i16::acquire:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_max::i16::relaxed:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_max::i16::release:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_max::i32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_max::i32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_max::i32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_max::i32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_max::i32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovg             r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_max::i64::acqrel:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovg             r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_max::i64::seqcst:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovg             r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_max::i64::acquire:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovg             r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_max::i64::relaxed:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovg             r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_max::i64::release:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovg             r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_max::i128::acqrel:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovl             rcx, rdx
        mov               rbx, r9
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_max::i128::seqcst:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovl             rcx, rdx
        mov               rbx, r9
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_max::i128::acquire:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovl             rcx, rdx
        mov               rbx, r9
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_max::i128::relaxed:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovl             rcx, rdx
        mov               rbx, r9
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_max::i128::release:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovl             rcx, rdx
        mov               rbx, r9
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_min::i8::acqrel:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_min::i8::seqcst:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_min::i8::acquire:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_min::i8::relaxed:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_min::i8::release:
        movzx             eax, byte ptr [rcx]
        movzx             edx, dl
        nop               word ptr cs:[rax + rax]
0:
        cmp               al, dl
        movzx             eax, al
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_min::i16::acqrel:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_min::i16::seqcst:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_min::i16::acquire:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_min::i16::relaxed:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_min::i16::release:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, dx
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_min::i32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_min::i32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_min::i32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_min::i32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_min::i32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, edx
        mov               r8d, edx
        cmovle            r8d, eax
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_min::i64::acqrel:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovle            r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_min::i64::seqcst:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovle            r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_min::i64::acquire:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovle            r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_min::i64::relaxed:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovle            r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_min::i64::release:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rdx
        mov               r8, rdx
        cmovle            r8, rax
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_min::i128::acqrel:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovge            rcx, rdx
        mov               rbx, r9
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_min::i128::seqcst:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovge            rcx, rdx
        mov               rbx, r9
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_min::i128::acquire:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovge            rcx, rdx
        mov               rbx, r9
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_min::i128::relaxed:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovge            rcx, rdx
        mov               rbx, r9
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_min::i128::release:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        cmp               r9, rax
        mov               rcx, r8
        sbb               rcx, rdx
        mov               rcx, r8
        cmovge            rcx, rdx
        mov               rbx, r9
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_neg::u8::acqrel:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_neg::u8::seqcst:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_neg::u8::acquire:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_neg::u8::relaxed:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_neg::u8::release:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_neg::u16::acqrel:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_neg::u16::seqcst:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_neg::u16::acquire:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_neg::u16::relaxed:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_neg::u16::release:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_neg::u32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_neg::u32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_neg::u32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_neg::u32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_neg::u32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_neg::u64::acqrel:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        neg               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_neg::u64::seqcst:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        neg               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_neg::u64::acquire:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        neg               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_neg::u64::relaxed:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        neg               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_neg::u64::release:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        neg               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_neg::u128::acqrel:
        push              rbx
        mov               r8, rcx
        xor               eax, eax
        xor               edx, edx
        xor               ecx, ecx
        xor               ebx, ebx
        lock cmpxchg16b   xmmword ptr [r8]
        nop               word ptr cs:[rax + rax]
0:
        mov               rbx, rax
        neg               rbx
        mov               ecx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r8]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_neg::u128::seqcst:
        push              rbx
        mov               r8, rcx
        xor               eax, eax
        xor               edx, edx
        xor               ecx, ecx
        xor               ebx, ebx
        lock cmpxchg16b   xmmword ptr [r8]
        nop               word ptr cs:[rax + rax]
0:
        mov               rbx, rax
        neg               rbx
        mov               ecx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r8]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_neg::u128::acquire:
        push              rbx
        mov               r8, rcx
        xor               eax, eax
        xor               edx, edx
        xor               ecx, ecx
        xor               ebx, ebx
        lock cmpxchg16b   xmmword ptr [r8]
        nop               word ptr cs:[rax + rax]
0:
        mov               rbx, rax
        neg               rbx
        mov               ecx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r8]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_neg::u128::relaxed:
        push              rbx
        mov               r8, rcx
        xor               eax, eax
        xor               edx, edx
        xor               ecx, ecx
        xor               ebx, ebx
        lock cmpxchg16b   xmmword ptr [r8]
        nop               word ptr cs:[rax + rax]
0:
        mov               rbx, rax
        neg               rbx
        mov               ecx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r8]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_neg::u128::release:
        push              rbx
        mov               r8, rcx
        xor               eax, eax
        xor               edx, edx
        xor               ecx, ecx
        xor               ebx, ebx
        lock cmpxchg16b   xmmword ptr [r8]
        nop               word ptr cs:[rax + rax]
0:
        mov               rbx, rax
        neg               rbx
        mov               ecx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r8]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_not::u8::acqrel:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_not::u8::seqcst:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_not::u8::acquire:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_not::u8::relaxed:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_not::u8::release:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_not::u16::acqrel:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_not::u16::seqcst:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_not::u16::acquire:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_not::u16::relaxed:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_not::u16::release:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_not::u32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_not::u32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_not::u32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_not::u32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_not::u32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_not::u64::acqrel:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        not               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_not::u64::seqcst:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        not               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_not::u64::acquire:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        not               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_not::u64::relaxed:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        not               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_not::u64::release:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        not               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_not::u128::acqrel:
        push              rbx
        mov               r8, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop               dword ptr [rax + rax]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r8]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_not::u128::seqcst:
        push              rbx
        mov               r8, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop               dword ptr [rax + rax]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r8]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_not::u128::acquire:
        push              rbx
        mov               r8, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop               dword ptr [rax + rax]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r8]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_not::u128::relaxed:
        push              rbx
        mov               r8, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop               dword ptr [rax + rax]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r8]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_not::u128::release:
        push              rbx
        mov               r8, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop               dword ptr [rax + rax]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r8]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_sub::u8::acqrel:
        mov               eax, edx
        neg               al
        lock xadd         byte ptr [rcx], al
        ret

asm_test::fetch_sub::u8::seqcst:
        mov               eax, edx
        neg               al
        lock xadd         byte ptr [rcx], al
        ret

asm_test::fetch_sub::u8::acquire:
        mov               eax, edx
        neg               al
        lock xadd         byte ptr [rcx], al
        ret

asm_test::fetch_sub::u8::relaxed:
        mov               eax, edx
        neg               al
        lock xadd         byte ptr [rcx], al
        ret

asm_test::fetch_sub::u8::release:
        mov               eax, edx
        neg               al
        lock xadd         byte ptr [rcx], al
        ret

asm_test::fetch_sub::u16::acqrel:
        mov               eax, edx
        neg               eax
        lock xadd         word ptr [rcx], ax
        ret

asm_test::fetch_sub::u16::seqcst:
        mov               eax, edx
        neg               eax
        lock xadd         word ptr [rcx], ax
        ret

asm_test::fetch_sub::u16::acquire:
        mov               eax, edx
        neg               eax
        lock xadd         word ptr [rcx], ax
        ret

asm_test::fetch_sub::u16::relaxed:
        mov               eax, edx
        neg               eax
        lock xadd         word ptr [rcx], ax
        ret

asm_test::fetch_sub::u16::release:
        mov               eax, edx
        neg               eax
        lock xadd         word ptr [rcx], ax
        ret

asm_test::fetch_sub::u32::acqrel:
        mov               eax, edx
        neg               eax
        lock xadd         dword ptr [rcx], eax
        ret

asm_test::fetch_sub::u32::seqcst:
        mov               eax, edx
        neg               eax
        lock xadd         dword ptr [rcx], eax
        ret

asm_test::fetch_sub::u32::acquire:
        mov               eax, edx
        neg               eax
        lock xadd         dword ptr [rcx], eax
        ret

asm_test::fetch_sub::u32::relaxed:
        mov               eax, edx
        neg               eax
        lock xadd         dword ptr [rcx], eax
        ret

asm_test::fetch_sub::u32::release:
        mov               eax, edx
        neg               eax
        lock xadd         dword ptr [rcx], eax
        ret

asm_test::fetch_sub::u64::acqrel:
        mov               rax, rdx
        neg               rax
        lock xadd         qword ptr [rcx], rax
        ret

asm_test::fetch_sub::u64::seqcst:
        mov               rax, rdx
        neg               rax
        lock xadd         qword ptr [rcx], rax
        ret

asm_test::fetch_sub::u64::acquire:
        mov               rax, rdx
        neg               rax
        lock xadd         qword ptr [rcx], rax
        ret

asm_test::fetch_sub::u64::relaxed:
        mov               rax, rdx
        neg               rax
        lock xadd         qword ptr [rcx], rax
        ret

asm_test::fetch_sub::u64::release:
        mov               rax, rdx
        neg               rax
        lock xadd         qword ptr [rcx], rax
        ret

asm_test::fetch_sub::u128::acqrel:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        sub               rbx, r9
        mov               rcx, rdx
        sbb               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_sub::u128::seqcst:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        sub               rbx, r9
        mov               rcx, rdx
        sbb               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_sub::u128::acquire:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        sub               rbx, r9
        mov               rcx, rdx
        sbb               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_sub::u128::relaxed:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        sub               rbx, r9
        mov               rcx, rdx
        sbb               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_sub::u128::release:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        sub               rbx, r9
        mov               rcx, rdx
        sbb               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_xor::u8::acqrel:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_xor::u8::seqcst:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_xor::u8::acquire:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_xor::u8::relaxed:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_xor::u8::release:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        ret

asm_test::fetch_xor::u16::acqrel:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_xor::u16::seqcst:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_xor::u16::acquire:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_xor::u16::relaxed:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_xor::u16::release:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8d, edx
        lock cmpxchg      word ptr [rcx], r8w
        jne               0b
        ret

asm_test::fetch_xor::u32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_xor::u32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_xor::u32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_xor::u32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_xor::u32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8d, edx
        lock cmpxchg      dword ptr [rcx], r8d
        jne               0b
        ret

asm_test::fetch_xor::u64::acqrel:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        xor               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_xor::u64::seqcst:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        xor               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_xor::u64::acquire:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        xor               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_xor::u64::relaxed:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        xor               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_xor::u64::release:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8, rax
        xor               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        ret

asm_test::fetch_xor::u128::acqrel:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        xor               rbx, r9
        mov               rcx, rdx
        xor               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_xor::u128::seqcst:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        xor               rbx, r9
        mov               rcx, rdx
        xor               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_xor::u128::acquire:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        xor               rbx, r9
        mov               rcx, rdx
        xor               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_xor::u128::relaxed:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        xor               rbx, r9
        mov               rcx, rdx
        xor               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret

asm_test::fetch_xor::u128::release:
        push              rbx
        mov               r9, rdx
        mov               r10, rcx
        mov               rax, qword ptr [rcx]
        mov               rdx, qword ptr [rcx + 0x8]
        nop
0:
        mov               rbx, rax
        xor               rbx, r9
        mov               rcx, rdx
        xor               rcx, r8
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        pop               rbx
        ret


asm_test::fetch_nand::u8::acqrel:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::seqcst:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::acquire:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::relaxed:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::release:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u16::acqrel:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::seqcst:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::acquire:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::relaxed:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::release:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u64::acqrel:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        and               rcx, rsi
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::seqcst:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        and               rcx, rsi
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::acquire:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        and               rcx, rsi
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::relaxed:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        and               rcx, rsi
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::release:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        and               rcx, rsi
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::bool::acqrel:
        test              esi, esi
        je                1f
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax + rax]
0:
        mov               ecx, eax
        xor               cl, 0x1
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::seqcst:
        test              esi, esi
        je                1f
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax + rax]
0:
        mov               ecx, eax
        xor               cl, 0x1
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::acquire:
        test              esi, esi
        je                1f
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax + rax]
0:
        mov               ecx, eax
        xor               cl, 0x1
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::relaxed:
        test              esi, esi
        je                1f
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax + rax]
0:
        mov               ecx, eax
        xor               cl, 0x1
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::release:
        test              esi, esi
        je                1f
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax + rax]
0:
        mov               ecx, eax
        xor               cl, 0x1
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::u128::acqrel:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_nand::u128::seqcst:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_nand::u128::acquire:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_nand::u128::relaxed:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_nand::u128::release:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_umax::u8::acqrel:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmova             edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_umax::u8::seqcst:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmova             edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_umax::u8::acquire:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmova             edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_umax::u8::relaxed:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmova             edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_umax::u8::release:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmova             edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_umax::u16::acqrel:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmova             ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_umax::u16::seqcst:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmova             ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_umax::u16::acquire:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmova             ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_umax::u16::relaxed:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmova             ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_umax::u16::release:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmova             ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_umax::u32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmova             ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_umax::u32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmova             ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_umax::u32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmova             ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_umax::u32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmova             ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_umax::u32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmova             ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_umax::u64::acqrel:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmova             rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_umax::u64::seqcst:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmova             rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_umax::u64::acquire:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmova             rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_umax::u64::relaxed:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmova             rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_umax::u64::release:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmova             rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_umax::u128::acqrel:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovb             rcx, rdx
        mov               rbx, r8
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_umax::u128::seqcst:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovb             rcx, rdx
        mov               rbx, r8
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_umax::u128::acquire:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovb             rcx, rdx
        mov               rbx, r8
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_umax::u128::relaxed:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovb             rcx, rdx
        mov               rbx, r8
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_umax::u128::release:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovb             rcx, rdx
        mov               rbx, r8
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_umin::u8::acqrel:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovbe            edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_umin::u8::seqcst:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovbe            edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_umin::u8::acquire:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovbe            edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_umin::u8::relaxed:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovbe            edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_umin::u8::release:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovbe            edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_umin::u16::acqrel:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovbe            ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_umin::u16::seqcst:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovbe            ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_umin::u16::acquire:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovbe            ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_umin::u16::relaxed:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovbe            ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_umin::u16::release:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovbe            ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_umin::u32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovbe            ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_umin::u32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovbe            ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_umin::u32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovbe            ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_umin::u32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovbe            ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_umin::u32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovbe            ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_umin::u64::acqrel:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovbe            rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_umin::u64::seqcst:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovbe            rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_umin::u64::acquire:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovbe            rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_umin::u64::relaxed:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovbe            rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_umin::u64::release:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovbe            rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_umin::u128::acqrel:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovae            rcx, rdx
        mov               rbx, r8
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_umin::u128::seqcst:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovae            rcx, rdx
        mov               rbx, r8
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_umin::u128::acquire:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovae            rcx, rdx
        mov               rbx, r8
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_umin::u128::relaxed:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovae            rcx, rdx
        mov               rbx, r8
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_umin::u128::release:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovae            rcx, rdx
        mov               rbx, r8
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::release_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::release_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::release_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::release_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::release_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u16::release_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::release_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::acquire_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::release_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u32::release_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u64::acqrel_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::seqcst_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::acqrel_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::acqrel_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::acquire_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::relaxed_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::release_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::seqcst_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::seqcst_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::acquire_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::acquire_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::relaxed_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::relaxed_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::release_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::u64::release_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::bool::acqrel_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u128::acqrel_seqcst:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::seqcst_seqcst:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::acqrel_acquire:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::acqrel_relaxed:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::acquire_seqcst:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::relaxed_seqcst:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::release_seqcst:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::seqcst_acquire:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::seqcst_relaxed:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::acquire_acquire:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::acquire_relaxed:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::relaxed_acquire:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::relaxed_relaxed:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::release_acquire:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange::u128::release_relaxed:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      word ptr [edi], dx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        mov               eax, esi
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        mov               edx, eax
        setne             cl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::release_seqcst:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::acquire_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::release_acquire:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u64::release_relaxed:
        mov               rax, rdx
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u128::acqrel_seqcst:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::seqcst_seqcst:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::acqrel_acquire:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::acqrel_relaxed:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::acquire_seqcst:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::relaxed_seqcst:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::release_seqcst:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::seqcst_acquire:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::seqcst_relaxed:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::acquire_acquire:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::acquire_relaxed:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::relaxed_acquire:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::relaxed_relaxed:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::release_acquire:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::u128::release_relaxed:
        mov               r10, rcx
        mov               rax, rdx
        mov               rcx, r9
        mov               rdx, r10
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [esi]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [edi + 0x18], rdx
        mov               qword ptr [edi + 0x10], rax
        mov               qword ptr [edi], rcx
        mov               qword ptr [edi + 0x8], 0x0
        mov               eax, edi
        ret

asm_test::or::u8::acqrel:
        lock or           byte ptr [edi], sil
        ret

asm_test::or::u8::seqcst:
        lock or           byte ptr [edi], sil
        ret

asm_test::or::u8::acquire:
        lock or           byte ptr [edi], sil
        ret

asm_test::or::u8::relaxed:
        lock or           byte ptr [edi], sil
        ret

asm_test::or::u8::release:
        lock or           byte ptr [edi], sil
        ret

asm_test::or::u16::acqrel:
        lock or           word ptr [edi], si
        ret

asm_test::or::u16::seqcst:
        lock or           word ptr [edi], si
        ret

asm_test::or::u16::acquire:
        lock or           word ptr [edi], si
        ret

asm_test::or::u16::relaxed:
        lock or           word ptr [edi], si
        ret

asm_test::or::u16::release:
        lock or           word ptr [edi], si
        ret

asm_test::or::u32::acqrel:
        lock or           dword ptr [edi], esi
        ret

asm_test::or::u32::seqcst:
        lock or           dword ptr [edi], esi
        ret

asm_test::or::u32::acquire:
        lock or           dword ptr [edi], esi
        ret

asm_test::or::u32::relaxed:
        lock or           dword ptr [edi], esi
        ret

asm_test::or::u32::release:
        lock or           dword ptr [edi], esi
        ret

asm_test::or::u64::acqrel:
        lock or           qword ptr [edi], rsi
        ret

asm_test::or::u64::seqcst:
        lock or           qword ptr [edi], rsi
        ret

asm_test::or::u64::acquire:
        lock or           qword ptr [edi], rsi
        ret

asm_test::or::u64::relaxed:
        lock or           qword ptr [edi], rsi
        ret

asm_test::or::u64::release:
        lock or           qword ptr [edi], rsi
        ret

asm_test::or::u128::acqrel:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::or::u128::seqcst:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::or::u128::acquire:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::or::u128::relaxed:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::or::u128::release:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::add::u8::acqrel:
        lock add          byte ptr [edi], sil
        ret

asm_test::add::u8::seqcst:
        lock add          byte ptr [edi], sil
        ret

asm_test::add::u8::acquire:
        lock add          byte ptr [edi], sil
        ret

asm_test::add::u8::relaxed:
        lock add          byte ptr [edi], sil
        ret

asm_test::add::u8::release:
        lock add          byte ptr [edi], sil
        ret

asm_test::add::u16::acqrel:
        lock add          word ptr [edi], si
        ret

asm_test::add::u16::seqcst:
        lock add          word ptr [edi], si
        ret

asm_test::add::u16::acquire:
        lock add          word ptr [edi], si
        ret

asm_test::add::u16::relaxed:
        lock add          word ptr [edi], si
        ret

asm_test::add::u16::release:
        lock add          word ptr [edi], si
        ret

asm_test::add::u32::acqrel:
        lock add          dword ptr [edi], esi
        ret

asm_test::add::u32::seqcst:
        lock add          dword ptr [edi], esi
        ret

asm_test::add::u32::acquire:
        lock add          dword ptr [edi], esi
        ret

asm_test::add::u32::relaxed:
        lock add          dword ptr [edi], esi
        ret

asm_test::add::u32::release:
        lock add          dword ptr [edi], esi
        ret

asm_test::add::u64::acqrel:
        lock add          qword ptr [edi], rsi
        ret

asm_test::add::u64::seqcst:
        lock add          qword ptr [edi], rsi
        ret

asm_test::add::u64::acquire:
        lock add          qword ptr [edi], rsi
        ret

asm_test::add::u64::relaxed:
        lock add          qword ptr [edi], rsi
        ret

asm_test::add::u64::release:
        lock add          qword ptr [edi], rsi
        ret

asm_test::add::u128::acqrel:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::add::u128::seqcst:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::add::u128::acquire:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::add::u128::relaxed:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::add::u128::release:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::and::u8::acqrel:
        lock and          byte ptr [edi], sil
        ret

asm_test::and::u8::seqcst:
        lock and          byte ptr [edi], sil
        ret

asm_test::and::u8::acquire:
        lock and          byte ptr [edi], sil
        ret

asm_test::and::u8::relaxed:
        lock and          byte ptr [edi], sil
        ret

asm_test::and::u8::release:
        lock and          byte ptr [edi], sil
        ret

asm_test::and::u16::acqrel:
        lock and          word ptr [edi], si
        ret

asm_test::and::u16::seqcst:
        lock and          word ptr [edi], si
        ret

asm_test::and::u16::acquire:
        lock and          word ptr [edi], si
        ret

asm_test::and::u16::relaxed:
        lock and          word ptr [edi], si
        ret

asm_test::and::u16::release:
        lock and          word ptr [edi], si
        ret

asm_test::and::u32::acqrel:
        lock and          dword ptr [edi], esi
        ret

asm_test::and::u32::seqcst:
        lock and          dword ptr [edi], esi
        ret

asm_test::and::u32::acquire:
        lock and          dword ptr [edi], esi
        ret

asm_test::and::u32::relaxed:
        lock and          dword ptr [edi], esi
        ret

asm_test::and::u32::release:
        lock and          dword ptr [edi], esi
        ret

asm_test::and::u64::acqrel:
        lock and          qword ptr [edi], rsi
        ret

asm_test::and::u64::seqcst:
        lock and          qword ptr [edi], rsi
        ret

asm_test::and::u64::acquire:
        lock and          qword ptr [edi], rsi
        ret

asm_test::and::u64::relaxed:
        lock and          qword ptr [edi], rsi
        ret

asm_test::and::u64::release:
        lock and          qword ptr [edi], rsi
        ret

asm_test::and::u128::acqrel:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::and::u128::seqcst:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::and::u128::acquire:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::and::u128::relaxed:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::and::u128::release:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::neg::u8::acqrel:
        lock neg          byte ptr [edi]
        ret

asm_test::neg::u8::seqcst:
        lock neg          byte ptr [edi]
        ret

asm_test::neg::u8::acquire:
        lock neg          byte ptr [edi]
        ret

asm_test::neg::u8::relaxed:
        lock neg          byte ptr [edi]
        ret

asm_test::neg::u8::release:
        lock neg          byte ptr [edi]
        ret

asm_test::neg::u16::acqrel:
        lock neg          word ptr [edi]
        ret

asm_test::neg::u16::seqcst:
        lock neg          word ptr [edi]
        ret

asm_test::neg::u16::acquire:
        lock neg          word ptr [edi]
        ret

asm_test::neg::u16::relaxed:
        lock neg          word ptr [edi]
        ret

asm_test::neg::u16::release:
        lock neg          word ptr [edi]
        ret

asm_test::neg::u32::acqrel:
        lock neg          dword ptr [edi]
        ret

asm_test::neg::u32::seqcst:
        lock neg          dword ptr [edi]
        ret

asm_test::neg::u32::acquire:
        lock neg          dword ptr [edi]
        ret

asm_test::neg::u32::relaxed:
        lock neg          dword ptr [edi]
        ret

asm_test::neg::u32::release:
        lock neg          dword ptr [edi]
        ret

asm_test::neg::u64::acqrel:
        lock neg          qword ptr [edi]
        ret

asm_test::neg::u64::seqcst:
        lock neg          qword ptr [edi]
        ret

asm_test::neg::u64::acquire:
        lock neg          qword ptr [edi]
        ret

asm_test::neg::u64::relaxed:
        lock neg          qword ptr [edi]
        ret

asm_test::neg::u64::release:
        lock neg          qword ptr [edi]
        ret

asm_test::neg::u128::acqrel:
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        ret

asm_test::neg::u128::seqcst:
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        ret

asm_test::neg::u128::acquire:
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        ret

asm_test::neg::u128::relaxed:
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        ret

asm_test::neg::u128::release:
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        ret

asm_test::not::u8::acqrel:
        lock not          byte ptr [edi]
        ret

asm_test::not::u8::seqcst:
        lock not          byte ptr [edi]
        ret

asm_test::not::u8::acquire:
        lock not          byte ptr [edi]
        ret

asm_test::not::u8::relaxed:
        lock not          byte ptr [edi]
        ret

asm_test::not::u8::release:
        lock not          byte ptr [edi]
        ret

asm_test::not::u16::acqrel:
        lock not          word ptr [edi]
        ret

asm_test::not::u16::seqcst:
        lock not          word ptr [edi]
        ret

asm_test::not::u16::acquire:
        lock not          word ptr [edi]
        ret

asm_test::not::u16::relaxed:
        lock not          word ptr [edi]
        ret

asm_test::not::u16::release:
        lock not          word ptr [edi]
        ret

asm_test::not::u32::acqrel:
        lock not          dword ptr [edi]
        ret

asm_test::not::u32::seqcst:
        lock not          dword ptr [edi]
        ret

asm_test::not::u32::acquire:
        lock not          dword ptr [edi]
        ret

asm_test::not::u32::relaxed:
        lock not          dword ptr [edi]
        ret

asm_test::not::u32::release:
        lock not          dword ptr [edi]
        ret

asm_test::not::u64::acqrel:
        lock not          qword ptr [edi]
        ret

asm_test::not::u64::seqcst:
        lock not          qword ptr [edi]
        ret

asm_test::not::u64::acquire:
        lock not          qword ptr [edi]
        ret

asm_test::not::u64::relaxed:
        lock not          qword ptr [edi]
        ret

asm_test::not::u64::release:
        lock not          qword ptr [edi]
        ret

asm_test::not::u128::acqrel:
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        ret

asm_test::not::u128::seqcst:
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        ret

asm_test::not::u128::acquire:
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        ret

asm_test::not::u128::relaxed:
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        ret

asm_test::not::u128::release:
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        ret

asm_test::sub::u8::acqrel:
        lock sub          byte ptr [edi], sil
        ret

asm_test::sub::u8::seqcst:
        lock sub          byte ptr [edi], sil
        ret

asm_test::sub::u8::acquire:
        lock sub          byte ptr [edi], sil
        ret

asm_test::sub::u8::relaxed:
        lock sub          byte ptr [edi], sil
        ret

asm_test::sub::u8::release:
        lock sub          byte ptr [edi], sil
        ret

asm_test::sub::u16::acqrel:
        lock sub          word ptr [edi], si
        ret

asm_test::sub::u16::seqcst:
        lock sub          word ptr [edi], si
        ret

asm_test::sub::u16::acquire:
        lock sub          word ptr [edi], si
        ret

asm_test::sub::u16::relaxed:
        lock sub          word ptr [edi], si
        ret

asm_test::sub::u16::release:
        lock sub          word ptr [edi], si
        ret

asm_test::sub::u32::acqrel:
        lock sub          dword ptr [edi], esi
        ret

asm_test::sub::u32::seqcst:
        lock sub          dword ptr [edi], esi
        ret

asm_test::sub::u32::acquire:
        lock sub          dword ptr [edi], esi
        ret

asm_test::sub::u32::relaxed:
        lock sub          dword ptr [edi], esi
        ret

asm_test::sub::u32::release:
        lock sub          dword ptr [edi], esi
        ret

asm_test::sub::u64::acqrel:
        lock sub          qword ptr [edi], rsi
        ret

asm_test::sub::u64::seqcst:
        lock sub          qword ptr [edi], rsi
        ret

asm_test::sub::u64::acquire:
        lock sub          qword ptr [edi], rsi
        ret

asm_test::sub::u64::relaxed:
        lock sub          qword ptr [edi], rsi
        ret

asm_test::sub::u64::release:
        lock sub          qword ptr [edi], rsi
        ret

asm_test::sub::u128::acqrel:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::sub::u128::seqcst:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::sub::u128::acquire:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::sub::u128::relaxed:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::sub::u128::release:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::xor::u8::acqrel:
        lock xor          byte ptr [edi], sil
        ret

asm_test::xor::u8::seqcst:
        lock xor          byte ptr [edi], sil
        ret

asm_test::xor::u8::acquire:
        lock xor          byte ptr [edi], sil
        ret

asm_test::xor::u8::relaxed:
        lock xor          byte ptr [edi], sil
        ret

asm_test::xor::u8::release:
        lock xor          byte ptr [edi], sil
        ret

asm_test::xor::u16::acqrel:
        lock xor          word ptr [edi], si
        ret

asm_test::xor::u16::seqcst:
        lock xor          word ptr [edi], si
        ret

asm_test::xor::u16::acquire:
        lock xor          word ptr [edi], si
        ret

asm_test::xor::u16::relaxed:
        lock xor          word ptr [edi], si
        ret

asm_test::xor::u16::release:
        lock xor          word ptr [edi], si
        ret

asm_test::xor::u32::acqrel:
        lock xor          dword ptr [edi], esi
        ret

asm_test::xor::u32::seqcst:
        lock xor          dword ptr [edi], esi
        ret

asm_test::xor::u32::acquire:
        lock xor          dword ptr [edi], esi
        ret

asm_test::xor::u32::relaxed:
        lock xor          dword ptr [edi], esi
        ret

asm_test::xor::u32::release:
        lock xor          dword ptr [edi], esi
        ret

asm_test::xor::u64::acqrel:
        lock xor          qword ptr [edi], rsi
        ret

asm_test::xor::u64::seqcst:
        lock xor          qword ptr [edi], rsi
        ret

asm_test::xor::u64::acquire:
        lock xor          qword ptr [edi], rsi
        ret

asm_test::xor::u64::relaxed:
        lock xor          qword ptr [edi], rsi
        ret

asm_test::xor::u64::release:
        lock xor          qword ptr [edi], rsi
        ret

asm_test::xor::u128::acqrel:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::xor::u128::seqcst:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::xor::u128::acquire:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::xor::u128::relaxed:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::xor::u128::release:
        mov               r8, rsi
        mov               r9, rdx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        ret

asm_test::load::u8::seqcst:
        movzx             eax, byte ptr [edi]
        ret

asm_test::load::u8::acquire:
        movzx             eax, byte ptr [edi]
        ret

asm_test::load::u8::relaxed:
        movzx             eax, byte ptr [edi]
        ret

asm_test::load::u16::seqcst:
        movzx             eax, word ptr [edi]
        ret

asm_test::load::u16::acquire:
        movzx             eax, word ptr [edi]
        ret

asm_test::load::u16::relaxed:
        movzx             eax, word ptr [edi]
        ret

asm_test::load::u32::seqcst:
        mov               eax, dword ptr [edi]
        ret

asm_test::load::u32::acquire:
        mov               eax, dword ptr [edi]
        ret

asm_test::load::u32::relaxed:
        mov               eax, dword ptr [edi]
        ret

asm_test::load::u64::seqcst:
        mov               rax, qword ptr [edi]
        ret

asm_test::load::u64::acquire:
        mov               rax, qword ptr [edi]
        ret

asm_test::load::u64::relaxed:
        mov               rax, qword ptr [edi]
        ret

asm_test::load::bool::seqcst:
        movzx             eax, byte ptr [edi]
        test              al, al
        setne             al
        ret

asm_test::load::bool::acquire:
        movzx             eax, byte ptr [edi]
        test              al, al
        setne             al
        ret

asm_test::load::bool::relaxed:
        movzx             eax, byte ptr [edi]
        test              al, al
        setne             al
        ret

asm_test::load::u128::seqcst:
        mov               rax, rdi
        vmovdqa           xmm0, xmmword ptr [esi]
        vmovaps           xmmword ptr [eax], xmm0
        ret

asm_test::load::u128::acquire:
        mov               rax, rdi
        vmovdqa           xmm0, xmmword ptr [esi]
        vmovaps           xmmword ptr [eax], xmm0
        ret

asm_test::load::u128::relaxed:
        mov               rax, rdi
        vmovdqa           xmm0, xmmword ptr [esi]
        vmovaps           xmmword ptr [eax], xmm0
        ret

asm_test::swap::u8::acqrel:
        mov               eax, esi
        xchg              byte ptr [edi], al
        ret

asm_test::swap::u8::seqcst:
        mov               eax, esi
        xchg              byte ptr [edi], al
        ret

asm_test::swap::u8::acquire:
        mov               eax, esi
        xchg              byte ptr [edi], al
        ret

asm_test::swap::u8::relaxed:
        mov               eax, esi
        xchg              byte ptr [edi], al
        ret

asm_test::swap::u8::release:
        mov               eax, esi
        xchg              byte ptr [edi], al
        ret

asm_test::swap::u16::acqrel:
        mov               eax, esi
        xchg              word ptr [edi], ax
        ret

asm_test::swap::u16::seqcst:
        mov               eax, esi
        xchg              word ptr [edi], ax
        ret

asm_test::swap::u16::acquire:
        mov               eax, esi
        xchg              word ptr [edi], ax
        ret

asm_test::swap::u16::relaxed:
        mov               eax, esi
        xchg              word ptr [edi], ax
        ret

asm_test::swap::u16::release:
        mov               eax, esi
        xchg              word ptr [edi], ax
        ret

asm_test::swap::u32::acqrel:
        mov               eax, esi
        xchg              dword ptr [edi], eax
        ret

asm_test::swap::u32::seqcst:
        mov               eax, esi
        xchg              dword ptr [edi], eax
        ret

asm_test::swap::u32::acquire:
        mov               eax, esi
        xchg              dword ptr [edi], eax
        ret

asm_test::swap::u32::relaxed:
        mov               eax, esi
        xchg              dword ptr [edi], eax
        ret

asm_test::swap::u32::release:
        mov               eax, esi
        xchg              dword ptr [edi], eax
        ret

asm_test::swap::u64::acqrel:
        mov               rax, rsi
        xchg              qword ptr [edi], rax
        ret

asm_test::swap::u64::seqcst:
        mov               rax, rsi
        xchg              qword ptr [edi], rax
        ret

asm_test::swap::u64::acquire:
        mov               rax, rsi
        xchg              qword ptr [edi], rax
        ret

asm_test::swap::u64::relaxed:
        mov               rax, rsi
        xchg              qword ptr [edi], rax
        ret

asm_test::swap::u64::release:
        mov               rax, rsi
        xchg              qword ptr [edi], rax
        ret

asm_test::swap::bool::acqrel:
        xchg              byte ptr [edi], sil
        test              sil, sil
        setne             al
        ret

asm_test::swap::bool::seqcst:
        xchg              byte ptr [edi], sil
        test              sil, sil
        setne             al
        ret

asm_test::swap::bool::acquire:
        xchg              byte ptr [edi], sil
        test              sil, sil
        setne             al
        ret

asm_test::swap::bool::relaxed:
        xchg              byte ptr [edi], sil
        test              sil, sil
        setne             al
        ret

asm_test::swap::bool::release:
        xchg              byte ptr [edi], sil
        test              sil, sil
        setne             al
        ret

asm_test::swap::u128::acqrel:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rdx
        xchg              rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::swap::u128::seqcst:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rdx
        xchg              rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::swap::u128::acquire:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rdx
        xchg              rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::swap::u128::relaxed:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rdx
        xchg              rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::swap::u128::release:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rdx
        xchg              rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::store::u8::seqcst:
        xchg              byte ptr [edi], sil
        ret

asm_test::store::u8::relaxed:
        mov               byte ptr [edi], sil
        ret

asm_test::store::u8::release:
        mov               byte ptr [edi], sil
        ret

asm_test::store::u16::seqcst:
        xchg              word ptr [edi], si
        ret

asm_test::store::u16::relaxed:
        mov               word ptr [edi], si
        ret

asm_test::store::u16::release:
        mov               word ptr [edi], si
        ret

asm_test::store::u32::seqcst:
        xchg              dword ptr [edi], esi
        ret

asm_test::store::u32::relaxed:
        mov               dword ptr [edi], esi
        ret

asm_test::store::u32::release:
        mov               dword ptr [edi], esi
        ret

asm_test::store::u64::seqcst:
        xchg              qword ptr [edi], rsi
        ret

asm_test::store::u64::relaxed:
        mov               qword ptr [edi], rsi
        ret

asm_test::store::u64::release:
        mov               qword ptr [edi], rsi
        ret

asm_test::store::bool::seqcst:
        xchg              byte ptr [edi], sil
        ret

asm_test::store::bool::relaxed:
        mov               byte ptr [edi], sil
        ret

asm_test::store::bool::release:
        mov               byte ptr [edi], sil
        ret

asm_test::store::u128::seqcst:
        vmovq             xmm0, rdx
        vmovq             xmm1, rsi
        vpunpcklqdq       xmm0, xmm1, xmm0 # xmm0 = xmm1[0],xmm0[0]
        lea               eax, [rsp - 0x8]
        vmovdqa           xmmword ptr [edi], xmm0
        xchg              qword ptr [eax], rcx
        ret

asm_test::store::u128::relaxed:
        vmovq             xmm0, rdx
        vmovq             xmm1, rsi
        vpunpcklqdq       xmm0, xmm1, xmm0 # xmm0 = xmm1[0],xmm0[0]
        vmovdqa           xmmword ptr [edi], xmm0
        ret

asm_test::store::u128::release:
        vmovq             xmm0, rdx
        vmovq             xmm1, rsi
        vpunpcklqdq       xmm0, xmm1, xmm0 # xmm0 = xmm1[0],xmm0[0]
        vmovdqa           xmmword ptr [edi], xmm0
        ret

asm_test::fetch_or::u8::acqrel:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_or::u8::seqcst:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_or::u8::acquire:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_or::u8::relaxed:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_or::u8::release:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_or::u16::acqrel:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_or::u16::seqcst:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_or::u16::acquire:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_or::u16::relaxed:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_or::u16::release:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_or::u32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_or::u32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_or::u32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_or::u32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_or::u32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_or::u64::acqrel:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        or                rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_or::u64::seqcst:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        or                rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_or::u64::acquire:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        or                rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_or::u64::relaxed:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        or                rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_or::u64::release:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        or                rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_or::bool::acqrel:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::seqcst:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::acquire:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::relaxed:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::release:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::u128::acqrel:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_or::u128::seqcst:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_or::u128::acquire:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_or::u128::relaxed:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_or::u128::release:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_add::u8::acqrel:
        mov               eax, esi
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_add::u8::seqcst:
        mov               eax, esi
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_add::u8::acquire:
        mov               eax, esi
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_add::u8::relaxed:
        mov               eax, esi
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_add::u8::release:
        mov               eax, esi
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_add::u16::acqrel:
        mov               eax, esi
        lock xadd         word ptr [edi], ax
        ret

asm_test::fetch_add::u16::seqcst:
        mov               eax, esi
        lock xadd         word ptr [edi], ax
        ret

asm_test::fetch_add::u16::acquire:
        mov               eax, esi
        lock xadd         word ptr [edi], ax
        ret

asm_test::fetch_add::u16::relaxed:
        mov               eax, esi
        lock xadd         word ptr [edi], ax
        ret

asm_test::fetch_add::u16::release:
        mov               eax, esi
        lock xadd         word ptr [edi], ax
        ret

asm_test::fetch_add::u32::acqrel:
        mov               eax, esi
        lock xadd         dword ptr [edi], eax
        ret

asm_test::fetch_add::u32::seqcst:
        mov               eax, esi
        lock xadd         dword ptr [edi], eax
        ret

asm_test::fetch_add::u32::acquire:
        mov               eax, esi
        lock xadd         dword ptr [edi], eax
        ret

asm_test::fetch_add::u32::relaxed:
        mov               eax, esi
        lock xadd         dword ptr [edi], eax
        ret

asm_test::fetch_add::u32::release:
        mov               eax, esi
        lock xadd         dword ptr [edi], eax
        ret

asm_test::fetch_add::u64::acqrel:
        mov               rax, rsi
        lock xadd         qword ptr [edi], rax
        ret

asm_test::fetch_add::u64::seqcst:
        mov               rax, rsi
        lock xadd         qword ptr [edi], rax
        ret

asm_test::fetch_add::u64::acquire:
        mov               rax, rsi
        lock xadd         qword ptr [edi], rax
        ret

asm_test::fetch_add::u64::relaxed:
        mov               rax, rsi
        lock xadd         qword ptr [edi], rax
        ret

asm_test::fetch_add::u64::release:
        mov               rax, rsi
        lock xadd         qword ptr [edi], rax
        ret

asm_test::fetch_add::u128::acqrel:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_add::u128::seqcst:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_add::u128::acquire:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_add::u128::relaxed:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_add::u128::release:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_and::u8::acqrel:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_and::u8::seqcst:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_and::u8::acquire:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_and::u8::relaxed:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_and::u8::release:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_and::u16::acqrel:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_and::u16::seqcst:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_and::u16::acquire:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_and::u16::relaxed:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_and::u16::release:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_and::u32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_and::u32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_and::u32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_and::u32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_and::u32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_and::u64::acqrel:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        and               rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_and::u64::seqcst:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        and               rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_and::u64::acquire:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        and               rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_and::u64::relaxed:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        and               rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_and::u64::release:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        and               rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_and::bool::acqrel:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::seqcst:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::acquire:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::relaxed:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::release:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::u128::acqrel:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_and::u128::seqcst:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_and::u128::acquire:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_and::u128::relaxed:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_and::u128::release:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_max::i8::acqrel:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovg             edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_max::i8::seqcst:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovg             edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_max::i8::acquire:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovg             edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_max::i8::relaxed:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovg             edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_max::i8::release:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovg             edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_max::i16::acqrel:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovg             ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_max::i16::seqcst:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovg             ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_max::i16::acquire:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovg             ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_max::i16::relaxed:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovg             ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_max::i16::release:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovg             ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_max::i32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovg             ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_max::i32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovg             ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_max::i32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovg             ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_max::i32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovg             ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_max::i32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovg             ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_max::i64::acqrel:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovg             rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_max::i64::seqcst:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovg             rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_max::i64::acquire:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovg             rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_max::i64::relaxed:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovg             rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_max::i64::release:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovg             rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_max::i128::acqrel:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovl             rcx, rdx
        mov               rbx, r8
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_max::i128::seqcst:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovl             rcx, rdx
        mov               rbx, r8
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_max::i128::acquire:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovl             rcx, rdx
        mov               rbx, r8
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_max::i128::relaxed:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovl             rcx, rdx
        mov               rbx, r8
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_max::i128::release:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovl             rcx, rdx
        mov               rbx, r8
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_min::i8::acqrel:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovle            edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_min::i8::seqcst:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovle            edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_min::i8::acquire:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovle            edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_min::i8::relaxed:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovle            edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_min::i8::release:
        movzx             eax, byte ptr [edi]
        movzx             ecx, sil
        nop               dword ptr [rax + rax]
0:
        cmp               al, cl
        movzx             eax, al
        mov               edx, ecx
        cmovle            edx, eax
        lock cmpxchg      byte ptr [edi], dl
        jne               0b
        ret

asm_test::fetch_min::i16::acqrel:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovle            ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_min::i16::seqcst:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovle            ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_min::i16::acquire:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovle            ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_min::i16::relaxed:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovle            ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_min::i16::release:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               ax, si
        mov               ecx, esi
        cmovle            ecx, eax
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_min::i32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovle            ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_min::i32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovle            ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_min::i32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovle            ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_min::i32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovle            ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_min::i32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               eax, esi
        mov               ecx, esi
        cmovle            ecx, eax
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_min::i64::acqrel:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovle            rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_min::i64::seqcst:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovle            rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_min::i64::acquire:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovle            rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_min::i64::relaxed:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovle            rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_min::i64::release:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        cmp               rax, rsi
        mov               rcx, rsi
        cmovle            rcx, rax
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_min::i128::acqrel:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovge            rcx, rdx
        mov               rbx, r8
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_min::i128::seqcst:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovge            rcx, rdx
        mov               rbx, r8
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_min::i128::acquire:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovge            rcx, rdx
        mov               rbx, r8
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_min::i128::relaxed:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovge            rcx, rdx
        mov               rbx, r8
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_min::i128::release:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovge            rcx, rdx
        mov               rbx, r8
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_neg::u8::acqrel:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_neg::u8::seqcst:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_neg::u8::acquire:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_neg::u8::relaxed:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_neg::u8::release:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_neg::u16::acqrel:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_neg::u16::seqcst:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_neg::u16::acquire:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_neg::u16::relaxed:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_neg::u16::release:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_neg::u32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_neg::u32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_neg::u32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_neg::u32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_neg::u32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        neg               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_neg::u64::acqrel:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        neg               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_neg::u64::seqcst:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        neg               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_neg::u64::acquire:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        neg               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_neg::u64::relaxed:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        neg               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_neg::u64::release:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        neg               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_neg::u128::acqrel:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::fetch_neg::u128::seqcst:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::fetch_neg::u128::acquire:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::fetch_neg::u128::relaxed:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::fetch_neg::u128::release:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::fetch_not::u8::acqrel:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_not::u8::seqcst:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_not::u8::acquire:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_not::u8::relaxed:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_not::u8::release:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_not::u16::acqrel:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_not::u16::seqcst:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_not::u16::acquire:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_not::u16::relaxed:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_not::u16::release:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_not::u32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_not::u32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_not::u32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_not::u32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_not::u32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_not::u64::acqrel:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_not::u64::seqcst:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_not::u64::acquire:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_not::u64::relaxed:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_not::u64::release:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_not::bool::acqrel:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, 0x1
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::bool::seqcst:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, 0x1
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::bool::acquire:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, 0x1
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::bool::relaxed:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, 0x1
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::bool::release:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, 0x1
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::u128::acqrel:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::fetch_not::u128::seqcst:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::fetch_not::u128::acquire:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::fetch_not::u128::relaxed:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::fetch_not::u128::release:
        mov               r8, rdi
        mov               edi, esi
        mov               rsi, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, rsi
        mov               qword ptr [r8d + 0x8], rdx
        mov               qword ptr [r8d], rax
        mov               eax, r8d
        ret

asm_test::fetch_sub::u8::acqrel:
        mov               eax, esi
        neg               al
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_sub::u8::seqcst:
        mov               eax, esi
        neg               al
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_sub::u8::acquire:
        mov               eax, esi
        neg               al
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_sub::u8::relaxed:
        mov               eax, esi
        neg               al
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_sub::u8::release:
        mov               eax, esi
        neg               al
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_sub::u16::acqrel:
        mov               eax, esi
        neg               eax
        lock xadd         word ptr [edi], ax
        ret

asm_test::fetch_sub::u16::seqcst:
        mov               eax, esi
        neg               eax
        lock xadd         word ptr [edi], ax
        ret

asm_test::fetch_sub::u16::acquire:
        mov               eax, esi
        neg               eax
        lock xadd         word ptr [edi], ax
        ret

asm_test::fetch_sub::u16::relaxed:
        mov               eax, esi
        neg               eax
        lock xadd         word ptr [edi], ax
        ret

asm_test::fetch_sub::u16::release:
        mov               eax, esi
        neg               eax
        lock xadd         word ptr [edi], ax
        ret

asm_test::fetch_sub::u32::acqrel:
        mov               eax, esi
        neg               eax
        lock xadd         dword ptr [edi], eax
        ret

asm_test::fetch_sub::u32::seqcst:
        mov               eax, esi
        neg               eax
        lock xadd         dword ptr [edi], eax
        ret

asm_test::fetch_sub::u32::acquire:
        mov               eax, esi
        neg               eax
        lock xadd         dword ptr [edi], eax
        ret

asm_test::fetch_sub::u32::relaxed:
        mov               eax, esi
        neg               eax
        lock xadd         dword ptr [edi], eax
        ret

asm_test::fetch_sub::u32::release:
        mov               eax, esi
        neg               eax
        lock xadd         dword ptr [edi], eax
        ret

asm_test::fetch_sub::u64::acqrel:
        mov               rax, rsi
        neg               rax
        lock xadd         qword ptr [edi], rax
        ret

asm_test::fetch_sub::u64::seqcst:
        mov               rax, rsi
        neg               rax
        lock xadd         qword ptr [edi], rax
        ret

asm_test::fetch_sub::u64::acquire:
        mov               rax, rsi
        neg               rax
        lock xadd         qword ptr [edi], rax
        ret

asm_test::fetch_sub::u64::relaxed:
        mov               rax, rsi
        neg               rax
        lock xadd         qword ptr [edi], rax
        ret

asm_test::fetch_sub::u64::release:
        mov               rax, rsi
        neg               rax
        lock xadd         qword ptr [edi], rax
        ret

asm_test::fetch_sub::u128::acqrel:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_sub::u128::seqcst:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_sub::u128::acquire:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_sub::u128::relaxed:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_sub::u128::release:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_xor::u8::acqrel:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_xor::u8::seqcst:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_xor::u8::acquire:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_xor::u8::relaxed:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_xor::u8::release:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_xor::u16::acqrel:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_xor::u16::seqcst:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_xor::u16::acquire:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_xor::u16::relaxed:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_xor::u16::release:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               ecx, esi
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_xor::u32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_xor::u32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_xor::u32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_xor::u32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_xor::u32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               ecx, esi
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_xor::u64::acqrel:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        xor               rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_xor::u64::seqcst:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        xor               rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_xor::u64::acquire:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        xor               rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_xor::u64::relaxed:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        xor               rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_xor::u64::release:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        xor               rcx, rsi
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_xor::bool::acqrel:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::seqcst:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::acquire:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::relaxed:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::release:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, sil
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::u128::acqrel:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_xor::u128::seqcst:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_xor::u128::acquire:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_xor::u128::relaxed:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret

asm_test::fetch_xor::u128::release:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, rdx
        mov               r9, rcx
        mov               r10, rbx
        mov               rax, qword ptr [edi]
        mov               rdx, qword ptr [edi + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [edi]
        jne               0b
        mov               rbx, r10
        mov               qword ptr [r11d + 0x8], rdx
        mov               qword ptr [r11d], rax
        mov               eax, r11d
        ret


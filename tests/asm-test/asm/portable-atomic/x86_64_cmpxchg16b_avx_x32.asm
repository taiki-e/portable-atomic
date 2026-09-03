asm_test::fence::acqrel:
        ret

asm_test::fence::seqcst:
        lea               eax, [rsp - 0x4]
        xchg              dword ptr [eax], ecx
        ret

asm_test::fence::acquire:
        ret

asm_test::fence::release:
        ret

asm_test::bit_toggle::u8::acqrel:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax]
0:
        mov               ecx, eax
        xor               cl, dl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_toggle::u8::seqcst:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax]
0:
        mov               ecx, eax
        xor               cl, dl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_toggle::u8::acquire:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax]
0:
        mov               ecx, eax
        xor               cl, dl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_toggle::u8::relaxed:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax]
0:
        mov               ecx, eax
        xor               cl, dl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_toggle::u8::release:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax]
0:
        mov               ecx, eax
        xor               cl, dl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_toggle::u16::acqrel:
        and               esi, 0xf
        lock btc          word ptr [edi], si
        setb              al
        ret

asm_test::bit_toggle::u16::seqcst:
        and               esi, 0xf
        lock btc          word ptr [edi], si
        setb              al
        ret

asm_test::bit_toggle::u16::acquire:
        and               esi, 0xf
        lock btc          word ptr [edi], si
        setb              al
        ret

asm_test::bit_toggle::u16::relaxed:
        and               esi, 0xf
        lock btc          word ptr [edi], si
        setb              al
        ret

asm_test::bit_toggle::u16::release:
        and               esi, 0xf
        lock btc          word ptr [edi], si
        setb              al
        ret

asm_test::bit_toggle::u32::acqrel:
        and               esi, 0x1f
        lock btc          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_toggle::u32::seqcst:
        and               esi, 0x1f
        lock btc          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_toggle::u32::acquire:
        and               esi, 0x1f
        lock btc          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_toggle::u32::relaxed:
        and               esi, 0x1f
        lock btc          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_toggle::u32::release:
        and               esi, 0x1f
        lock btc          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_toggle::u64::acqrel:
        and               esi, 0x3f
        lock btc          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_toggle::u64::seqcst:
        and               esi, 0x3f
        lock btc          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_toggle::u64::acquire:
        and               esi, 0x3f
        lock btc          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_toggle::u64::relaxed:
        and               esi, 0x3f
        lock btc          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_toggle::u64::release:
        and               esi, 0x3f
        lock btc          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_toggle::u128::acqrel:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::bit_toggle::u128::seqcst:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::bit_toggle::u128::acquire:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::bit_toggle::u128::relaxed:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::bit_toggle::u128::release:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::fetch_nand::u8::acqrel_all:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::seqcst_all:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::acqrel_zero:
        movzx             eax, byte ptr [edi]
        mov               cl, -0x1
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::acquire_all:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::relaxed_all:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::release_all:
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               cl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::seqcst_zero:
        movzx             eax, byte ptr [edi]
        mov               cl, -0x1
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::acquire_zero:
        movzx             eax, byte ptr [edi]
        mov               cl, -0x1
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::relaxed_zero:
        movzx             eax, byte ptr [edi]
        mov               cl, -0x1
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

asm_test::fetch_nand::u8::release_zero:
        movzx             eax, byte ptr [edi]
        mov               cl, -0x1
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        ret

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

asm_test::fetch_nand::u16::acqrel_all:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::seqcst_all:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::acqrel_zero:
        movzx             eax, word ptr [edi]
        mov               cx, 0xffff
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::acquire_all:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::relaxed_all:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::release_all:
        movzx             eax, word ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::seqcst_zero:
        movzx             eax, word ptr [edi]
        mov               cx, 0xffff
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::acquire_zero:
        movzx             eax, word ptr [edi]
        mov               cx, 0xffff
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::relaxed_zero:
        movzx             eax, word ptr [edi]
        mov               cx, 0xffff
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      word ptr [edi], cx
        jne               0b
        ret

asm_test::fetch_nand::u16::release_zero:
        movzx             eax, word ptr [edi]
        mov               cx, 0xffff
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      word ptr [edi], cx
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

asm_test::fetch_nand::u32::acqrel_all:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::seqcst_all:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::acqrel_zero:
        mov               eax, dword ptr [edi]
        mov               ecx, 0xffffffff
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::acquire_all:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::relaxed_all:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::release_all:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        not               ecx
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::seqcst_zero:
        mov               eax, dword ptr [edi]
        mov               ecx, 0xffffffff
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::acquire_zero:
        mov               eax, dword ptr [edi]
        mov               ecx, 0xffffffff
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::relaxed_zero:
        mov               eax, dword ptr [edi]
        mov               ecx, 0xffffffff
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        ret

asm_test::fetch_nand::u32::release_zero:
        mov               eax, dword ptr [edi]
        mov               ecx, 0xffffffff
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      dword ptr [edi], ecx
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

asm_test::fetch_nand::u64::acqrel_all:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::seqcst_all:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::acqrel_zero:
        mov               rax, qword ptr [edi]
        mov               rcx, -0x1
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::acquire_all:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::relaxed_all:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::release_all:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               rcx, rax
        not               rcx
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::seqcst_zero:
        mov               rax, qword ptr [edi]
        mov               rcx, -0x1
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::acquire_zero:
        mov               rax, qword ptr [edi]
        mov               rcx, -0x1
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::relaxed_zero:
        mov               rax, qword ptr [edi]
        mov               rcx, -0x1
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        ret

asm_test::fetch_nand::u64::release_zero:
        mov               rax, qword ptr [edi]
        mov               rcx, -0x1
        nop               dword ptr [rax + rax]
0:
        lock cmpxchg      qword ptr [edi], rcx
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

asm_test::fetch_nand::bool::acqrel_true:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_nand::bool::seqcst_true:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_nand::bool::acqrel_false:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_nand::bool::acquire_true:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_nand::bool::relaxed_true:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_nand::bool::release_true:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_nand::bool::seqcst_false:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_nand::bool::acquire_false:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_nand::bool::relaxed_false:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_nand::bool::release_false:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_nand::bool::acqrel:
        test              esi, esi
        je                0f
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret
0:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_nand::bool::seqcst:
        test              esi, esi
        je                0f
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret
0:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_nand::bool::acquire:
        test              esi, esi
        je                0f
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret
0:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_nand::bool::relaxed:
        test              esi, esi
        je                0f
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret
0:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_nand::bool::release:
        test              esi, esi
        je                0f
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret
0:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_nand::u128::acqrel_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_nand::u128::seqcst_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_nand::u128::acqrel_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_nand::u128::acquire_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_nand::u128::relaxed_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_nand::u128::release_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_nand::u128::seqcst_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_nand::u128::acquire_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_nand::u128::relaxed_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_nand::u128::release_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::compare_exchange::f32::acqrel_seqcst:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::seqcst_seqcst:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::acqrel_acquire:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::acqrel_relaxed:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::acquire_seqcst:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::relaxed_seqcst:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::release_seqcst:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::seqcst_acquire:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::seqcst_relaxed:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::acquire_acquire:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::acquire_relaxed:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::relaxed_acquire:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::relaxed_relaxed:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::release_acquire:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f32::release_relaxed:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange::f64::acqrel_seqcst:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::seqcst_seqcst:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::acqrel_acquire:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::acqrel_relaxed:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::acquire_seqcst:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::relaxed_seqcst:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::release_seqcst:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::seqcst_acquire:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::seqcst_relaxed:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::acquire_acquire:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::acquire_relaxed:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::relaxed_acquire:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::relaxed_relaxed:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::release_acquire:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange::f64::release_relaxed:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
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
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_seqcst_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_acquire_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_relaxed_true_true:
        mov               cl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_seqcst_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_seqcst_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_acquire_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_acquire_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_relaxed_false_true:
        mov               cl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_relaxed_true_false:
        xor               ecx, ecx
        mov               al, 0x1
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_seqcst_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_acquire_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::bool::release_relaxed_false_false:
        xor               ecx, ecx
        xor               eax, eax
        lock cmpxchg      byte ptr [edi], cl
        mov               edx, eax
        setne             al
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

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::acqrel_acquire:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::acqrel_relaxed:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::acquire_seqcst:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::relaxed_seqcst:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::release_seqcst:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::seqcst_acquire:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::acquire_acquire:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::acquire_relaxed:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::relaxed_acquire:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::relaxed_relaxed:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::release_acquire:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f32::release_relaxed:
        vmovd             eax, xmm0
        vmovd             edx, xmm1
        xor               ecx, ecx
        lock cmpxchg      dword ptr [edi], edx
        setne             cl
        vmovd             xmm0, eax
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::f64::acqrel_seqcst:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::seqcst_seqcst:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::acqrel_acquire:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::acqrel_relaxed:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::acquire_seqcst:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::relaxed_seqcst:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::release_seqcst:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::seqcst_acquire:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::seqcst_relaxed:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::acquire_acquire:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::acquire_relaxed:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::relaxed_acquire:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::relaxed_relaxed:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::release_acquire:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
        ret

asm_test::compare_exchange_weak::f64::release_relaxed:
        vmovq             rax, xmm0
        vmovq             rcx, xmm1
        xor               edx, edx
        lock cmpxchg      qword ptr [esi], rcx
        setne             dl
        mov               qword ptr [edi + 0x8], rax
        mov               qword ptr [edi], rdx
        mov               eax, edi
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
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        mov               eax, esi
        lock cmpxchg      byte ptr [edi], dl
        mov               edx, eax
        setne             al
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

asm_test::or::u8::acqrel_all:
        mov               al, -0x1
        xchg              byte ptr [edi], al
        ret

asm_test::or::u8::seqcst_all:
        mov               al, -0x1
        xchg              byte ptr [edi], al
        ret

asm_test::or::u8::acqrel_zero:
        ret

asm_test::or::u8::acquire_all:
        mov               al, -0x1
        xchg              byte ptr [edi], al
        ret

asm_test::or::u8::relaxed_all:
        mov               al, -0x1
        xchg              byte ptr [edi], al
        ret

asm_test::or::u8::release_all:
        mov               al, -0x1
        xchg              byte ptr [edi], al
        ret

asm_test::or::u8::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::or::u8::acquire_zero:
        ret

asm_test::or::u8::relaxed_zero:
        ret

asm_test::or::u8::release_zero:
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

asm_test::or::u16::acqrel_all:
        mov               ax, 0xffff
        xchg              word ptr [edi], ax
        ret

asm_test::or::u16::seqcst_all:
        mov               ax, 0xffff
        xchg              word ptr [edi], ax
        ret

asm_test::or::u16::acqrel_zero:
        ret

asm_test::or::u16::acquire_all:
        mov               ax, 0xffff
        xchg              word ptr [edi], ax
        ret

asm_test::or::u16::relaxed_all:
        mov               ax, 0xffff
        xchg              word ptr [edi], ax
        ret

asm_test::or::u16::release_all:
        mov               ax, 0xffff
        xchg              word ptr [edi], ax
        ret

asm_test::or::u16::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::or::u16::acquire_zero:
        ret

asm_test::or::u16::relaxed_zero:
        ret

asm_test::or::u16::release_zero:
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

asm_test::or::u32::acqrel_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [edi], eax
        ret

asm_test::or::u32::seqcst_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [edi], eax
        ret

asm_test::or::u32::acqrel_zero:
        ret

asm_test::or::u32::acquire_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [edi], eax
        ret

asm_test::or::u32::relaxed_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [edi], eax
        ret

asm_test::or::u32::release_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [edi], eax
        ret

asm_test::or::u32::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::or::u32::acquire_zero:
        ret

asm_test::or::u32::relaxed_zero:
        ret

asm_test::or::u32::release_zero:
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

asm_test::or::u64::acqrel_all:
        mov               rax, -0x1
        xchg              qword ptr [edi], rax
        ret

asm_test::or::u64::seqcst_all:
        mov               rax, -0x1
        xchg              qword ptr [edi], rax
        ret

asm_test::or::u64::acqrel_zero:
        ret

asm_test::or::u64::acquire_all:
        mov               rax, -0x1
        xchg              qword ptr [edi], rax
        ret

asm_test::or::u64::relaxed_all:
        mov               rax, -0x1
        xchg              qword ptr [edi], rax
        ret

asm_test::or::u64::release_all:
        mov               rax, -0x1
        xchg              qword ptr [edi], rax
        ret

asm_test::or::u64::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::or::u64::acquire_zero:
        ret

asm_test::or::u64::relaxed_zero:
        ret

asm_test::or::u64::release_zero:
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

asm_test::or::bool::acqrel_true:
        lock or           byte ptr [edi], 0x1
        ret

asm_test::or::bool::seqcst_true:
        lock or           byte ptr [edi], 0x1
        ret

asm_test::or::bool::acqrel_false:
        ret

asm_test::or::bool::acquire_true:
        lock or           byte ptr [edi], 0x1
        ret

asm_test::or::bool::relaxed_true:
        lock or           byte ptr [edi], 0x1
        ret

asm_test::or::bool::release_true:
        lock or           byte ptr [edi], 0x1
        ret

asm_test::or::bool::seqcst_false:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::or::bool::acquire_false:
        ret

asm_test::or::bool::relaxed_false:
        ret

asm_test::or::bool::release_false:
        ret

asm_test::or::bool::acqrel:
        lock or           byte ptr [edi], sil
        ret

asm_test::or::bool::seqcst:
        lock or           byte ptr [edi], sil
        ret

asm_test::or::bool::acquire:
        lock or           byte ptr [edi], sil
        ret

asm_test::or::bool::relaxed:
        lock or           byte ptr [edi], sil
        ret

asm_test::or::bool::release:
        lock or           byte ptr [edi], sil
        ret

asm_test::or::u128::acqrel_all:
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::or::u128::seqcst_all:
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::or::u128::acqrel_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::or::u128::acquire_all:
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::or::u128::relaxed_all:
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::or::u128::release_all:
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::or::u128::seqcst_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::or::u128::acquire_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::or::u128::relaxed_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::or::u128::release_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::add::u8::acqrel_zero:
        ret

asm_test::add::u8::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::add::u8::acquire_zero:
        ret

asm_test::add::u8::relaxed_zero:
        ret

asm_test::add::u8::release_zero:
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

asm_test::add::u16::acqrel_zero:
        ret

asm_test::add::u16::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::add::u16::acquire_zero:
        ret

asm_test::add::u16::relaxed_zero:
        ret

asm_test::add::u16::release_zero:
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

asm_test::add::u32::acqrel_zero:
        ret

asm_test::add::u32::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::add::u32::acquire_zero:
        ret

asm_test::add::u32::relaxed_zero:
        ret

asm_test::add::u32::release_zero:
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

asm_test::add::u64::acqrel_zero:
        ret

asm_test::add::u64::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::add::u64::acquire_zero:
        ret

asm_test::add::u64::relaxed_zero:
        ret

asm_test::add::u64::release_zero:
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

asm_test::add::u128::acqrel_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::add::u128::seqcst_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::add::u128::acquire_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::add::u128::relaxed_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::add::u128::release_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::and::u8::acqrel_all:
        ret

asm_test::and::u8::seqcst_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::and::u8::acqrel_zero:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::and::u8::acquire_all:
        ret

asm_test::and::u8::relaxed_all:
        ret

asm_test::and::u8::release_all:
        ret

asm_test::and::u8::seqcst_zero:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::and::u8::acquire_zero:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::and::u8::relaxed_zero:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::and::u8::release_zero:
        xor               eax, eax
        xchg              byte ptr [edi], al
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

asm_test::and::u16::acqrel_all:
        ret

asm_test::and::u16::seqcst_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::and::u16::acqrel_zero:
        xor               eax, eax
        xchg              word ptr [edi], ax
        ret

asm_test::and::u16::acquire_all:
        ret

asm_test::and::u16::relaxed_all:
        ret

asm_test::and::u16::release_all:
        ret

asm_test::and::u16::seqcst_zero:
        xor               eax, eax
        xchg              word ptr [edi], ax
        ret

asm_test::and::u16::acquire_zero:
        xor               eax, eax
        xchg              word ptr [edi], ax
        ret

asm_test::and::u16::relaxed_zero:
        xor               eax, eax
        xchg              word ptr [edi], ax
        ret

asm_test::and::u16::release_zero:
        xor               eax, eax
        xchg              word ptr [edi], ax
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

asm_test::and::u32::acqrel_all:
        ret

asm_test::and::u32::seqcst_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::and::u32::acqrel_zero:
        xor               eax, eax
        xchg              dword ptr [edi], eax
        ret

asm_test::and::u32::acquire_all:
        ret

asm_test::and::u32::relaxed_all:
        ret

asm_test::and::u32::release_all:
        ret

asm_test::and::u32::seqcst_zero:
        xor               eax, eax
        xchg              dword ptr [edi], eax
        ret

asm_test::and::u32::acquire_zero:
        xor               eax, eax
        xchg              dword ptr [edi], eax
        ret

asm_test::and::u32::relaxed_zero:
        xor               eax, eax
        xchg              dword ptr [edi], eax
        ret

asm_test::and::u32::release_zero:
        xor               eax, eax
        xchg              dword ptr [edi], eax
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

asm_test::and::u64::acqrel_all:
        ret

asm_test::and::u64::seqcst_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::and::u64::acqrel_zero:
        xor               eax, eax
        xchg              qword ptr [edi], rax
        ret

asm_test::and::u64::acquire_all:
        ret

asm_test::and::u64::relaxed_all:
        ret

asm_test::and::u64::release_all:
        ret

asm_test::and::u64::seqcst_zero:
        xor               eax, eax
        xchg              qword ptr [edi], rax
        ret

asm_test::and::u64::acquire_zero:
        xor               eax, eax
        xchg              qword ptr [edi], rax
        ret

asm_test::and::u64::relaxed_zero:
        xor               eax, eax
        xchg              qword ptr [edi], rax
        ret

asm_test::and::u64::release_zero:
        xor               eax, eax
        xchg              qword ptr [edi], rax
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

asm_test::and::bool::acqrel_true:
        lock and          byte ptr [edi], 0x1
        ret

asm_test::and::bool::seqcst_true:
        lock and          byte ptr [edi], 0x1
        ret

asm_test::and::bool::acqrel_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::and::bool::acquire_true:
        lock and          byte ptr [edi], 0x1
        ret

asm_test::and::bool::relaxed_true:
        lock and          byte ptr [edi], 0x1
        ret

asm_test::and::bool::release_true:
        lock and          byte ptr [edi], 0x1
        ret

asm_test::and::bool::seqcst_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::and::bool::acquire_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::and::bool::relaxed_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::and::bool::release_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::and::bool::acqrel:
        lock and          byte ptr [edi], sil
        ret

asm_test::and::bool::seqcst:
        lock and          byte ptr [edi], sil
        ret

asm_test::and::bool::acquire:
        lock and          byte ptr [edi], sil
        ret

asm_test::and::bool::relaxed:
        lock and          byte ptr [edi], sil
        ret

asm_test::and::bool::release:
        lock and          byte ptr [edi], sil
        ret

asm_test::and::u128::acqrel_all:
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::and::u128::seqcst_all:
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::and::u128::acqrel_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::and::u128::acquire_all:
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::and::u128::relaxed_all:
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::and::u128::release_all:
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::and::u128::seqcst_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::and::u128::acquire_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::and::u128::relaxed_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::and::u128::release_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::not::bool::acqrel:
        lock xor          byte ptr [edi], 0x1
        ret

asm_test::not::bool::seqcst:
        lock xor          byte ptr [edi], 0x1
        ret

asm_test::not::bool::acquire:
        lock xor          byte ptr [edi], 0x1
        ret

asm_test::not::bool::relaxed:
        lock xor          byte ptr [edi], 0x1
        ret

asm_test::not::bool::release:
        lock xor          byte ptr [edi], 0x1
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

asm_test::sub::u8::acqrel_zero:
        ret

asm_test::sub::u8::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::sub::u8::acquire_zero:
        ret

asm_test::sub::u8::relaxed_zero:
        ret

asm_test::sub::u8::release_zero:
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

asm_test::sub::u16::acqrel_zero:
        ret

asm_test::sub::u16::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::sub::u16::acquire_zero:
        ret

asm_test::sub::u16::relaxed_zero:
        ret

asm_test::sub::u16::release_zero:
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

asm_test::sub::u32::acqrel_zero:
        ret

asm_test::sub::u32::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::sub::u32::acquire_zero:
        ret

asm_test::sub::u32::relaxed_zero:
        ret

asm_test::sub::u32::release_zero:
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

asm_test::sub::u64::acqrel_zero:
        ret

asm_test::sub::u64::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::sub::u64::acquire_zero:
        ret

asm_test::sub::u64::relaxed_zero:
        ret

asm_test::sub::u64::release_zero:
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

asm_test::sub::u128::acqrel_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::sub::u128::seqcst_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::sub::u128::acquire_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::sub::u128::relaxed_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::sub::u128::release_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::xor::u8::acqrel_zero:
        ret

asm_test::xor::u8::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::xor::u8::acquire_zero:
        ret

asm_test::xor::u8::relaxed_zero:
        ret

asm_test::xor::u8::release_zero:
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

asm_test::xor::u16::acqrel_zero:
        ret

asm_test::xor::u16::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::xor::u16::acquire_zero:
        ret

asm_test::xor::u16::relaxed_zero:
        ret

asm_test::xor::u16::release_zero:
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

asm_test::xor::u32::acqrel_zero:
        ret

asm_test::xor::u32::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::xor::u32::acquire_zero:
        ret

asm_test::xor::u32::relaxed_zero:
        ret

asm_test::xor::u32::release_zero:
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

asm_test::xor::u64::acqrel_zero:
        ret

asm_test::xor::u64::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::xor::u64::acquire_zero:
        ret

asm_test::xor::u64::relaxed_zero:
        ret

asm_test::xor::u64::release_zero:
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

asm_test::xor::bool::acqrel_true:
        lock xor          byte ptr [edi], 0x1
        ret

asm_test::xor::bool::seqcst_true:
        lock xor          byte ptr [edi], 0x1
        ret

asm_test::xor::bool::acqrel_false:
        ret

asm_test::xor::bool::acquire_true:
        lock xor          byte ptr [edi], 0x1
        ret

asm_test::xor::bool::relaxed_true:
        lock xor          byte ptr [edi], 0x1
        ret

asm_test::xor::bool::release_true:
        lock xor          byte ptr [edi], 0x1
        ret

asm_test::xor::bool::seqcst_false:
        lock or           dword ptr [rsp - 0x40], 0x0
        ret

asm_test::xor::bool::acquire_false:
        ret

asm_test::xor::bool::relaxed_false:
        ret

asm_test::xor::bool::release_false:
        ret

asm_test::xor::bool::acqrel:
        lock xor          byte ptr [edi], sil
        ret

asm_test::xor::bool::seqcst:
        lock xor          byte ptr [edi], sil
        ret

asm_test::xor::bool::acquire:
        lock xor          byte ptr [edi], sil
        ret

asm_test::xor::bool::relaxed:
        lock xor          byte ptr [edi], sil
        ret

asm_test::xor::bool::release:
        lock xor          byte ptr [edi], sil
        ret

asm_test::xor::u128::acqrel_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::xor::u128::seqcst_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::xor::u128::acquire_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::xor::u128::relaxed_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::xor::u128::release_zero:
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::load::f32::seqcst:
        vmovss            xmm0, dword ptr [edi]
        ret

asm_test::load::f32::acquire:
        vmovss            xmm0, dword ptr [edi]
        ret

asm_test::load::f32::relaxed:
        vmovss            xmm0, dword ptr [edi]
        ret

asm_test::load::f64::seqcst:
        vmovsd            xmm0, qword ptr [edi]
        ret

asm_test::load::f64::acquire:
        vmovsd            xmm0, qword ptr [edi]
        ret

asm_test::load::f64::relaxed:
        vmovsd            xmm0, qword ptr [edi]
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
        ret

asm_test::load::bool::acquire:
        movzx             eax, byte ptr [edi]
        ret

asm_test::load::bool::relaxed:
        movzx             eax, byte ptr [edi]
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

asm_test::swap::f32::acqrel:
        vmovd             eax, xmm0
        xchg              dword ptr [edi], eax
        vmovd             xmm0, eax
        ret

asm_test::swap::f32::seqcst:
        vmovd             eax, xmm0
        xchg              dword ptr [edi], eax
        vmovd             xmm0, eax
        ret

asm_test::swap::f32::acquire:
        vmovd             eax, xmm0
        xchg              dword ptr [edi], eax
        vmovd             xmm0, eax
        ret

asm_test::swap::f32::relaxed:
        vmovd             eax, xmm0
        xchg              dword ptr [edi], eax
        vmovd             xmm0, eax
        ret

asm_test::swap::f32::release:
        vmovd             eax, xmm0
        xchg              dword ptr [edi], eax
        vmovd             xmm0, eax
        ret

asm_test::swap::f64::acqrel:
        vmovq             rax, xmm0
        xchg              qword ptr [edi], rax
        vmovq             xmm0, rax
        ret

asm_test::swap::f64::seqcst:
        vmovq             rax, xmm0
        xchg              qword ptr [edi], rax
        vmovq             xmm0, rax
        ret

asm_test::swap::f64::acquire:
        vmovq             rax, xmm0
        xchg              qword ptr [edi], rax
        vmovq             xmm0, rax
        ret

asm_test::swap::f64::relaxed:
        vmovq             rax, xmm0
        xchg              qword ptr [edi], rax
        vmovq             xmm0, rax
        ret

asm_test::swap::f64::release:
        vmovq             rax, xmm0
        xchg              qword ptr [edi], rax
        vmovq             xmm0, rax
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

asm_test::swap::bool::acqrel_true:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::seqcst_true:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::acqrel_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::acquire_true:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::relaxed_true:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::release_true:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::seqcst_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::acquire_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::relaxed_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::release_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::acqrel:
        mov               eax, esi
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::seqcst:
        mov               eax, esi
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::acquire:
        mov               eax, esi
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::relaxed:
        mov               eax, esi
        xchg              byte ptr [edi], al
        ret

asm_test::swap::bool::release:
        mov               eax, esi
        xchg              byte ptr [edi], al
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

asm_test::store::f32::seqcst:
        vmovd             eax, xmm0
        xchg              dword ptr [edi], eax
        ret

asm_test::store::f32::relaxed:
        vmovss            dword ptr [edi], xmm0
        ret

asm_test::store::f32::release:
        vmovss            dword ptr [edi], xmm0
        ret

asm_test::store::f64::seqcst:
        vmovq             rax, xmm0
        xchg              qword ptr [edi], rax
        ret

asm_test::store::f64::relaxed:
        vmovsd            qword ptr [edi], xmm0
        ret

asm_test::store::f64::release:
        vmovsd            qword ptr [edi], xmm0
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

asm_test::bit_set::u8::acqrel:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax]
0:
        mov               ecx, eax
        or                cl, dl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_set::u8::seqcst:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax]
0:
        mov               ecx, eax
        or                cl, dl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_set::u8::acquire:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax]
0:
        mov               ecx, eax
        or                cl, dl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_set::u8::relaxed:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax]
0:
        mov               ecx, eax
        or                cl, dl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_set::u8::release:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        movzx             eax, byte ptr [edi]
        nop               dword ptr [rax]
0:
        mov               ecx, eax
        or                cl, dl
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_set::u16::acqrel:
        and               esi, 0xf
        lock bts          word ptr [edi], si
        setb              al
        ret

asm_test::bit_set::u16::seqcst:
        and               esi, 0xf
        lock bts          word ptr [edi], si
        setb              al
        ret

asm_test::bit_set::u16::acquire:
        and               esi, 0xf
        lock bts          word ptr [edi], si
        setb              al
        ret

asm_test::bit_set::u16::relaxed:
        and               esi, 0xf
        lock bts          word ptr [edi], si
        setb              al
        ret

asm_test::bit_set::u16::release:
        and               esi, 0xf
        lock bts          word ptr [edi], si
        setb              al
        ret

asm_test::bit_set::u32::acqrel:
        and               esi, 0x1f
        lock bts          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_set::u32::seqcst:
        and               esi, 0x1f
        lock bts          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_set::u32::acquire:
        and               esi, 0x1f
        lock bts          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_set::u32::relaxed:
        and               esi, 0x1f
        lock bts          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_set::u32::release:
        and               esi, 0x1f
        lock bts          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_set::u64::acqrel:
        and               esi, 0x3f
        lock bts          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_set::u64::seqcst:
        and               esi, 0x3f
        lock bts          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_set::u64::acquire:
        and               esi, 0x3f
        lock bts          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_set::u64::relaxed:
        and               esi, 0x3f
        lock bts          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_set::u64::release:
        and               esi, 0x3f
        lock bts          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_set::u128::acqrel:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::bit_set::u128::seqcst:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::bit_set::u128::acquire:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::bit_set::u128::relaxed:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::bit_set::u128::release:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::fetch_or::u8::acqrel_all:
        mov               al, -0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_or::u8::seqcst_all:
        mov               al, -0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_or::u8::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_or::u8::acquire_all:
        mov               al, -0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_or::u8::relaxed_all:
        mov               al, -0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_or::u8::release_all:
        mov               al, -0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_or::u8::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_or::u8::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_or::u8::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_or::u8::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
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

asm_test::fetch_or::u16::acqrel_all:
        mov               ax, 0xffff
        xchg              word ptr [edi], ax
        ret

asm_test::fetch_or::u16::seqcst_all:
        mov               ax, 0xffff
        xchg              word ptr [edi], ax
        ret

asm_test::fetch_or::u16::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_or::u16::acquire_all:
        mov               ax, 0xffff
        xchg              word ptr [edi], ax
        ret

asm_test::fetch_or::u16::relaxed_all:
        mov               ax, 0xffff
        xchg              word ptr [edi], ax
        ret

asm_test::fetch_or::u16::release_all:
        mov               ax, 0xffff
        xchg              word ptr [edi], ax
        ret

asm_test::fetch_or::u16::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_or::u16::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_or::u16::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_or::u16::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
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

asm_test::fetch_or::u32::acqrel_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [edi], eax
        ret

asm_test::fetch_or::u32::seqcst_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [edi], eax
        ret

asm_test::fetch_or::u32::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_or::u32::acquire_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [edi], eax
        ret

asm_test::fetch_or::u32::relaxed_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [edi], eax
        ret

asm_test::fetch_or::u32::release_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [edi], eax
        ret

asm_test::fetch_or::u32::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_or::u32::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_or::u32::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_or::u32::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
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

asm_test::fetch_or::u64::acqrel_all:
        mov               rax, -0x1
        xchg              qword ptr [edi], rax
        ret

asm_test::fetch_or::u64::seqcst_all:
        mov               rax, -0x1
        xchg              qword ptr [edi], rax
        ret

asm_test::fetch_or::u64::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_or::u64::acquire_all:
        mov               rax, -0x1
        xchg              qword ptr [edi], rax
        ret

asm_test::fetch_or::u64::relaxed_all:
        mov               rax, -0x1
        xchg              qword ptr [edi], rax
        ret

asm_test::fetch_or::u64::release_all:
        mov               rax, -0x1
        xchg              qword ptr [edi], rax
        ret

asm_test::fetch_or::u64::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_or::u64::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_or::u64::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_or::u64::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
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

asm_test::fetch_or::bool::acqrel_true:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_or::bool::seqcst_true:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_or::bool::acqrel_false:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_or::bool::acquire_true:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_or::bool::relaxed_true:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_or::bool::release_true:
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_or::bool::seqcst_false:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_or::bool::acquire_false:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_or::bool::relaxed_false:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_or::bool::release_false:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_or::bool::acqrel:
        test              esi, esi
        je                0f
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret
0:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_or::bool::seqcst:
        test              esi, esi
        je                0f
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret
0:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_or::bool::acquire:
        test              esi, esi
        je                0f
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret
0:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_or::bool::relaxed:
        test              esi, esi
        je                0f
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret
0:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_or::bool::release:
        test              esi, esi
        je                0f
        mov               al, 0x1
        xchg              byte ptr [edi], al
        ret
0:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_or::u128::acqrel_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_or::u128::seqcst_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_or::u128::acqrel_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_or::u128::acquire_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_or::u128::relaxed_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_or::u128::release_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_or::u128::seqcst_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_or::u128::acquire_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_or::u128::relaxed_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_or::u128::release_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::bit_clear::u8::acqrel:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        mov               r8b, -0x2
        mov               ecx, esi
        rol               r8b, cl
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, r8b
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_clear::u8::seqcst:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        mov               r8b, -0x2
        mov               ecx, esi
        rol               r8b, cl
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, r8b
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_clear::u8::acquire:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        mov               r8b, -0x2
        mov               ecx, esi
        rol               r8b, cl
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, r8b
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_clear::u8::relaxed:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        mov               r8b, -0x2
        mov               ecx, esi
        rol               r8b, cl
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, r8b
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_clear::u8::release:
        mov               ecx, esi
        and               cl, 0x7
        mov               dl, 0x1
        shl               dl, cl
        mov               r8b, -0x2
        mov               ecx, esi
        rol               r8b, cl
        movzx             eax, byte ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               cl, r8b
        lock cmpxchg      byte ptr [edi], cl
        jne               0b
        test              al, dl
        setne             al
        ret

asm_test::bit_clear::u16::acqrel:
        and               esi, 0xf
        lock btr          word ptr [edi], si
        setb              al
        ret

asm_test::bit_clear::u16::seqcst:
        and               esi, 0xf
        lock btr          word ptr [edi], si
        setb              al
        ret

asm_test::bit_clear::u16::acquire:
        and               esi, 0xf
        lock btr          word ptr [edi], si
        setb              al
        ret

asm_test::bit_clear::u16::relaxed:
        and               esi, 0xf
        lock btr          word ptr [edi], si
        setb              al
        ret

asm_test::bit_clear::u16::release:
        and               esi, 0xf
        lock btr          word ptr [edi], si
        setb              al
        ret

asm_test::bit_clear::u32::acqrel:
        and               esi, 0x1f
        lock btr          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_clear::u32::seqcst:
        and               esi, 0x1f
        lock btr          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_clear::u32::acquire:
        and               esi, 0x1f
        lock btr          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_clear::u32::relaxed:
        and               esi, 0x1f
        lock btr          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_clear::u32::release:
        and               esi, 0x1f
        lock btr          dword ptr [edi], esi
        setb              al
        ret

asm_test::bit_clear::u64::acqrel:
        and               esi, 0x3f
        lock btr          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_clear::u64::seqcst:
        and               esi, 0x3f
        lock btr          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_clear::u64::acquire:
        and               esi, 0x3f
        lock btr          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_clear::u64::relaxed:
        and               esi, 0x3f
        lock btr          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_clear::u64::release:
        and               esi, 0x3f
        lock btr          qword ptr [edi], rsi
        setb              al
        ret

asm_test::bit_clear::u128::acqrel:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        shl               r8, cl
        xor               eax, eax
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        not               r9
        not               r8
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::bit_clear::u128::seqcst:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        shl               r8, cl
        xor               eax, eax
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        not               r9
        not               r8
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::bit_clear::u128::acquire:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        shl               r8, cl
        xor               eax, eax
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        not               r9
        not               r8
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::bit_clear::u128::relaxed:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        shl               r8, cl
        xor               eax, eax
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        not               r9
        not               r8
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::bit_clear::u128::release:
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        shl               r8, cl
        xor               eax, eax
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        not               r9
        not               r8
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
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        ret

asm_test::fetch_abs::f32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, 0x7fffffff
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_abs::f32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, 0x7fffffff
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_abs::f32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, 0x7fffffff
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_abs::f32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, 0x7fffffff
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_abs::f32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        and               ecx, 0x7fffffff
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_abs::f64::acqrel:
        mov               rax, qword ptr [edi]
        movabs            rcx, 0x7fffffffffffffff
        nop
0:
        mov               rdx, rax
        and               rdx, rcx
        lock cmpxchg      qword ptr [edi], rdx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_abs::f64::seqcst:
        mov               rax, qword ptr [edi]
        movabs            rcx, 0x7fffffffffffffff
        nop
0:
        mov               rdx, rax
        and               rdx, rcx
        lock cmpxchg      qword ptr [edi], rdx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_abs::f64::acquire:
        mov               rax, qword ptr [edi]
        movabs            rcx, 0x7fffffffffffffff
        nop
0:
        mov               rdx, rax
        and               rdx, rcx
        lock cmpxchg      qword ptr [edi], rdx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_abs::f64::relaxed:
        mov               rax, qword ptr [edi]
        movabs            rcx, 0x7fffffffffffffff
        nop
0:
        mov               rdx, rax
        and               rdx, rcx
        lock cmpxchg      qword ptr [edi], rdx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_abs::f64::release:
        mov               rax, qword ptr [edi]
        movabs            rcx, 0x7fffffffffffffff
        nop
0:
        mov               rdx, rax
        and               rdx, rcx
        lock cmpxchg      qword ptr [edi], rdx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_add::u8::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_add::u8::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_add::u8::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_add::u8::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_add::u8::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
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

asm_test::fetch_add::f32::acqrel_zero:
        mov               eax, dword ptr [edi]
        vxorps            xmm0, xmm0, xmm0
        nop               word ptr [rax + rax]
0:
        vmovd             xmm1, eax
        vaddss            xmm1, xmm1, xmm0
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_add::f32::seqcst_zero:
        mov               eax, dword ptr [edi]
        vxorps            xmm0, xmm0, xmm0
        nop               word ptr [rax + rax]
0:
        vmovd             xmm1, eax
        vaddss            xmm1, xmm1, xmm0
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_add::f32::acquire_zero:
        mov               eax, dword ptr [edi]
        vxorps            xmm0, xmm0, xmm0
        nop               word ptr [rax + rax]
0:
        vmovd             xmm1, eax
        vaddss            xmm1, xmm1, xmm0
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_add::f32::relaxed_zero:
        mov               eax, dword ptr [edi]
        vxorps            xmm0, xmm0, xmm0
        nop               word ptr [rax + rax]
0:
        vmovd             xmm1, eax
        vaddss            xmm1, xmm1, xmm0
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_add::f32::release_zero:
        mov               eax, dword ptr [edi]
        vxorps            xmm0, xmm0, xmm0
        nop               word ptr [rax + rax]
0:
        vmovd             xmm1, eax
        vaddss            xmm1, xmm1, xmm0
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_add::f32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovd             xmm1, eax
        vaddss            xmm1, xmm0, xmm1
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_add::f32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovd             xmm1, eax
        vaddss            xmm1, xmm0, xmm1
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_add::f32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovd             xmm1, eax
        vaddss            xmm1, xmm0, xmm1
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_add::f32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovd             xmm1, eax
        vaddss            xmm1, xmm0, xmm1
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_add::f32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovd             xmm1, eax
        vaddss            xmm1, xmm0, xmm1
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_add::f64::acqrel_zero:
        mov               rax, qword ptr [edi]
        vxorpd            xmm0, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovq             xmm1, rax
        vaddsd            xmm1, xmm1, xmm0
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_add::f64::seqcst_zero:
        mov               rax, qword ptr [edi]
        vxorpd            xmm0, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovq             xmm1, rax
        vaddsd            xmm1, xmm1, xmm0
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_add::f64::acquire_zero:
        mov               rax, qword ptr [edi]
        vxorpd            xmm0, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovq             xmm1, rax
        vaddsd            xmm1, xmm1, xmm0
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_add::f64::relaxed_zero:
        mov               rax, qword ptr [edi]
        vxorpd            xmm0, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovq             xmm1, rax
        vaddsd            xmm1, xmm1, xmm0
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_add::f64::release_zero:
        mov               rax, qword ptr [edi]
        vxorpd            xmm0, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovq             xmm1, rax
        vaddsd            xmm1, xmm1, xmm0
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_add::f64::acqrel:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovq             xmm1, rax
        vaddsd            xmm1, xmm0, xmm1
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_add::f64::seqcst:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovq             xmm1, rax
        vaddsd            xmm1, xmm0, xmm1
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_add::f64::acquire:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovq             xmm1, rax
        vaddsd            xmm1, xmm0, xmm1
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_add::f64::relaxed:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovq             xmm1, rax
        vaddsd            xmm1, xmm0, xmm1
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_add::f64::release:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovq             xmm1, rax
        vaddsd            xmm1, xmm0, xmm1
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_add::u16::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_add::u16::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_add::u16::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_add::u16::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_add::u16::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
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

asm_test::fetch_add::u32::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_add::u32::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_add::u32::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_add::u32::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_add::u32::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
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

asm_test::fetch_add::u64::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_add::u64::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_add::u64::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_add::u64::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_add::u64::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
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

asm_test::fetch_add::u128::acqrel_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_add::u128::seqcst_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_add::u128::acquire_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_add::u128::relaxed_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_add::u128::release_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_and::u8::acqrel_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_and::u8::seqcst_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_and::u8::acqrel_zero:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::u8::acquire_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_and::u8::relaxed_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_and::u8::release_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_and::u8::seqcst_zero:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::u8::acquire_zero:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::u8::relaxed_zero:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::u8::release_zero:
        xor               eax, eax
        xchg              byte ptr [edi], al
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

asm_test::fetch_and::u16::acqrel_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_and::u16::seqcst_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_and::u16::acqrel_zero:
        xor               eax, eax
        xchg              word ptr [edi], ax
        ret

asm_test::fetch_and::u16::acquire_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_and::u16::relaxed_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_and::u16::release_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_and::u16::seqcst_zero:
        xor               eax, eax
        xchg              word ptr [edi], ax
        ret

asm_test::fetch_and::u16::acquire_zero:
        xor               eax, eax
        xchg              word ptr [edi], ax
        ret

asm_test::fetch_and::u16::relaxed_zero:
        xor               eax, eax
        xchg              word ptr [edi], ax
        ret

asm_test::fetch_and::u16::release_zero:
        xor               eax, eax
        xchg              word ptr [edi], ax
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

asm_test::fetch_and::u32::acqrel_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_and::u32::seqcst_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_and::u32::acqrel_zero:
        xor               eax, eax
        xchg              dword ptr [edi], eax
        ret

asm_test::fetch_and::u32::acquire_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_and::u32::relaxed_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_and::u32::release_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_and::u32::seqcst_zero:
        xor               eax, eax
        xchg              dword ptr [edi], eax
        ret

asm_test::fetch_and::u32::acquire_zero:
        xor               eax, eax
        xchg              dword ptr [edi], eax
        ret

asm_test::fetch_and::u32::relaxed_zero:
        xor               eax, eax
        xchg              dword ptr [edi], eax
        ret

asm_test::fetch_and::u32::release_zero:
        xor               eax, eax
        xchg              dword ptr [edi], eax
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

asm_test::fetch_and::u64::acqrel_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_and::u64::seqcst_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_and::u64::acqrel_zero:
        xor               eax, eax
        xchg              qword ptr [edi], rax
        ret

asm_test::fetch_and::u64::acquire_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_and::u64::relaxed_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_and::u64::release_all:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_and::u64::seqcst_zero:
        xor               eax, eax
        xchg              qword ptr [edi], rax
        ret

asm_test::fetch_and::u64::acquire_zero:
        xor               eax, eax
        xchg              qword ptr [edi], rax
        ret

asm_test::fetch_and::u64::relaxed_zero:
        xor               eax, eax
        xchg              qword ptr [edi], rax
        ret

asm_test::fetch_and::u64::release_zero:
        xor               eax, eax
        xchg              qword ptr [edi], rax
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

asm_test::fetch_and::bool::acqrel_true:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_and::bool::seqcst_true:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_and::bool::acqrel_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::bool::acquire_true:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_and::bool::relaxed_true:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_and::bool::release_true:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_and::bool::seqcst_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::bool::acquire_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::bool::relaxed_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::bool::release_false:
        xor               eax, eax
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::bool::acqrel:
        xor               eax, eax
        test              esi, esi
        je                0f
        lock xadd         byte ptr [edi], al
        ret
0:
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::bool::seqcst:
        xor               eax, eax
        test              esi, esi
        je                0f
        lock xadd         byte ptr [edi], al
        ret
0:
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::bool::acquire:
        xor               eax, eax
        test              esi, esi
        je                0f
        lock xadd         byte ptr [edi], al
        ret
0:
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::bool::relaxed:
        xor               eax, eax
        test              esi, esi
        je                0f
        lock xadd         byte ptr [edi], al
        ret
0:
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::bool::release:
        xor               eax, eax
        test              esi, esi
        je                0f
        lock xadd         byte ptr [edi], al
        ret
0:
        xchg              byte ptr [edi], al
        ret

asm_test::fetch_and::u128::acqrel_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_and::u128::seqcst_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_and::u128::acqrel_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_and::u128::acquire_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_and::u128::relaxed_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_and::u128::release_all:
        mov               r11, rdi
        mov               edi, esi
        mov               r8, -0x1
        mov               r9, -0x1
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

asm_test::fetch_and::u128::seqcst_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_and::u128::acquire_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_and::u128::relaxed_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_and::u128::release_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_max::f32::acqrel:
        mov               eax, dword ptr [edi]
        vcmpunordss       xmm1, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovd             xmm2, eax
        vmaxss            xmm3, xmm2, xmm0
        vblendvps         xmm2, xmm3, xmm2, xmm1
        vextractps        ecx, xmm2, 0x0
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_max::f32::seqcst:
        mov               eax, dword ptr [edi]
        vcmpunordss       xmm1, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovd             xmm2, eax
        vmaxss            xmm3, xmm2, xmm0
        vblendvps         xmm2, xmm3, xmm2, xmm1
        vextractps        ecx, xmm2, 0x0
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_max::f32::acquire:
        mov               eax, dword ptr [edi]
        vcmpunordss       xmm1, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovd             xmm2, eax
        vmaxss            xmm3, xmm2, xmm0
        vblendvps         xmm2, xmm3, xmm2, xmm1
        vextractps        ecx, xmm2, 0x0
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_max::f32::relaxed:
        mov               eax, dword ptr [edi]
        vcmpunordss       xmm1, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovd             xmm2, eax
        vmaxss            xmm3, xmm2, xmm0
        vblendvps         xmm2, xmm3, xmm2, xmm1
        vextractps        ecx, xmm2, 0x0
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_max::f32::release:
        mov               eax, dword ptr [edi]
        vcmpunordss       xmm1, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovd             xmm2, eax
        vmaxss            xmm3, xmm2, xmm0
        vblendvps         xmm2, xmm3, xmm2, xmm1
        vextractps        ecx, xmm2, 0x0
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_max::f64::acqrel:
        mov               rax, qword ptr [edi]
        vcmpunordsd       xmm1, xmm0, xmm0
        nop               dword ptr [rax]
0:
        vmovq             xmm2, rax
        vmaxsd            xmm3, xmm2, xmm0
        vblendvpd         xmm2, xmm3, xmm2, xmm1
        vmovq             rcx, xmm2
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_max::f64::seqcst:
        mov               rax, qword ptr [edi]
        vcmpunordsd       xmm1, xmm0, xmm0
        nop               dword ptr [rax]
0:
        vmovq             xmm2, rax
        vmaxsd            xmm3, xmm2, xmm0
        vblendvpd         xmm2, xmm3, xmm2, xmm1
        vmovq             rcx, xmm2
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_max::f64::acquire:
        mov               rax, qword ptr [edi]
        vcmpunordsd       xmm1, xmm0, xmm0
        nop               dword ptr [rax]
0:
        vmovq             xmm2, rax
        vmaxsd            xmm3, xmm2, xmm0
        vblendvpd         xmm2, xmm3, xmm2, xmm1
        vmovq             rcx, xmm2
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_max::f64::relaxed:
        mov               rax, qword ptr [edi]
        vcmpunordsd       xmm1, xmm0, xmm0
        nop               dword ptr [rax]
0:
        vmovq             xmm2, rax
        vmaxsd            xmm3, xmm2, xmm0
        vblendvpd         xmm2, xmm3, xmm2, xmm1
        vmovq             rcx, xmm2
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_max::f64::release:
        mov               rax, qword ptr [edi]
        vcmpunordsd       xmm1, xmm0, xmm0
        nop               dword ptr [rax]
0:
        vmovq             xmm2, rax
        vmaxsd            xmm3, xmm2, xmm0
        vblendvpd         xmm2, xmm3, xmm2, xmm1
        vmovq             rcx, xmm2
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
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

asm_test::fetch_min::f32::acqrel:
        mov               eax, dword ptr [edi]
        vcmpunordss       xmm1, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovd             xmm2, eax
        vminss            xmm3, xmm2, xmm0
        vblendvps         xmm2, xmm3, xmm2, xmm1
        vextractps        ecx, xmm2, 0x0
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_min::f32::seqcst:
        mov               eax, dword ptr [edi]
        vcmpunordss       xmm1, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovd             xmm2, eax
        vminss            xmm3, xmm2, xmm0
        vblendvps         xmm2, xmm3, xmm2, xmm1
        vextractps        ecx, xmm2, 0x0
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_min::f32::acquire:
        mov               eax, dword ptr [edi]
        vcmpunordss       xmm1, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovd             xmm2, eax
        vminss            xmm3, xmm2, xmm0
        vblendvps         xmm2, xmm3, xmm2, xmm1
        vextractps        ecx, xmm2, 0x0
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_min::f32::relaxed:
        mov               eax, dword ptr [edi]
        vcmpunordss       xmm1, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovd             xmm2, eax
        vminss            xmm3, xmm2, xmm0
        vblendvps         xmm2, xmm3, xmm2, xmm1
        vextractps        ecx, xmm2, 0x0
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_min::f32::release:
        mov               eax, dword ptr [edi]
        vcmpunordss       xmm1, xmm0, xmm0
        nop               dword ptr [rax + rax]
0:
        vmovd             xmm2, eax
        vminss            xmm3, xmm2, xmm0
        vblendvps         xmm2, xmm3, xmm2, xmm1
        vextractps        ecx, xmm2, 0x0
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_min::f64::acqrel:
        mov               rax, qword ptr [edi]
        vcmpunordsd       xmm1, xmm0, xmm0
        nop               dword ptr [rax]
0:
        vmovq             xmm2, rax
        vminsd            xmm3, xmm2, xmm0
        vblendvpd         xmm2, xmm3, xmm2, xmm1
        vmovq             rcx, xmm2
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_min::f64::seqcst:
        mov               rax, qword ptr [edi]
        vcmpunordsd       xmm1, xmm0, xmm0
        nop               dword ptr [rax]
0:
        vmovq             xmm2, rax
        vminsd            xmm3, xmm2, xmm0
        vblendvpd         xmm2, xmm3, xmm2, xmm1
        vmovq             rcx, xmm2
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_min::f64::acquire:
        mov               rax, qword ptr [edi]
        vcmpunordsd       xmm1, xmm0, xmm0
        nop               dword ptr [rax]
0:
        vmovq             xmm2, rax
        vminsd            xmm3, xmm2, xmm0
        vblendvpd         xmm2, xmm3, xmm2, xmm1
        vmovq             rcx, xmm2
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_min::f64::relaxed:
        mov               rax, qword ptr [edi]
        vcmpunordsd       xmm1, xmm0, xmm0
        nop               dword ptr [rax]
0:
        vmovq             xmm2, rax
        vminsd            xmm3, xmm2, xmm0
        vblendvpd         xmm2, xmm3, xmm2, xmm1
        vmovq             rcx, xmm2
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_min::f64::release:
        mov               rax, qword ptr [edi]
        vcmpunordsd       xmm1, xmm0, xmm0
        nop               dword ptr [rax]
0:
        vmovq             xmm2, rax
        vminsd            xmm3, xmm2, xmm0
        vblendvpd         xmm2, xmm3, xmm2, xmm1
        vmovq             rcx, xmm2
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
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

asm_test::fetch_neg::f32::acqrel:
        mov               eax, 0x80000000
        lock xadd         dword ptr [edi], eax
        vmovd             xmm0, eax
        ret

asm_test::fetch_neg::f32::seqcst:
        mov               eax, 0x80000000
        lock xadd         dword ptr [edi], eax
        vmovd             xmm0, eax
        ret

asm_test::fetch_neg::f32::acquire:
        mov               eax, 0x80000000
        lock xadd         dword ptr [edi], eax
        vmovd             xmm0, eax
        ret

asm_test::fetch_neg::f32::relaxed:
        mov               eax, 0x80000000
        lock xadd         dword ptr [edi], eax
        vmovd             xmm0, eax
        ret

asm_test::fetch_neg::f32::release:
        mov               eax, 0x80000000
        lock xadd         dword ptr [edi], eax
        vmovd             xmm0, eax
        ret

asm_test::fetch_neg::f64::acqrel:
        movabs            rax, -0x8000000000000000
        lock xadd         qword ptr [edi], rax
        vmovq             xmm0, rax
        ret

asm_test::fetch_neg::f64::seqcst:
        movabs            rax, -0x8000000000000000
        lock xadd         qword ptr [edi], rax
        vmovq             xmm0, rax
        ret

asm_test::fetch_neg::f64::acquire:
        movabs            rax, -0x8000000000000000
        lock xadd         qword ptr [edi], rax
        vmovq             xmm0, rax
        ret

asm_test::fetch_neg::f64::relaxed:
        movabs            rax, -0x8000000000000000
        lock xadd         qword ptr [edi], rax
        vmovq             xmm0, rax
        ret

asm_test::fetch_neg::f64::release:
        movabs            rax, -0x8000000000000000
        lock xadd         qword ptr [edi], rax
        vmovq             xmm0, rax
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
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_not::bool::seqcst:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_not::bool::acquire:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_not::bool::relaxed:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_not::bool::release:
        lock xor          byte ptr [edi], 0x1
        sete              al
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

asm_test::fetch_sub::u8::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_sub::u8::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_sub::u8::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_sub::u8::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_sub::u8::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
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

asm_test::fetch_sub::f32::acqrel_zero:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      dword ptr [edi], eax
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_sub::f32::seqcst_zero:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      dword ptr [edi], eax
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_sub::f32::acquire_zero:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      dword ptr [edi], eax
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_sub::f32::relaxed_zero:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      dword ptr [edi], eax
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_sub::f32::release_zero:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      dword ptr [edi], eax
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_sub::f32::acqrel:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovd             xmm1, eax
        vsubss            xmm1, xmm1, xmm0
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_sub::f32::seqcst:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovd             xmm1, eax
        vsubss            xmm1, xmm1, xmm0
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_sub::f32::acquire:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovd             xmm1, eax
        vsubss            xmm1, xmm1, xmm0
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_sub::f32::relaxed:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovd             xmm1, eax
        vsubss            xmm1, xmm1, xmm0
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_sub::f32::release:
        mov               eax, dword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovd             xmm1, eax
        vsubss            xmm1, xmm1, xmm0
        vmovd             ecx, xmm1
        lock cmpxchg      dword ptr [edi], ecx
        jne               0b
        vmovd             xmm0, eax
        ret

asm_test::fetch_sub::f64::acqrel_zero:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      qword ptr [edi], rax
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_sub::f64::seqcst_zero:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      qword ptr [edi], rax
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_sub::f64::acquire_zero:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      qword ptr [edi], rax
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_sub::f64::relaxed_zero:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      qword ptr [edi], rax
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_sub::f64::release_zero:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      qword ptr [edi], rax
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_sub::f64::acqrel:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovq             xmm1, rax
        vsubsd            xmm1, xmm1, xmm0
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_sub::f64::seqcst:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovq             xmm1, rax
        vsubsd            xmm1, xmm1, xmm0
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_sub::f64::acquire:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovq             xmm1, rax
        vsubsd            xmm1, xmm1, xmm0
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_sub::f64::relaxed:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovq             xmm1, rax
        vsubsd            xmm1, xmm1, xmm0
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_sub::f64::release:
        mov               rax, qword ptr [edi]
        nop               word ptr cs:[rax + rax]
0:
        vmovq             xmm1, rax
        vsubsd            xmm1, xmm1, xmm0
        vmovq             rcx, xmm1
        lock cmpxchg      qword ptr [edi], rcx
        jne               0b
        vmovq             xmm0, rax
        ret

asm_test::fetch_sub::u16::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_sub::u16::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_sub::u16::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_sub::u16::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_sub::u16::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
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

asm_test::fetch_sub::u32::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_sub::u32::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_sub::u32::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_sub::u32::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_sub::u32::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
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

asm_test::fetch_sub::u64::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_sub::u64::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_sub::u64::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_sub::u64::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_sub::u64::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
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

asm_test::fetch_sub::u128::acqrel_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_sub::u128::seqcst_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_sub::u128::acquire_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_sub::u128::relaxed_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_sub::u128::release_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_xor::u8::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_xor::u8::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_xor::u8::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_xor::u8::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
        ret

asm_test::fetch_xor::u8::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, byte ptr [edi]
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

asm_test::fetch_xor::u16::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_xor::u16::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_xor::u16::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_xor::u16::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
        ret

asm_test::fetch_xor::u16::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        movzx             eax, word ptr [edi]
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

asm_test::fetch_xor::u32::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_xor::u32::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_xor::u32::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_xor::u32::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
        ret

asm_test::fetch_xor::u32::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               eax, dword ptr [edi]
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

asm_test::fetch_xor::u64::acqrel_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_xor::u64::seqcst_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_xor::u64::acquire_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_xor::u64::relaxed_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
        ret

asm_test::fetch_xor::u64::release_zero:
        lock or           dword ptr [rsp - 0x40], 0x0
        mov               rax, qword ptr [edi]
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

asm_test::fetch_xor::bool::acqrel_true:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_xor::bool::seqcst_true:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_xor::bool::acqrel_false:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_xor::bool::acquire_true:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_xor::bool::relaxed_true:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_xor::bool::release_true:
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret

asm_test::fetch_xor::bool::seqcst_false:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_xor::bool::acquire_false:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_xor::bool::relaxed_false:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_xor::bool::release_false:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_xor::bool::acqrel:
        test              esi, esi
        je                0f
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret
0:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_xor::bool::seqcst:
        test              esi, esi
        je                0f
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret
0:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_xor::bool::acquire:
        test              esi, esi
        je                0f
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret
0:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_xor::bool::relaxed:
        test              esi, esi
        je                0f
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret
0:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_xor::bool::release:
        test              esi, esi
        je                0f
        lock xor          byte ptr [edi], 0x1
        sete              al
        ret
0:
        xor               eax, eax
        lock xadd         byte ptr [edi], al
        ret

asm_test::fetch_xor::u128::acqrel_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_xor::u128::seqcst_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_xor::u128::acquire_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_xor::u128::relaxed_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

asm_test::fetch_xor::u128::release_zero:
        mov               r11, rdi
        mov               edi, esi
        xor               r8d, r8d
        xor               r9d, r9d
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

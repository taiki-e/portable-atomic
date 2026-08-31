asm_test::fence::acqrel:
        ret

asm_test::fence::seqcst:
        push              rax
        mov               rax, rsp
        xchg              qword ptr [rax], rcx
        pop               rax
        ret

asm_test::fence::acquire:
        ret

asm_test::fence::release:
        ret

asm_test::bit_toggle::u8::acqrel:
        mov               eax, edx
        mov               rdx, rcx
        and               al, 0x7
        mov               r8b, 0x1
        mov               ecx, eax
        shl               r8b, cl
        movzx             eax, byte ptr [rdx]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, r8b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_toggle::u8::seqcst:
        mov               eax, edx
        mov               rdx, rcx
        and               al, 0x7
        mov               r8b, 0x1
        mov               ecx, eax
        shl               r8b, cl
        movzx             eax, byte ptr [rdx]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, r8b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_toggle::u8::acquire:
        mov               eax, edx
        mov               rdx, rcx
        and               al, 0x7
        mov               r8b, 0x1
        mov               ecx, eax
        shl               r8b, cl
        movzx             eax, byte ptr [rdx]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, r8b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_toggle::u8::relaxed:
        mov               eax, edx
        mov               rdx, rcx
        and               al, 0x7
        mov               r8b, 0x1
        mov               ecx, eax
        shl               r8b, cl
        movzx             eax, byte ptr [rdx]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, r8b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_toggle::u8::release:
        mov               eax, edx
        mov               rdx, rcx
        and               al, 0x7
        mov               r8b, 0x1
        mov               ecx, eax
        shl               r8b, cl
        movzx             eax, byte ptr [rdx]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        xor               cl, r8b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_toggle::u16::acqrel:
        and               edx, 0xf
        lock btc          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_toggle::u16::seqcst:
        and               edx, 0xf
        lock btc          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_toggle::u16::acquire:
        and               edx, 0xf
        lock btc          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_toggle::u16::relaxed:
        and               edx, 0xf
        lock btc          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_toggle::u16::release:
        and               edx, 0xf
        lock btc          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_toggle::u32::acqrel:
        and               edx, 0x1f
        lock btc          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_toggle::u32::seqcst:
        and               edx, 0x1f
        lock btc          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_toggle::u32::acquire:
        and               edx, 0x1f
        lock btc          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_toggle::u32::relaxed:
        and               edx, 0x1f
        lock btc          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_toggle::u32::release:
        and               edx, 0x1f
        lock btc          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_toggle::u64::acqrel:
        and               edx, 0x3f
        lock btc          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_toggle::u64::seqcst:
        and               edx, 0x3f
        lock btc          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_toggle::u64::acquire:
        and               edx, 0x3f
        lock btc          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_toggle::u64::relaxed:
        and               edx, 0x3f
        lock btc          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_toggle::u64::release:
        and               edx, 0x3f
        lock btc          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_toggle::u128::acqrel:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::bit_toggle::u128::seqcst:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::bit_toggle::u128::acquire:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::bit_toggle::u128::relaxed:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::bit_toggle::u128::release:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::fetch_nand::u8::acqrel_all:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::seqcst_all:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::acqrel_zero:
        movzx             eax, byte ptr [rcx]
        mov               dl, -0x1
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::acquire_all:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::relaxed_all:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::release_all:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::seqcst_zero:
        movzx             eax, byte ptr [rcx]
        mov               dl, -0x1
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::acquire_zero:
        movzx             eax, byte ptr [rcx]
        mov               dl, -0x1
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::relaxed_zero:
        movzx             eax, byte ptr [rcx]
        mov               dl, -0x1
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::release_zero:
        movzx             eax, byte ptr [rcx]
        mov               dl, -0x1
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        ret

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

asm_test::fetch_nand::u16::acqrel_all:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::seqcst_all:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::acqrel_zero:
        movzx             eax, word ptr [rcx]
        mov               dx, 0xffff
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::acquire_all:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::relaxed_all:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::release_all:
        movzx             eax, word ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::seqcst_zero:
        movzx             eax, word ptr [rcx]
        mov               dx, 0xffff
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::acquire_zero:
        movzx             eax, word ptr [rcx]
        mov               dx, 0xffff
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::relaxed_zero:
        movzx             eax, word ptr [rcx]
        mov               dx, 0xffff
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      word ptr [rcx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::release_zero:
        movzx             eax, word ptr [rcx]
        mov               dx, 0xffff
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      word ptr [rcx], dx
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

asm_test::fetch_nand::u32::acqrel_all:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::seqcst_all:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::acqrel_zero:
        mov               eax, dword ptr [rcx]
        mov               edx, 0xffffffff
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::acquire_all:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::relaxed_all:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::release_all:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::seqcst_zero:
        mov               eax, dword ptr [rcx]
        mov               edx, 0xffffffff
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::acquire_zero:
        mov               eax, dword ptr [rcx]
        mov               edx, 0xffffffff
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::relaxed_zero:
        mov               eax, dword ptr [rcx]
        mov               edx, 0xffffffff
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::release_zero:
        mov               eax, dword ptr [rcx]
        mov               edx, 0xffffffff
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      dword ptr [rcx], edx
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

asm_test::fetch_nand::u64::acqrel_all:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        not               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_nand::u64::seqcst_all:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        not               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_nand::u64::acqrel_zero:
        mov               rax, qword ptr [rcx]
        mov               rdx, -0x1
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_nand::u64::acquire_all:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        not               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_nand::u64::relaxed_all:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        not               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_nand::u64::release_all:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               rdx, rax
        not               rdx
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_nand::u64::seqcst_zero:
        mov               rax, qword ptr [rcx]
        mov               rdx, -0x1
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_nand::u64::acquire_zero:
        mov               rax, qword ptr [rcx]
        mov               rdx, -0x1
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_nand::u64::relaxed_zero:
        mov               rax, qword ptr [rcx]
        mov               rdx, -0x1
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        ret

asm_test::fetch_nand::u64::release_zero:
        mov               rax, qword ptr [rcx]
        mov               rdx, -0x1
        nop               word ptr [rax + rax]
0:
        lock cmpxchg      qword ptr [rcx], rdx
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

asm_test::fetch_nand::bool::acqrel_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::seqcst_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::acqrel_false:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::acquire_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::relaxed_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::release_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::seqcst_false:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::acquire_false:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::relaxed_false:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::release_false:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::acqrel:
        test              dl, dl
        je                1f
        movzx             eax, byte ptr [rcx]
        nop               word ptr [rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::seqcst:
        test              dl, dl
        je                1f
        movzx             eax, byte ptr [rcx]
        nop               word ptr [rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::acquire:
        test              dl, dl
        je                1f
        movzx             eax, byte ptr [rcx]
        nop               word ptr [rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::relaxed:
        test              dl, dl
        je                1f
        movzx             eax, byte ptr [rcx]
        nop               word ptr [rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::release:
        test              dl, dl
        je                1f
        movzx             eax, byte ptr [rcx]
        nop               word ptr [rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::u128::acqrel_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::seqcst_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::acqrel_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::acquire_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::relaxed_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::release_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::seqcst_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::acquire_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::relaxed_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::release_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::acqrel:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_nand::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        not               rbx
        mov               rcx, rdx
        and               rcx, r9
        not               rcx
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
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
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovb             rcx, rdx
        mov               rbx, r8
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_umax::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovb             rcx, rdx
        mov               rbx, r8
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_umax::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovb             rcx, rdx
        mov               rbx, r8
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_umax::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovb             rcx, rdx
        mov               rbx, r8
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_umax::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovb             rcx, rdx
        mov               rbx, r8
        cmovb             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
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
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovae            rcx, rdx
        mov               rbx, r8
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_umin::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovae            rcx, rdx
        mov               rbx, r8
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_umin::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovae            rcx, rdx
        mov               rbx, r8
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_umin::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovae            rcx, rdx
        mov               rbx, r8
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_umin::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovae            rcx, rdx
        mov               rbx, r8
        cmovae            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
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

asm_test::compare_exchange::f32::acqrel_seqcst:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::seqcst_seqcst:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::acqrel_acquire:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::acqrel_relaxed:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::acquire_seqcst:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::relaxed_seqcst:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::release_seqcst:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::seqcst_acquire:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::seqcst_relaxed:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::acquire_acquire:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::acquire_relaxed:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::relaxed_acquire:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::relaxed_relaxed:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::release_acquire:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f32::release_relaxed:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange::f64::acqrel_seqcst:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::seqcst_seqcst:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::acqrel_acquire:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::acqrel_relaxed:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::acquire_seqcst:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::relaxed_seqcst:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::release_seqcst:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::seqcst_acquire:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::seqcst_relaxed:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::acquire_acquire:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::acquire_relaxed:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::relaxed_acquire:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::relaxed_relaxed:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::release_acquire:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange::f64::release_relaxed:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
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

asm_test::compare_exchange::bool::acqrel_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_seqcst_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_acquire_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_relaxed_true_true:
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_seqcst_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_seqcst_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_acquire_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_acquire_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_relaxed_false_true:
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_relaxed_true_false:
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_seqcst_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_acquire_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_relaxed_false_false:
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [rcx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::u128::acqrel_seqcst:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::seqcst_seqcst:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::acqrel_acquire:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::acqrel_relaxed:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::acquire_seqcst:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::relaxed_seqcst:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::release_seqcst:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::seqcst_acquire:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::seqcst_relaxed:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::acquire_acquire:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::acquire_relaxed:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::relaxed_acquire:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::relaxed_relaxed:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::release_acquire:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange::u128::release_relaxed:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
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

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::acqrel_acquire:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::acqrel_relaxed:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::acquire_seqcst:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::relaxed_seqcst:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::release_seqcst:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::seqcst_acquire:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::acquire_acquire:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::acquire_relaxed:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::relaxed_acquire:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::relaxed_relaxed:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::release_acquire:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f32::release_relaxed:
        movd              eax, xmm1
        movd              r8d, xmm2
        xor               edx, edx
        lock cmpxchg      dword ptr [rcx], r8d
        setne             dl
        movd              xmm0, eax
        mov               eax, edx
        ret

asm_test::compare_exchange_weak::f64::acqrel_seqcst:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::seqcst_seqcst:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::acqrel_acquire:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::acqrel_relaxed:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::acquire_seqcst:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::relaxed_seqcst:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::release_seqcst:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::seqcst_acquire:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::seqcst_relaxed:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::acquire_acquire:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::acquire_relaxed:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::relaxed_acquire:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::relaxed_relaxed:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::release_acquire:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
        ret

asm_test::compare_exchange_weak::f64::release_relaxed:
        movq              rax, xmm1
        movq              r8, xmm2
        xor               edx, edx
        lock cmpxchg      qword ptr [rcx], r8
        setne             dl
        movq              xmm0, rax
        mov               rax, rdx
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

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        mov               eax, edx
        lock cmpxchg      byte ptr [rcx], r8b
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u128::acqrel_seqcst:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::seqcst_seqcst:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::acqrel_acquire:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::acqrel_relaxed:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::acquire_seqcst:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::relaxed_seqcst:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::release_seqcst:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::seqcst_acquire:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::seqcst_relaxed:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::acquire_acquire:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::acquire_relaxed:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::relaxed_acquire:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::relaxed_relaxed:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::release_acquire:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::compare_exchange_weak::u128::release_relaxed:
        mov               rax, r8
        mov               r10, rcx
        mov               r8, qword ptr [rsp + 0x28]
        mov               rcx, qword ptr [rsp + 0x30]
        mov               r11, rdx
        mov               rdx, r9
        xchg              r8, rbx
        lock cmpxchg16b   xmmword ptr [r11]
        setne             cl
        mov               rbx, r8
        movzx             ecx, cl
        mov               qword ptr [r10 + 0x18], rdx
        mov               qword ptr [r10 + 0x10], rax
        mov               qword ptr [r10], rcx
        mov               qword ptr [r10 + 0x8], 0x0
        mov               rax, r10
        ret

asm_test::or::u8::acqrel_all:
        mov               al, -0x1
        xchg              byte ptr [rcx], al
        ret

asm_test::or::u8::seqcst_all:
        mov               al, -0x1
        xchg              byte ptr [rcx], al
        ret

asm_test::or::u8::acqrel_zero:
        ret

asm_test::or::u8::acquire_all:
        mov               al, -0x1
        xchg              byte ptr [rcx], al
        ret

asm_test::or::u8::relaxed_all:
        mov               al, -0x1
        xchg              byte ptr [rcx], al
        ret

asm_test::or::u8::release_all:
        mov               al, -0x1
        xchg              byte ptr [rcx], al
        ret

asm_test::or::u8::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::or::u8::acquire_zero:
        ret

asm_test::or::u8::relaxed_zero:
        ret

asm_test::or::u8::release_zero:
        ret

asm_test::or::u8::acqrel:
        lock or           byte ptr [rcx], dl
        ret

asm_test::or::u8::seqcst:
        lock or           byte ptr [rcx], dl
        ret

asm_test::or::u8::acquire:
        lock or           byte ptr [rcx], dl
        ret

asm_test::or::u8::relaxed:
        lock or           byte ptr [rcx], dl
        ret

asm_test::or::u8::release:
        lock or           byte ptr [rcx], dl
        ret

asm_test::or::u16::acqrel_all:
        mov               ax, 0xffff
        xchg              word ptr [rcx], ax
        ret

asm_test::or::u16::seqcst_all:
        mov               ax, 0xffff
        xchg              word ptr [rcx], ax
        ret

asm_test::or::u16::acqrel_zero:
        ret

asm_test::or::u16::acquire_all:
        mov               ax, 0xffff
        xchg              word ptr [rcx], ax
        ret

asm_test::or::u16::relaxed_all:
        mov               ax, 0xffff
        xchg              word ptr [rcx], ax
        ret

asm_test::or::u16::release_all:
        mov               ax, 0xffff
        xchg              word ptr [rcx], ax
        ret

asm_test::or::u16::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::or::u16::acquire_zero:
        ret

asm_test::or::u16::relaxed_zero:
        ret

asm_test::or::u16::release_zero:
        ret

asm_test::or::u16::acqrel:
        lock or           word ptr [rcx], dx
        ret

asm_test::or::u16::seqcst:
        lock or           word ptr [rcx], dx
        ret

asm_test::or::u16::acquire:
        lock or           word ptr [rcx], dx
        ret

asm_test::or::u16::relaxed:
        lock or           word ptr [rcx], dx
        ret

asm_test::or::u16::release:
        lock or           word ptr [rcx], dx
        ret

asm_test::or::u32::acqrel_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [rcx], eax
        ret

asm_test::or::u32::seqcst_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [rcx], eax
        ret

asm_test::or::u32::acqrel_zero:
        ret

asm_test::or::u32::acquire_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [rcx], eax
        ret

asm_test::or::u32::relaxed_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [rcx], eax
        ret

asm_test::or::u32::release_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [rcx], eax
        ret

asm_test::or::u32::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::or::u32::acquire_zero:
        ret

asm_test::or::u32::relaxed_zero:
        ret

asm_test::or::u32::release_zero:
        ret

asm_test::or::u32::acqrel:
        lock or           dword ptr [rcx], edx
        ret

asm_test::or::u32::seqcst:
        lock or           dword ptr [rcx], edx
        ret

asm_test::or::u32::acquire:
        lock or           dword ptr [rcx], edx
        ret

asm_test::or::u32::relaxed:
        lock or           dword ptr [rcx], edx
        ret

asm_test::or::u32::release:
        lock or           dword ptr [rcx], edx
        ret

asm_test::or::u64::acqrel_all:
        mov               rax, -0x1
        xchg              qword ptr [rcx], rax
        ret

asm_test::or::u64::seqcst_all:
        mov               rax, -0x1
        xchg              qword ptr [rcx], rax
        ret

asm_test::or::u64::acqrel_zero:
        ret

asm_test::or::u64::acquire_all:
        mov               rax, -0x1
        xchg              qword ptr [rcx], rax
        ret

asm_test::or::u64::relaxed_all:
        mov               rax, -0x1
        xchg              qword ptr [rcx], rax
        ret

asm_test::or::u64::release_all:
        mov               rax, -0x1
        xchg              qword ptr [rcx], rax
        ret

asm_test::or::u64::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::or::u64::acquire_zero:
        ret

asm_test::or::u64::relaxed_zero:
        ret

asm_test::or::u64::release_zero:
        ret

asm_test::or::u64::acqrel:
        lock or           qword ptr [rcx], rdx
        ret

asm_test::or::u64::seqcst:
        lock or           qword ptr [rcx], rdx
        ret

asm_test::or::u64::acquire:
        lock or           qword ptr [rcx], rdx
        ret

asm_test::or::u64::relaxed:
        lock or           qword ptr [rcx], rdx
        ret

asm_test::or::u64::release:
        lock or           qword ptr [rcx], rdx
        ret

asm_test::or::bool::acqrel_true:
        lock or           byte ptr [rcx], 0x1
        ret

asm_test::or::bool::seqcst_true:
        lock or           byte ptr [rcx], 0x1
        ret

asm_test::or::bool::acqrel_false:
        ret

asm_test::or::bool::acquire_true:
        lock or           byte ptr [rcx], 0x1
        ret

asm_test::or::bool::relaxed_true:
        lock or           byte ptr [rcx], 0x1
        ret

asm_test::or::bool::release_true:
        lock or           byte ptr [rcx], 0x1
        ret

asm_test::or::bool::seqcst_false:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::or::bool::acquire_false:
        ret

asm_test::or::bool::relaxed_false:
        ret

asm_test::or::bool::release_false:
        ret

asm_test::or::bool::acqrel:
        lock or           byte ptr [rcx], dl
        ret

asm_test::or::bool::seqcst:
        lock or           byte ptr [rcx], dl
        ret

asm_test::or::bool::acquire:
        lock or           byte ptr [rcx], dl
        ret

asm_test::or::bool::relaxed:
        lock or           byte ptr [rcx], dl
        ret

asm_test::or::bool::release:
        lock or           byte ptr [rcx], dl
        ret

asm_test::or::u128::acqrel_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::seqcst_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::acqrel_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::acquire_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::relaxed_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::release_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::seqcst_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::acquire_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::relaxed_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::release_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::acqrel:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::or::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::add::u8::acqrel_zero:
        ret

asm_test::add::u8::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::add::u8::acquire_zero:
        ret

asm_test::add::u8::relaxed_zero:
        ret

asm_test::add::u8::release_zero:
        ret

asm_test::add::u8::acqrel:
        lock add          byte ptr [rcx], dl
        ret

asm_test::add::u8::seqcst:
        lock add          byte ptr [rcx], dl
        ret

asm_test::add::u8::acquire:
        lock add          byte ptr [rcx], dl
        ret

asm_test::add::u8::relaxed:
        lock add          byte ptr [rcx], dl
        ret

asm_test::add::u8::release:
        lock add          byte ptr [rcx], dl
        ret

asm_test::add::u16::acqrel_zero:
        ret

asm_test::add::u16::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::add::u16::acquire_zero:
        ret

asm_test::add::u16::relaxed_zero:
        ret

asm_test::add::u16::release_zero:
        ret

asm_test::add::u16::acqrel:
        lock add          word ptr [rcx], dx
        ret

asm_test::add::u16::seqcst:
        lock add          word ptr [rcx], dx
        ret

asm_test::add::u16::acquire:
        lock add          word ptr [rcx], dx
        ret

asm_test::add::u16::relaxed:
        lock add          word ptr [rcx], dx
        ret

asm_test::add::u16::release:
        lock add          word ptr [rcx], dx
        ret

asm_test::add::u32::acqrel_zero:
        ret

asm_test::add::u32::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::add::u32::acquire_zero:
        ret

asm_test::add::u32::relaxed_zero:
        ret

asm_test::add::u32::release_zero:
        ret

asm_test::add::u32::acqrel:
        lock add          dword ptr [rcx], edx
        ret

asm_test::add::u32::seqcst:
        lock add          dword ptr [rcx], edx
        ret

asm_test::add::u32::acquire:
        lock add          dword ptr [rcx], edx
        ret

asm_test::add::u32::relaxed:
        lock add          dword ptr [rcx], edx
        ret

asm_test::add::u32::release:
        lock add          dword ptr [rcx], edx
        ret

asm_test::add::u64::acqrel_zero:
        ret

asm_test::add::u64::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::add::u64::acquire_zero:
        ret

asm_test::add::u64::relaxed_zero:
        ret

asm_test::add::u64::release_zero:
        ret

asm_test::add::u64::acqrel:
        lock add          qword ptr [rcx], rdx
        ret

asm_test::add::u64::seqcst:
        lock add          qword ptr [rcx], rdx
        ret

asm_test::add::u64::acquire:
        lock add          qword ptr [rcx], rdx
        ret

asm_test::add::u64::relaxed:
        lock add          qword ptr [rcx], rdx
        ret

asm_test::add::u64::release:
        lock add          qword ptr [rcx], rdx
        ret

asm_test::add::u128::acqrel_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::add::u128::seqcst_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::add::u128::acquire_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::add::u128::relaxed_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::add::u128::release_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::add::u128::acqrel:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::add::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::add::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::add::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::add::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u8::acqrel_all:
        ret

asm_test::and::u8::seqcst_all:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::and::u8::acqrel_zero:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::and::u8::acquire_all:
        ret

asm_test::and::u8::relaxed_all:
        ret

asm_test::and::u8::release_all:
        ret

asm_test::and::u8::seqcst_zero:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::and::u8::acquire_zero:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::and::u8::relaxed_zero:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::and::u8::release_zero:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::and::u8::acqrel:
        lock and          byte ptr [rcx], dl
        ret

asm_test::and::u8::seqcst:
        lock and          byte ptr [rcx], dl
        ret

asm_test::and::u8::acquire:
        lock and          byte ptr [rcx], dl
        ret

asm_test::and::u8::relaxed:
        lock and          byte ptr [rcx], dl
        ret

asm_test::and::u8::release:
        lock and          byte ptr [rcx], dl
        ret

asm_test::and::u16::acqrel_all:
        ret

asm_test::and::u16::seqcst_all:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::and::u16::acqrel_zero:
        xor               eax, eax
        xchg              word ptr [rcx], ax
        ret

asm_test::and::u16::acquire_all:
        ret

asm_test::and::u16::relaxed_all:
        ret

asm_test::and::u16::release_all:
        ret

asm_test::and::u16::seqcst_zero:
        xor               eax, eax
        xchg              word ptr [rcx], ax
        ret

asm_test::and::u16::acquire_zero:
        xor               eax, eax
        xchg              word ptr [rcx], ax
        ret

asm_test::and::u16::relaxed_zero:
        xor               eax, eax
        xchg              word ptr [rcx], ax
        ret

asm_test::and::u16::release_zero:
        xor               eax, eax
        xchg              word ptr [rcx], ax
        ret

asm_test::and::u16::acqrel:
        lock and          word ptr [rcx], dx
        ret

asm_test::and::u16::seqcst:
        lock and          word ptr [rcx], dx
        ret

asm_test::and::u16::acquire:
        lock and          word ptr [rcx], dx
        ret

asm_test::and::u16::relaxed:
        lock and          word ptr [rcx], dx
        ret

asm_test::and::u16::release:
        lock and          word ptr [rcx], dx
        ret

asm_test::and::u32::acqrel_all:
        ret

asm_test::and::u32::seqcst_all:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::and::u32::acqrel_zero:
        xor               eax, eax
        xchg              dword ptr [rcx], eax
        ret

asm_test::and::u32::acquire_all:
        ret

asm_test::and::u32::relaxed_all:
        ret

asm_test::and::u32::release_all:
        ret

asm_test::and::u32::seqcst_zero:
        xor               eax, eax
        xchg              dword ptr [rcx], eax
        ret

asm_test::and::u32::acquire_zero:
        xor               eax, eax
        xchg              dword ptr [rcx], eax
        ret

asm_test::and::u32::relaxed_zero:
        xor               eax, eax
        xchg              dword ptr [rcx], eax
        ret

asm_test::and::u32::release_zero:
        xor               eax, eax
        xchg              dword ptr [rcx], eax
        ret

asm_test::and::u32::acqrel:
        lock and          dword ptr [rcx], edx
        ret

asm_test::and::u32::seqcst:
        lock and          dword ptr [rcx], edx
        ret

asm_test::and::u32::acquire:
        lock and          dword ptr [rcx], edx
        ret

asm_test::and::u32::relaxed:
        lock and          dword ptr [rcx], edx
        ret

asm_test::and::u32::release:
        lock and          dword ptr [rcx], edx
        ret

asm_test::and::u64::acqrel_all:
        ret

asm_test::and::u64::seqcst_all:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::and::u64::acqrel_zero:
        xor               eax, eax
        xchg              qword ptr [rcx], rax
        ret

asm_test::and::u64::acquire_all:
        ret

asm_test::and::u64::relaxed_all:
        ret

asm_test::and::u64::release_all:
        ret

asm_test::and::u64::seqcst_zero:
        xor               eax, eax
        xchg              qword ptr [rcx], rax
        ret

asm_test::and::u64::acquire_zero:
        xor               eax, eax
        xchg              qword ptr [rcx], rax
        ret

asm_test::and::u64::relaxed_zero:
        xor               eax, eax
        xchg              qword ptr [rcx], rax
        ret

asm_test::and::u64::release_zero:
        xor               eax, eax
        xchg              qword ptr [rcx], rax
        ret

asm_test::and::u64::acqrel:
        lock and          qword ptr [rcx], rdx
        ret

asm_test::and::u64::seqcst:
        lock and          qword ptr [rcx], rdx
        ret

asm_test::and::u64::acquire:
        lock and          qword ptr [rcx], rdx
        ret

asm_test::and::u64::relaxed:
        lock and          qword ptr [rcx], rdx
        ret

asm_test::and::u64::release:
        lock and          qword ptr [rcx], rdx
        ret

asm_test::and::bool::acqrel_true:
        lock and          byte ptr [rcx], 0x1
        ret

asm_test::and::bool::seqcst_true:
        lock and          byte ptr [rcx], 0x1
        ret

asm_test::and::bool::acqrel_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::and::bool::acquire_true:
        lock and          byte ptr [rcx], 0x1
        ret

asm_test::and::bool::relaxed_true:
        lock and          byte ptr [rcx], 0x1
        ret

asm_test::and::bool::release_true:
        lock and          byte ptr [rcx], 0x1
        ret

asm_test::and::bool::seqcst_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::and::bool::acquire_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::and::bool::relaxed_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::and::bool::release_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::and::bool::acqrel:
        lock and          byte ptr [rcx], dl
        ret

asm_test::and::bool::seqcst:
        lock and          byte ptr [rcx], dl
        ret

asm_test::and::bool::acquire:
        lock and          byte ptr [rcx], dl
        ret

asm_test::and::bool::relaxed:
        lock and          byte ptr [rcx], dl
        ret

asm_test::and::bool::release:
        lock and          byte ptr [rcx], dl
        ret

asm_test::and::u128::acqrel_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::seqcst_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::acqrel_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::acquire_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::relaxed_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::release_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::seqcst_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::acquire_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::relaxed_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::release_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::acqrel:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::and::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::neg::u8::acqrel:
        lock neg          byte ptr [rcx]
        ret

asm_test::neg::u8::seqcst:
        lock neg          byte ptr [rcx]
        ret

asm_test::neg::u8::acquire:
        lock neg          byte ptr [rcx]
        ret

asm_test::neg::u8::relaxed:
        lock neg          byte ptr [rcx]
        ret

asm_test::neg::u8::release:
        lock neg          byte ptr [rcx]
        ret

asm_test::neg::u16::acqrel:
        lock neg          word ptr [rcx]
        ret

asm_test::neg::u16::seqcst:
        lock neg          word ptr [rcx]
        ret

asm_test::neg::u16::acquire:
        lock neg          word ptr [rcx]
        ret

asm_test::neg::u16::relaxed:
        lock neg          word ptr [rcx]
        ret

asm_test::neg::u16::release:
        lock neg          word ptr [rcx]
        ret

asm_test::neg::u32::acqrel:
        lock neg          dword ptr [rcx]
        ret

asm_test::neg::u32::seqcst:
        lock neg          dword ptr [rcx]
        ret

asm_test::neg::u32::acquire:
        lock neg          dword ptr [rcx]
        ret

asm_test::neg::u32::relaxed:
        lock neg          dword ptr [rcx]
        ret

asm_test::neg::u32::release:
        lock neg          dword ptr [rcx]
        ret

asm_test::neg::u64::acqrel:
        lock neg          qword ptr [rcx]
        ret

asm_test::neg::u64::seqcst:
        lock neg          qword ptr [rcx]
        ret

asm_test::neg::u64::acquire:
        lock neg          qword ptr [rcx]
        ret

asm_test::neg::u64::relaxed:
        lock neg          qword ptr [rcx]
        ret

asm_test::neg::u64::release:
        lock neg          qword ptr [rcx]
        ret

asm_test::neg::u128::acqrel:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::neg::u128::seqcst:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::neg::u128::acquire:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::neg::u128::relaxed:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::neg::u128::release:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::not::u8::acqrel:
        lock not          byte ptr [rcx]
        ret

asm_test::not::u8::seqcst:
        lock not          byte ptr [rcx]
        ret

asm_test::not::u8::acquire:
        lock not          byte ptr [rcx]
        ret

asm_test::not::u8::relaxed:
        lock not          byte ptr [rcx]
        ret

asm_test::not::u8::release:
        lock not          byte ptr [rcx]
        ret

asm_test::not::u16::acqrel:
        lock not          word ptr [rcx]
        ret

asm_test::not::u16::seqcst:
        lock not          word ptr [rcx]
        ret

asm_test::not::u16::acquire:
        lock not          word ptr [rcx]
        ret

asm_test::not::u16::relaxed:
        lock not          word ptr [rcx]
        ret

asm_test::not::u16::release:
        lock not          word ptr [rcx]
        ret

asm_test::not::u32::acqrel:
        lock not          dword ptr [rcx]
        ret

asm_test::not::u32::seqcst:
        lock not          dword ptr [rcx]
        ret

asm_test::not::u32::acquire:
        lock not          dword ptr [rcx]
        ret

asm_test::not::u32::relaxed:
        lock not          dword ptr [rcx]
        ret

asm_test::not::u32::release:
        lock not          dword ptr [rcx]
        ret

asm_test::not::u64::acqrel:
        lock not          qword ptr [rcx]
        ret

asm_test::not::u64::seqcst:
        lock not          qword ptr [rcx]
        ret

asm_test::not::u64::acquire:
        lock not          qword ptr [rcx]
        ret

asm_test::not::u64::relaxed:
        lock not          qword ptr [rcx]
        ret

asm_test::not::u64::release:
        lock not          qword ptr [rcx]
        ret

asm_test::not::bool::acqrel:
        lock xor          byte ptr [rcx], 0x1
        ret

asm_test::not::bool::seqcst:
        lock xor          byte ptr [rcx], 0x1
        ret

asm_test::not::bool::acquire:
        lock xor          byte ptr [rcx], 0x1
        ret

asm_test::not::bool::relaxed:
        lock xor          byte ptr [rcx], 0x1
        ret

asm_test::not::bool::release:
        lock xor          byte ptr [rcx], 0x1
        ret

asm_test::not::u128::acqrel:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::not::u128::seqcst:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::not::u128::acquire:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::not::u128::relaxed:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::not::u128::release:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::sub::u8::acqrel_zero:
        ret

asm_test::sub::u8::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::sub::u8::acquire_zero:
        ret

asm_test::sub::u8::relaxed_zero:
        ret

asm_test::sub::u8::release_zero:
        ret

asm_test::sub::u8::acqrel:
        lock sub          byte ptr [rcx], dl
        ret

asm_test::sub::u8::seqcst:
        lock sub          byte ptr [rcx], dl
        ret

asm_test::sub::u8::acquire:
        lock sub          byte ptr [rcx], dl
        ret

asm_test::sub::u8::relaxed:
        lock sub          byte ptr [rcx], dl
        ret

asm_test::sub::u8::release:
        lock sub          byte ptr [rcx], dl
        ret

asm_test::sub::u16::acqrel_zero:
        ret

asm_test::sub::u16::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::sub::u16::acquire_zero:
        ret

asm_test::sub::u16::relaxed_zero:
        ret

asm_test::sub::u16::release_zero:
        ret

asm_test::sub::u16::acqrel:
        lock sub          word ptr [rcx], dx
        ret

asm_test::sub::u16::seqcst:
        lock sub          word ptr [rcx], dx
        ret

asm_test::sub::u16::acquire:
        lock sub          word ptr [rcx], dx
        ret

asm_test::sub::u16::relaxed:
        lock sub          word ptr [rcx], dx
        ret

asm_test::sub::u16::release:
        lock sub          word ptr [rcx], dx
        ret

asm_test::sub::u32::acqrel_zero:
        ret

asm_test::sub::u32::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::sub::u32::acquire_zero:
        ret

asm_test::sub::u32::relaxed_zero:
        ret

asm_test::sub::u32::release_zero:
        ret

asm_test::sub::u32::acqrel:
        lock sub          dword ptr [rcx], edx
        ret

asm_test::sub::u32::seqcst:
        lock sub          dword ptr [rcx], edx
        ret

asm_test::sub::u32::acquire:
        lock sub          dword ptr [rcx], edx
        ret

asm_test::sub::u32::relaxed:
        lock sub          dword ptr [rcx], edx
        ret

asm_test::sub::u32::release:
        lock sub          dword ptr [rcx], edx
        ret

asm_test::sub::u64::acqrel_zero:
        ret

asm_test::sub::u64::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::sub::u64::acquire_zero:
        ret

asm_test::sub::u64::relaxed_zero:
        ret

asm_test::sub::u64::release_zero:
        ret

asm_test::sub::u64::acqrel:
        lock sub          qword ptr [rcx], rdx
        ret

asm_test::sub::u64::seqcst:
        lock sub          qword ptr [rcx], rdx
        ret

asm_test::sub::u64::acquire:
        lock sub          qword ptr [rcx], rdx
        ret

asm_test::sub::u64::relaxed:
        lock sub          qword ptr [rcx], rdx
        ret

asm_test::sub::u64::release:
        lock sub          qword ptr [rcx], rdx
        ret

asm_test::sub::u128::acqrel_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::sub::u128::seqcst_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::sub::u128::acquire_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::sub::u128::relaxed_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::sub::u128::release_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::sub::u128::acqrel:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::sub::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::sub::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::sub::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::sub::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::xor::u8::acqrel_zero:
        ret

asm_test::xor::u8::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::xor::u8::acquire_zero:
        ret

asm_test::xor::u8::relaxed_zero:
        ret

asm_test::xor::u8::release_zero:
        ret

asm_test::xor::u8::acqrel:
        lock xor          byte ptr [rcx], dl
        ret

asm_test::xor::u8::seqcst:
        lock xor          byte ptr [rcx], dl
        ret

asm_test::xor::u8::acquire:
        lock xor          byte ptr [rcx], dl
        ret

asm_test::xor::u8::relaxed:
        lock xor          byte ptr [rcx], dl
        ret

asm_test::xor::u8::release:
        lock xor          byte ptr [rcx], dl
        ret

asm_test::xor::u16::acqrel_zero:
        ret

asm_test::xor::u16::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::xor::u16::acquire_zero:
        ret

asm_test::xor::u16::relaxed_zero:
        ret

asm_test::xor::u16::release_zero:
        ret

asm_test::xor::u16::acqrel:
        lock xor          word ptr [rcx], dx
        ret

asm_test::xor::u16::seqcst:
        lock xor          word ptr [rcx], dx
        ret

asm_test::xor::u16::acquire:
        lock xor          word ptr [rcx], dx
        ret

asm_test::xor::u16::relaxed:
        lock xor          word ptr [rcx], dx
        ret

asm_test::xor::u16::release:
        lock xor          word ptr [rcx], dx
        ret

asm_test::xor::u32::acqrel_zero:
        ret

asm_test::xor::u32::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::xor::u32::acquire_zero:
        ret

asm_test::xor::u32::relaxed_zero:
        ret

asm_test::xor::u32::release_zero:
        ret

asm_test::xor::u32::acqrel:
        lock xor          dword ptr [rcx], edx
        ret

asm_test::xor::u32::seqcst:
        lock xor          dword ptr [rcx], edx
        ret

asm_test::xor::u32::acquire:
        lock xor          dword ptr [rcx], edx
        ret

asm_test::xor::u32::relaxed:
        lock xor          dword ptr [rcx], edx
        ret

asm_test::xor::u32::release:
        lock xor          dword ptr [rcx], edx
        ret

asm_test::xor::u64::acqrel_zero:
        ret

asm_test::xor::u64::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::xor::u64::acquire_zero:
        ret

asm_test::xor::u64::relaxed_zero:
        ret

asm_test::xor::u64::release_zero:
        ret

asm_test::xor::u64::acqrel:
        lock xor          qword ptr [rcx], rdx
        ret

asm_test::xor::u64::seqcst:
        lock xor          qword ptr [rcx], rdx
        ret

asm_test::xor::u64::acquire:
        lock xor          qword ptr [rcx], rdx
        ret

asm_test::xor::u64::relaxed:
        lock xor          qword ptr [rcx], rdx
        ret

asm_test::xor::u64::release:
        lock xor          qword ptr [rcx], rdx
        ret

asm_test::xor::bool::acqrel_true:
        lock xor          byte ptr [rcx], 0x1
        ret

asm_test::xor::bool::seqcst_true:
        lock xor          byte ptr [rcx], 0x1
        ret

asm_test::xor::bool::acqrel_false:
        ret

asm_test::xor::bool::acquire_true:
        lock xor          byte ptr [rcx], 0x1
        ret

asm_test::xor::bool::relaxed_true:
        lock xor          byte ptr [rcx], 0x1
        ret

asm_test::xor::bool::release_true:
        lock xor          byte ptr [rcx], 0x1
        ret

asm_test::xor::bool::seqcst_false:
        lock or           dword ptr [rsp], 0x0
        ret

asm_test::xor::bool::acquire_false:
        ret

asm_test::xor::bool::relaxed_false:
        ret

asm_test::xor::bool::release_false:
        ret

asm_test::xor::bool::acqrel:
        lock xor          byte ptr [rcx], dl
        ret

asm_test::xor::bool::seqcst:
        lock xor          byte ptr [rcx], dl
        ret

asm_test::xor::bool::acquire:
        lock xor          byte ptr [rcx], dl
        ret

asm_test::xor::bool::relaxed:
        lock xor          byte ptr [rcx], dl
        ret

asm_test::xor::bool::release:
        lock xor          byte ptr [rcx], dl
        ret

asm_test::xor::u128::acqrel_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::xor::u128::seqcst_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::xor::u128::acquire_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::xor::u128::relaxed_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::xor::u128::release_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::xor::u128::acqrel:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::xor::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::xor::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::xor::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::xor::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
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

asm_test::load::f32::seqcst:
        movss             xmm0, dword ptr [rcx]
        ret

asm_test::load::f32::acquire:
        movss             xmm0, dword ptr [rcx]
        ret

asm_test::load::f32::relaxed:
        movss             xmm0, dword ptr [rcx]
        ret

asm_test::load::f64::seqcst:
        movsd             xmm0, qword ptr [rcx]
        ret

asm_test::load::f64::acquire:
        movsd             xmm0, qword ptr [rcx]
        ret

asm_test::load::f64::relaxed:
        movsd             xmm0, qword ptr [rcx]
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

asm_test::load::bool::seqcst:
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::load::bool::acquire:
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::load::bool::relaxed:
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::load::u128::seqcst:
        mov               r9, rcx
        xor               ecx, ecx
        xor               eax, eax
        xor               edx, edx
        mov               r8, rbx
        xor               rbx, rbx
        lock cmpxchg16b   xmmword ptr [r9]
        mov               rbx, r8
        ret

asm_test::load::u128::acquire:
        mov               r9, rcx
        xor               ecx, ecx
        xor               eax, eax
        xor               edx, edx
        mov               r8, rbx
        xor               rbx, rbx
        lock cmpxchg16b   xmmword ptr [r9]
        mov               rbx, r8
        ret

asm_test::load::u128::relaxed:
        mov               r9, rcx
        xor               ecx, ecx
        xor               eax, eax
        xor               edx, edx
        mov               r8, rbx
        xor               rbx, rbx
        lock cmpxchg16b   xmmword ptr [r9]
        mov               rbx, r8
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

asm_test::swap::f32::acqrel:
        movd              eax, xmm1
        xchg              dword ptr [rcx], eax
        movd              xmm0, eax
        ret

asm_test::swap::f32::seqcst:
        movd              eax, xmm1
        xchg              dword ptr [rcx], eax
        movd              xmm0, eax
        ret

asm_test::swap::f32::acquire:
        movd              eax, xmm1
        xchg              dword ptr [rcx], eax
        movd              xmm0, eax
        ret

asm_test::swap::f32::relaxed:
        movd              eax, xmm1
        xchg              dword ptr [rcx], eax
        movd              xmm0, eax
        ret

asm_test::swap::f32::release:
        movd              eax, xmm1
        xchg              dword ptr [rcx], eax
        movd              xmm0, eax
        ret

asm_test::swap::f64::acqrel:
        movq              rax, xmm1
        xchg              qword ptr [rcx], rax
        movq              xmm0, rax
        ret

asm_test::swap::f64::seqcst:
        movq              rax, xmm1
        xchg              qword ptr [rcx], rax
        movq              xmm0, rax
        ret

asm_test::swap::f64::acquire:
        movq              rax, xmm1
        xchg              qword ptr [rcx], rax
        movq              xmm0, rax
        ret

asm_test::swap::f64::relaxed:
        movq              rax, xmm1
        xchg              qword ptr [rcx], rax
        movq              xmm0, rax
        ret

asm_test::swap::f64::release:
        movq              rax, xmm1
        xchg              qword ptr [rcx], rax
        movq              xmm0, rax
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

asm_test::swap::bool::acqrel_true:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::swap::bool::seqcst_true:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::swap::bool::acqrel_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::swap::bool::acquire_true:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::swap::bool::relaxed_true:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::swap::bool::release_true:
        mov               al, 0x1
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::swap::bool::seqcst_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::swap::bool::acquire_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::swap::bool::relaxed_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::swap::bool::release_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::swap::bool::acqrel:
        xchg              byte ptr [rcx], dl
        test              dl, dl
        setne             al
        ret

asm_test::swap::bool::seqcst:
        xchg              byte ptr [rcx], dl
        test              dl, dl
        setne             al
        ret

asm_test::swap::bool::acquire:
        xchg              byte ptr [rcx], dl
        test              dl, dl
        setne             al
        ret

asm_test::swap::bool::relaxed:
        xchg              byte ptr [rcx], dl
        test              dl, dl
        setne             al
        ret

asm_test::swap::bool::release:
        xchg              byte ptr [rcx], dl
        test              dl, dl
        setne             al
        ret

asm_test::swap::u128::acqrel:
        mov               r9, rcx
        mov               rcx, r8
        mov               r8, rdx
        xchg              r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::swap::u128::seqcst:
        mov               r9, rcx
        mov               rcx, r8
        mov               r8, rdx
        xchg              r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::swap::u128::acquire:
        mov               r9, rcx
        mov               rcx, r8
        mov               r8, rdx
        xchg              r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::swap::u128::relaxed:
        mov               r9, rcx
        mov               rcx, r8
        mov               r8, rdx
        xchg              r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::swap::u128::release:
        mov               r9, rcx
        mov               rcx, r8
        mov               r8, rdx
        xchg              r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
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

asm_test::store::f32::seqcst:
        movd              eax, xmm1
        xchg              dword ptr [rcx], eax
        ret

asm_test::store::f32::relaxed:
        movss             dword ptr [rcx], xmm1
        ret

asm_test::store::f32::release:
        movss             dword ptr [rcx], xmm1
        ret

asm_test::store::f64::seqcst:
        movq              rax, xmm1
        xchg              qword ptr [rcx], rax
        ret

asm_test::store::f64::relaxed:
        movsd             qword ptr [rcx], xmm1
        ret

asm_test::store::f64::release:
        movsd             qword ptr [rcx], xmm1
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

asm_test::store::bool::seqcst:
        xchg              byte ptr [rcx], dl
        ret

asm_test::store::bool::relaxed:
        mov               byte ptr [rcx], dl
        ret

asm_test::store::bool::release:
        mov               byte ptr [rcx], dl
        ret

asm_test::store::u128::seqcst:
        mov               r9, rcx
        mov               rcx, r8
        mov               r8, rdx
        xchg              r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::store::u128::relaxed:
        mov               r9, rcx
        mov               rcx, r8
        mov               r8, rdx
        xchg              r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::store::u128::release:
        mov               r9, rcx
        mov               rcx, r8
        mov               r8, rdx
        xchg              r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::bit_set::u8::acqrel:
        mov               eax, edx
        mov               rdx, rcx
        and               al, 0x7
        mov               r8b, 0x1
        mov               ecx, eax
        shl               r8b, cl
        movzx             eax, byte ptr [rdx]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, r8b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_set::u8::seqcst:
        mov               eax, edx
        mov               rdx, rcx
        and               al, 0x7
        mov               r8b, 0x1
        mov               ecx, eax
        shl               r8b, cl
        movzx             eax, byte ptr [rdx]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, r8b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_set::u8::acquire:
        mov               eax, edx
        mov               rdx, rcx
        and               al, 0x7
        mov               r8b, 0x1
        mov               ecx, eax
        shl               r8b, cl
        movzx             eax, byte ptr [rdx]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, r8b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_set::u8::relaxed:
        mov               eax, edx
        mov               rdx, rcx
        and               al, 0x7
        mov               r8b, 0x1
        mov               ecx, eax
        shl               r8b, cl
        movzx             eax, byte ptr [rdx]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, r8b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_set::u8::release:
        mov               eax, edx
        mov               rdx, rcx
        and               al, 0x7
        mov               r8b, 0x1
        mov               ecx, eax
        shl               r8b, cl
        movzx             eax, byte ptr [rdx]
        nop               word ptr cs:[rax + rax]
0:
        mov               ecx, eax
        or                cl, r8b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_set::u16::acqrel:
        and               edx, 0xf
        lock bts          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_set::u16::seqcst:
        and               edx, 0xf
        lock bts          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_set::u16::acquire:
        and               edx, 0xf
        lock bts          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_set::u16::relaxed:
        and               edx, 0xf
        lock bts          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_set::u16::release:
        and               edx, 0xf
        lock bts          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_set::u32::acqrel:
        and               edx, 0x1f
        lock bts          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_set::u32::seqcst:
        and               edx, 0x1f
        lock bts          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_set::u32::acquire:
        and               edx, 0x1f
        lock bts          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_set::u32::relaxed:
        and               edx, 0x1f
        lock bts          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_set::u32::release:
        and               edx, 0x1f
        lock bts          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_set::u64::acqrel:
        and               edx, 0x3f
        lock bts          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_set::u64::seqcst:
        and               edx, 0x3f
        lock bts          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_set::u64::acquire:
        and               edx, 0x3f
        lock bts          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_set::u64::relaxed:
        and               edx, 0x3f
        lock bts          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_set::u64::release:
        and               edx, 0x3f
        lock bts          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_set::u128::acqrel:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::bit_set::u128::seqcst:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::bit_set::u128::acquire:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::bit_set::u128::relaxed:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::bit_set::u128::release:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
        mov               r8d, 0x1
        xor               r9d, r9d
        mov               ecx, esi
        shld              r9, r8, cl
        xor               eax, eax
        shl               r8, cl
        test              sil, 0x40
        cmovne            r9, r8
        cmovne            r8, rax
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::fetch_or::u8::acqrel_all:
        mov               al, -0x1
        xchg              byte ptr [rcx], al
        ret

asm_test::fetch_or::u8::seqcst_all:
        mov               al, -0x1
        xchg              byte ptr [rcx], al
        ret

asm_test::fetch_or::u8::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_or::u8::acquire_all:
        mov               al, -0x1
        xchg              byte ptr [rcx], al
        ret

asm_test::fetch_or::u8::relaxed_all:
        mov               al, -0x1
        xchg              byte ptr [rcx], al
        ret

asm_test::fetch_or::u8::release_all:
        mov               al, -0x1
        xchg              byte ptr [rcx], al
        ret

asm_test::fetch_or::u8::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_or::u8::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_or::u8::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_or::u8::release_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
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

asm_test::fetch_or::u16::acqrel_all:
        mov               ax, 0xffff
        xchg              word ptr [rcx], ax
        ret

asm_test::fetch_or::u16::seqcst_all:
        mov               ax, 0xffff
        xchg              word ptr [rcx], ax
        ret

asm_test::fetch_or::u16::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_or::u16::acquire_all:
        mov               ax, 0xffff
        xchg              word ptr [rcx], ax
        ret

asm_test::fetch_or::u16::relaxed_all:
        mov               ax, 0xffff
        xchg              word ptr [rcx], ax
        ret

asm_test::fetch_or::u16::release_all:
        mov               ax, 0xffff
        xchg              word ptr [rcx], ax
        ret

asm_test::fetch_or::u16::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_or::u16::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_or::u16::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_or::u16::release_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
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

asm_test::fetch_or::u32::acqrel_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [rcx], eax
        ret

asm_test::fetch_or::u32::seqcst_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [rcx], eax
        ret

asm_test::fetch_or::u32::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_or::u32::acquire_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [rcx], eax
        ret

asm_test::fetch_or::u32::relaxed_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [rcx], eax
        ret

asm_test::fetch_or::u32::release_all:
        mov               eax, 0xffffffff
        xchg              dword ptr [rcx], eax
        ret

asm_test::fetch_or::u32::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_or::u32::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_or::u32::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_or::u32::release_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
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

asm_test::fetch_or::u64::acqrel_all:
        mov               rax, -0x1
        xchg              qword ptr [rcx], rax
        ret

asm_test::fetch_or::u64::seqcst_all:
        mov               rax, -0x1
        xchg              qword ptr [rcx], rax
        ret

asm_test::fetch_or::u64::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_or::u64::acquire_all:
        mov               rax, -0x1
        xchg              qword ptr [rcx], rax
        ret

asm_test::fetch_or::u64::relaxed_all:
        mov               rax, -0x1
        xchg              qword ptr [rcx], rax
        ret

asm_test::fetch_or::u64::release_all:
        mov               rax, -0x1
        xchg              qword ptr [rcx], rax
        ret

asm_test::fetch_or::u64::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_or::u64::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_or::u64::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_or::u64::release_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
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

asm_test::fetch_or::bool::acqrel_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        or                dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::seqcst_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        or                dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::acqrel_false:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::acquire_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        or                dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::relaxed_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        or                dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::release_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        or                dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::seqcst_false:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::acquire_false:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::relaxed_false:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::release_false:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::acqrel:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::seqcst:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::acquire:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::relaxed:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::release:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        or                r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::u128::acqrel_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::seqcst_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::acqrel_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::acquire_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::relaxed_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::release_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::seqcst_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::acquire_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::relaxed_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::release_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::acqrel:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_or::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        or                rbx, r8
        mov               rcx, rdx
        or                rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::bit_clear::u8::acqrel:
        mov               eax, edx
        mov               rdx, rcx
        mov               ecx, eax
        and               cl, 0x7
        mov               r8b, 0x1
        shl               r8b, cl
        mov               r9b, -0x2
        mov               ecx, eax
        rol               r9b, cl
        movzx             eax, byte ptr [rdx]
        nop               dword ptr [rax + rax]
0:
        mov               ecx, eax
        and               cl, r9b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_clear::u8::seqcst:
        mov               eax, edx
        mov               rdx, rcx
        mov               ecx, eax
        and               cl, 0x7
        mov               r8b, 0x1
        shl               r8b, cl
        mov               r9b, -0x2
        mov               ecx, eax
        rol               r9b, cl
        movzx             eax, byte ptr [rdx]
        nop               dword ptr [rax + rax]
0:
        mov               ecx, eax
        and               cl, r9b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_clear::u8::acquire:
        mov               eax, edx
        mov               rdx, rcx
        mov               ecx, eax
        and               cl, 0x7
        mov               r8b, 0x1
        shl               r8b, cl
        mov               r9b, -0x2
        mov               ecx, eax
        rol               r9b, cl
        movzx             eax, byte ptr [rdx]
        nop               dword ptr [rax + rax]
0:
        mov               ecx, eax
        and               cl, r9b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_clear::u8::relaxed:
        mov               eax, edx
        mov               rdx, rcx
        mov               ecx, eax
        and               cl, 0x7
        mov               r8b, 0x1
        shl               r8b, cl
        mov               r9b, -0x2
        mov               ecx, eax
        rol               r9b, cl
        movzx             eax, byte ptr [rdx]
        nop               dword ptr [rax + rax]
0:
        mov               ecx, eax
        and               cl, r9b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_clear::u8::release:
        mov               eax, edx
        mov               rdx, rcx
        mov               ecx, eax
        and               cl, 0x7
        mov               r8b, 0x1
        shl               r8b, cl
        mov               r9b, -0x2
        mov               ecx, eax
        rol               r9b, cl
        movzx             eax, byte ptr [rdx]
        nop               dword ptr [rax + rax]
0:
        mov               ecx, eax
        and               cl, r9b
        lock cmpxchg      byte ptr [rdx], cl
        jne               0b
        test              al, r8b
        setne             al
        ret

asm_test::bit_clear::u16::acqrel:
        and               edx, 0xf
        lock btr          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_clear::u16::seqcst:
        and               edx, 0xf
        lock btr          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_clear::u16::acquire:
        and               edx, 0xf
        lock btr          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_clear::u16::relaxed:
        and               edx, 0xf
        lock btr          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_clear::u16::release:
        and               edx, 0xf
        lock btr          word ptr [rcx], dx
        setb              al
        ret

asm_test::bit_clear::u32::acqrel:
        and               edx, 0x1f
        lock btr          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_clear::u32::seqcst:
        and               edx, 0x1f
        lock btr          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_clear::u32::acquire:
        and               edx, 0x1f
        lock btr          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_clear::u32::relaxed:
        and               edx, 0x1f
        lock btr          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_clear::u32::release:
        and               edx, 0x1f
        lock btr          dword ptr [rcx], edx
        setb              al
        ret

asm_test::bit_clear::u64::acqrel:
        and               edx, 0x3f
        lock btr          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_clear::u64::seqcst:
        and               edx, 0x3f
        lock btr          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_clear::u64::acquire:
        and               edx, 0x3f
        lock btr          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_clear::u64::relaxed:
        and               edx, 0x3f
        lock btr          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_clear::u64::release:
        and               edx, 0x3f
        lock btr          qword ptr [rcx], rdx
        setb              al
        ret

asm_test::bit_clear::u128::acqrel:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
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
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::bit_clear::u128::seqcst:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
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
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::bit_clear::u128::acquire:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
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
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::bit_clear::u128::relaxed:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
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
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::bit_clear::u128::release:
        push              rsi
        mov               esi, edx
        mov               r10, rcx
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
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        mov               ecx, esi
        and               cl, 0x20
        shr               rdx, cl
        shr               rax, cl
        test              sil, 0x40
        cmovne            rax, rdx
        bt                eax, esi
        setb              al
        pop               rsi
        ret

asm_test::fetch_abs::f32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        and               edx, 0x7fffffff
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_abs::f32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        and               edx, 0x7fffffff
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_abs::f32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        and               edx, 0x7fffffff
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_abs::f32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        and               edx, 0x7fffffff
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_abs::f32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        and               edx, 0x7fffffff
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_abs::f64::acqrel:
        mov               rax, qword ptr [rcx]
        movabs            rdx, 0x7fffffffffffffff
        nop               dword ptr [rax]
0:
        mov               r8, rax
        and               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_abs::f64::seqcst:
        mov               rax, qword ptr [rcx]
        movabs            rdx, 0x7fffffffffffffff
        nop               dword ptr [rax]
0:
        mov               r8, rax
        and               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_abs::f64::acquire:
        mov               rax, qword ptr [rcx]
        movabs            rdx, 0x7fffffffffffffff
        nop               dword ptr [rax]
0:
        mov               r8, rax
        and               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_abs::f64::relaxed:
        mov               rax, qword ptr [rcx]
        movabs            rdx, 0x7fffffffffffffff
        nop               dword ptr [rax]
0:
        mov               r8, rax
        and               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_abs::f64::release:
        mov               rax, qword ptr [rcx]
        movabs            rdx, 0x7fffffffffffffff
        nop               dword ptr [rax]
0:
        mov               r8, rax
        and               r8, rdx
        lock cmpxchg      qword ptr [rcx], r8
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_add::u8::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_add::u8::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_add::u8::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_add::u8::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_add::u8::release_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
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

asm_test::fetch_add::f32::acqrel_zero:
        mov               eax, dword ptr [rcx]
        xorps             xmm0, xmm0
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::seqcst_zero:
        mov               eax, dword ptr [rcx]
        xorps             xmm0, xmm0
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::acquire_zero:
        mov               eax, dword ptr [rcx]
        xorps             xmm0, xmm0
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::relaxed_zero:
        mov               eax, dword ptr [rcx]
        xorps             xmm0, xmm0
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::release_zero:
        mov               eax, dword ptr [rcx]
        xorps             xmm0, xmm0
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm0, eax
        addss             xmm0, xmm1
        movd              edx, xmm0
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm0, eax
        addss             xmm0, xmm1
        movd              edx, xmm0
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm0, eax
        addss             xmm0, xmm1
        movd              edx, xmm0
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm0, eax
        addss             xmm0, xmm1
        movd              edx, xmm0
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm0, eax
        addss             xmm0, xmm1
        movd              edx, xmm0
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f64::acqrel_zero:
        mov               rax, qword ptr [rcx]
        xorpd             xmm0, xmm0
        nop               word ptr [rax + rax]
0:
        movq              xmm1, rax
        addsd             xmm1, xmm0
        movq              rdx, xmm1
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_add::f64::seqcst_zero:
        mov               rax, qword ptr [rcx]
        xorpd             xmm0, xmm0
        nop               word ptr [rax + rax]
0:
        movq              xmm1, rax
        addsd             xmm1, xmm0
        movq              rdx, xmm1
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_add::f64::acquire_zero:
        mov               rax, qword ptr [rcx]
        xorpd             xmm0, xmm0
        nop               word ptr [rax + rax]
0:
        movq              xmm1, rax
        addsd             xmm1, xmm0
        movq              rdx, xmm1
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_add::f64::relaxed_zero:
        mov               rax, qword ptr [rcx]
        xorpd             xmm0, xmm0
        nop               word ptr [rax + rax]
0:
        movq              xmm1, rax
        addsd             xmm1, xmm0
        movq              rdx, xmm1
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_add::f64::release_zero:
        mov               rax, qword ptr [rcx]
        xorpd             xmm0, xmm0
        nop               word ptr [rax + rax]
0:
        movq              xmm1, rax
        addsd             xmm1, xmm0
        movq              rdx, xmm1
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_add::f64::acqrel:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movq              xmm0, rax
        addsd             xmm0, xmm1
        movq              rdx, xmm0
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_add::f64::seqcst:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movq              xmm0, rax
        addsd             xmm0, xmm1
        movq              rdx, xmm0
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_add::f64::acquire:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movq              xmm0, rax
        addsd             xmm0, xmm1
        movq              rdx, xmm0
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_add::f64::relaxed:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movq              xmm0, rax
        addsd             xmm0, xmm1
        movq              rdx, xmm0
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_add::f64::release:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movq              xmm0, rax
        addsd             xmm0, xmm1
        movq              rdx, xmm0
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_add::u16::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_add::u16::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_add::u16::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_add::u16::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_add::u16::release_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
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

asm_test::fetch_add::u32::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_add::u32::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_add::u32::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_add::u32::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_add::u32::release_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
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

asm_test::fetch_add::u64::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_add::u64::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_add::u64::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_add::u64::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_add::u64::release_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
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

asm_test::fetch_add::u128::acqrel_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_add::u128::seqcst_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_add::u128::acquire_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_add::u128::relaxed_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_add::u128::release_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_add::u128::acqrel:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_add::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_add::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_add::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_add::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        add               rbx, r8
        mov               rcx, rdx
        adc               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u8::acqrel_all:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_and::u8::seqcst_all:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_and::u8::acqrel_zero:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::fetch_and::u8::acquire_all:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_and::u8::relaxed_all:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_and::u8::release_all:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_and::u8::seqcst_zero:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::fetch_and::u8::acquire_zero:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::fetch_and::u8::relaxed_zero:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        ret

asm_test::fetch_and::u8::release_zero:
        xor               eax, eax
        xchg              byte ptr [rcx], al
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

asm_test::fetch_and::u16::acqrel_all:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_and::u16::seqcst_all:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_and::u16::acqrel_zero:
        xor               eax, eax
        xchg              word ptr [rcx], ax
        ret

asm_test::fetch_and::u16::acquire_all:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_and::u16::relaxed_all:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_and::u16::release_all:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_and::u16::seqcst_zero:
        xor               eax, eax
        xchg              word ptr [rcx], ax
        ret

asm_test::fetch_and::u16::acquire_zero:
        xor               eax, eax
        xchg              word ptr [rcx], ax
        ret

asm_test::fetch_and::u16::relaxed_zero:
        xor               eax, eax
        xchg              word ptr [rcx], ax
        ret

asm_test::fetch_and::u16::release_zero:
        xor               eax, eax
        xchg              word ptr [rcx], ax
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

asm_test::fetch_and::u32::acqrel_all:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_and::u32::seqcst_all:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_and::u32::acqrel_zero:
        xor               eax, eax
        xchg              dword ptr [rcx], eax
        ret

asm_test::fetch_and::u32::acquire_all:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_and::u32::relaxed_all:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_and::u32::release_all:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_and::u32::seqcst_zero:
        xor               eax, eax
        xchg              dword ptr [rcx], eax
        ret

asm_test::fetch_and::u32::acquire_zero:
        xor               eax, eax
        xchg              dword ptr [rcx], eax
        ret

asm_test::fetch_and::u32::relaxed_zero:
        xor               eax, eax
        xchg              dword ptr [rcx], eax
        ret

asm_test::fetch_and::u32::release_zero:
        xor               eax, eax
        xchg              dword ptr [rcx], eax
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

asm_test::fetch_and::u64::acqrel_all:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_and::u64::seqcst_all:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_and::u64::acqrel_zero:
        xor               eax, eax
        xchg              qword ptr [rcx], rax
        ret

asm_test::fetch_and::u64::acquire_all:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_and::u64::relaxed_all:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_and::u64::release_all:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_and::u64::seqcst_zero:
        xor               eax, eax
        xchg              qword ptr [rcx], rax
        ret

asm_test::fetch_and::u64::acquire_zero:
        xor               eax, eax
        xchg              qword ptr [rcx], rax
        ret

asm_test::fetch_and::u64::relaxed_zero:
        xor               eax, eax
        xchg              qword ptr [rcx], rax
        ret

asm_test::fetch_and::u64::release_zero:
        xor               eax, eax
        xchg              qword ptr [rcx], rax
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

asm_test::fetch_and::bool::acqrel_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        and               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::seqcst_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        and               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::acqrel_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::acquire_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        and               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::relaxed_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        and               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::release_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        and               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::seqcst_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::acquire_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::relaxed_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::release_false:
        xor               eax, eax
        xchg              byte ptr [rcx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::acqrel:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::seqcst:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::acquire:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::relaxed:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::release:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        and               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::u128::acqrel_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::seqcst_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::acqrel_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::acquire_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::relaxed_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::release_all:
        mov               r10, rcx
        mov               r8, -0x1
        mov               r9, -0x1
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::seqcst_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::acquire_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::relaxed_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::release_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::acqrel:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_and::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        and               rbx, r8
        mov               rcx, rdx
        and               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
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

asm_test::fetch_max::f32::acqrel:
        mov               eax, dword ptr [rcx]
        movaps            xmm0, xmm1
        cmpunordss        xmm0, xmm1
        nop               word ptr [rax + rax]
0:
        movd              xmm2, eax
        movaps            xmm3, xmm0
        andps             xmm3, xmm2
        maxss             xmm2, xmm1
        movaps            xmm4, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_max::f32::seqcst:
        mov               eax, dword ptr [rcx]
        movaps            xmm0, xmm1
        cmpunordss        xmm0, xmm1
        nop               word ptr [rax + rax]
0:
        movd              xmm2, eax
        movaps            xmm3, xmm0
        andps             xmm3, xmm2
        maxss             xmm2, xmm1
        movaps            xmm4, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_max::f32::acquire:
        mov               eax, dword ptr [rcx]
        movaps            xmm0, xmm1
        cmpunordss        xmm0, xmm1
        nop               word ptr [rax + rax]
0:
        movd              xmm2, eax
        movaps            xmm3, xmm0
        andps             xmm3, xmm2
        maxss             xmm2, xmm1
        movaps            xmm4, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_max::f32::relaxed:
        mov               eax, dword ptr [rcx]
        movaps            xmm0, xmm1
        cmpunordss        xmm0, xmm1
        nop               word ptr [rax + rax]
0:
        movd              xmm2, eax
        movaps            xmm3, xmm0
        andps             xmm3, xmm2
        maxss             xmm2, xmm1
        movaps            xmm4, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_max::f32::release:
        mov               eax, dword ptr [rcx]
        movaps            xmm0, xmm1
        cmpunordss        xmm0, xmm1
        nop               word ptr [rax + rax]
0:
        movd              xmm2, eax
        movaps            xmm3, xmm0
        andps             xmm3, xmm2
        maxss             xmm2, xmm1
        movaps            xmm4, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_max::f64::acqrel:
        mov               rax, qword ptr [rcx]
        movapd            xmm0, xmm1
        cmpunordsd        xmm0, xmm1
        nop               dword ptr [rax]
0:
        movq              xmm2, rax
        movapd            xmm3, xmm0
        andpd             xmm3, xmm2
        maxsd             xmm2, xmm1
        movapd            xmm4, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm3
        movq              rdx, xmm4
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_max::f64::seqcst:
        mov               rax, qword ptr [rcx]
        movapd            xmm0, xmm1
        cmpunordsd        xmm0, xmm1
        nop               dword ptr [rax]
0:
        movq              xmm2, rax
        movapd            xmm3, xmm0
        andpd             xmm3, xmm2
        maxsd             xmm2, xmm1
        movapd            xmm4, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm3
        movq              rdx, xmm4
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_max::f64::acquire:
        mov               rax, qword ptr [rcx]
        movapd            xmm0, xmm1
        cmpunordsd        xmm0, xmm1
        nop               dword ptr [rax]
0:
        movq              xmm2, rax
        movapd            xmm3, xmm0
        andpd             xmm3, xmm2
        maxsd             xmm2, xmm1
        movapd            xmm4, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm3
        movq              rdx, xmm4
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_max::f64::relaxed:
        mov               rax, qword ptr [rcx]
        movapd            xmm0, xmm1
        cmpunordsd        xmm0, xmm1
        nop               dword ptr [rax]
0:
        movq              xmm2, rax
        movapd            xmm3, xmm0
        andpd             xmm3, xmm2
        maxsd             xmm2, xmm1
        movapd            xmm4, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm3
        movq              rdx, xmm4
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_max::f64::release:
        mov               rax, qword ptr [rcx]
        movapd            xmm0, xmm1
        cmpunordsd        xmm0, xmm1
        nop               dword ptr [rax]
0:
        movq              xmm2, rax
        movapd            xmm3, xmm0
        andpd             xmm3, xmm2
        maxsd             xmm2, xmm1
        movapd            xmm4, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm3
        movq              rdx, xmm4
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
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
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovl             rcx, rdx
        mov               rbx, r8
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_max::i128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovl             rcx, rdx
        mov               rbx, r8
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_max::i128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovl             rcx, rdx
        mov               rbx, r8
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_max::i128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovl             rcx, rdx
        mov               rbx, r8
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_max::i128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovl             rcx, rdx
        mov               rbx, r8
        cmovl             rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
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

asm_test::fetch_min::f32::acqrel:
        mov               eax, dword ptr [rcx]
        movaps            xmm0, xmm1
        cmpunordss        xmm0, xmm1
        nop               word ptr [rax + rax]
0:
        movd              xmm2, eax
        movaps            xmm3, xmm0
        andps             xmm3, xmm2
        minss             xmm2, xmm1
        movaps            xmm4, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_min::f32::seqcst:
        mov               eax, dword ptr [rcx]
        movaps            xmm0, xmm1
        cmpunordss        xmm0, xmm1
        nop               word ptr [rax + rax]
0:
        movd              xmm2, eax
        movaps            xmm3, xmm0
        andps             xmm3, xmm2
        minss             xmm2, xmm1
        movaps            xmm4, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_min::f32::acquire:
        mov               eax, dword ptr [rcx]
        movaps            xmm0, xmm1
        cmpunordss        xmm0, xmm1
        nop               word ptr [rax + rax]
0:
        movd              xmm2, eax
        movaps            xmm3, xmm0
        andps             xmm3, xmm2
        minss             xmm2, xmm1
        movaps            xmm4, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_min::f32::relaxed:
        mov               eax, dword ptr [rcx]
        movaps            xmm0, xmm1
        cmpunordss        xmm0, xmm1
        nop               word ptr [rax + rax]
0:
        movd              xmm2, eax
        movaps            xmm3, xmm0
        andps             xmm3, xmm2
        minss             xmm2, xmm1
        movaps            xmm4, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_min::f32::release:
        mov               eax, dword ptr [rcx]
        movaps            xmm0, xmm1
        cmpunordss        xmm0, xmm1
        nop               word ptr [rax + rax]
0:
        movd              xmm2, eax
        movaps            xmm3, xmm0
        andps             xmm3, xmm2
        minss             xmm2, xmm1
        movaps            xmm4, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_min::f64::acqrel:
        mov               rax, qword ptr [rcx]
        movapd            xmm0, xmm1
        cmpunordsd        xmm0, xmm1
        nop               dword ptr [rax]
0:
        movq              xmm2, rax
        movapd            xmm3, xmm0
        andpd             xmm3, xmm2
        minsd             xmm2, xmm1
        movapd            xmm4, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm3
        movq              rdx, xmm4
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_min::f64::seqcst:
        mov               rax, qword ptr [rcx]
        movapd            xmm0, xmm1
        cmpunordsd        xmm0, xmm1
        nop               dword ptr [rax]
0:
        movq              xmm2, rax
        movapd            xmm3, xmm0
        andpd             xmm3, xmm2
        minsd             xmm2, xmm1
        movapd            xmm4, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm3
        movq              rdx, xmm4
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_min::f64::acquire:
        mov               rax, qword ptr [rcx]
        movapd            xmm0, xmm1
        cmpunordsd        xmm0, xmm1
        nop               dword ptr [rax]
0:
        movq              xmm2, rax
        movapd            xmm3, xmm0
        andpd             xmm3, xmm2
        minsd             xmm2, xmm1
        movapd            xmm4, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm3
        movq              rdx, xmm4
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_min::f64::relaxed:
        mov               rax, qword ptr [rcx]
        movapd            xmm0, xmm1
        cmpunordsd        xmm0, xmm1
        nop               dword ptr [rax]
0:
        movq              xmm2, rax
        movapd            xmm3, xmm0
        andpd             xmm3, xmm2
        minsd             xmm2, xmm1
        movapd            xmm4, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm3
        movq              rdx, xmm4
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_min::f64::release:
        mov               rax, qword ptr [rcx]
        movapd            xmm0, xmm1
        cmpunordsd        xmm0, xmm1
        nop               dword ptr [rax]
0:
        movq              xmm2, rax
        movapd            xmm3, xmm0
        andpd             xmm3, xmm2
        minsd             xmm2, xmm1
        movapd            xmm4, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm3
        movq              rdx, xmm4
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
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
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovge            rcx, rdx
        mov               rbx, r8
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_min::i128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovge            rcx, rdx
        mov               rbx, r8
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_min::i128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovge            rcx, rdx
        mov               rbx, r8
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_min::i128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovge            rcx, rdx
        mov               rbx, r8
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_min::i128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        cmp               r8, rax
        mov               rcx, r9
        sbb               rcx, rdx
        mov               rcx, r9
        cmovge            rcx, rdx
        mov               rbx, r8
        cmovge            rbx, rax
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
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

asm_test::fetch_neg::f32::acqrel:
        mov               eax, 0x80000000
        lock xadd         dword ptr [rcx], eax
        movd              xmm0, eax
        ret

asm_test::fetch_neg::f32::seqcst:
        mov               eax, 0x80000000
        lock xadd         dword ptr [rcx], eax
        movd              xmm0, eax
        ret

asm_test::fetch_neg::f32::acquire:
        mov               eax, 0x80000000
        lock xadd         dword ptr [rcx], eax
        movd              xmm0, eax
        ret

asm_test::fetch_neg::f32::relaxed:
        mov               eax, 0x80000000
        lock xadd         dword ptr [rcx], eax
        movd              xmm0, eax
        ret

asm_test::fetch_neg::f32::release:
        mov               eax, 0x80000000
        lock xadd         dword ptr [rcx], eax
        movd              xmm0, eax
        ret

asm_test::fetch_neg::f64::acqrel:
        movabs            rax, -0x8000000000000000
        lock xadd         qword ptr [rcx], rax
        movq              xmm0, rax
        ret

asm_test::fetch_neg::f64::seqcst:
        movabs            rax, -0x8000000000000000
        lock xadd         qword ptr [rcx], rax
        movq              xmm0, rax
        ret

asm_test::fetch_neg::f64::acquire:
        movabs            rax, -0x8000000000000000
        lock xadd         qword ptr [rcx], rax
        movq              xmm0, rax
        ret

asm_test::fetch_neg::f64::relaxed:
        movabs            rax, -0x8000000000000000
        lock xadd         qword ptr [rcx], rax
        movq              xmm0, rax
        ret

asm_test::fetch_neg::f64::release:
        movabs            rax, -0x8000000000000000
        lock xadd         qword ptr [rcx], rax
        movq              xmm0, rax
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
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::fetch_neg::u128::seqcst:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::fetch_neg::u128::acquire:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::fetch_neg::u128::relaxed:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::fetch_neg::u128::release:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        neg               rbx
        mov               rcx, 0x0
        sbb               rcx, rdx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
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

asm_test::fetch_not::bool::acqrel:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::bool::seqcst:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::bool::acquire:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::bool::relaxed:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::bool::release:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::u128::acqrel:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::fetch_not::u128::seqcst:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::fetch_not::u128::acquire:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::fetch_not::u128::relaxed:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::fetch_not::u128::release:
        mov               r9, rcx
        mov               r8, rbx
        mov               rax, qword ptr [r9]
        mov               rdx, qword ptr [r9 + 0x8]
0:
        mov               rbx, rax
        not               rbx
        mov               rcx, rdx
        not               rcx
        lock cmpxchg16b   xmmword ptr [r9]
        jne               0b
        mov               rbx, r8
        ret

asm_test::fetch_sub::u8::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_sub::u8::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_sub::u8::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_sub::u8::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_sub::u8::release_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
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

asm_test::fetch_sub::f32::acqrel_zero:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      dword ptr [rcx], eax
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::seqcst_zero:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      dword ptr [rcx], eax
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::acquire_zero:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      dword ptr [rcx], eax
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::relaxed_zero:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      dword ptr [rcx], eax
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::release_zero:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      dword ptr [rcx], eax
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::acqrel:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm0, eax
        subss             xmm0, xmm1
        movd              edx, xmm0
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::seqcst:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm0, eax
        subss             xmm0, xmm1
        movd              edx, xmm0
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::acquire:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm0, eax
        subss             xmm0, xmm1
        movd              edx, xmm0
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::relaxed:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm0, eax
        subss             xmm0, xmm1
        movd              edx, xmm0
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::release:
        mov               eax, dword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movd              xmm0, eax
        subss             xmm0, xmm1
        movd              edx, xmm0
        lock cmpxchg      dword ptr [rcx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f64::acqrel_zero:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      qword ptr [rcx], rax
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_sub::f64::seqcst_zero:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      qword ptr [rcx], rax
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_sub::f64::acquire_zero:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      qword ptr [rcx], rax
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_sub::f64::relaxed_zero:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      qword ptr [rcx], rax
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_sub::f64::release_zero:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        lock cmpxchg      qword ptr [rcx], rax
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_sub::f64::acqrel:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movq              xmm0, rax
        subsd             xmm0, xmm1
        movq              rdx, xmm0
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_sub::f64::seqcst:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movq              xmm0, rax
        subsd             xmm0, xmm1
        movq              rdx, xmm0
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_sub::f64::acquire:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movq              xmm0, rax
        subsd             xmm0, xmm1
        movq              rdx, xmm0
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_sub::f64::relaxed:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movq              xmm0, rax
        subsd             xmm0, xmm1
        movq              rdx, xmm0
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_sub::f64::release:
        mov               rax, qword ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        movq              xmm0, rax
        subsd             xmm0, xmm1
        movq              rdx, xmm0
        lock cmpxchg      qword ptr [rcx], rdx
        jne               0b
        movq              xmm0, rax
        ret

asm_test::fetch_sub::u16::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_sub::u16::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_sub::u16::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_sub::u16::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_sub::u16::release_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
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

asm_test::fetch_sub::u32::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_sub::u32::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_sub::u32::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_sub::u32::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_sub::u32::release_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
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

asm_test::fetch_sub::u64::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_sub::u64::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_sub::u64::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_sub::u64::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_sub::u64::release_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
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

asm_test::fetch_sub::u128::acqrel_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_sub::u128::seqcst_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_sub::u128::acquire_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_sub::u128::relaxed_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_sub::u128::release_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_sub::u128::acqrel:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_sub::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_sub::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_sub::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_sub::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        sub               rbx, r8
        mov               rcx, rdx
        sbb               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_xor::u8::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_xor::u8::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_xor::u8::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_xor::u8::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        ret

asm_test::fetch_xor::u8::release_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
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

asm_test::fetch_xor::u16::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_xor::u16::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_xor::u16::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_xor::u16::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
        ret

asm_test::fetch_xor::u16::release_zero:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, word ptr [rcx]
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

asm_test::fetch_xor::u32::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_xor::u32::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_xor::u32::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_xor::u32::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
        ret

asm_test::fetch_xor::u32::release_zero:
        lock or           dword ptr [rsp], 0x0
        mov               eax, dword ptr [rcx]
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

asm_test::fetch_xor::u64::acqrel_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_xor::u64::seqcst_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_xor::u64::acquire_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_xor::u64::relaxed_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
        ret

asm_test::fetch_xor::u64::release_zero:
        lock or           dword ptr [rsp], 0x0
        mov               rax, qword ptr [rcx]
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

asm_test::fetch_xor::bool::acqrel_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::seqcst_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::acqrel_false:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::acquire_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::relaxed_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::release_true:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [rcx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::seqcst_false:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::acquire_false:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::relaxed_false:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::release_false:
        lock or           dword ptr [rsp], 0x0
        movzx             eax, byte ptr [rcx]
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::acqrel:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::seqcst:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::acquire:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::relaxed:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::release:
        movzx             eax, byte ptr [rcx]
        nop               word ptr cs:[rax + rax]
0:
        mov               r8d, eax
        xor               r8b, dl
        lock cmpxchg      byte ptr [rcx], r8b
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::u128::acqrel_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_xor::u128::seqcst_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_xor::u128::acquire_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_xor::u128::relaxed_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_xor::u128::release_zero:
        mov               r10, rcx
        xor               r8d, r8d
        xor               r9d, r9d
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_xor::u128::acqrel:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_xor::u128::seqcst:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_xor::u128::acquire:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_xor::u128::relaxed:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

asm_test::fetch_xor::u128::release:
        mov               r9, r8
        mov               r10, rcx
        mov               r8, rdx
        mov               r11, rbx
        mov               rax, qword ptr [r10]
        mov               rdx, qword ptr [r10 + 0x8]
0:
        mov               rbx, rax
        xor               rbx, r8
        mov               rcx, rdx
        xor               rcx, r9
        lock cmpxchg16b   xmmword ptr [r10]
        jne               0b
        mov               rbx, r11
        ret

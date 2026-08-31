asm_test::fence::acqrel:
        ret

asm_test::fence::seqcst:
        push              eax
        mov               eax, esp
        xchg              dword ptr [eax], ecx
        pop               eax
        ret

asm_test::fence::acquire:
        ret

asm_test::fence::release:
        ret

asm_test::bit_toggle::u8::acqrel:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        mov               ah, 0x1
        mov               al, byte ptr [edx]
        and               cl, 0x7
        shl               ah, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        mov               ecx, eax
        xor               cl, ah
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_toggle::u8::seqcst:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        mov               ah, 0x1
        mov               al, byte ptr [edx]
        and               cl, 0x7
        shl               ah, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        mov               ecx, eax
        xor               cl, ah
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_toggle::u8::acquire:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        mov               ah, 0x1
        mov               al, byte ptr [edx]
        and               cl, 0x7
        shl               ah, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        mov               ecx, eax
        xor               cl, ah
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_toggle::u8::relaxed:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        mov               ah, 0x1
        mov               al, byte ptr [edx]
        and               cl, 0x7
        shl               ah, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        mov               ecx, eax
        xor               cl, ah
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_toggle::u8::release:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        mov               ah, 0x1
        mov               al, byte ptr [edx]
        and               cl, 0x7
        shl               ah, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        mov               ecx, eax
        xor               cl, ah
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_toggle::u16::acqrel:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock btc          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_toggle::u16::seqcst:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock btc          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_toggle::u16::acquire:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock btc          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_toggle::u16::relaxed:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock btc          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_toggle::u16::release:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock btc          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_toggle::u32::acqrel:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock btc          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_toggle::u32::seqcst:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock btc          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_toggle::u32::acquire:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock btc          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_toggle::u32::relaxed:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock btc          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_toggle::u32::release:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock btc          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_toggle::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        movzx             ecx, byte ptr [esp + 0x18]
        mov               edi, dword ptr [esp + 0x14]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        nop               dword ptr [eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, esi
        xor               ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, esi
        and               edx, ebp
        or                edx, eax
        setne             al
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::bit_toggle::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        movzx             ecx, byte ptr [esp + 0x18]
        mov               edi, dword ptr [esp + 0x14]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        nop               dword ptr [eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, esi
        xor               ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, esi
        and               edx, ebp
        or                edx, eax
        setne             al
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::bit_toggle::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        movzx             ecx, byte ptr [esp + 0x18]
        mov               edi, dword ptr [esp + 0x14]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        nop               dword ptr [eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, esi
        xor               ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, esi
        and               edx, ebp
        or                edx, eax
        setne             al
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::bit_toggle::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        movzx             ecx, byte ptr [esp + 0x18]
        mov               edi, dword ptr [esp + 0x14]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        nop               dword ptr [eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, esi
        xor               ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, esi
        and               edx, ebp
        or                edx, eax
        setne             al
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::bit_toggle::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        movzx             ecx, byte ptr [esp + 0x18]
        mov               edi, dword ptr [esp + 0x14]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        nop               dword ptr [eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, esi
        xor               ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, esi
        and               edx, ebp
        or                edx, eax
        setne             al
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_nand::u8::acqrel_all:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::seqcst_all:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::acqrel_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, -0x1
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::acquire_all:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::relaxed_all:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::release_all:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::seqcst_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, -0x1
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::acquire_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, -0x1
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::relaxed_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, -0x1
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::release_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, -0x1
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_nand::u8::acqrel:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, cl
        not               ah
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_nand::u8::seqcst:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, cl
        not               ah
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_nand::u8::acquire:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, cl
        not               ah
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_nand::u8::relaxed:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, cl
        not               ah
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_nand::u8::release:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, cl
        not               ah
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_nand::u16::acqrel_all:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::seqcst_all:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::acqrel_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dx, 0xffff
        movzx             eax, word ptr [ecx]
        nop               dword ptr [eax + eax]
0:
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::acquire_all:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::relaxed_all:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::release_all:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::seqcst_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dx, 0xffff
        movzx             eax, word ptr [ecx]
        nop               dword ptr [eax + eax]
0:
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::acquire_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dx, 0xffff
        movzx             eax, word ptr [ecx]
        nop               dword ptr [eax + eax]
0:
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::relaxed_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dx, 0xffff
        movzx             eax, word ptr [ecx]
        nop               dword ptr [eax + eax]
0:
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::release_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dx, 0xffff
        movzx             eax, word ptr [ecx]
        nop               dword ptr [eax + eax]
0:
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_nand::u16::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        and               esi, ecx
        not               esi
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_nand::u16::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        and               esi, ecx
        not               esi
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_nand::u16::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        and               esi, ecx
        not               esi
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_nand::u16::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        and               esi, ecx
        not               esi
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_nand::u16::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        and               esi, ecx
        not               esi
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_nand::u32::acqrel_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::seqcst_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::acqrel_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               edx, 0xffffffff
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax + eax]
0:
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::acquire_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::relaxed_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::release_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::seqcst_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               edx, 0xffffffff
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax + eax]
0:
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::acquire_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               edx, 0xffffffff
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax + eax]
0:
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::relaxed_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               edx, 0xffffffff
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax + eax]
0:
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::release_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               edx, 0xffffffff
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax + eax]
0:
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_nand::u32::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        and               esi, ecx
        not               esi
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_nand::u32::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        and               esi, ecx
        not               esi
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_nand::u32::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        and               esi, ecx
        not               esi
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_nand::u32::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        and               esi, ecx
        not               esi
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_nand::u32::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        and               esi, ecx
        not               esi
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_nand::u64::acqrel_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_nand::u64::seqcst_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_nand::u64::acqrel_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_nand::u64::acquire_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_nand::u64::relaxed_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_nand::u64::release_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_nand::u64::seqcst_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_nand::u64::acquire_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_nand::u64::relaxed_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_nand::u64::release_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_nand::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        and               ecx, esi
        and               ebx, edi
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_nand::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        and               ecx, esi
        and               ebx, edi
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_nand::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        and               ecx, esi
        and               ebx, edi
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_nand::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        and               ecx, esi
        and               ebx, edi
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_nand::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        and               ecx, esi
        and               ebx, edi
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_nand::bool::acqrel_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::seqcst_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::acqrel_false:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, 0x1
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::fetch_nand::bool::acquire_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::relaxed_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::release_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::seqcst_false:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, 0x1
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::fetch_nand::bool::acquire_false:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, 0x1
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::fetch_nand::bool::relaxed_false:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, 0x1
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::fetch_nand::bool::release_false:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, 0x1
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::fetch_nand::bool::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        cmp               byte ptr [esp + 0x8], 0x0
        je                1f
        movzx             eax, byte ptr [ecx]
        nop
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [ecx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        cmp               byte ptr [esp + 0x8], 0x0
        je                1f
        movzx             eax, byte ptr [ecx]
        nop
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [ecx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        cmp               byte ptr [esp + 0x8], 0x0
        je                1f
        movzx             eax, byte ptr [ecx]
        nop
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [ecx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        cmp               byte ptr [esp + 0x8], 0x0
        je                1f
        movzx             eax, byte ptr [ecx]
        nop
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [ecx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_nand::bool::release:
        mov               ecx, dword ptr [esp + 0x4]
        cmp               byte ptr [esp + 0x8], 0x0
        je                1f
        movzx             eax, byte ptr [ecx]
        nop
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret
1:
        mov               al, 0x1
        xchg              byte ptr [ecx], al
        test              al, al
        setne             al
        ret

asm_test::fetch_umax::u8::acqrel:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovbe            ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_umax::u8::seqcst:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovbe            ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_umax::u8::acquire:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovbe            ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_umax::u8::relaxed:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovbe            ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_umax::u8::release:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovbe            ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_umax::u16::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmova             esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_umax::u16::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmova             esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_umax::u16::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmova             esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_umax::u16::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmova             esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_umax::u16::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmova             esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_umax::u32::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmova             esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_umax::u32::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmova             esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_umax::u32::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmova             esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_umax::u32::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmova             esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_umax::u32::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmova             esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_umax::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovb             ecx, edx
        cmovb             ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_umax::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovb             ecx, edx
        cmovb             ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_umax::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovb             ecx, edx
        cmovb             ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_umax::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovb             ecx, edx
        cmovb             ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_umax::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovb             ecx, edx
        cmovb             ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_umin::u8::acqrel:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmova             ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_umin::u8::seqcst:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmova             ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_umin::u8::acquire:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmova             ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_umin::u8::relaxed:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmova             ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_umin::u8::release:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmova             ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_umin::u16::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovbe            esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_umin::u16::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovbe            esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_umin::u16::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovbe            esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_umin::u16::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovbe            esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_umin::u16::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovbe            esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_umin::u32::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovbe            esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_umin::u32::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovbe            esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_umin::u32::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovbe            esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_umin::u32::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovbe            esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_umin::u32::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovbe            esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_umin::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovae            ecx, edx
        cmovae            ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_umin::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovae            ecx, edx
        cmovae            ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_umin::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovae            ecx, edx
        cmovae            ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_umin::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovae            ecx, edx
        cmovae            ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_umin::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovae            ecx, edx
        cmovae            ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::release_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::release_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::u8::release_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange::f32::acqrel_seqcst:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::seqcst_seqcst:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::acqrel_acquire:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::acqrel_relaxed:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::acquire_seqcst:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::relaxed_seqcst:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::release_seqcst:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::seqcst_acquire:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::seqcst_relaxed:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::acquire_acquire:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::acquire_relaxed:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::relaxed_acquire:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::relaxed_relaxed:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::release_acquire:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f32::release_relaxed:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange::f64::acqrel_seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::seqcst_seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::acqrel_acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::acqrel_relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::acquire_seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::relaxed_seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::release_seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::seqcst_acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::seqcst_relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::acquire_acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::acquire_relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::relaxed_acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::relaxed_relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::release_acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::f64::release_relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u16::acqrel_seqcst:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::release_seqcst:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::release_acquire:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u16::release_relaxed:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::release_seqcst:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::acquire_acquire:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::release_acquire:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u32::release_relaxed:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange::u64::acqrel_seqcst:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::seqcst_seqcst:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::acqrel_acquire:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::acqrel_relaxed:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::acquire_seqcst:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::relaxed_seqcst:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::release_seqcst:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::seqcst_acquire:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::seqcst_relaxed:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::acquire_acquire:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::acquire_relaxed:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::relaxed_acquire:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::relaxed_relaxed:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::release_acquire:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::u64::release_relaxed:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange::bool::acqrel_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_seqcst_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_acquire_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_relaxed_true_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_seqcst_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_seqcst_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_acquire_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_acquire_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_relaxed_false_true:
        mov               ecx, dword ptr [esp + 0x4]
        mov               dl, 0x1
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_relaxed_true_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        mov               al, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_seqcst_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_acquire_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange::bool::release_relaxed_false_false:
        mov               ecx, dword ptr [esp + 0x4]
        xor               edx, edx
        xor               eax, eax
        lock cmpxchg      byte ptr [ecx], dl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        mov               edx, eax
        setne             al
        ret

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::acqrel_acquire:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::acqrel_relaxed:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::acquire_seqcst:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::relaxed_seqcst:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::release_seqcst:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::seqcst_acquire:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::acquire_acquire:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::acquire_relaxed:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::relaxed_acquire:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::relaxed_relaxed:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::release_acquire:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f32::release_relaxed:
        push              esi
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x14]
        xor               edx, edx
        lock cmpxchg      dword ptr [ecx], esi
        mov               ecx, dword ptr [esp + 0x8]
        setne             dl
        mov               dword ptr [ecx + 0x4], eax
        mov               eax, ecx
        mov               dword ptr [ecx], edx
        pop               esi
        ret               0x4

asm_test::compare_exchange_weak::f64::acqrel_seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::seqcst_seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::acqrel_acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::acqrel_relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::acquire_seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::relaxed_seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::release_seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::seqcst_acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::seqcst_relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::acquire_acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::acquire_relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::relaxed_acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::relaxed_relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::release_acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::f64::release_relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        push              esi
        movzx             eax, word ptr [esp + 0xc]
        movzx             edx, word ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      word ptr [esi], dx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        push              esi
        mov               eax, dword ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x10]
        mov               esi, dword ptr [esp + 0x8]
        xor               ecx, ecx
        lock cmpxchg      dword ptr [esi], edx
        setne             cl
        mov               edx, eax
        mov               eax, ecx
        pop               esi
        ret

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::release_seqcst:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::acquire_acquire:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::release_acquire:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::u64::release_relaxed:
        push              ebx
        push              esi
        mov               eax, dword ptr [esp + 0x14]
        mov               edx, dword ptr [esp + 0x18]
        mov               ebx, dword ptr [esp + 0x1c]
        mov               ecx, dword ptr [esp + 0x20]
        mov               esi, dword ptr [esp + 0x10]
        lock cmpxchg8b    qword ptr [esi]
        mov               ecx, dword ptr [esp + 0xc]
        mov               ebx, 0x0
        setne             bl
        mov               dword ptr [ecx + 0x4], eax
        mov               dword ptr [ecx + 0x8], edx
        mov               eax, ecx
        mov               dword ptr [ecx], ebx
        pop               esi
        pop               ebx
        ret               0x4

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        movzx             ecx, byte ptr [esp + 0xc]
        mov               edx, dword ptr [esp + 0x4]
        lock cmpxchg      byte ptr [edx], cl
        setne             cl
        test              al, al
        setne             dl
        mov               eax, ecx
        ret

asm_test::or::u8::acqrel_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, -0x1
        xchg              byte ptr [eax], cl
        ret

asm_test::or::u8::seqcst_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, -0x1
        xchg              byte ptr [eax], cl
        ret

asm_test::or::u8::acqrel_zero:
        ret

asm_test::or::u8::acquire_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, -0x1
        xchg              byte ptr [eax], cl
        ret

asm_test::or::u8::relaxed_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, -0x1
        xchg              byte ptr [eax], cl
        ret

asm_test::or::u8::release_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, -0x1
        xchg              byte ptr [eax], cl
        ret

asm_test::or::u8::seqcst_zero:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::or::u8::acquire_zero:
        ret

asm_test::or::u8::relaxed_zero:
        ret

asm_test::or::u8::release_zero:
        ret

asm_test::or::u8::acqrel:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           byte ptr [ecx], al
        ret

asm_test::or::u8::seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           byte ptr [ecx], al
        ret

asm_test::or::u8::acquire:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           byte ptr [ecx], al
        ret

asm_test::or::u8::relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           byte ptr [ecx], al
        ret

asm_test::or::u8::release:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           byte ptr [ecx], al
        ret

asm_test::or::u16::acqrel_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               cx, 0xffff
        xchg              word ptr [eax], cx
        ret

asm_test::or::u16::seqcst_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               cx, 0xffff
        xchg              word ptr [eax], cx
        ret

asm_test::or::u16::acqrel_zero:
        ret

asm_test::or::u16::acquire_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               cx, 0xffff
        xchg              word ptr [eax], cx
        ret

asm_test::or::u16::relaxed_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               cx, 0xffff
        xchg              word ptr [eax], cx
        ret

asm_test::or::u16::release_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               cx, 0xffff
        xchg              word ptr [eax], cx
        ret

asm_test::or::u16::seqcst_zero:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::or::u16::acquire_zero:
        ret

asm_test::or::u16::relaxed_zero:
        ret

asm_test::or::u16::release_zero:
        ret

asm_test::or::u16::acqrel:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           word ptr [ecx], ax
        ret

asm_test::or::u16::seqcst:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           word ptr [ecx], ax
        ret

asm_test::or::u16::acquire:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           word ptr [ecx], ax
        ret

asm_test::or::u16::relaxed:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           word ptr [ecx], ax
        ret

asm_test::or::u16::release:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           word ptr [ecx], ax
        ret

asm_test::or::u32::acqrel_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, 0xffffffff
        xchg              dword ptr [eax], ecx
        ret

asm_test::or::u32::seqcst_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, 0xffffffff
        xchg              dword ptr [eax], ecx
        ret

asm_test::or::u32::acqrel_zero:
        ret

asm_test::or::u32::acquire_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, 0xffffffff
        xchg              dword ptr [eax], ecx
        ret

asm_test::or::u32::relaxed_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, 0xffffffff
        xchg              dword ptr [eax], ecx
        ret

asm_test::or::u32::release_all:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, 0xffffffff
        xchg              dword ptr [eax], ecx
        ret

asm_test::or::u32::seqcst_zero:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::or::u32::acquire_zero:
        ret

asm_test::or::u32::relaxed_zero:
        ret

asm_test::or::u32::release_zero:
        ret

asm_test::or::u32::acqrel:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           dword ptr [ecx], eax
        ret

asm_test::or::u32::seqcst:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           dword ptr [ecx], eax
        ret

asm_test::or::u32::acquire:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           dword ptr [ecx], eax
        ret

asm_test::or::u32::relaxed:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           dword ptr [ecx], eax
        ret

asm_test::or::u32::release:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           dword ptr [ecx], eax
        ret

asm_test::or::u64::acqrel_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::or::u64::seqcst_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::or::u64::acqrel_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::or::u64::acquire_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::or::u64::relaxed_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::or::u64::release_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::or::u64::seqcst_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::or::u64::acquire_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::or::u64::relaxed_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::or::u64::release_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::or::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, edi
        or                ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::or::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, edi
        or                ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::or::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, edi
        or                ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::or::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, edi
        or                ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::or::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, edi
        or                ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::or::bool::acqrel_true:
        mov               eax, dword ptr [esp + 0x4]
        lock or           byte ptr [eax], 0x1
        ret

asm_test::or::bool::seqcst_true:
        mov               eax, dword ptr [esp + 0x4]
        lock or           byte ptr [eax], 0x1
        ret

asm_test::or::bool::acqrel_false:
        ret

asm_test::or::bool::acquire_true:
        mov               eax, dword ptr [esp + 0x4]
        lock or           byte ptr [eax], 0x1
        ret

asm_test::or::bool::relaxed_true:
        mov               eax, dword ptr [esp + 0x4]
        lock or           byte ptr [eax], 0x1
        ret

asm_test::or::bool::release_true:
        mov               eax, dword ptr [esp + 0x4]
        lock or           byte ptr [eax], 0x1
        ret

asm_test::or::bool::seqcst_false:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::or::bool::acquire_false:
        ret

asm_test::or::bool::relaxed_false:
        ret

asm_test::or::bool::release_false:
        ret

asm_test::or::bool::acqrel:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           byte ptr [ecx], al
        ret

asm_test::or::bool::seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           byte ptr [ecx], al
        ret

asm_test::or::bool::acquire:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           byte ptr [ecx], al
        ret

asm_test::or::bool::relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           byte ptr [ecx], al
        ret

asm_test::or::bool::release:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock or           byte ptr [ecx], al
        ret

asm_test::add::u8::acqrel_zero:
        ret

asm_test::add::u8::seqcst_zero:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::add::u8::acquire_zero:
        ret

asm_test::add::u8::relaxed_zero:
        ret

asm_test::add::u8::release_zero:
        ret

asm_test::add::u8::acqrel:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          byte ptr [ecx], al
        ret

asm_test::add::u8::seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          byte ptr [ecx], al
        ret

asm_test::add::u8::acquire:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          byte ptr [ecx], al
        ret

asm_test::add::u8::relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          byte ptr [ecx], al
        ret

asm_test::add::u8::release:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          byte ptr [ecx], al
        ret

asm_test::add::u16::acqrel_zero:
        ret

asm_test::add::u16::seqcst_zero:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::add::u16::acquire_zero:
        ret

asm_test::add::u16::relaxed_zero:
        ret

asm_test::add::u16::release_zero:
        ret

asm_test::add::u16::acqrel:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          word ptr [ecx], ax
        ret

asm_test::add::u16::seqcst:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          word ptr [ecx], ax
        ret

asm_test::add::u16::acquire:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          word ptr [ecx], ax
        ret

asm_test::add::u16::relaxed:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          word ptr [ecx], ax
        ret

asm_test::add::u16::release:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          word ptr [ecx], ax
        ret

asm_test::add::u32::acqrel_zero:
        ret

asm_test::add::u32::seqcst_zero:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::add::u32::acquire_zero:
        ret

asm_test::add::u32::relaxed_zero:
        ret

asm_test::add::u32::release_zero:
        ret

asm_test::add::u32::acqrel:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          dword ptr [ecx], eax
        ret

asm_test::add::u32::seqcst:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          dword ptr [ecx], eax
        ret

asm_test::add::u32::acquire:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          dword ptr [ecx], eax
        ret

asm_test::add::u32::relaxed:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          dword ptr [ecx], eax
        ret

asm_test::add::u32::release:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock add          dword ptr [ecx], eax
        ret

asm_test::add::u64::acqrel_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::add::u64::seqcst_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::add::u64::acquire_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::add::u64::relaxed_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::add::u64::release_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::add::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        add               ebx, edi
        adc               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::add::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        add               ebx, edi
        adc               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::add::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        add               ebx, edi
        adc               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::add::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        add               ebx, edi
        adc               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::add::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        add               ebx, edi
        adc               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::and::u8::acqrel_all:
        ret

asm_test::and::u8::seqcst_all:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::and::u8::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        ret

asm_test::and::u8::acquire_all:
        ret

asm_test::and::u8::relaxed_all:
        ret

asm_test::and::u8::release_all:
        ret

asm_test::and::u8::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        ret

asm_test::and::u8::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        ret

asm_test::and::u8::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        ret

asm_test::and::u8::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        ret

asm_test::and::u8::acqrel:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          byte ptr [ecx], al
        ret

asm_test::and::u8::seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          byte ptr [ecx], al
        ret

asm_test::and::u8::acquire:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          byte ptr [ecx], al
        ret

asm_test::and::u8::relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          byte ptr [ecx], al
        ret

asm_test::and::u8::release:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          byte ptr [ecx], al
        ret

asm_test::and::u16::acqrel_all:
        ret

asm_test::and::u16::seqcst_all:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::and::u16::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              word ptr [eax], cx
        ret

asm_test::and::u16::acquire_all:
        ret

asm_test::and::u16::relaxed_all:
        ret

asm_test::and::u16::release_all:
        ret

asm_test::and::u16::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              word ptr [eax], cx
        ret

asm_test::and::u16::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              word ptr [eax], cx
        ret

asm_test::and::u16::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              word ptr [eax], cx
        ret

asm_test::and::u16::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              word ptr [eax], cx
        ret

asm_test::and::u16::acqrel:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          word ptr [ecx], ax
        ret

asm_test::and::u16::seqcst:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          word ptr [ecx], ax
        ret

asm_test::and::u16::acquire:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          word ptr [ecx], ax
        ret

asm_test::and::u16::relaxed:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          word ptr [ecx], ax
        ret

asm_test::and::u16::release:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          word ptr [ecx], ax
        ret

asm_test::and::u32::acqrel_all:
        ret

asm_test::and::u32::seqcst_all:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::and::u32::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              dword ptr [eax], ecx
        ret

asm_test::and::u32::acquire_all:
        ret

asm_test::and::u32::relaxed_all:
        ret

asm_test::and::u32::release_all:
        ret

asm_test::and::u32::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              dword ptr [eax], ecx
        ret

asm_test::and::u32::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              dword ptr [eax], ecx
        ret

asm_test::and::u32::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              dword ptr [eax], ecx
        ret

asm_test::and::u32::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              dword ptr [eax], ecx
        ret

asm_test::and::u32::acqrel:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          dword ptr [ecx], eax
        ret

asm_test::and::u32::seqcst:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          dword ptr [ecx], eax
        ret

asm_test::and::u32::acquire:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          dword ptr [ecx], eax
        ret

asm_test::and::u32::relaxed:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          dword ptr [ecx], eax
        ret

asm_test::and::u32::release:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          dword ptr [ecx], eax
        ret

asm_test::and::u64::acqrel_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::and::u64::seqcst_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::and::u64::acqrel_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        xor               ecx, ecx
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax]
0:
        xor               ebx, ebx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::and::u64::acquire_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::and::u64::relaxed_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::and::u64::release_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::and::u64::seqcst_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        xor               ecx, ecx
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax]
0:
        xor               ebx, ebx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::and::u64::acquire_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        xor               ecx, ecx
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax]
0:
        xor               ebx, ebx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::and::u64::relaxed_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        xor               ecx, ecx
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax]
0:
        xor               ebx, ebx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::and::u64::release_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        xor               ecx, ecx
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax]
0:
        xor               ebx, ebx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::and::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, edi
        and               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::and::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, edi
        and               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::and::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, edi
        and               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::and::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, edi
        and               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::and::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, edi
        and               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::and::bool::acqrel_true:
        mov               eax, dword ptr [esp + 0x4]
        lock and          byte ptr [eax], 0x1
        ret

asm_test::and::bool::seqcst_true:
        mov               eax, dword ptr [esp + 0x4]
        lock and          byte ptr [eax], 0x1
        ret

asm_test::and::bool::acqrel_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        ret

asm_test::and::bool::acquire_true:
        mov               eax, dword ptr [esp + 0x4]
        lock and          byte ptr [eax], 0x1
        ret

asm_test::and::bool::relaxed_true:
        mov               eax, dword ptr [esp + 0x4]
        lock and          byte ptr [eax], 0x1
        ret

asm_test::and::bool::release_true:
        mov               eax, dword ptr [esp + 0x4]
        lock and          byte ptr [eax], 0x1
        ret

asm_test::and::bool::seqcst_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        ret

asm_test::and::bool::acquire_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        ret

asm_test::and::bool::relaxed_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        ret

asm_test::and::bool::release_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        ret

asm_test::and::bool::acqrel:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          byte ptr [ecx], al
        ret

asm_test::and::bool::seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          byte ptr [ecx], al
        ret

asm_test::and::bool::acquire:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          byte ptr [ecx], al
        ret

asm_test::and::bool::relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          byte ptr [ecx], al
        ret

asm_test::and::bool::release:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock and          byte ptr [ecx], al
        ret

asm_test::neg::u8::acqrel:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          byte ptr [eax]
        ret

asm_test::neg::u8::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          byte ptr [eax]
        ret

asm_test::neg::u8::acquire:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          byte ptr [eax]
        ret

asm_test::neg::u8::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          byte ptr [eax]
        ret

asm_test::neg::u8::release:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          byte ptr [eax]
        ret

asm_test::neg::u16::acqrel:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          word ptr [eax]
        ret

asm_test::neg::u16::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          word ptr [eax]
        ret

asm_test::neg::u16::acquire:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          word ptr [eax]
        ret

asm_test::neg::u16::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          word ptr [eax]
        ret

asm_test::neg::u16::release:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          word ptr [eax]
        ret

asm_test::neg::u32::acqrel:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          dword ptr [eax]
        ret

asm_test::neg::u32::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          dword ptr [eax]
        ret

asm_test::neg::u32::acquire:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          dword ptr [eax]
        ret

asm_test::neg::u32::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          dword ptr [eax]
        ret

asm_test::neg::u32::release:
        mov               eax, dword ptr [esp + 0x4]
        lock neg          dword ptr [eax]
        ret

asm_test::neg::u64::acqrel:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, 0x0
        neg               ebx
        sbb               ecx, edx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::neg::u64::seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, 0x0
        neg               ebx
        sbb               ecx, edx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::neg::u64::acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, 0x0
        neg               ebx
        sbb               ecx, edx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::neg::u64::relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, 0x0
        neg               ebx
        sbb               ecx, edx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::neg::u64::release:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, 0x0
        neg               ebx
        sbb               ecx, edx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::not::u8::acqrel:
        mov               eax, dword ptr [esp + 0x4]
        lock not          byte ptr [eax]
        ret

asm_test::not::u8::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        lock not          byte ptr [eax]
        ret

asm_test::not::u8::acquire:
        mov               eax, dword ptr [esp + 0x4]
        lock not          byte ptr [eax]
        ret

asm_test::not::u8::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        lock not          byte ptr [eax]
        ret

asm_test::not::u8::release:
        mov               eax, dword ptr [esp + 0x4]
        lock not          byte ptr [eax]
        ret

asm_test::not::u16::acqrel:
        mov               eax, dword ptr [esp + 0x4]
        lock not          word ptr [eax]
        ret

asm_test::not::u16::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        lock not          word ptr [eax]
        ret

asm_test::not::u16::acquire:
        mov               eax, dword ptr [esp + 0x4]
        lock not          word ptr [eax]
        ret

asm_test::not::u16::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        lock not          word ptr [eax]
        ret

asm_test::not::u16::release:
        mov               eax, dword ptr [esp + 0x4]
        lock not          word ptr [eax]
        ret

asm_test::not::u32::acqrel:
        mov               eax, dword ptr [esp + 0x4]
        lock not          dword ptr [eax]
        ret

asm_test::not::u32::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        lock not          dword ptr [eax]
        ret

asm_test::not::u32::acquire:
        mov               eax, dword ptr [esp + 0x4]
        lock not          dword ptr [eax]
        ret

asm_test::not::u32::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        lock not          dword ptr [eax]
        ret

asm_test::not::u32::release:
        mov               eax, dword ptr [esp + 0x4]
        lock not          dword ptr [eax]
        ret

asm_test::not::u64::acqrel:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::not::u64::seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::not::u64::acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::not::u64::relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::not::u64::release:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::not::bool::acqrel:
        mov               eax, dword ptr [esp + 0x4]
        lock xor          byte ptr [eax], 0x1
        ret

asm_test::not::bool::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        lock xor          byte ptr [eax], 0x1
        ret

asm_test::not::bool::acquire:
        mov               eax, dword ptr [esp + 0x4]
        lock xor          byte ptr [eax], 0x1
        ret

asm_test::not::bool::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        lock xor          byte ptr [eax], 0x1
        ret

asm_test::not::bool::release:
        mov               eax, dword ptr [esp + 0x4]
        lock xor          byte ptr [eax], 0x1
        ret

asm_test::sub::u8::acqrel_zero:
        ret

asm_test::sub::u8::seqcst_zero:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::sub::u8::acquire_zero:
        ret

asm_test::sub::u8::relaxed_zero:
        ret

asm_test::sub::u8::release_zero:
        ret

asm_test::sub::u8::acqrel:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          byte ptr [ecx], al
        ret

asm_test::sub::u8::seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          byte ptr [ecx], al
        ret

asm_test::sub::u8::acquire:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          byte ptr [ecx], al
        ret

asm_test::sub::u8::relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          byte ptr [ecx], al
        ret

asm_test::sub::u8::release:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          byte ptr [ecx], al
        ret

asm_test::sub::u16::acqrel_zero:
        ret

asm_test::sub::u16::seqcst_zero:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::sub::u16::acquire_zero:
        ret

asm_test::sub::u16::relaxed_zero:
        ret

asm_test::sub::u16::release_zero:
        ret

asm_test::sub::u16::acqrel:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          word ptr [ecx], ax
        ret

asm_test::sub::u16::seqcst:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          word ptr [ecx], ax
        ret

asm_test::sub::u16::acquire:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          word ptr [ecx], ax
        ret

asm_test::sub::u16::relaxed:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          word ptr [ecx], ax
        ret

asm_test::sub::u16::release:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          word ptr [ecx], ax
        ret

asm_test::sub::u32::acqrel_zero:
        ret

asm_test::sub::u32::seqcst_zero:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::sub::u32::acquire_zero:
        ret

asm_test::sub::u32::relaxed_zero:
        ret

asm_test::sub::u32::release_zero:
        ret

asm_test::sub::u32::acqrel:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          dword ptr [ecx], eax
        ret

asm_test::sub::u32::seqcst:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          dword ptr [ecx], eax
        ret

asm_test::sub::u32::acquire:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          dword ptr [ecx], eax
        ret

asm_test::sub::u32::relaxed:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          dword ptr [ecx], eax
        ret

asm_test::sub::u32::release:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock sub          dword ptr [ecx], eax
        ret

asm_test::sub::u64::acqrel_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::sub::u64::seqcst_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::sub::u64::acquire_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::sub::u64::relaxed_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::sub::u64::release_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::sub::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        sub               ebx, edi
        sbb               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::sub::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        sub               ebx, edi
        sbb               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::sub::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        sub               ebx, edi
        sbb               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::sub::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        sub               ebx, edi
        sbb               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::sub::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        sub               ebx, edi
        sbb               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::xor::u8::acqrel_zero:
        ret

asm_test::xor::u8::seqcst_zero:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::xor::u8::acquire_zero:
        ret

asm_test::xor::u8::relaxed_zero:
        ret

asm_test::xor::u8::release_zero:
        ret

asm_test::xor::u8::acqrel:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          byte ptr [ecx], al
        ret

asm_test::xor::u8::seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          byte ptr [ecx], al
        ret

asm_test::xor::u8::acquire:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          byte ptr [ecx], al
        ret

asm_test::xor::u8::relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          byte ptr [ecx], al
        ret

asm_test::xor::u8::release:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          byte ptr [ecx], al
        ret

asm_test::xor::u16::acqrel_zero:
        ret

asm_test::xor::u16::seqcst_zero:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::xor::u16::acquire_zero:
        ret

asm_test::xor::u16::relaxed_zero:
        ret

asm_test::xor::u16::release_zero:
        ret

asm_test::xor::u16::acqrel:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          word ptr [ecx], ax
        ret

asm_test::xor::u16::seqcst:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          word ptr [ecx], ax
        ret

asm_test::xor::u16::acquire:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          word ptr [ecx], ax
        ret

asm_test::xor::u16::relaxed:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          word ptr [ecx], ax
        ret

asm_test::xor::u16::release:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          word ptr [ecx], ax
        ret

asm_test::xor::u32::acqrel_zero:
        ret

asm_test::xor::u32::seqcst_zero:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::xor::u32::acquire_zero:
        ret

asm_test::xor::u32::relaxed_zero:
        ret

asm_test::xor::u32::release_zero:
        ret

asm_test::xor::u32::acqrel:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          dword ptr [ecx], eax
        ret

asm_test::xor::u32::seqcst:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          dword ptr [ecx], eax
        ret

asm_test::xor::u32::acquire:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          dword ptr [ecx], eax
        ret

asm_test::xor::u32::relaxed:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          dword ptr [ecx], eax
        ret

asm_test::xor::u32::release:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          dword ptr [ecx], eax
        ret

asm_test::xor::u64::acqrel_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::xor::u64::seqcst_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::xor::u64::acquire_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::xor::u64::relaxed_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::xor::u64::release_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::xor::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, edi
        xor               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::xor::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, edi
        xor               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::xor::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, edi
        xor               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::xor::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, edi
        xor               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::xor::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, edi
        xor               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::xor::bool::acqrel_true:
        mov               eax, dword ptr [esp + 0x4]
        lock xor          byte ptr [eax], 0x1
        ret

asm_test::xor::bool::seqcst_true:
        mov               eax, dword ptr [esp + 0x4]
        lock xor          byte ptr [eax], 0x1
        ret

asm_test::xor::bool::acqrel_false:
        ret

asm_test::xor::bool::acquire_true:
        mov               eax, dword ptr [esp + 0x4]
        lock xor          byte ptr [eax], 0x1
        ret

asm_test::xor::bool::relaxed_true:
        mov               eax, dword ptr [esp + 0x4]
        lock xor          byte ptr [eax], 0x1
        ret

asm_test::xor::bool::release_true:
        mov               eax, dword ptr [esp + 0x4]
        lock xor          byte ptr [eax], 0x1
        ret

asm_test::xor::bool::seqcst_false:
        lock or           dword ptr [esp], 0x0
        ret

asm_test::xor::bool::acquire_false:
        ret

asm_test::xor::bool::relaxed_false:
        ret

asm_test::xor::bool::release_false:
        ret

asm_test::xor::bool::acqrel:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          byte ptr [ecx], al
        ret

asm_test::xor::bool::seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          byte ptr [ecx], al
        ret

asm_test::xor::bool::acquire:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          byte ptr [ecx], al
        ret

asm_test::xor::bool::relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          byte ptr [ecx], al
        ret

asm_test::xor::bool::release:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        lock xor          byte ptr [ecx], al
        ret

asm_test::load::u8::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [eax]
        ret

asm_test::load::u8::acquire:
        mov               eax, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [eax]
        ret

asm_test::load::u8::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [eax]
        ret

asm_test::load::f32::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [eax]
        ret

asm_test::load::f32::acquire:
        mov               eax, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [eax]
        ret

asm_test::load::f32::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [eax]
        ret

asm_test::load::f64::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        movsd             xmm0, qword ptr [eax]
        ret

asm_test::load::f64::acquire:
        mov               eax, dword ptr [esp + 0x4]
        movsd             xmm0, qword ptr [eax]
        ret

asm_test::load::f64::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        movsd             xmm0, qword ptr [eax]
        ret

asm_test::load::u16::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        movzx             eax, word ptr [eax]
        ret

asm_test::load::u16::acquire:
        mov               eax, dword ptr [esp + 0x4]
        movzx             eax, word ptr [eax]
        ret

asm_test::load::u16::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        movzx             eax, word ptr [eax]
        ret

asm_test::load::u32::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        mov               eax, dword ptr [eax]
        ret

asm_test::load::u32::acquire:
        mov               eax, dword ptr [esp + 0x4]
        mov               eax, dword ptr [eax]
        ret

asm_test::load::u32::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        mov               eax, dword ptr [eax]
        ret

asm_test::load::u64::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        movq              xmm0, qword ptr [eax]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        ret

asm_test::load::u64::acquire:
        mov               eax, dword ptr [esp + 0x4]
        movq              xmm0, qword ptr [eax]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        ret

asm_test::load::u64::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        movq              xmm0, qword ptr [eax]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        ret

asm_test::load::bool::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::load::bool::acquire:
        mov               eax, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::load::bool::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::swap::u8::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [esp + 0x8]
        xchg              byte ptr [ecx], al
        ret

asm_test::swap::u8::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [esp + 0x8]
        xchg              byte ptr [ecx], al
        ret

asm_test::swap::u8::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [esp + 0x8]
        xchg              byte ptr [ecx], al
        ret

asm_test::swap::u8::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [esp + 0x8]
        xchg              byte ptr [ecx], al
        ret

asm_test::swap::u8::release:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [esp + 0x8]
        xchg              byte ptr [ecx], al
        ret

asm_test::swap::f32::acqrel:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, dword ptr [esp + 0x8]
        xchg              dword ptr [eax], ecx
        movd              xmm0, ecx
        ret

asm_test::swap::f32::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, dword ptr [esp + 0x8]
        xchg              dword ptr [eax], ecx
        movd              xmm0, ecx
        ret

asm_test::swap::f32::acquire:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, dword ptr [esp + 0x8]
        xchg              dword ptr [eax], ecx
        movd              xmm0, ecx
        ret

asm_test::swap::f32::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, dword ptr [esp + 0x8]
        xchg              dword ptr [eax], ecx
        movd              xmm0, ecx
        ret

asm_test::swap::f32::release:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, dword ptr [esp + 0x8]
        xchg              dword ptr [eax], ecx
        movd              xmm0, ecx
        ret

asm_test::swap::f64::acqrel:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ebx, dword ptr [esp + 0x10]
        mov               ecx, dword ptr [esp + 0x14]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::swap::f64::seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ebx, dword ptr [esp + 0x10]
        mov               ecx, dword ptr [esp + 0x14]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::swap::f64::acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ebx, dword ptr [esp + 0x10]
        mov               ecx, dword ptr [esp + 0x14]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::swap::f64::relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ebx, dword ptr [esp + 0x10]
        mov               ecx, dword ptr [esp + 0x14]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::swap::f64::release:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ebx, dword ptr [esp + 0x10]
        mov               ecx, dword ptr [esp + 0x14]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::swap::u16::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [esp + 0x8]
        xchg              word ptr [ecx], ax
        ret

asm_test::swap::u16::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [esp + 0x8]
        xchg              word ptr [ecx], ax
        ret

asm_test::swap::u16::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [esp + 0x8]
        xchg              word ptr [ecx], ax
        ret

asm_test::swap::u16::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [esp + 0x8]
        xchg              word ptr [ecx], ax
        ret

asm_test::swap::u16::release:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [esp + 0x8]
        xchg              word ptr [ecx], ax
        ret

asm_test::swap::u32::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [esp + 0x8]
        xchg              dword ptr [ecx], eax
        ret

asm_test::swap::u32::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [esp + 0x8]
        xchg              dword ptr [ecx], eax
        ret

asm_test::swap::u32::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [esp + 0x8]
        xchg              dword ptr [ecx], eax
        ret

asm_test::swap::u32::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [esp + 0x8]
        xchg              dword ptr [ecx], eax
        ret

asm_test::swap::u32::release:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [esp + 0x8]
        xchg              dword ptr [ecx], eax
        ret

asm_test::swap::u64::acqrel:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, dword ptr [esp + 0x14]
        mov               ebx, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::swap::u64::seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, dword ptr [esp + 0x14]
        mov               ebx, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::swap::u64::acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, dword ptr [esp + 0x14]
        mov               ebx, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::swap::u64::relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, dword ptr [esp + 0x14]
        mov               ebx, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::swap::u64::release:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, dword ptr [esp + 0x14]
        mov               ebx, dword ptr [esp + 0x10]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::swap::bool::acqrel_true:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, 0x1
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::seqcst_true:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, 0x1
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::acqrel_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::acquire_true:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, 0x1
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::relaxed_true:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, 0x1
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::release_true:
        mov               eax, dword ptr [esp + 0x4]
        mov               cl, 0x1
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::seqcst_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::acquire_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::relaxed_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::release_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::acqrel:
        mov               eax, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::acquire:
        mov               eax, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::swap::bool::release:
        mov               eax, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::store::u8::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        xchg              byte ptr [eax], cl
        ret

asm_test::store::u8::relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        mov               byte ptr [ecx], al
        ret

asm_test::store::u8::release:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        mov               byte ptr [ecx], al
        ret

asm_test::store::f32::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, dword ptr [esp + 0x8]
        xchg              dword ptr [eax], ecx
        ret

asm_test::store::f32::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, dword ptr [esp + 0x8]
        mov               dword ptr [eax], ecx
        ret

asm_test::store::f32::release:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, dword ptr [esp + 0x8]
        mov               dword ptr [eax], ecx
        ret

asm_test::store::f64::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        movsd             xmm0, qword ptr [esp + 0x8]
        movlps            qword ptr [eax], xmm0
        lock or           dword ptr [esp], 0x0
        ret

asm_test::store::f64::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        movsd             xmm0, qword ptr [esp + 0x8]
        movlps            qword ptr [eax], xmm0
        ret

asm_test::store::f64::release:
        mov               eax, dword ptr [esp + 0x4]
        movsd             xmm0, qword ptr [esp + 0x8]
        movlps            qword ptr [eax], xmm0
        ret

asm_test::store::u16::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        movzx             ecx, word ptr [esp + 0x8]
        xchg              word ptr [eax], cx
        ret

asm_test::store::u16::relaxed:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        mov               word ptr [ecx], ax
        ret

asm_test::store::u16::release:
        movzx             eax, word ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        mov               word ptr [ecx], ax
        ret

asm_test::store::u32::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, dword ptr [esp + 0x8]
        xchg              dword ptr [eax], ecx
        ret

asm_test::store::u32::relaxed:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        mov               dword ptr [ecx], eax
        ret

asm_test::store::u32::release:
        mov               eax, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        mov               dword ptr [ecx], eax
        ret

asm_test::store::u64::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        movsd             xmm0, qword ptr [esp + 0x8]
        movlps            qword ptr [eax], xmm0
        lock or           dword ptr [esp], 0x0
        ret

asm_test::store::u64::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        movsd             xmm0, qword ptr [esp + 0x8]
        movlps            qword ptr [eax], xmm0
        ret

asm_test::store::u64::release:
        mov               eax, dword ptr [esp + 0x4]
        movsd             xmm0, qword ptr [esp + 0x8]
        movlps            qword ptr [eax], xmm0
        ret

asm_test::store::bool::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        xchg              byte ptr [eax], cl
        ret

asm_test::store::bool::relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        mov               byte ptr [ecx], al
        ret

asm_test::store::bool::release:
        movzx             eax, byte ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0x4]
        mov               byte ptr [ecx], al
        ret

asm_test::bit_set::u8::acqrel:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        mov               ah, 0x1
        mov               al, byte ptr [edx]
        and               cl, 0x7
        shl               ah, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        mov               ecx, eax
        or                cl, ah
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_set::u8::seqcst:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        mov               ah, 0x1
        mov               al, byte ptr [edx]
        and               cl, 0x7
        shl               ah, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        mov               ecx, eax
        or                cl, ah
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_set::u8::acquire:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        mov               ah, 0x1
        mov               al, byte ptr [edx]
        and               cl, 0x7
        shl               ah, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        mov               ecx, eax
        or                cl, ah
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_set::u8::relaxed:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        mov               ah, 0x1
        mov               al, byte ptr [edx]
        and               cl, 0x7
        shl               ah, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        mov               ecx, eax
        or                cl, ah
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_set::u8::release:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        mov               ah, 0x1
        mov               al, byte ptr [edx]
        and               cl, 0x7
        shl               ah, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax]
0:
        mov               ecx, eax
        or                cl, ah
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_set::u16::acqrel:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock bts          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_set::u16::seqcst:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock bts          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_set::u16::acquire:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock bts          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_set::u16::relaxed:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock bts          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_set::u16::release:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock bts          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_set::u32::acqrel:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock bts          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_set::u32::seqcst:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock bts          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_set::u32::acquire:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock bts          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_set::u32::relaxed:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock bts          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_set::u32::release:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock bts          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_set::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        movzx             ecx, byte ptr [esp + 0x18]
        mov               edi, dword ptr [esp + 0x14]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        nop               dword ptr [eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, esi
        or                ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, esi
        and               edx, ebp
        or                edx, eax
        setne             al
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::bit_set::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        movzx             ecx, byte ptr [esp + 0x18]
        mov               edi, dword ptr [esp + 0x14]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        nop               dword ptr [eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, esi
        or                ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, esi
        and               edx, ebp
        or                edx, eax
        setne             al
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::bit_set::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        movzx             ecx, byte ptr [esp + 0x18]
        mov               edi, dword ptr [esp + 0x14]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        nop               dword ptr [eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, esi
        or                ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, esi
        and               edx, ebp
        or                edx, eax
        setne             al
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::bit_set::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        movzx             ecx, byte ptr [esp + 0x18]
        mov               edi, dword ptr [esp + 0x14]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        nop               dword ptr [eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, esi
        or                ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, esi
        and               edx, ebp
        or                edx, eax
        setne             al
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::bit_set::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        movzx             ecx, byte ptr [esp + 0x18]
        mov               edi, dword ptr [esp + 0x14]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        nop               dword ptr [eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, esi
        or                ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, esi
        and               edx, ebp
        or                edx, eax
        setne             al
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_or::u8::acqrel_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               al, -0x1
        xchg              byte ptr [ecx], al
        ret

asm_test::fetch_or::u8::seqcst_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               al, -0x1
        xchg              byte ptr [ecx], al
        ret

asm_test::fetch_or::u8::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_or::u8::acquire_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               al, -0x1
        xchg              byte ptr [ecx], al
        ret

asm_test::fetch_or::u8::relaxed_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               al, -0x1
        xchg              byte ptr [ecx], al
        ret

asm_test::fetch_or::u8::release_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               al, -0x1
        xchg              byte ptr [ecx], al
        ret

asm_test::fetch_or::u8::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_or::u8::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_or::u8::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_or::u8::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_or::u8::acqrel:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        or                ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_or::u8::seqcst:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        or                ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_or::u8::acquire:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        or                ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_or::u8::relaxed:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        or                ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_or::u8::release:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        or                ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_or::u16::acqrel_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               ax, 0xffff
        xchg              word ptr [ecx], ax
        ret

asm_test::fetch_or::u16::seqcst_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               ax, 0xffff
        xchg              word ptr [ecx], ax
        ret

asm_test::fetch_or::u16::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_or::u16::acquire_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               ax, 0xffff
        xchg              word ptr [ecx], ax
        ret

asm_test::fetch_or::u16::relaxed_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               ax, 0xffff
        xchg              word ptr [ecx], ax
        ret

asm_test::fetch_or::u16::release_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               ax, 0xffff
        xchg              word ptr [ecx], ax
        ret

asm_test::fetch_or::u16::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_or::u16::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_or::u16::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_or::u16::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_or::u16::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        or                esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_or::u16::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        or                esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_or::u16::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        or                esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_or::u16::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        or                esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_or::u16::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        or                esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_or::u32::acqrel_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, 0xffffffff
        xchg              dword ptr [ecx], eax
        ret

asm_test::fetch_or::u32::seqcst_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, 0xffffffff
        xchg              dword ptr [ecx], eax
        ret

asm_test::fetch_or::u32::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_or::u32::acquire_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, 0xffffffff
        xchg              dword ptr [ecx], eax
        ret

asm_test::fetch_or::u32::relaxed_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, 0xffffffff
        xchg              dword ptr [ecx], eax
        ret

asm_test::fetch_or::u32::release_all:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, 0xffffffff
        xchg              dword ptr [ecx], eax
        ret

asm_test::fetch_or::u32::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_or::u32::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_or::u32::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_or::u32::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_or::u32::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        or                esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_or::u32::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        or                esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_or::u32::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        or                esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_or::u32::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        or                esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_or::u32::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        or                esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_or::u64::acqrel_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_or::u64::seqcst_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_or::u64::acqrel_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_or::u64::acquire_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_or::u64::relaxed_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_or::u64::release_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               ecx, 0xffffffff
        mov               ebx, 0xffffffff
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               word ptr cs:[eax + eax]
        nop
0:
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_or::u64::seqcst_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_or::u64::acquire_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_or::u64::relaxed_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_or::u64::release_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_or::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, edi
        or                ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_or::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, edi
        or                ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_or::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, edi
        or                ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_or::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, edi
        or                ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_or::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        or                ebx, edi
        or                ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_or::bool::acqrel_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        or                dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::seqcst_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        or                dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::acqrel_false:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::acquire_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        or                dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::relaxed_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        or                dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::release_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        or                dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::seqcst_false:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::acquire_false:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::relaxed_false:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::release_false:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        or                ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        or                ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        or                ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        or                ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_or::bool::release:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        or                ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::bit_clear::u8::acqrel:
        movzx             eax, byte ptr [esp + 0x8]
        mov               edx, dword ptr [esp + 0x4]
        mov               ah, 0x1
        mov               ch, -0x2
        mov               cl, al
        and               cl, 0x7
        shl               ah, cl
        mov               cl, al
        mov               al, byte ptr [edx]
        rol               ch, cl
        nop               word ptr [eax + eax]
0:
        mov               cl, al
        and               cl, ch
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_clear::u8::seqcst:
        movzx             eax, byte ptr [esp + 0x8]
        mov               edx, dword ptr [esp + 0x4]
        mov               ah, 0x1
        mov               ch, -0x2
        mov               cl, al
        and               cl, 0x7
        shl               ah, cl
        mov               cl, al
        mov               al, byte ptr [edx]
        rol               ch, cl
        nop               word ptr [eax + eax]
0:
        mov               cl, al
        and               cl, ch
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_clear::u8::acquire:
        movzx             eax, byte ptr [esp + 0x8]
        mov               edx, dword ptr [esp + 0x4]
        mov               ah, 0x1
        mov               ch, -0x2
        mov               cl, al
        and               cl, 0x7
        shl               ah, cl
        mov               cl, al
        mov               al, byte ptr [edx]
        rol               ch, cl
        nop               word ptr [eax + eax]
0:
        mov               cl, al
        and               cl, ch
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_clear::u8::relaxed:
        movzx             eax, byte ptr [esp + 0x8]
        mov               edx, dword ptr [esp + 0x4]
        mov               ah, 0x1
        mov               ch, -0x2
        mov               cl, al
        and               cl, 0x7
        shl               ah, cl
        mov               cl, al
        mov               al, byte ptr [edx]
        rol               ch, cl
        nop               word ptr [eax + eax]
0:
        mov               cl, al
        and               cl, ch
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_clear::u8::release:
        movzx             eax, byte ptr [esp + 0x8]
        mov               edx, dword ptr [esp + 0x4]
        mov               ah, 0x1
        mov               ch, -0x2
        mov               cl, al
        and               cl, 0x7
        shl               ah, cl
        mov               cl, al
        mov               al, byte ptr [edx]
        rol               ch, cl
        nop               word ptr [eax + eax]
0:
        mov               cl, al
        and               cl, ch
        lock cmpxchg      byte ptr [edx], cl
        jne               0b
        test              al, ah
        setne             al
        ret

asm_test::bit_clear::u16::acqrel:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock btr          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_clear::u16::seqcst:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock btr          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_clear::u16::acquire:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock btr          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_clear::u16::relaxed:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock btr          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_clear::u16::release:
        movzx             ecx, word ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0xf
        lock btr          word ptr [eax], cx
        setb              al
        ret

asm_test::bit_clear::u32::acqrel:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock btr          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_clear::u32::seqcst:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock btr          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_clear::u32::acquire:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock btr          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_clear::u32::relaxed:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock btr          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_clear::u32::release:
        mov               ecx, dword ptr [esp + 0x8]
        mov               eax, dword ptr [esp + 0x4]
        and               ecx, 0x1f
        lock btr          dword ptr [eax], ecx
        setb              al
        ret

asm_test::bit_clear::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        sub               esp, 0x8
        movzx             ecx, byte ptr [esp + 0x20]
        mov               edi, dword ptr [esp + 0x1c]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        mov               dword ptr [esp], ebp
        mov               dword ptr [esp + 0x4], esi
        not               ebp
        not               esi
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, esi
        and               ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, dword ptr [esp + 0x4]
        and               edx, dword ptr [esp]
        or                edx, eax
        setne             al
        add               esp, 0x8
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::bit_clear::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        sub               esp, 0x8
        movzx             ecx, byte ptr [esp + 0x20]
        mov               edi, dword ptr [esp + 0x1c]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        mov               dword ptr [esp], ebp
        mov               dword ptr [esp + 0x4], esi
        not               ebp
        not               esi
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, esi
        and               ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, dword ptr [esp + 0x4]
        and               edx, dword ptr [esp]
        or                edx, eax
        setne             al
        add               esp, 0x8
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::bit_clear::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        sub               esp, 0x8
        movzx             ecx, byte ptr [esp + 0x20]
        mov               edi, dword ptr [esp + 0x1c]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        mov               dword ptr [esp], ebp
        mov               dword ptr [esp + 0x4], esi
        not               ebp
        not               esi
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, esi
        and               ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, dword ptr [esp + 0x4]
        and               edx, dword ptr [esp]
        or                edx, eax
        setne             al
        add               esp, 0x8
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::bit_clear::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        sub               esp, 0x8
        movzx             ecx, byte ptr [esp + 0x20]
        mov               edi, dword ptr [esp + 0x1c]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        mov               dword ptr [esp], ebp
        mov               dword ptr [esp + 0x4], esi
        not               ebp
        not               esi
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, esi
        and               ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, dword ptr [esp + 0x4]
        and               edx, dword ptr [esp]
        or                edx, eax
        setne             al
        add               esp, 0x8
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::bit_clear::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        sub               esp, 0x8
        movzx             ecx, byte ptr [esp + 0x20]
        mov               edi, dword ptr [esp + 0x1c]
        mov               esi, 0x1
        xor               ebp, ebp
        xor               eax, eax
        shld              ebp, esi, cl
        shl               esi, cl
        test              cl, 0x20
        mov               edx, dword ptr [edi + 0x4]
        cmovne            ebp, esi
        cmovne            esi, eax
        mov               eax, dword ptr [edi]
        mov               dword ptr [esp], ebp
        mov               dword ptr [esp + 0x4], esi
        not               ebp
        not               esi
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, esi
        and               ecx, ebp
        lock cmpxchg8b    qword ptr [edi]
        jne               0b
        and               eax, dword ptr [esp + 0x4]
        and               edx, dword ptr [esp]
        or                edx, eax
        setne             al
        add               esp, 0x8
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_abs::f32::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        and               edx, 0x7fffffff
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_abs::f32::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        and               edx, 0x7fffffff
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_abs::f32::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        and               edx, 0x7fffffff
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_abs::f32::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        and               edx, 0x7fffffff
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_abs::f32::release:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        and               edx, 0x7fffffff
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_abs::f64::acqrel:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        and               ecx, 0x7fffffff
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_abs::f64::seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        and               ecx, 0x7fffffff
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_abs::f64::acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        and               ecx, 0x7fffffff
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_abs::f64::relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        and               ecx, 0x7fffffff
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_abs::f64::release:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        and               ecx, 0x7fffffff
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::u8::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_add::u8::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_add::u8::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_add::u8::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_add::u8::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_add::u8::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [esp + 0x8]
        lock xadd         byte ptr [ecx], al
        ret

asm_test::fetch_add::u8::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [esp + 0x8]
        lock xadd         byte ptr [ecx], al
        ret

asm_test::fetch_add::u8::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [esp + 0x8]
        lock xadd         byte ptr [ecx], al
        ret

asm_test::fetch_add::u8::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [esp + 0x8]
        lock xadd         byte ptr [ecx], al
        ret

asm_test::fetch_add::u8::release:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [esp + 0x8]
        lock xadd         byte ptr [ecx], al
        ret

asm_test::fetch_add::f32::acqrel_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xorps             xmm0, xmm0
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::seqcst_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xorps             xmm0, xmm0
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::acquire_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xorps             xmm0, xmm0
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::relaxed_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xorps             xmm0, xmm0
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::release_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xorps             xmm0, xmm0
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f32::release:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        addss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_add::f64::acqrel_zero:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        pxor              xmm0, xmm0
        nop
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        addsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::f64::seqcst_zero:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        pxor              xmm0, xmm0
        nop
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        addsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::f64::acquire_zero:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        pxor              xmm0, xmm0
        nop
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        addsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::f64::relaxed_zero:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        pxor              xmm0, xmm0
        nop
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        addsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::f64::release_zero:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        pxor              xmm0, xmm0
        nop
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        addsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::f64::acqrel:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        addsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::f64::seqcst:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        addsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::f64::acquire:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        addsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::f64::relaxed:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        addsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::f64::release:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        addsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::u16::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_add::u16::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_add::u16::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_add::u16::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_add::u16::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_add::u16::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [esp + 0x8]
        lock xadd         word ptr [ecx], ax
        ret

asm_test::fetch_add::u16::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [esp + 0x8]
        lock xadd         word ptr [ecx], ax
        ret

asm_test::fetch_add::u16::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [esp + 0x8]
        lock xadd         word ptr [ecx], ax
        ret

asm_test::fetch_add::u16::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [esp + 0x8]
        lock xadd         word ptr [ecx], ax
        ret

asm_test::fetch_add::u16::release:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [esp + 0x8]
        lock xadd         word ptr [ecx], ax
        ret

asm_test::fetch_add::u32::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_add::u32::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_add::u32::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_add::u32::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_add::u32::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_add::u32::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [esp + 0x8]
        lock xadd         dword ptr [ecx], eax
        ret

asm_test::fetch_add::u32::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [esp + 0x8]
        lock xadd         dword ptr [ecx], eax
        ret

asm_test::fetch_add::u32::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [esp + 0x8]
        lock xadd         dword ptr [ecx], eax
        ret

asm_test::fetch_add::u32::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [esp + 0x8]
        lock xadd         dword ptr [ecx], eax
        ret

asm_test::fetch_add::u32::release:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [esp + 0x8]
        lock xadd         dword ptr [ecx], eax
        ret

asm_test::fetch_add::u64::acqrel_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::u64::seqcst_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::u64::acquire_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::u64::relaxed_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::u64::release_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_add::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        add               ebx, edi
        adc               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_add::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        add               ebx, edi
        adc               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_add::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        add               ebx, edi
        adc               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_add::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        add               ebx, edi
        adc               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_add::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        add               ebx, edi
        adc               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_and::u8::acqrel_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_and::u8::seqcst_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_and::u8::acqrel_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              byte ptr [ecx], al
        ret

asm_test::fetch_and::u8::acquire_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_and::u8::relaxed_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_and::u8::release_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_and::u8::seqcst_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              byte ptr [ecx], al
        ret

asm_test::fetch_and::u8::acquire_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              byte ptr [ecx], al
        ret

asm_test::fetch_and::u8::relaxed_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              byte ptr [ecx], al
        ret

asm_test::fetch_and::u8::release_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              byte ptr [ecx], al
        ret

asm_test::fetch_and::u8::acqrel:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_and::u8::seqcst:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_and::u8::acquire:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_and::u8::relaxed:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_and::u8::release:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_and::u16::acqrel_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_and::u16::seqcst_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_and::u16::acqrel_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              word ptr [ecx], ax
        ret

asm_test::fetch_and::u16::acquire_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_and::u16::relaxed_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_and::u16::release_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_and::u16::seqcst_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              word ptr [ecx], ax
        ret

asm_test::fetch_and::u16::acquire_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              word ptr [ecx], ax
        ret

asm_test::fetch_and::u16::relaxed_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              word ptr [ecx], ax
        ret

asm_test::fetch_and::u16::release_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              word ptr [ecx], ax
        ret

asm_test::fetch_and::u16::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        and               esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_and::u16::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        and               esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_and::u16::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        and               esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_and::u16::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        and               esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_and::u16::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        and               esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_and::u32::acqrel_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_and::u32::seqcst_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_and::u32::acqrel_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              dword ptr [ecx], eax
        ret

asm_test::fetch_and::u32::acquire_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_and::u32::relaxed_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_and::u32::release_all:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_and::u32::seqcst_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              dword ptr [ecx], eax
        ret

asm_test::fetch_and::u32::acquire_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              dword ptr [ecx], eax
        ret

asm_test::fetch_and::u32::relaxed_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              dword ptr [ecx], eax
        ret

asm_test::fetch_and::u32::release_zero:
        mov               ecx, dword ptr [esp + 0x4]
        xor               eax, eax
        xchg              dword ptr [ecx], eax
        ret

asm_test::fetch_and::u32::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        and               esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_and::u32::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        and               esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_and::u32::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        and               esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_and::u32::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        and               esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_and::u32::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        and               esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_and::u64::acqrel_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_and::u64::seqcst_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_and::u64::acqrel_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        xor               ecx, ecx
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax]
0:
        xor               ebx, ebx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_and::u64::acquire_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_and::u64::relaxed_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_and::u64::release_all:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_and::u64::seqcst_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        xor               ecx, ecx
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax]
0:
        xor               ebx, ebx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_and::u64::acquire_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        xor               ecx, ecx
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax]
0:
        xor               ebx, ebx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_and::u64::relaxed_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        xor               ecx, ecx
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax]
0:
        xor               ebx, ebx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_and::u64::release_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        xor               ecx, ecx
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax]
0:
        xor               ebx, ebx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_and::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, edi
        and               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_and::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, edi
        and               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_and::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, edi
        and               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_and::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, edi
        and               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_and::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        and               ebx, edi
        and               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_and::bool::acqrel_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        and               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::seqcst_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        and               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::acqrel_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::fetch_and::bool::acquire_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        and               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::relaxed_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        and               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::release_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        and               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::seqcst_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::fetch_and::bool::acquire_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::fetch_and::bool::relaxed_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::fetch_and::bool::release_false:
        mov               eax, dword ptr [esp + 0x4]
        xor               ecx, ecx
        xchg              byte ptr [eax], cl
        test              cl, cl
        setne             al
        ret

asm_test::fetch_and::bool::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_and::bool::release:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        and               ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_max::i8::acqrel:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovle            ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_max::i8::seqcst:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovle            ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_max::i8::acquire:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovle            ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_max::i8::relaxed:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovle            ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_max::i8::release:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovle            ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_max::f32::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        movaps            xmm1, xmm0
        cmpunordss        xmm1, xmm0
        nop               word ptr cs:[eax + eax]
        nop
0:
        movd              xmm2, eax
        movaps            xmm3, xmm1
        movaps            xmm4, xmm1
        andps             xmm3, xmm2
        maxss             xmm2, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_max::f32::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        movaps            xmm1, xmm0
        cmpunordss        xmm1, xmm0
        nop               word ptr cs:[eax + eax]
        nop
0:
        movd              xmm2, eax
        movaps            xmm3, xmm1
        movaps            xmm4, xmm1
        andps             xmm3, xmm2
        maxss             xmm2, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_max::f32::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        movaps            xmm1, xmm0
        cmpunordss        xmm1, xmm0
        nop               word ptr cs:[eax + eax]
        nop
0:
        movd              xmm2, eax
        movaps            xmm3, xmm1
        movaps            xmm4, xmm1
        andps             xmm3, xmm2
        maxss             xmm2, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_max::f32::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        movaps            xmm1, xmm0
        cmpunordss        xmm1, xmm0
        nop               word ptr cs:[eax + eax]
        nop
0:
        movd              xmm2, eax
        movaps            xmm3, xmm1
        movaps            xmm4, xmm1
        andps             xmm3, xmm2
        maxss             xmm2, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_max::f32::release:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        movaps            xmm1, xmm0
        cmpunordss        xmm1, xmm0
        nop               word ptr cs:[eax + eax]
        nop
0:
        movd              xmm2, eax
        movaps            xmm3, xmm1
        movaps            xmm4, xmm1
        andps             xmm3, xmm2
        maxss             xmm2, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_max::f64::acqrel:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
        movapd            xmm1, xmm0
        cmpunordsd        xmm1, xmm0
        nop               dword ptr [eax]
0:
        movd              xmm2, eax
        movd              xmm3, edx
        movapd            xmm5, xmm1
        movapd            xmm4, xmm1
        punpckldq         xmm2, xmm3      # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
        andpd             xmm5, xmm2
        maxsd             xmm2, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm5
        movlpd            qword ptr [esp], xmm4
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_max::f64::seqcst:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
        movapd            xmm1, xmm0
        cmpunordsd        xmm1, xmm0
        nop               dword ptr [eax]
0:
        movd              xmm2, eax
        movd              xmm3, edx
        movapd            xmm5, xmm1
        movapd            xmm4, xmm1
        punpckldq         xmm2, xmm3      # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
        andpd             xmm5, xmm2
        maxsd             xmm2, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm5
        movlpd            qword ptr [esp], xmm4
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_max::f64::acquire:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
        movapd            xmm1, xmm0
        cmpunordsd        xmm1, xmm0
        nop               dword ptr [eax]
0:
        movd              xmm2, eax
        movd              xmm3, edx
        movapd            xmm5, xmm1
        movapd            xmm4, xmm1
        punpckldq         xmm2, xmm3      # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
        andpd             xmm5, xmm2
        maxsd             xmm2, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm5
        movlpd            qword ptr [esp], xmm4
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_max::f64::relaxed:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
        movapd            xmm1, xmm0
        cmpunordsd        xmm1, xmm0
        nop               dword ptr [eax]
0:
        movd              xmm2, eax
        movd              xmm3, edx
        movapd            xmm5, xmm1
        movapd            xmm4, xmm1
        punpckldq         xmm2, xmm3      # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
        andpd             xmm5, xmm2
        maxsd             xmm2, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm5
        movlpd            qword ptr [esp], xmm4
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_max::f64::release:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
        movapd            xmm1, xmm0
        cmpunordsd        xmm1, xmm0
        nop               dword ptr [eax]
0:
        movd              xmm2, eax
        movd              xmm3, edx
        movapd            xmm5, xmm1
        movapd            xmm4, xmm1
        punpckldq         xmm2, xmm3      # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
        andpd             xmm5, xmm2
        maxsd             xmm2, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm5
        movlpd            qword ptr [esp], xmm4
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_max::i16::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovg             esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_max::i16::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovg             esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_max::i16::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovg             esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_max::i16::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovg             esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_max::i16::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovg             esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_max::i32::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovg             esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_max::i32::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovg             esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_max::i32::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovg             esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_max::i32::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovg             esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_max::i32::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovg             esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_max::i64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovl             ecx, edx
        cmovl             ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_max::i64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovl             ecx, edx
        cmovl             ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_max::i64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovl             ecx, edx
        cmovl             ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_max::i64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovl             ecx, edx
        cmovl             ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_max::i64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovl             ecx, edx
        cmovl             ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_min::i8::acqrel:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovg             ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_min::i8::seqcst:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovg             ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_min::i8::acquire:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovg             ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_min::i8::relaxed:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovg             ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_min::i8::release:
        push              ebx
        push              esi
        mov               edx, dword ptr [esp + 0xc]
        movzx             ecx, byte ptr [esp + 0x10]
        movzx             eax, byte ptr [edx]
        movzx             esi, cl
        nop               word ptr cs:[eax + eax]
        nop               dword ptr [eax + eax]
0:
        cmp               al, cl
        movzx             ebx, al
        cmovg             ebx, esi
        lock cmpxchg      byte ptr [edx], bl
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_min::f32::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        movaps            xmm1, xmm0
        cmpunordss        xmm1, xmm0
        nop               word ptr cs:[eax + eax]
        nop
0:
        movd              xmm2, eax
        movaps            xmm3, xmm1
        movaps            xmm4, xmm1
        andps             xmm3, xmm2
        minss             xmm2, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_min::f32::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        movaps            xmm1, xmm0
        cmpunordss        xmm1, xmm0
        nop               word ptr cs:[eax + eax]
        nop
0:
        movd              xmm2, eax
        movaps            xmm3, xmm1
        movaps            xmm4, xmm1
        andps             xmm3, xmm2
        minss             xmm2, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_min::f32::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        movaps            xmm1, xmm0
        cmpunordss        xmm1, xmm0
        nop               word ptr cs:[eax + eax]
        nop
0:
        movd              xmm2, eax
        movaps            xmm3, xmm1
        movaps            xmm4, xmm1
        andps             xmm3, xmm2
        minss             xmm2, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_min::f32::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        movaps            xmm1, xmm0
        cmpunordss        xmm1, xmm0
        nop               word ptr cs:[eax + eax]
        nop
0:
        movd              xmm2, eax
        movaps            xmm3, xmm1
        movaps            xmm4, xmm1
        andps             xmm3, xmm2
        minss             xmm2, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_min::f32::release:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        movaps            xmm1, xmm0
        cmpunordss        xmm1, xmm0
        nop               word ptr cs:[eax + eax]
        nop
0:
        movd              xmm2, eax
        movaps            xmm3, xmm1
        movaps            xmm4, xmm1
        andps             xmm3, xmm2
        minss             xmm2, xmm0
        andnps            xmm4, xmm2
        orps              xmm4, xmm3
        movd              edx, xmm4
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_min::f64::acqrel:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
        movapd            xmm1, xmm0
        cmpunordsd        xmm1, xmm0
        nop               dword ptr [eax]
0:
        movd              xmm2, eax
        movd              xmm3, edx
        movapd            xmm5, xmm1
        movapd            xmm4, xmm1
        punpckldq         xmm2, xmm3      # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
        andpd             xmm5, xmm2
        minsd             xmm2, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm5
        movlpd            qword ptr [esp], xmm4
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_min::f64::seqcst:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
        movapd            xmm1, xmm0
        cmpunordsd        xmm1, xmm0
        nop               dword ptr [eax]
0:
        movd              xmm2, eax
        movd              xmm3, edx
        movapd            xmm5, xmm1
        movapd            xmm4, xmm1
        punpckldq         xmm2, xmm3      # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
        andpd             xmm5, xmm2
        minsd             xmm2, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm5
        movlpd            qword ptr [esp], xmm4
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_min::f64::acquire:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
        movapd            xmm1, xmm0
        cmpunordsd        xmm1, xmm0
        nop               dword ptr [eax]
0:
        movd              xmm2, eax
        movd              xmm3, edx
        movapd            xmm5, xmm1
        movapd            xmm4, xmm1
        punpckldq         xmm2, xmm3      # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
        andpd             xmm5, xmm2
        minsd             xmm2, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm5
        movlpd            qword ptr [esp], xmm4
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_min::f64::relaxed:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
        movapd            xmm1, xmm0
        cmpunordsd        xmm1, xmm0
        nop               dword ptr [eax]
0:
        movd              xmm2, eax
        movd              xmm3, edx
        movapd            xmm5, xmm1
        movapd            xmm4, xmm1
        punpckldq         xmm2, xmm3      # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
        andpd             xmm5, xmm2
        minsd             xmm2, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm5
        movlpd            qword ptr [esp], xmm4
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_min::f64::release:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
        movapd            xmm1, xmm0
        cmpunordsd        xmm1, xmm0
        nop               dword ptr [eax]
0:
        movd              xmm2, eax
        movd              xmm3, edx
        movapd            xmm5, xmm1
        movapd            xmm4, xmm1
        punpckldq         xmm2, xmm3      # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
        andpd             xmm5, xmm2
        minsd             xmm2, xmm0
        andnpd            xmm4, xmm2
        orpd              xmm4, xmm5
        movlpd            qword ptr [esp], xmm4
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_min::i16::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovle            esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_min::i16::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovle            esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_min::i16::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovle            esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_min::i16::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovle            esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_min::i16::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        cmp               ax, cx
        mov               esi, ecx
        cmovle            esi, eax
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_min::i32::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovle            esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_min::i32::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovle            esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_min::i32::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovle            esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_min::i32::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovle            esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_min::i32::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        cmp               eax, ecx
        mov               esi, ecx
        cmovle            esi, eax
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_min::i64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovge            ecx, edx
        cmovge            ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_min::i64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovge            ecx, edx
        cmovge            ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_min::i64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovge            ecx, edx
        cmovge            ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_min::i64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovge            ecx, edx
        cmovge            ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_min::i64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        cmp               edi, eax
        mov               ecx, esi
        mov               ebx, edi
        sbb               ecx, edx
        mov               ecx, esi
        cmovge            ecx, edx
        cmovge            ebx, eax
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_neg::u8::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        neg               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_neg::u8::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        neg               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_neg::u8::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        neg               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_neg::u8::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        neg               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_neg::u8::release:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        neg               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_neg::f32::acqrel:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, 0x80000000
        lock xadd         dword ptr [eax], ecx
        movd              xmm0, ecx
        ret

asm_test::fetch_neg::f32::seqcst:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, 0x80000000
        lock xadd         dword ptr [eax], ecx
        movd              xmm0, ecx
        ret

asm_test::fetch_neg::f32::acquire:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, 0x80000000
        lock xadd         dword ptr [eax], ecx
        movd              xmm0, ecx
        ret

asm_test::fetch_neg::f32::relaxed:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, 0x80000000
        lock xadd         dword ptr [eax], ecx
        movd              xmm0, ecx
        ret

asm_test::fetch_neg::f32::release:
        mov               eax, dword ptr [esp + 0x4]
        mov               ecx, 0x80000000
        lock xadd         dword ptr [eax], ecx
        movd              xmm0, ecx
        ret

asm_test::fetch_neg::f64::acqrel:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        lea               ecx, [edx - 0x80000000]
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_neg::f64::seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        lea               ecx, [edx - 0x80000000]
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_neg::f64::acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        lea               ecx, [edx - 0x80000000]
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_neg::f64::relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        lea               ecx, [edx - 0x80000000]
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_neg::f64::release:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        lea               ecx, [edx - 0x80000000]
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_neg::u16::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_neg::u16::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_neg::u16::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_neg::u16::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_neg::u16::release:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_neg::u32::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_neg::u32::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_neg::u32::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_neg::u32::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_neg::u32::release:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        neg               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_neg::u64::acqrel:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, 0x0
        neg               ebx
        sbb               ecx, edx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_neg::u64::seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, 0x0
        neg               ebx
        sbb               ecx, edx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_neg::u64::acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, 0x0
        neg               ebx
        sbb               ecx, edx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_neg::u64::relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, 0x0
        neg               ebx
        sbb               ecx, edx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_neg::u64::release:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, 0x0
        neg               ebx
        sbb               ecx, edx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_not::u8::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_not::u8::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_not::u8::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_not::u8::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_not::u8::release:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               dl
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        ret

asm_test::fetch_not::u16::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_not::u16::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_not::u16::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_not::u16::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_not::u16::release:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, word ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      word ptr [ecx], dx
        jne               0b
        ret

asm_test::fetch_not::u32::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_not::u32::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_not::u32::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_not::u32::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_not::u32::release:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        mov               edx, eax
        not               edx
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        ret

asm_test::fetch_not::u64::acqrel:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_not::u64::seqcst:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_not::u64::acquire:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_not::u64::relaxed:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_not::u64::release:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        not               ebx
        not               ecx
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_not::bool::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::bool::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::bool::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::bool::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_not::bool::release:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_sub::u8::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_sub::u8::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_sub::u8::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_sub::u8::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_sub::u8::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_sub::u8::acqrel:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               al, byte ptr [esp + 0x8]
        lock xadd         byte ptr [ecx], al
        ret

asm_test::fetch_sub::u8::seqcst:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               al, byte ptr [esp + 0x8]
        lock xadd         byte ptr [ecx], al
        ret

asm_test::fetch_sub::u8::acquire:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               al, byte ptr [esp + 0x8]
        lock xadd         byte ptr [ecx], al
        ret

asm_test::fetch_sub::u8::relaxed:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               al, byte ptr [esp + 0x8]
        lock xadd         byte ptr [ecx], al
        ret

asm_test::fetch_sub::u8::release:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               al, byte ptr [esp + 0x8]
        lock xadd         byte ptr [ecx], al
        ret

asm_test::fetch_sub::f32::acqrel_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        lock cmpxchg      dword ptr [ecx], eax
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::seqcst_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        lock cmpxchg      dword ptr [ecx], eax
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::acquire_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        lock cmpxchg      dword ptr [ecx], eax
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::relaxed_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        lock cmpxchg      dword ptr [ecx], eax
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::release_zero:
        mov               ecx, dword ptr [esp + 0x4]
        mov               eax, dword ptr [ecx]
        nop               word ptr cs:[eax + eax]
0:
        lock cmpxchg      dword ptr [ecx], eax
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        subss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        subss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        subss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        subss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f32::release:
        mov               ecx, dword ptr [esp + 0x4]
        movss             xmm0, dword ptr [esp + 0x8]
        mov               eax, dword ptr [ecx]
        nop               dword ptr [eax]
0:
        movd              xmm1, eax
        subss             xmm1, xmm0
        movd              edx, xmm1
        lock cmpxchg      dword ptr [ecx], edx
        jne               0b
        movd              xmm0, eax
        ret

asm_test::fetch_sub::f64::acqrel_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::f64::seqcst_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::f64::acquire_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::f64::relaxed_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::f64::release_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        movq              xmm0, qword ptr [esi]
        movd              eax, xmm0
        pshufd            xmm0, xmm0, 0x55        # xmm0 = xmm0[1,1,1,1]
        movd              edx, xmm0
        nop               word ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::f64::acqrel:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        subsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::f64::seqcst:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        subsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::f64::acquire:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        subsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::f64::relaxed:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        subsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::f64::release:
        push              ebx
        push              esi
        sub               esp, 0xc
        mov               esi, dword ptr [esp + 0x18]
        movsd             xmm0, qword ptr [esp + 0x1c]
        movq              xmm1, qword ptr [esi]
        movd              eax, xmm1
        pshufd            xmm1, xmm1, 0x55        # xmm1 = xmm1[1,1,1,1]
        movd              edx, xmm1
0:
        movd              xmm1, eax
        movd              xmm2, edx
        punpckldq         xmm1, xmm2      # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
        subsd             xmm1, xmm0
        movsd             qword ptr [esp], xmm1
        mov               ebx, dword ptr [esp]
        mov               ecx, dword ptr [esp + 0x4]
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        movd              xmm0, eax
        movd              xmm1, edx
        punpckldq         xmm0, xmm1      # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
        add               esp, 0xc
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::u16::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_sub::u16::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_sub::u16::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_sub::u16::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_sub::u16::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_sub::u16::acqrel:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               ax, word ptr [esp + 0x8]
        lock xadd         word ptr [ecx], ax
        ret

asm_test::fetch_sub::u16::seqcst:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               ax, word ptr [esp + 0x8]
        lock xadd         word ptr [ecx], ax
        ret

asm_test::fetch_sub::u16::acquire:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               ax, word ptr [esp + 0x8]
        lock xadd         word ptr [ecx], ax
        ret

asm_test::fetch_sub::u16::relaxed:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               ax, word ptr [esp + 0x8]
        lock xadd         word ptr [ecx], ax
        ret

asm_test::fetch_sub::u16::release:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               ax, word ptr [esp + 0x8]
        lock xadd         word ptr [ecx], ax
        ret

asm_test::fetch_sub::u32::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_sub::u32::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_sub::u32::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_sub::u32::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_sub::u32::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_sub::u32::acqrel:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               eax, dword ptr [esp + 0x8]
        lock xadd         dword ptr [ecx], eax
        ret

asm_test::fetch_sub::u32::seqcst:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               eax, dword ptr [esp + 0x8]
        lock xadd         dword ptr [ecx], eax
        ret

asm_test::fetch_sub::u32::acquire:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               eax, dword ptr [esp + 0x8]
        lock xadd         dword ptr [ecx], eax
        ret

asm_test::fetch_sub::u32::relaxed:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               eax, dword ptr [esp + 0x8]
        lock xadd         dword ptr [ecx], eax
        ret

asm_test::fetch_sub::u32::release:
        xor               eax, eax
        mov               ecx, dword ptr [esp + 0x4]
        sub               eax, dword ptr [esp + 0x8]
        lock xadd         dword ptr [ecx], eax
        ret

asm_test::fetch_sub::u64::acqrel_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::u64::seqcst_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::u64::acquire_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::u64::relaxed_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::u64::release_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_sub::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        sub               ebx, edi
        sbb               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_sub::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        sub               ebx, edi
        sbb               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_sub::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        sub               ebx, edi
        sbb               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_sub::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        sub               ebx, edi
        sbb               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_sub::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        sub               ebx, edi
        sbb               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_xor::u8::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_xor::u8::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_xor::u8::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_xor::u8::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_xor::u8::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        ret

asm_test::fetch_xor::u8::acqrel:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        xor               ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_xor::u8::seqcst:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        xor               ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_xor::u8::acquire:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        xor               ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_xor::u8::relaxed:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        xor               ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_xor::u8::release:
        mov               edx, dword ptr [esp + 0x4]
        movzx             ecx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [edx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        xor               ah, cl
        lock cmpxchg      byte ptr [edx], ah
        jne               0b
        ret

asm_test::fetch_xor::u16::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_xor::u16::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_xor::u16::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_xor::u16::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_xor::u16::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, word ptr [eax]
        ret

asm_test::fetch_xor::u16::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        xor               esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_xor::u16::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        xor               esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_xor::u16::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        xor               esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_xor::u16::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        xor               esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_xor::u16::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        movzx             ecx, word ptr [esp + 0xc]
        movzx             eax, word ptr [edx]
        nop               dword ptr [eax]
0:
        mov               esi, eax
        xor               esi, ecx
        lock cmpxchg      word ptr [edx], si
        jne               0b
        pop               esi
        ret

asm_test::fetch_xor::u32::acqrel_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_xor::u32::seqcst_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_xor::u32::acquire_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_xor::u32::relaxed_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_xor::u32::release_zero:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        mov               eax, dword ptr [eax]
        ret

asm_test::fetch_xor::u32::acqrel:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        xor               esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_xor::u32::seqcst:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        xor               esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_xor::u32::acquire:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        xor               esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_xor::u32::relaxed:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        xor               esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_xor::u32::release:
        push              esi
        mov               edx, dword ptr [esp + 0x8]
        mov               ecx, dword ptr [esp + 0xc]
        mov               eax, dword ptr [edx]
        nop               dword ptr [eax + eax]
0:
        mov               esi, eax
        xor               esi, ecx
        lock cmpxchg      dword ptr [edx], esi
        jne               0b
        pop               esi
        ret

asm_test::fetch_xor::u64::acqrel_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_xor::u64::seqcst_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_xor::u64::acquire_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_xor::u64::relaxed_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_xor::u64::release_zero:
        push              ebx
        push              esi
        mov               esi, dword ptr [esp + 0xc]
        mov               eax, dword ptr [esi]
        mov               edx, dword ptr [esi + 0x4]
        nop               dword ptr [eax + eax]
0:
        mov               ecx, edx
        mov               ebx, eax
        lock cmpxchg8b    qword ptr [esi]
        jne               0b
        pop               esi
        pop               ebx
        ret

asm_test::fetch_xor::u64::acqrel:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, edi
        xor               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_xor::u64::seqcst:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, edi
        xor               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_xor::u64::acquire:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, edi
        xor               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_xor::u64::relaxed:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, edi
        xor               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_xor::u64::release:
        push              ebp
        push              ebx
        push              edi
        push              esi
        mov               ebp, dword ptr [esp + 0x14]
        mov               esi, dword ptr [esp + 0x1c]
        mov               edi, dword ptr [esp + 0x18]
        mov               eax, dword ptr [ebp]
        mov               edx, dword ptr [ebp + 0x4]
        nop               word ptr cs:[eax + eax]
0:
        mov               ebx, eax
        mov               ecx, edx
        xor               ebx, edi
        xor               ecx, esi
        lock cmpxchg8b    qword ptr [ebp]
        jne               0b
        pop               esi
        pop               edi
        pop               ebx
        pop               ebp
        ret

asm_test::fetch_xor::bool::acqrel_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::seqcst_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::acqrel_false:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::acquire_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::relaxed_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::release_true:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             eax, byte ptr [ecx]
        nop               word ptr [eax + eax]
0:
        mov               edx, eax
        xor               dl, 0x1
        lock cmpxchg      byte ptr [ecx], dl
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::seqcst_false:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::acquire_false:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::relaxed_false:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::release_false:
        mov               eax, dword ptr [esp + 0x4]
        mfence
        movzx             eax, byte ptr [eax]
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::acqrel:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        xor               ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::seqcst:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        xor               ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::acquire:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        xor               ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::relaxed:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        xor               ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

asm_test::fetch_xor::bool::release:
        mov               ecx, dword ptr [esp + 0x4]
        movzx             edx, byte ptr [esp + 0x8]
        movzx             eax, byte ptr [ecx]
        nop               dword ptr [eax]
0:
        mov               ah, al
        xor               ah, dl
        lock cmpxchg      byte ptr [ecx], ah
        jne               0b
        test              al, al
        setne             al
        ret

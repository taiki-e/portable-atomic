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


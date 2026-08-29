asm_test::fence::acqrel:
        dbar              16
        ret

asm_test::fence::seqcst:
        dbar              16
        ret

asm_test::fence::acquire:
        dbar              20
        ret

asm_test::fence::release:
        dbar              18
        ret

asm_test::fetch_nand::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_nand::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_nand::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_nand::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_nand::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_nand::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_nand::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_nand::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_nand::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_nand::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_nand::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        nor               $a3, $a3, $zero
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_nand::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        nor               $a3, $a3, $zero
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_nand::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        nor               $a3, $a3, $zero
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_nand::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        nor               $a3, $a3, $zero
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_nand::u32::release:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        nor               $a3, $a3, $zero
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_umax::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umax::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umax::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umax::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umax::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umax::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umax::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umax::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umax::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umax::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umax::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bgeu              $a2, $a1, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_umax::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bgeu              $a2, $a1, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_umax::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bgeu              $a2, $a1, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_umax::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bgeu              $a2, $a1, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_umax::u32::release:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bgeu              $a2, $a1, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_umin::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umin::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umin::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umin::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umin::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umin::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umin::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umin::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umin::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umin::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_umin::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bgeu              $a1, $a2, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_umin::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bgeu              $a1, $a2, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_umin::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bgeu              $a1, $a2, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_umin::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bgeu              $a1, $a2, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_umin::u32::release:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bgeu              $a1, $a2, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::release_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::release_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::release_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::release_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::release_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::release_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::release_seqcst:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::acquire_acquire:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::release_acquire:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::release_relaxed:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a5, $a1, $a0
        sll.w             $a1, $a2, $a0
0:
        ll.w              $a2, $a3, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a3, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a0
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
0:
        ll.w              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::load::u8::seqcst:
        ld.b              $a0, $a0, 0
        dbar              16
        ret

asm_test::load::u8::acquire:
        ld.b              $a0, $a0, 0
        dbar              20
        ret

asm_test::load::u8::relaxed:
        ld.b              $a0, $a0, 0
        ret

asm_test::load::u16::seqcst:
        ld.h              $a0, $a0, 0
        dbar              16
        ret

asm_test::load::u16::acquire:
        ld.h              $a0, $a0, 0
        dbar              20
        ret

asm_test::load::u16::relaxed:
        ld.h              $a0, $a0, 0
        ret

asm_test::load::u32::seqcst:
        ld.w              $a0, $a0, 0
        dbar              16
        ret

asm_test::load::u32::acquire:
        ld.w              $a0, $a0, 0
        dbar              20
        ret

asm_test::load::u32::relaxed:
        ld.w              $a0, $a0, 0
        ret

asm_test::swap::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::swap::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::swap::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::swap::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::swap::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::swap::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::swap::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::swap::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::swap::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::swap::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::swap::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::swap::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::swap::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::swap::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::swap::u32::release:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::store::u8::seqcst:
        dbar              16
        st.b              $a1, $a0, 0
        dbar              16
        ret

asm_test::store::u8::relaxed:
        st.b              $a1, $a0, 0
        ret

asm_test::store::u8::release:
        dbar              18
        st.b              $a1, $a0, 0
        ret

asm_test::store::u16::seqcst:
        dbar              16
        st.h              $a1, $a0, 0
        dbar              16
        ret

asm_test::store::u16::relaxed:
        st.h              $a1, $a0, 0
        ret

asm_test::store::u16::release:
        dbar              18
        st.h              $a1, $a0, 0
        ret

asm_test::store::u32::seqcst:
        dbar              16
        st.w              $a1, $a0, 0
        dbar              16
        ret

asm_test::store::u32::relaxed:
        st.w              $a1, $a0, 0
        ret

asm_test::store::u32::release:
        dbar              18
        st.w              $a1, $a0, 0
        ret

asm_test::fetch_or::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        or                $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_or::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        or                $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_or::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        or                $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_or::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        or                $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_or::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        or                $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_or::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        or                $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_or::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        or                $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_or::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        or                $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_or::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        or                $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_or::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        or                $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_or::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_or::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_or::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_or::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_or::u32::release:
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_add::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_add::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_add::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_add::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_add::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_add::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_add::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_add::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_add::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_add::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_add::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        add.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_add::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        add.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_add::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        add.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_add::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        add.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_add::u32::release:
0:
        ll.w              $a2, $a0, 0
        add.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_and::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
        orn               $a1, $a1, $a3
0:
        ll.w              $a3, $a2, 0
        and               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_and::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
        orn               $a1, $a1, $a3
0:
        ll.w              $a3, $a2, 0
        and               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_and::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
        orn               $a1, $a1, $a3
0:
        ll.w              $a3, $a2, 0
        and               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_and::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
        orn               $a1, $a1, $a3
0:
        ll.w              $a3, $a2, 0
        and               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_and::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
        orn               $a1, $a1, $a3
0:
        ll.w              $a3, $a2, 0
        and               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_and::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
        orn               $a1, $a1, $a3
0:
        ll.w              $a3, $a2, 0
        and               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_and::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
        orn               $a1, $a1, $a3
0:
        ll.w              $a3, $a2, 0
        and               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_and::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
        orn               $a1, $a1, $a3
0:
        ll.w              $a3, $a2, 0
        and               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_and::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
        orn               $a1, $a1, $a3
0:
        ll.w              $a3, $a2, 0
        and               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_and::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
        orn               $a1, $a1, $a3
0:
        ll.w              $a3, $a2, 0
        and               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_and::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_and::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_and::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_and::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_and::u32::release:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_max::i8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        xori              $a3, $a3, 24
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_max::i8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        xori              $a3, $a3, 24
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_max::i8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        xori              $a3, $a3, 24
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_max::i8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        xori              $a3, $a3, 24
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_max::i8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        xori              $a3, $a3, 24
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_max::i16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        ori               $a5, $zero, 16
        sub.w             $a3, $a5, $a3
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_max::i16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        ori               $a5, $zero, 16
        sub.w             $a3, $a5, $a3
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_max::i16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        ori               $a5, $zero, 16
        sub.w             $a3, $a5, $a3
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_max::i16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        ori               $a5, $zero, 16
        sub.w             $a3, $a5, $a3
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_max::i16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        ori               $a5, $zero, 16
        sub.w             $a3, $a5, $a3
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_max::i32::acqrel:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bge               $a2, $a1, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_max::i32::seqcst:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bge               $a2, $a1, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_max::i32::acquire:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bge               $a2, $a1, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_max::i32::relaxed:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bge               $a2, $a1, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_max::i32::release:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bge               $a2, $a1, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_min::i8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        xori              $a3, $a3, 24
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_min::i8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        xori              $a3, $a3, 24
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_min::i8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        xori              $a3, $a3, 24
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_min::i8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        xori              $a3, $a3, 24
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_min::i8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        xori              $a3, $a3, 24
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_min::i16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        ori               $a5, $zero, 16
        sub.w             $a3, $a5, $a3
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_min::i16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        ori               $a5, $zero, 16
        sub.w             $a3, $a5, $a3
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_min::i16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        ori               $a5, $zero, 16
        sub.w             $a3, $a5, $a3
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_min::i16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        ori               $a5, $zero, 16
        sub.w             $a3, $a5, $a3
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_min::i16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        andi              $a3, $a0, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a0
        sll.w             $a1, $a1, $a0
        ori               $a5, $zero, 16
        sub.w             $a3, $a5, $a3
0:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a0
        ret

asm_test::fetch_min::i32::acqrel:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bge               $a1, $a2, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_min::i32::seqcst:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bge               $a1, $a2, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_min::i32::acquire:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bge               $a1, $a2, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_min::i32::relaxed:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bge               $a1, $a2, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_min::i32::release:
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a2
        bge               $a1, $a2, 1f
        move              $a3, $a1
1:
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_neg::u8::acqrel:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -4
        and               $a2, $a1, $a2
        slli.w            $a1, $a1, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a1
        nop
0:
        sub.w             $a4, $zero, $a0
        andi              $a0, $a0, 255
        sll.w             $a5, $a0, $a1
        andi              $a0, $a4, 255
        sll.w             $a0, $a0, $a1
1:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a0
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a0, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::fetch_neg::u8::seqcst:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -4
        and               $a2, $a1, $a2
        slli.w            $a1, $a1, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a1
        nop
0:
        sub.w             $a4, $zero, $a0
        andi              $a0, $a0, 255
        sll.w             $a5, $a0, $a1
        andi              $a0, $a4, 255
        sll.w             $a0, $a0, $a1
1:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a0
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a0, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::fetch_neg::u8::acquire:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -4
        and               $a2, $a1, $a2
        slli.w            $a1, $a1, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a1
        nop
0:
        sub.w             $a4, $zero, $a0
        andi              $a0, $a0, 255
        sll.w             $a5, $a0, $a1
        andi              $a0, $a4, 255
        sll.w             $a0, $a0, $a1
1:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a0
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a0, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::fetch_neg::u8::relaxed:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -4
        and               $a2, $a1, $a2
        slli.w            $a1, $a1, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a1
        nop
0:
        sub.w             $a4, $zero, $a0
        andi              $a0, $a0, 255
        sll.w             $a5, $a0, $a1
        andi              $a0, $a4, 255
        sll.w             $a0, $a0, $a1
1:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a0
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a0, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::fetch_neg::u8::release:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -4
        and               $a2, $a1, $a2
        slli.w            $a1, $a1, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a1
        nop
0:
        sub.w             $a4, $zero, $a0
        andi              $a0, $a0, 255
        sll.w             $a5, $a0, $a1
        andi              $a0, $a4, 255
        sll.w             $a0, $a0, $a1
1:
        ll.w              $a4, $a2, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a0
        sc.w              $a6, $a2, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a0, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::fetch_neg::u16::acqrel:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -4
        and               $a2, $a1, $a2
        slli.w            $a1, $a1, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a4, $a3, $a1
0:
        sub.w             $a5, $zero, $a0
        and               $a0, $a0, $a3
        sll.w             $a6, $a0, $a1
        and               $a0, $a5, $a3
        sll.w             $a0, $a0, $a1
1:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        bne               $a7, $a6, 2f
        andn              $a7, $a5, $a4
        or                $a7, $a7, $a0
        sc.w              $a7, $a2, 0
        beq               $a7, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a7, $a5, $a4
        srl.w             $a0, $a5, $a1
        bne               $a6, $a7, 0b
        ret

asm_test::fetch_neg::u16::seqcst:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -4
        and               $a2, $a1, $a2
        slli.w            $a1, $a1, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a4, $a3, $a1
0:
        sub.w             $a5, $zero, $a0
        and               $a0, $a0, $a3
        sll.w             $a6, $a0, $a1
        and               $a0, $a5, $a3
        sll.w             $a0, $a0, $a1
1:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        bne               $a7, $a6, 2f
        andn              $a7, $a5, $a4
        or                $a7, $a7, $a0
        sc.w              $a7, $a2, 0
        beq               $a7, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a7, $a5, $a4
        srl.w             $a0, $a5, $a1
        bne               $a6, $a7, 0b
        ret

asm_test::fetch_neg::u16::acquire:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -4
        and               $a2, $a1, $a2
        slli.w            $a1, $a1, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a4, $a3, $a1
0:
        sub.w             $a5, $zero, $a0
        and               $a0, $a0, $a3
        sll.w             $a6, $a0, $a1
        and               $a0, $a5, $a3
        sll.w             $a0, $a0, $a1
1:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        bne               $a7, $a6, 2f
        andn              $a7, $a5, $a4
        or                $a7, $a7, $a0
        sc.w              $a7, $a2, 0
        beq               $a7, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a7, $a5, $a4
        srl.w             $a0, $a5, $a1
        bne               $a6, $a7, 0b
        ret

asm_test::fetch_neg::u16::relaxed:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -4
        and               $a2, $a1, $a2
        slli.w            $a1, $a1, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a4, $a3, $a1
0:
        sub.w             $a5, $zero, $a0
        and               $a0, $a0, $a3
        sll.w             $a6, $a0, $a1
        and               $a0, $a5, $a3
        sll.w             $a0, $a0, $a1
1:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        bne               $a7, $a6, 2f
        andn              $a7, $a5, $a4
        or                $a7, $a7, $a0
        sc.w              $a7, $a2, 0
        beq               $a7, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a7, $a5, $a4
        srl.w             $a0, $a5, $a1
        bne               $a6, $a7, 0b
        ret

asm_test::fetch_neg::u16::release:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -4
        and               $a2, $a1, $a2
        slli.w            $a1, $a1, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a4, $a3, $a1
0:
        sub.w             $a5, $zero, $a0
        and               $a0, $a0, $a3
        sll.w             $a6, $a0, $a1
        and               $a0, $a5, $a3
        sll.w             $a0, $a0, $a1
1:
        ll.w              $a5, $a2, 0
        and               $a7, $a5, $a4
        bne               $a7, $a6, 2f
        andn              $a7, $a5, $a4
        or                $a7, $a7, $a0
        sc.w              $a7, $a2, 0
        beq               $a7, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a7, $a5, $a4
        srl.w             $a0, $a5, $a1
        bne               $a6, $a7, 0b
        ret

asm_test::fetch_neg::u32::acqrel:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.w             $a3, $zero, $a1
1:
        ll.w              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u32::seqcst:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.w             $a3, $zero, $a1
1:
        ll.w              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u32::acquire:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.w             $a3, $zero, $a1
1:
        ll.w              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u32::relaxed:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.w             $a3, $zero, $a1
1:
        ll.w              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u32::release:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.w             $a3, $zero, $a1
1:
        ll.w              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        move              $a0, $a1
        ret

asm_test::fetch_not::u8::acqrel:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_not::u8::seqcst:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_not::u8::acquire:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_not::u8::relaxed:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_not::u8::release:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_not::u16::acqrel:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_not::u16::seqcst:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_not::u16::acquire:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_not::u16::relaxed:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_not::u16::release:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_not::u32::acqrel:
        addi.w            $a2, $zero, -1
0:
        ll.w              $a1, $a0, 0
        xor               $a3, $a1, $a2
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_not::u32::seqcst:
        addi.w            $a2, $zero, -1
0:
        ll.w              $a1, $a0, 0
        xor               $a3, $a1, $a2
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_not::u32::acquire:
        addi.w            $a2, $zero, -1
0:
        ll.w              $a1, $a0, 0
        xor               $a3, $a1, $a2
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_not::u32::relaxed:
        addi.w            $a2, $zero, -1
0:
        ll.w              $a1, $a0, 0
        xor               $a3, $a1, $a2
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_not::u32::release:
        addi.w            $a2, $zero, -1
0:
        ll.w              $a1, $a0, 0
        xor               $a3, $a1, $a2
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_sub::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_sub::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_sub::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_sub::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_sub::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_sub::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_sub::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_sub::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_sub::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_sub::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        ret

asm_test::fetch_sub::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        sub.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_sub::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        sub.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_sub::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        sub.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_sub::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        sub.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_sub::u32::release:
0:
        ll.w              $a2, $a0, 0
        sub.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_xor::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        xor               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_xor::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        xor               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_xor::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        xor               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_xor::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        xor               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_xor::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        xor               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_xor::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        xor               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_xor::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        xor               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_xor::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        xor               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_xor::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        xor               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_xor::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a1, $a1, $a0
0:
        ll.w              $a3, $a2, 0
        xor               $a4, $a3, $a1
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        ret

asm_test::fetch_xor::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_xor::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_xor::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_xor::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_xor::u32::release:
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

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

asm_test::bit_toggle::u8::acqrel:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        xor               $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u8::seqcst:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        xor               $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u8::acquire:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        xor               $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u8::relaxed:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        xor               $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u8::release:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        xor               $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u16::acqrel:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        xor               $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u16::seqcst:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        xor               $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u16::acquire:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        xor               $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u16::relaxed:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        xor               $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u16::release:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        xor               $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u32::acqrel:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u32::seqcst:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u32::acquire:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u32::relaxed:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u32::release:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
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

asm_test::fetch_nand::bool::acqrel:
        beq               $a1, $zero, 1f
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        andi              $a0, $a0, 1
        ret
1:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a0
2:
        ll.w              $a4, $a1, 0
        addi.w            $a5, $a3, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a2
        xor               $a5, $a4, $a5
        sc.w              $a5, $a1, 0
        beq               $a5, $zero, 2b
        srl.w             $a0, $a4, $a0
        andi              $a0, $a0, 1
        ret

asm_test::fetch_nand::bool::seqcst:
        beq               $a1, $zero, 1f
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        andi              $a0, $a0, 1
        ret
1:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a0
2:
        ll.w              $a4, $a1, 0
        addi.w            $a5, $a3, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a2
        xor               $a5, $a4, $a5
        sc.w              $a5, $a1, 0
        beq               $a5, $zero, 2b
        srl.w             $a0, $a4, $a0
        andi              $a0, $a0, 1
        ret

asm_test::fetch_nand::bool::acquire:
        beq               $a1, $zero, 1f
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        andi              $a0, $a0, 1
        ret
1:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a0
2:
        ll.w              $a4, $a1, 0
        addi.w            $a5, $a3, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a2
        xor               $a5, $a4, $a5
        sc.w              $a5, $a1, 0
        beq               $a5, $zero, 2b
        srl.w             $a0, $a4, $a0
        andi              $a0, $a0, 1
        ret

asm_test::fetch_nand::bool::relaxed:
        beq               $a1, $zero, 1f
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        andi              $a0, $a0, 1
        ret
1:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a0
2:
        ll.w              $a4, $a1, 0
        addi.w            $a5, $a3, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a2
        xor               $a5, $a4, $a5
        sc.w              $a5, $a1, 0
        beq               $a5, $zero, 2b
        srl.w             $a0, $a4, $a0
        andi              $a0, $a0, 1
        ret

asm_test::fetch_nand::bool::release:
        beq               $a1, $zero, 1f
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        andi              $a0, $a0, 1
        ret
1:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a0
2:
        ll.w              $a4, $a1, 0
        addi.w            $a5, $a3, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a2
        xor               $a5, $a4, $a5
        sc.w              $a5, $a1, 0
        beq               $a5, $zero, 2b
        srl.w             $a0, $a4, $a0
        andi              $a0, $a0, 1
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

asm_test::compare_exchange::f32::acqrel_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::seqcst_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::acqrel_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::acqrel_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::acquire_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::relaxed_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::release_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::seqcst_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::seqcst_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::acquire_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::acquire_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::relaxed_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::relaxed_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::release_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::release_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
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

asm_test::compare_exchange::bool::acqrel_seqcst:
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

asm_test::compare_exchange::bool::seqcst_seqcst:
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

asm_test::compare_exchange::bool::acqrel_acquire:
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

asm_test::compare_exchange::bool::acqrel_relaxed:
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

asm_test::compare_exchange::bool::acquire_seqcst:
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

asm_test::compare_exchange::bool::relaxed_seqcst:
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

asm_test::compare_exchange::bool::release_seqcst:
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

asm_test::compare_exchange::bool::seqcst_acquire:
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

asm_test::compare_exchange::bool::seqcst_relaxed:
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

asm_test::compare_exchange::bool::acquire_acquire:
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

asm_test::compare_exchange::bool::acquire_relaxed:
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

asm_test::compare_exchange::bool::relaxed_acquire:
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

asm_test::compare_exchange::bool::relaxed_relaxed:
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

asm_test::compare_exchange::bool::release_acquire:
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

asm_test::compare_exchange::bool::release_relaxed:
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

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::acqrel_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::acqrel_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::acquire_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::relaxed_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::release_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::seqcst_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::acquire_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::acquire_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::relaxed_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::relaxed_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::release_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::release_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
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
        movgr2fr.w        $fa0, $a3
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

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
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

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
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

asm_test::compare_exchange_weak::bool::acqrel_acquire:
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

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
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

asm_test::compare_exchange_weak::bool::acquire_seqcst:
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

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
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

asm_test::compare_exchange_weak::bool::release_seqcst:
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

asm_test::compare_exchange_weak::bool::seqcst_acquire:
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

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
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

asm_test::compare_exchange_weak::bool::acquire_acquire:
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

asm_test::compare_exchange_weak::bool::acquire_relaxed:
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

asm_test::compare_exchange_weak::bool::relaxed_acquire:
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

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
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

asm_test::compare_exchange_weak::bool::release_acquire:
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

asm_test::compare_exchange_weak::bool::release_relaxed:
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

asm_test::or::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::u32::release:
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::bool::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::bool::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::bool::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::bool::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::or::bool::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        or                $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::add::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        add.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        add.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        add.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        add.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        add.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        add.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        add.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        add.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        add.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        add.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        add.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::add::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        add.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::add::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        add.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::add::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        add.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::add::u32::release:
0:
        ll.w              $a2, $a0, 0
        add.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::u32::release:
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::bool::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::bool::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::bool::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::bool::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::and::bool::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
        orn               $a0, $a0, $a3
0:
        ll.w              $a1, $a2, 0
        and               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::neg::u8::acqrel:
        ld.b              $a3, $a0, 0
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
        nop
        nop
0:
        sub.w             $a4, $zero, $a3
        andi              $a3, $a3, 255
        sll.w             $a5, $a3, $a0
        andi              $a3, $a4, 255
        sll.w             $a3, $a3, $a0
1:
        ll.w              $a4, $a1, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a1, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a0
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u8::seqcst:
        ld.b              $a3, $a0, 0
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
        nop
        nop
0:
        sub.w             $a4, $zero, $a3
        andi              $a3, $a3, 255
        sll.w             $a5, $a3, $a0
        andi              $a3, $a4, 255
        sll.w             $a3, $a3, $a0
1:
        ll.w              $a4, $a1, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a1, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a0
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u8::acquire:
        ld.b              $a3, $a0, 0
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
        nop
        nop
0:
        sub.w             $a4, $zero, $a3
        andi              $a3, $a3, 255
        sll.w             $a5, $a3, $a0
        andi              $a3, $a4, 255
        sll.w             $a3, $a3, $a0
1:
        ll.w              $a4, $a1, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a1, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a0
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u8::relaxed:
        ld.b              $a3, $a0, 0
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
        nop
        nop
0:
        sub.w             $a4, $zero, $a3
        andi              $a3, $a3, 255
        sll.w             $a5, $a3, $a0
        andi              $a3, $a4, 255
        sll.w             $a3, $a3, $a0
1:
        ll.w              $a4, $a1, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a1, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a0
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u8::release:
        ld.b              $a3, $a0, 0
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a0
        nop
        nop
0:
        sub.w             $a4, $zero, $a3
        andi              $a3, $a3, 255
        sll.w             $a5, $a3, $a0
        andi              $a3, $a4, 255
        sll.w             $a3, $a3, $a0
1:
        ll.w              $a4, $a1, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a1, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a0
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u16::acqrel:
        ld.h              $a4, $a0, 0
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a3, $a2, $a0
        nop
0:
        sub.w             $a5, $zero, $a4
        and               $a4, $a4, $a2
        sll.w             $a6, $a4, $a0
        and               $a4, $a5, $a2
        sll.w             $a4, $a4, $a0
1:
        ll.w              $a5, $a1, 0
        and               $a7, $a5, $a3
        bne               $a7, $a6, 2f
        andn              $a7, $a5, $a3
        or                $a7, $a7, $a4
        sc.w              $a7, $a1, 0
        beq               $a7, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a7, $a5, $a3
        srl.w             $a4, $a5, $a0
        bne               $a6, $a7, 0b
        ret

asm_test::neg::u16::seqcst:
        ld.h              $a4, $a0, 0
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a3, $a2, $a0
        nop
0:
        sub.w             $a5, $zero, $a4
        and               $a4, $a4, $a2
        sll.w             $a6, $a4, $a0
        and               $a4, $a5, $a2
        sll.w             $a4, $a4, $a0
1:
        ll.w              $a5, $a1, 0
        and               $a7, $a5, $a3
        bne               $a7, $a6, 2f
        andn              $a7, $a5, $a3
        or                $a7, $a7, $a4
        sc.w              $a7, $a1, 0
        beq               $a7, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a7, $a5, $a3
        srl.w             $a4, $a5, $a0
        bne               $a6, $a7, 0b
        ret

asm_test::neg::u16::acquire:
        ld.h              $a4, $a0, 0
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a3, $a2, $a0
        nop
0:
        sub.w             $a5, $zero, $a4
        and               $a4, $a4, $a2
        sll.w             $a6, $a4, $a0
        and               $a4, $a5, $a2
        sll.w             $a4, $a4, $a0
1:
        ll.w              $a5, $a1, 0
        and               $a7, $a5, $a3
        bne               $a7, $a6, 2f
        andn              $a7, $a5, $a3
        or                $a7, $a7, $a4
        sc.w              $a7, $a1, 0
        beq               $a7, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a7, $a5, $a3
        srl.w             $a4, $a5, $a0
        bne               $a6, $a7, 0b
        ret

asm_test::neg::u16::relaxed:
        ld.h              $a4, $a0, 0
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a3, $a2, $a0
        nop
0:
        sub.w             $a5, $zero, $a4
        and               $a4, $a4, $a2
        sll.w             $a6, $a4, $a0
        and               $a4, $a5, $a2
        sll.w             $a4, $a4, $a0
1:
        ll.w              $a5, $a1, 0
        and               $a7, $a5, $a3
        bne               $a7, $a6, 2f
        andn              $a7, $a5, $a3
        or                $a7, $a7, $a4
        sc.w              $a7, $a1, 0
        beq               $a7, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a7, $a5, $a3
        srl.w             $a4, $a5, $a0
        bne               $a6, $a7, 0b
        ret

asm_test::neg::u16::release:
        ld.h              $a4, $a0, 0
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a3, $a2, $a0
        nop
0:
        sub.w             $a5, $zero, $a4
        and               $a4, $a4, $a2
        sll.w             $a6, $a4, $a0
        and               $a4, $a5, $a2
        sll.w             $a4, $a4, $a0
1:
        ll.w              $a5, $a1, 0
        and               $a7, $a5, $a3
        bne               $a7, $a6, 2f
        andn              $a7, $a5, $a3
        or                $a7, $a7, $a4
        sc.w              $a7, $a1, 0
        beq               $a7, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a7, $a5, $a3
        srl.w             $a4, $a5, $a0
        bne               $a6, $a7, 0b
        ret

asm_test::neg::u32::acqrel:
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
        ret

asm_test::neg::u32::seqcst:
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
        ret

asm_test::neg::u32::acquire:
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
        ret

asm_test::neg::u32::relaxed:
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
        ret

asm_test::neg::u32::release:
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
        ret

asm_test::not::u8::acqrel:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u8::seqcst:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u8::acquire:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u8::relaxed:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u8::release:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 255
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u16::acqrel:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u16::seqcst:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u16::acquire:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u16::relaxed:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u16::release:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u32::acqrel:
        addi.w            $a1, $zero, -1
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u32::seqcst:
        addi.w            $a1, $zero, -1
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u32::acquire:
        addi.w            $a1, $zero, -1
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u32::relaxed:
        addi.w            $a1, $zero, -1
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::u32::release:
        addi.w            $a1, $zero, -1
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::bool::acqrel:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::bool::seqcst:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::bool::acquire:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::bool::relaxed:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::not::bool::release:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a0, $a2, $a0
0:
        ll.w              $a2, $a1, 0
        xor               $a3, $a2, $a0
        sc.w              $a3, $a1, 0
        beq               $a3, $zero, 0b
        ret

asm_test::sub::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        sub.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        sub.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        sub.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        sub.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        sub.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        sub.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        sub.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        sub.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        sub.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a0
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        sub.w             $a4, $a1, $a0
        xor               $a4, $a1, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a1, $a4
        sc.w              $a4, $a2, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        sub.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::sub::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        sub.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::sub::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        sub.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::sub::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        sub.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::sub::u32::release:
0:
        ll.w              $a2, $a0, 0
        sub.w             $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u8::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u8::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u8::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u8::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u8::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u16::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u16::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u16::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u16::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u16::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u32::acqrel:
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u32::seqcst:
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u32::acquire:
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u32::relaxed:
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::u32::release:
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::bool::acqrel:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::bool::seqcst:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::bool::acquire:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::bool::relaxed:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
        ret

asm_test::xor::bool::release:
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        andi              $a0, $a0, 3
        slli.w            $a0, $a0, 3
        sll.w             $a0, $a1, $a0
0:
        ll.w              $a1, $a2, 0
        xor               $a3, $a1, $a0
        sc.w              $a3, $a2, 0
        beq               $a3, $zero, 0b
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

asm_test::load::f32::seqcst:
        ld.w              $a0, $a0, 0
        movgr2fr.w        $fa0, $a0
        dbar              16
        ret

asm_test::load::f32::acquire:
        ld.w              $a0, $a0, 0
        movgr2fr.w        $fa0, $a0
        dbar              20
        ret

asm_test::load::f32::relaxed:
        ld.w              $a0, $a0, 0
        movgr2fr.w        $fa0, $a0
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

asm_test::load::bool::seqcst:
        ld.b              $a0, $a0, 0
        andi              $a0, $a0, 255
        dbar              16
        ret

asm_test::load::bool::acquire:
        ld.b              $a0, $a0, 0
        andi              $a0, $a0, 255
        dbar              20
        ret

asm_test::load::bool::relaxed:
        ld.b              $a0, $a0, 0
        andi              $a0, $a0, 255
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

asm_test::swap::f32::acqrel:
        movfr2gr.s        $a1, $fa0
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
        ret

asm_test::swap::f32::seqcst:
        movfr2gr.s        $a1, $fa0
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
        ret

asm_test::swap::f32::acquire:
        movfr2gr.s        $a1, $fa0
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
        ret

asm_test::swap::f32::relaxed:
        movfr2gr.s        $a1, $fa0
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
        ret

asm_test::swap::f32::release:
        movfr2gr.s        $a1, $fa0
0:
        ll.w              $a2, $a0, 0
        move              $a3, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
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

asm_test::swap::bool::acqrel:
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
        andi              $a0, $a0, 1
        ret

asm_test::swap::bool::seqcst:
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
        andi              $a0, $a0, 1
        ret

asm_test::swap::bool::acquire:
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
        andi              $a0, $a0, 1
        ret

asm_test::swap::bool::relaxed:
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
        andi              $a0, $a0, 1
        ret

asm_test::swap::bool::release:
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
        andi              $a0, $a0, 1
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

asm_test::store::f32::seqcst:
        movfr2gr.s        $a1, $fa0
        dbar              16
        st.w              $a1, $a0, 0
        dbar              16
        ret

asm_test::store::f32::relaxed:
        movfr2gr.s        $a1, $fa0
        st.w              $a1, $a0, 0
        ret

asm_test::store::f32::release:
        movfr2gr.s        $a1, $fa0
        dbar              18
        st.w              $a1, $a0, 0
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

asm_test::store::bool::seqcst:
        dbar              16
        st.b              $a1, $a0, 0
        dbar              16
        ret

asm_test::store::bool::relaxed:
        st.b              $a1, $a0, 0
        ret

asm_test::store::bool::release:
        dbar              18
        st.b              $a1, $a0, 0
        ret

asm_test::bit_set::u8::acqrel:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        or                $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u8::seqcst:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        or                $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u8::acquire:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        or                $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u8::relaxed:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        or                $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u8::release:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        or                $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u16::acqrel:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        or                $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u16::seqcst:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        or                $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u16::acquire:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        or                $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u16::relaxed:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        or                $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u16::release:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        addi.w            $a2, $zero, -4
        and               $a2, $a0, $a2
        slli.w            $a0, $a0, 3
        sll.w             $a3, $a1, $a0
0:
        ll.w              $a4, $a2, 0
        or                $a5, $a4, $a3
        sc.w              $a5, $a2, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u32::acqrel:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u32::seqcst:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u32::acquire:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u32::relaxed:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u32::release:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
0:
        ll.w              $a2, $a0, 0
        or                $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
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

asm_test::fetch_or::bool::acqrel:
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
        andi              $a0, $a0, 1
        ret

asm_test::fetch_or::bool::seqcst:
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
        andi              $a0, $a0, 1
        ret

asm_test::fetch_or::bool::acquire:
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
        andi              $a0, $a0, 1
        ret

asm_test::fetch_or::bool::relaxed:
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
        andi              $a0, $a0, 1
        ret

asm_test::fetch_or::bool::release:
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
        andi              $a0, $a0, 1
        ret

asm_test::bit_clear::u8::acqrel:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        xori              $a2, $a1, 255
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a2, $a2, $a0
        orn               $a2, $a2, $a4
0:
        ll.w              $a4, $a3, 0
        and               $a5, $a4, $a2
        sc.w              $a5, $a3, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u8::seqcst:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        xori              $a2, $a1, 255
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a2, $a2, $a0
        orn               $a2, $a2, $a4
0:
        ll.w              $a4, $a3, 0
        and               $a5, $a4, $a2
        sc.w              $a5, $a3, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u8::acquire:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        xori              $a2, $a1, 255
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a2, $a2, $a0
        orn               $a2, $a2, $a4
0:
        ll.w              $a4, $a3, 0
        and               $a5, $a4, $a2
        sc.w              $a5, $a3, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u8::relaxed:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        xori              $a2, $a1, 255
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a2, $a2, $a0
        orn               $a2, $a2, $a4
0:
        ll.w              $a4, $a3, 0
        and               $a5, $a4, $a2
        sc.w              $a5, $a3, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u8::release:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        xori              $a2, $a1, 255
        addi.w            $a3, $zero, -4
        and               $a3, $a0, $a3
        slli.w            $a0, $a0, 3
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a0
        sll.w             $a2, $a2, $a0
        orn               $a2, $a2, $a4
0:
        ll.w              $a4, $a3, 0
        and               $a5, $a4, $a2
        sc.w              $a5, $a3, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u16::acqrel:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        xor               $a3, $a1, $a2
        addi.w            $a4, $zero, -4
        and               $a4, $a0, $a4
        slli.w            $a0, $a0, 3
        sll.w             $a2, $a2, $a0
        sll.w             $a3, $a3, $a0
        orn               $a2, $a3, $a2
0:
        ll.w              $a3, $a4, 0
        and               $a5, $a3, $a2
        sc.w              $a5, $a4, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a3, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u16::seqcst:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        xor               $a3, $a1, $a2
        addi.w            $a4, $zero, -4
        and               $a4, $a0, $a4
        slli.w            $a0, $a0, 3
        sll.w             $a2, $a2, $a0
        sll.w             $a3, $a3, $a0
        orn               $a2, $a3, $a2
0:
        ll.w              $a3, $a4, 0
        and               $a5, $a3, $a2
        sc.w              $a5, $a4, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a3, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u16::acquire:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        xor               $a3, $a1, $a2
        addi.w            $a4, $zero, -4
        and               $a4, $a0, $a4
        slli.w            $a0, $a0, 3
        sll.w             $a2, $a2, $a0
        sll.w             $a3, $a3, $a0
        orn               $a2, $a3, $a2
0:
        ll.w              $a3, $a4, 0
        and               $a5, $a3, $a2
        sc.w              $a5, $a4, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a3, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u16::relaxed:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        xor               $a3, $a1, $a2
        addi.w            $a4, $zero, -4
        and               $a4, $a0, $a4
        slli.w            $a0, $a0, 3
        sll.w             $a2, $a2, $a0
        sll.w             $a3, $a3, $a0
        orn               $a2, $a3, $a2
0:
        ll.w              $a3, $a4, 0
        and               $a5, $a3, $a2
        sc.w              $a5, $a4, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a3, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u16::release:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        xor               $a3, $a1, $a2
        addi.w            $a4, $zero, -4
        and               $a4, $a0, $a4
        slli.w            $a0, $a0, 3
        sll.w             $a2, $a2, $a0
        sll.w             $a3, $a3, $a0
        orn               $a2, $a3, $a2
0:
        ll.w              $a3, $a4, 0
        and               $a5, $a3, $a2
        sc.w              $a5, $a4, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a3, $a0
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u32::acqrel:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        nor               $a2, $a1, $zero
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u32::seqcst:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        nor               $a2, $a1, $zero
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u32::acquire:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        nor               $a2, $a1, $zero
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u32::relaxed:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        nor               $a2, $a1, $zero
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u32::release:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        nor               $a2, $a1, $zero
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_abs::f32::acqrel:
        lu12i.w           $a1, 524287
        ori               $a1, $a1, 4095
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_abs::f32::seqcst:
        lu12i.w           $a1, 524287
        ori               $a1, $a1, 4095
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_abs::f32::acquire:
        lu12i.w           $a1, 524287
        ori               $a1, $a1, 4095
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_abs::f32::relaxed:
        lu12i.w           $a1, 524287
        ori               $a1, $a1, 4095
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_abs::f32::release:
        lu12i.w           $a1, 524287
        ori               $a1, $a1, 4095
0:
        ll.w              $a2, $a0, 0
        and               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
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

asm_test::fetch_add::f32::acqrel:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fadd.s            $fa1, $fa0, $fa1
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_add::f32::seqcst:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fadd.s            $fa1, $fa0, $fa1
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_add::f32::acquire:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fadd.s            $fa1, $fa0, $fa1
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_add::f32::relaxed:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fadd.s            $fa1, $fa0, $fa1
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_add::f32::release:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fadd.s            $fa1, $fa0, $fa1
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
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

asm_test::fetch_and::bool::acqrel:
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
        andi              $a0, $a0, 1
        ret

asm_test::fetch_and::bool::seqcst:
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
        andi              $a0, $a0, 1
        ret

asm_test::fetch_and::bool::acquire:
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
        andi              $a0, $a0, 1
        ret

asm_test::fetch_and::bool::relaxed:
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
        andi              $a0, $a0, 1
        ret

asm_test::fetch_and::bool::release:
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
        andi              $a0, $a0, 1
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

asm_test::fetch_max::f32::acqrel:
        ld.w              $a1, $a0, 0
        fmax.s            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fmax.s            $fa1, $fa1, $fa1
        fmax.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_max::f32::seqcst:
        ld.w              $a1, $a0, 0
        fmax.s            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fmax.s            $fa1, $fa1, $fa1
        fmax.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_max::f32::acquire:
        ld.w              $a1, $a0, 0
        fmax.s            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fmax.s            $fa1, $fa1, $fa1
        fmax.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_max::f32::relaxed:
        ld.w              $a1, $a0, 0
        fmax.s            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fmax.s            $fa1, $fa1, $fa1
        fmax.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_max::f32::release:
        ld.w              $a1, $a0, 0
        fmax.s            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fmax.s            $fa1, $fa1, $fa1
        fmax.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
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

asm_test::fetch_min::f32::acqrel:
        ld.w              $a1, $a0, 0
        fmax.s            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fmax.s            $fa1, $fa1, $fa1
        fmin.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_min::f32::seqcst:
        ld.w              $a1, $a0, 0
        fmax.s            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fmax.s            $fa1, $fa1, $fa1
        fmin.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_min::f32::acquire:
        ld.w              $a1, $a0, 0
        fmax.s            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fmax.s            $fa1, $fa1, $fa1
        fmin.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_min::f32::relaxed:
        ld.w              $a1, $a0, 0
        fmax.s            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fmax.s            $fa1, $fa1, $fa1
        fmin.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_min::f32::release:
        ld.w              $a1, $a0, 0
        fmax.s            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fmax.s            $fa1, $fa1, $fa1
        fmin.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
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

asm_test::fetch_neg::f32::acqrel:
        lu12i.w           $a1, -524288
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_neg::f32::seqcst:
        lu12i.w           $a1, -524288
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_neg::f32::acquire:
        lu12i.w           $a1, -524288
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_neg::f32::relaxed:
        lu12i.w           $a1, -524288
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_neg::f32::release:
        lu12i.w           $a1, -524288
0:
        ll.w              $a2, $a0, 0
        xor               $a3, $a2, $a1
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        movgr2fr.w        $fa0, $a2
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

asm_test::fetch_not::bool::acqrel:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        andi              $a0, $a0, 1
        ret

asm_test::fetch_not::bool::seqcst:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        andi              $a0, $a0, 1
        ret

asm_test::fetch_not::bool::acquire:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        andi              $a0, $a0, 1
        ret

asm_test::fetch_not::bool::relaxed:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        andi              $a0, $a0, 1
        ret

asm_test::fetch_not::bool::release:
        addi.w            $a1, $zero, -4
        and               $a1, $a0, $a1
        slli.w            $a0, $a0, 3
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a0
0:
        ll.w              $a3, $a1, 0
        xor               $a4, $a3, $a2
        sc.w              $a4, $a1, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a0
        andi              $a0, $a0, 1
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

asm_test::fetch_sub::f32::acqrel:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fsub.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_sub::f32::seqcst:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fsub.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_sub::f32::acquire:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fsub.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_sub::f32::relaxed:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fsub.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_sub::f32::release:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fsub.s            $fa1, $fa1, $fa0
        movfr2gr.s        $a3, $fa1
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
        movgr2fr.w        $fa0, $a1
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

asm_test::fetch_xor::bool::acqrel:
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
        andi              $a0, $a0, 1
        ret

asm_test::fetch_xor::bool::seqcst:
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
        andi              $a0, $a0, 1
        ret

asm_test::fetch_xor::bool::acquire:
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
        andi              $a0, $a0, 1
        ret

asm_test::fetch_xor::bool::relaxed:
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
        andi              $a0, $a0, 1
        ret

asm_test::fetch_xor::bool::release:
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
        andi              $a0, $a0, 1
        ret

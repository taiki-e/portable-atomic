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
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amxor_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u8::seqcst:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amxor_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u8::acquire:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amxor_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u8::relaxed:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amxor.w           $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u8::release:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amxor_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u16::acqrel:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amxor_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u16::seqcst:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amxor_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u16::acquire:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amxor_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u16::relaxed:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amxor.w           $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u16::release:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amxor_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u32::acqrel:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u32::seqcst:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u32::acquire:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u32::relaxed:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor.w           $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u32::release:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u64::acqrel:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        amxor_db.d        $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u64::seqcst:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        amxor_db.d        $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u64::acquire:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        amxor_db.d        $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u64::relaxed:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        amxor.d           $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_toggle::u64::release:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        amxor_db.d        $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::u8::acqrel_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u8::seqcst_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u8::acqrel_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $zero
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u8::acquire_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u8::relaxed_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u8::release_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u8::seqcst_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $zero
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u8::acquire_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $zero
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u8::relaxed_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $zero
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u8::release_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $zero
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_nand::u8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_nand::u8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_nand::u8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_nand::u8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_nand::u16::acqrel_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u16::seqcst_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u16::acqrel_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $zero
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u16::acquire_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u16::relaxed_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u16::release_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $a2
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u16::seqcst_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $zero
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u16::acquire_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $zero
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u16::relaxed_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $zero
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u16::release_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
0:
        ll.w              $a3, $a0, 0
        and               $a4, $a3, $zero
        nor               $a4, $a4, $zero
        xor               $a4, $a3, $a4
        and               $a4, $a4, $a2
        xor               $a4, $a3, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_nand::u16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_nand::u16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_nand::u16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_nand::u16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_nand::u16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a5, $a4, $a1
        nor               $a5, $a5, $zero
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_nand::u32::acqrel_all:
        addi.w            $a2, $zero, -1
0:
        ll.w              $a1, $a0, 0
        and               $a3, $a1, $a2
        nor               $a3, $a3, $zero
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u32::seqcst_all:
        addi.w            $a2, $zero, -1
0:
        ll.w              $a1, $a0, 0
        and               $a3, $a1, $a2
        nor               $a3, $a3, $zero
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u32::acqrel_zero:
0:
        ll.w              $a1, $a0, 0
        and               $a2, $a1, $zero
        nor               $a2, $a2, $zero
        sc.w              $a2, $a0, 0
        beq               $a2, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u32::acquire_all:
        addi.w            $a2, $zero, -1
0:
        ll.w              $a1, $a0, 0
        and               $a3, $a1, $a2
        nor               $a3, $a3, $zero
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u32::relaxed_all:
        addi.w            $a2, $zero, -1
0:
        ll.w              $a1, $a0, 0
        and               $a3, $a1, $a2
        nor               $a3, $a3, $zero
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u32::release_all:
        addi.w            $a2, $zero, -1
0:
        ll.w              $a1, $a0, 0
        and               $a3, $a1, $a2
        nor               $a3, $a3, $zero
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u32::seqcst_zero:
0:
        ll.w              $a1, $a0, 0
        and               $a2, $a1, $zero
        nor               $a2, $a2, $zero
        sc.w              $a2, $a0, 0
        beq               $a2, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u32::acquire_zero:
0:
        ll.w              $a1, $a0, 0
        and               $a2, $a1, $zero
        nor               $a2, $a2, $zero
        sc.w              $a2, $a0, 0
        beq               $a2, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u32::relaxed_zero:
0:
        ll.w              $a1, $a0, 0
        and               $a2, $a1, $zero
        nor               $a2, $a2, $zero
        sc.w              $a2, $a0, 0
        beq               $a2, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u32::release_zero:
0:
        ll.w              $a1, $a0, 0
        and               $a2, $a1, $zero
        nor               $a2, $a2, $zero
        sc.w              $a2, $a0, 0
        beq               $a2, $zero, 0b
        move              $a0, $a1
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

asm_test::fetch_nand::u64::acqrel_all:
        addi.w            $a2, $zero, -1
0:
        ll.d              $a1, $a0, 0
        and               $a3, $a1, $a2
        nor               $a3, $a3, $zero
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u64::seqcst_all:
        addi.w            $a2, $zero, -1
0:
        ll.d              $a1, $a0, 0
        and               $a3, $a1, $a2
        nor               $a3, $a3, $zero
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u64::acqrel_zero:
0:
        ll.d              $a1, $a0, 0
        and               $a2, $a1, $zero
        nor               $a2, $a2, $zero
        sc.d              $a2, $a0, 0
        beq               $a2, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u64::acquire_all:
        addi.w            $a2, $zero, -1
0:
        ll.d              $a1, $a0, 0
        and               $a3, $a1, $a2
        nor               $a3, $a3, $zero
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u64::relaxed_all:
        addi.w            $a2, $zero, -1
0:
        ll.d              $a1, $a0, 0
        and               $a3, $a1, $a2
        nor               $a3, $a3, $zero
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u64::release_all:
        addi.w            $a2, $zero, -1
0:
        ll.d              $a1, $a0, 0
        and               $a3, $a1, $a2
        nor               $a3, $a3, $zero
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u64::seqcst_zero:
0:
        ll.d              $a1, $a0, 0
        and               $a2, $a1, $zero
        nor               $a2, $a2, $zero
        sc.d              $a2, $a0, 0
        beq               $a2, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u64::acquire_zero:
0:
        ll.d              $a1, $a0, 0
        and               $a2, $a1, $zero
        nor               $a2, $a2, $zero
        sc.d              $a2, $a0, 0
        beq               $a2, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u64::relaxed_zero:
0:
        ll.d              $a1, $a0, 0
        and               $a2, $a1, $zero
        nor               $a2, $a2, $zero
        sc.d              $a2, $a0, 0
        beq               $a2, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u64::release_zero:
0:
        ll.d              $a1, $a0, 0
        and               $a2, $a1, $zero
        nor               $a2, $a2, $zero
        sc.d              $a2, $a0, 0
        beq               $a2, $zero, 0b
        move              $a0, $a1
        ret

asm_test::fetch_nand::u64::acqrel:
0:
        ll.d              $a2, $a0, 0
        and               $a3, $a2, $a1
        nor               $a3, $a3, $zero
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_nand::u64::seqcst:
0:
        ll.d              $a2, $a0, 0
        and               $a3, $a2, $a1
        nor               $a3, $a3, $zero
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_nand::u64::acquire:
0:
        ll.d              $a2, $a0, 0
        and               $a3, $a2, $a1
        nor               $a3, $a3, $zero
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_nand::u64::relaxed:
0:
        ll.d              $a2, $a0, 0
        and               $a3, $a2, $a1
        nor               $a3, $a3, $zero
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_nand::u64::release:
0:
        ll.d              $a2, $a0, 0
        and               $a3, $a2, $a1
        nor               $a3, $a3, $zero
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 0b
        move              $a0, $a2
        ret

asm_test::fetch_nand::bool::acqrel_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::seqcst_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::acqrel_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::acquire_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::relaxed_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::release_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::seqcst_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::acquire_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::relaxed_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor.w            $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::release_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::acqrel:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret
0:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::seqcst:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret
0:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::acquire:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret
0:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::relaxed:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret
0:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor.w            $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_nand::bool::release:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret
0:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_umax::u8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umax::u8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umax::u8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umax::u8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umax::u8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umax::u16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umax::u16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umax::u16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umax::u16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umax::u16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a6, $a1, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umax::u32::acqrel:
        ammax_db.wu       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umax::u32::seqcst:
        ammax_db.wu       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umax::u32::acquire:
        ammax_db.wu       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umax::u32::relaxed:
        ammax.wu          $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umax::u32::release:
        ammax_db.wu       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umax::u64::acqrel:
        ammax_db.du       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umax::u64::seqcst:
        ammax_db.du       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umax::u64::acquire:
        ammax_db.du       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umax::u64::relaxed:
        ammax.du          $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umax::u64::release:
        ammax_db.du       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umin::u8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umin::u8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umin::u8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umin::u8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umin::u8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umin::u16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umin::u16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umin::u16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umin::u16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umin::u16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        move              $a5, $a4
        bgeu              $a1, $a6, 1f
        xor               $a5, $a4, $a1
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
1:
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_umin::u32::acqrel:
        ammin_db.wu       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umin::u32::seqcst:
        ammin_db.wu       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umin::u32::acquire:
        ammin_db.wu       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umin::u32::relaxed:
        ammin.wu          $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umin::u32::release:
        ammin_db.wu       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umin::u64::acqrel:
        ammin_db.du       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umin::u64::seqcst:
        ammin_db.du       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umin::u64::acquire:
        ammin_db.du       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umin::u64::relaxed:
        ammin.du          $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_umin::u64::release:
        ammin_db.du       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::release_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::release_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::release_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
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

asm_test::compare_exchange::f64::acqrel_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::seqcst_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::acqrel_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::acqrel_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::acquire_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::relaxed_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::release_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::seqcst_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::seqcst_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::acquire_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::acquire_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::relaxed_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::relaxed_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::release_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::release_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::release_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::release_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::release_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
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

asm_test::compare_exchange::u64::acqrel_seqcst:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::seqcst_seqcst:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::acqrel_acquire:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::acqrel_relaxed:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::acquire_seqcst:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::relaxed_seqcst:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::release_seqcst:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::seqcst_acquire:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::seqcst_relaxed:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::acquire_acquire:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::acquire_relaxed:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::relaxed_acquire:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::relaxed_relaxed:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::release_acquire:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::release_relaxed:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
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
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::release_seqcst:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor.w            $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand.w           $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::release_acquire:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::release_relaxed:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::release_seqcst_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::release_acquire_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::release_relaxed_true_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::release_seqcst_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::release_seqcst_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor.w            $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::release_acquire_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::release_acquire_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::release_relaxed_false_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::release_relaxed_true_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a1, $a0, 255
        sltui             $a0, $a1, 1
        sltu              $a1, $zero, $a1
        ret

asm_test::compare_exchange::bool::release_seqcst_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::release_acquire_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange::bool::release_relaxed_false_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        move              $a1, $a0
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
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

asm_test::compare_exchange_weak::f64::acqrel_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::seqcst_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::acqrel_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::acqrel_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::acquire_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::relaxed_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::release_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::seqcst_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::seqcst_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::acquire_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::acquire_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::relaxed_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::relaxed_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::release_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::release_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        srl.w             $a1, $a2, $a3
        and               $a0, $a2, $a4
        xor               $a0, $a5, $a0
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        slli.d            $a3, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a3
        sll.w             $a5, $a1, $a3
        sll.w             $a1, $a2, $a3
0:
        ll.w              $a2, $a0, 0
        and               $a6, $a2, $a4
        bne               $a6, $a5, 1f
        andn              $a6, $a2, $a4
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        srl.w             $a1, $a2, $a3
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

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::acqrel_acquire:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::acquire_seqcst:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::release_seqcst:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::seqcst_acquire:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::acquire_acquire:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::acquire_relaxed:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::relaxed_acquire:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              1792
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::release_acquire:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 0b
        b                 2f
1:
        dbar              20
2:
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::release_relaxed:
0:
        ll.d              $a3, $a0, 0
        bne               $a3, $a1, 1f
        move              $a4, $a2
        sc.d              $a4, $a0, 0
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
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor.w            $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand.w           $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        beq               $a1, $a2, 0f
        beqz              $a2, 1f
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a2
        amor_db.w         $a4, $a3, $a0
        b                 2f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a0, $a3, $a0
        b                 3f
1:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nor               $a3, $a3, $zero
        amand_db.w        $a4, $a3, $a0
2:
        srl.w             $a0, $a4, $a2
3:
        andi              $a0, $a0, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::or::u8::acqrel_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u8::seqcst_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u8::acqrel_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u8::acquire_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u8::relaxed_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        amor.w            $a2, $a1, $a0
        ret

asm_test::or::u8::release_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u8::seqcst_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u8::acquire_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u8::relaxed_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a1, $zero, $a0
        ret

asm_test::or::u8::release_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u8::acqrel:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u8::seqcst:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u8::acquire:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u8::relaxed:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor.w            $a2, $a1, $a0
        ret

asm_test::or::u8::release:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u16::acqrel_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u16::seqcst_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u16::acqrel_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u16::acquire_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u16::relaxed_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        amor.w            $a2, $a1, $a0
        ret

asm_test::or::u16::release_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u16::seqcst_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u16::acquire_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u16::relaxed_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a1, $zero, $a0
        ret

asm_test::or::u16::release_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u16::acqrel:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u16::seqcst:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u16::acquire:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u16::relaxed:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor.w            $a2, $a1, $a0
        ret

asm_test::or::u16::release:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u32::acqrel_all:
        addi.w            $a1, $zero, -1
        amswap_db.w       $a2, $a1, $a0
        ret

asm_test::or::u32::seqcst_all:
        addi.w            $a1, $zero, -1
        amswap_db.w       $a2, $a1, $a0
        ret

asm_test::or::u32::acqrel_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u32::acquire_all:
        addi.w            $a1, $zero, -1
        amswap_db.w       $a2, $a1, $a0
        ret

asm_test::or::u32::relaxed_all:
        addi.w            $a1, $zero, -1
        amswap.w          $a2, $a1, $a0
        ret

asm_test::or::u32::release_all:
        addi.w            $a1, $zero, -1
        amswap_db.w       $a2, $a1, $a0
        ret

asm_test::or::u32::seqcst_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u32::acquire_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u32::relaxed_zero:
        amor.w            $a1, $zero, $a0
        ret

asm_test::or::u32::release_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u32::acqrel:
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u32::seqcst:
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u32::acquire:
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u32::relaxed:
        amor.w            $a2, $a1, $a0
        ret

asm_test::or::u32::release:
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::u64::acqrel_all:
        addi.w            $a1, $zero, -1
        amswap_db.d       $a2, $a1, $a0
        ret

asm_test::or::u64::seqcst_all:
        addi.w            $a1, $zero, -1
        amswap_db.d       $a2, $a1, $a0
        ret

asm_test::or::u64::acqrel_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::or::u64::acquire_all:
        addi.w            $a1, $zero, -1
        amswap_db.d       $a2, $a1, $a0
        ret

asm_test::or::u64::relaxed_all:
        addi.w            $a1, $zero, -1
        amswap.d          $a2, $a1, $a0
        ret

asm_test::or::u64::release_all:
        addi.w            $a1, $zero, -1
        amswap_db.d       $a2, $a1, $a0
        ret

asm_test::or::u64::seqcst_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::or::u64::acquire_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::or::u64::relaxed_zero:
        amor.d            $a1, $zero, $a0
        ret

asm_test::or::u64::release_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::or::u64::acqrel:
        amor_db.d         $a2, $a1, $a0
        ret

asm_test::or::u64::seqcst:
        amor_db.d         $a2, $a1, $a0
        ret

asm_test::or::u64::acquire:
        amor_db.d         $a2, $a1, $a0
        ret

asm_test::or::u64::relaxed:
        amor.d            $a2, $a1, $a0
        ret

asm_test::or::u64::release:
        amor_db.d         $a2, $a1, $a0
        ret

asm_test::or::bool::acqrel_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::bool::seqcst_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::bool::acqrel_false:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::bool::acquire_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::bool::relaxed_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amor.w            $a2, $a1, $a0
        ret

asm_test::or::bool::release_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::bool::seqcst_false:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::bool::acquire_false:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::bool::relaxed_false:
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a1, $zero, $a0
        ret

asm_test::or::bool::release_false:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::bool::acqrel:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::bool::seqcst:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::bool::acquire:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::or::bool::relaxed:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor.w            $a2, $a1, $a0
        ret

asm_test::or::bool::release:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amor_db.w         $a2, $a1, $a0
        ret

asm_test::add::u8::acqrel_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::add::u8::seqcst_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::add::u8::acquire_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::add::u8::relaxed_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a1, $zero, $a0
        ret

asm_test::add::u8::release_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::add::u8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        add.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        add.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        add.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        add.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        add.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u16::acqrel_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::add::u16::seqcst_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::add::u16::acquire_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::add::u16::relaxed_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a1, $zero, $a0
        ret

asm_test::add::u16::release_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::add::u16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        add.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        add.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        add.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        add.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        add.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::add::u32::acqrel_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::add::u32::seqcst_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::add::u32::acquire_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::add::u32::relaxed_zero:
        amor.w            $a1, $zero, $a0
        ret

asm_test::add::u32::release_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::add::u32::acqrel:
        amadd_db.w        $a2, $a1, $a0
        ret

asm_test::add::u32::seqcst:
        amadd_db.w        $a2, $a1, $a0
        ret

asm_test::add::u32::acquire:
        amadd_db.w        $a2, $a1, $a0
        ret

asm_test::add::u32::relaxed:
        amadd.w           $a2, $a1, $a0
        ret

asm_test::add::u32::release:
        amadd_db.w        $a2, $a1, $a0
        ret

asm_test::add::u64::acqrel_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::add::u64::seqcst_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::add::u64::acquire_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::add::u64::relaxed_zero:
        amor.d            $a1, $zero, $a0
        ret

asm_test::add::u64::release_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::add::u64::acqrel:
        amadd_db.d        $a2, $a1, $a0
        ret

asm_test::add::u64::seqcst:
        amadd_db.d        $a2, $a1, $a0
        ret

asm_test::add::u64::acquire:
        amadd_db.d        $a2, $a1, $a0
        ret

asm_test::add::u64::relaxed:
        amadd.d           $a2, $a1, $a0
        ret

asm_test::add::u64::release:
        amadd_db.d        $a2, $a1, $a0
        ret

asm_test::and::u8::acqrel_all:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::and::u8::seqcst_all:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::and::u8::acqrel_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u8::acquire_all:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::and::u8::relaxed_all:
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a1, $zero, $a0
        ret

asm_test::and::u8::release_all:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::and::u8::seqcst_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u8::acquire_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u8::relaxed_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand.w           $a2, $a1, $a0
        ret

asm_test::and::u8::release_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand.w           $a2, $a1, $a0
        ret

asm_test::and::u8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u16::acqrel_all:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::and::u16::seqcst_all:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::and::u16::acqrel_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u16::acquire_all:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::and::u16::relaxed_all:
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a1, $zero, $a0
        ret

asm_test::and::u16::release_all:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::and::u16::seqcst_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u16::acquire_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u16::relaxed_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand.w           $a2, $a1, $a0
        ret

asm_test::and::u16::release_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand.w           $a2, $a1, $a0
        ret

asm_test::and::u16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u32::acqrel_all:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::and::u32::seqcst_all:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::and::u32::acqrel_zero:
        amswap_db.w       $a1, $zero, $a0
        ret

asm_test::and::u32::acquire_all:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::and::u32::relaxed_all:
        amor.w            $a1, $zero, $a0
        ret

asm_test::and::u32::release_all:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::and::u32::seqcst_zero:
        amswap_db.w       $a1, $zero, $a0
        ret

asm_test::and::u32::acquire_zero:
        amswap_db.w       $a1, $zero, $a0
        ret

asm_test::and::u32::relaxed_zero:
        amswap.w          $a1, $zero, $a0
        ret

asm_test::and::u32::release_zero:
        amswap_db.w       $a1, $zero, $a0
        ret

asm_test::and::u32::acqrel:
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u32::seqcst:
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u32::acquire:
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u32::relaxed:
        amand.w           $a2, $a1, $a0
        ret

asm_test::and::u32::release:
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::u64::acqrel_all:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::and::u64::seqcst_all:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::and::u64::acqrel_zero:
        amswap_db.d       $a1, $zero, $a0
        ret

asm_test::and::u64::acquire_all:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::and::u64::relaxed_all:
        amor.d            $a1, $zero, $a0
        ret

asm_test::and::u64::release_all:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::and::u64::seqcst_zero:
        amswap_db.d       $a1, $zero, $a0
        ret

asm_test::and::u64::acquire_zero:
        amswap_db.d       $a1, $zero, $a0
        ret

asm_test::and::u64::relaxed_zero:
        amswap.d          $a1, $zero, $a0
        ret

asm_test::and::u64::release_zero:
        amswap_db.d       $a1, $zero, $a0
        ret

asm_test::and::u64::acqrel:
        amand_db.d        $a2, $a1, $a0
        ret

asm_test::and::u64::seqcst:
        amand_db.d        $a2, $a1, $a0
        ret

asm_test::and::u64::acquire:
        amand_db.d        $a2, $a1, $a0
        ret

asm_test::and::u64::relaxed:
        amand.d           $a2, $a1, $a0
        ret

asm_test::and::u64::release:
        amand_db.d        $a2, $a1, $a0
        ret

asm_test::and::bool::acqrel_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        ori               $a3, $zero, 1
        sll.w             $a1, $a3, $a1
        orn               $a1, $a1, $a2
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::bool::seqcst_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        ori               $a3, $zero, 1
        sll.w             $a1, $a3, $a1
        orn               $a1, $a1, $a2
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::bool::acqrel_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::bool::acquire_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        ori               $a3, $zero, 1
        sll.w             $a1, $a3, $a1
        orn               $a1, $a1, $a2
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::bool::relaxed_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        ori               $a3, $zero, 1
        sll.w             $a1, $a3, $a1
        orn               $a1, $a1, $a2
        amand.w           $a2, $a1, $a0
        ret

asm_test::and::bool::release_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        ori               $a3, $zero, 1
        sll.w             $a1, $a3, $a1
        orn               $a1, $a1, $a2
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::bool::seqcst_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::bool::acquire_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::bool::relaxed_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand.w           $a2, $a1, $a0
        ret

asm_test::and::bool::release_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        nor               $a1, $a1, $zero
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::bool::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::bool::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::bool::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::and::bool::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand.w           $a2, $a1, $a0
        ret

asm_test::and::bool::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a2, $a1, $a0
        ret

asm_test::neg::u8::acqrel:
        ld.b              $a3, $a0, 0
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nop
        nop
        nop
0:
        sub.d             $a4, $zero, $a3
        andi              $a3, $a3, 255
        sll.w             $a5, $a3, $a1
        andi              $a3, $a4, 255
        sll.w             $a3, $a3, $a1
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u8::seqcst:
        ld.b              $a3, $a0, 0
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nop
        nop
        nop
0:
        sub.d             $a4, $zero, $a3
        andi              $a3, $a3, 255
        sll.w             $a5, $a3, $a1
        andi              $a3, $a4, 255
        sll.w             $a3, $a3, $a1
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u8::acquire:
        ld.b              $a3, $a0, 0
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nop
        nop
        nop
0:
        sub.d             $a4, $zero, $a3
        andi              $a3, $a3, 255
        sll.w             $a5, $a3, $a1
        andi              $a3, $a4, 255
        sll.w             $a3, $a3, $a1
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u8::relaxed:
        ld.b              $a3, $a0, 0
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nop
        nop
        nop
0:
        sub.d             $a4, $zero, $a3
        andi              $a3, $a3, 255
        sll.w             $a5, $a3, $a1
        andi              $a3, $a4, 255
        sll.w             $a3, $a3, $a1
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u8::release:
        ld.b              $a3, $a0, 0
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nop
        nop
        nop
0:
        sub.d             $a4, $zero, $a3
        andi              $a3, $a3, 255
        sll.w             $a5, $a3, $a1
        andi              $a3, $a4, 255
        sll.w             $a3, $a3, $a1
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u16::acqrel:
        ld.h              $a3, $a0, 0
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        nop
        nop
0:
        sub.d             $a4, $zero, $a3
        bstrpick.d        $a3, $a3, 15, 0
        sll.w             $a5, $a3, $a1
        bstrpick.d        $a3, $a4, 15, 0
        sll.w             $a3, $a3, $a1
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u16::seqcst:
        ld.h              $a3, $a0, 0
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        nop
        nop
0:
        sub.d             $a4, $zero, $a3
        bstrpick.d        $a3, $a3, 15, 0
        sll.w             $a5, $a3, $a1
        bstrpick.d        $a3, $a4, 15, 0
        sll.w             $a3, $a3, $a1
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u16::acquire:
        ld.h              $a3, $a0, 0
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        nop
        nop
0:
        sub.d             $a4, $zero, $a3
        bstrpick.d        $a3, $a3, 15, 0
        sll.w             $a5, $a3, $a1
        bstrpick.d        $a3, $a4, 15, 0
        sll.w             $a3, $a3, $a1
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u16::relaxed:
        ld.h              $a3, $a0, 0
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        nop
        nop
0:
        sub.d             $a4, $zero, $a3
        bstrpick.d        $a3, $a3, 15, 0
        sll.w             $a5, $a3, $a1
        bstrpick.d        $a3, $a4, 15, 0
        sll.w             $a3, $a3, $a1
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a1
        bne               $a5, $a6, 0b
        ret

asm_test::neg::u16::release:
        ld.h              $a3, $a0, 0
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        nop
        nop
0:
        sub.d             $a4, $zero, $a3
        bstrpick.d        $a3, $a3, 15, 0
        sll.w             $a5, $a3, $a1
        bstrpick.d        $a3, $a4, 15, 0
        sll.w             $a3, $a3, $a1
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a2
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a2
        or                $a6, $a6, $a3
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a2
        srl.w             $a3, $a4, $a1
        bne               $a5, $a6, 0b
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

asm_test::neg::u64::acqrel:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.d             $a3, $zero, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        ret

asm_test::neg::u64::seqcst:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.d             $a3, $zero, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        ret

asm_test::neg::u64::acquire:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.d             $a3, $zero, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        ret

asm_test::neg::u64::relaxed:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.d             $a3, $zero, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        ret

asm_test::neg::u64::release:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.d             $a3, $zero, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        ret

asm_test::not::u8::acqrel:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::u8::seqcst:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::u8::acquire:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::u8::relaxed:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        amxor.w           $a2, $a1, $a0
        ret

asm_test::not::u8::release:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 255
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::u16::acqrel:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::u16::seqcst:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::u16::acquire:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::u16::relaxed:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        amxor.w           $a2, $a1, $a0
        ret

asm_test::not::u16::release:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::u32::acqrel:
        addi.w            $a1, $zero, -1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::u32::seqcst:
        addi.w            $a1, $zero, -1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::u32::acquire:
        addi.w            $a1, $zero, -1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::u32::relaxed:
        addi.w            $a1, $zero, -1
        amxor.w           $a2, $a1, $a0
        ret

asm_test::not::u32::release:
        addi.w            $a1, $zero, -1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::u64::acqrel:
        addi.w            $a1, $zero, -1
        amxor_db.d        $a2, $a1, $a0
        ret

asm_test::not::u64::seqcst:
        addi.w            $a1, $zero, -1
        amxor_db.d        $a2, $a1, $a0
        ret

asm_test::not::u64::acquire:
        addi.w            $a1, $zero, -1
        amxor_db.d        $a2, $a1, $a0
        ret

asm_test::not::u64::relaxed:
        addi.w            $a1, $zero, -1
        amxor.d           $a2, $a1, $a0
        ret

asm_test::not::u64::release:
        addi.w            $a1, $zero, -1
        amxor_db.d        $a2, $a1, $a0
        ret

asm_test::not::bool::acqrel:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::bool::seqcst:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::bool::acquire:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::not::bool::relaxed:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor.w           $a2, $a1, $a0
        ret

asm_test::not::bool::release:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::sub::u8::acqrel_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::sub::u8::seqcst_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::sub::u8::acquire_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::sub::u8::relaxed_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a1, $zero, $a0
        ret

asm_test::sub::u8::release_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::sub::u8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        sub.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        sub.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        sub.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        sub.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        sub.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u16::acqrel_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::sub::u16::seqcst_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::sub::u16::acquire_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::sub::u16::relaxed_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a1, $zero, $a0
        ret

asm_test::sub::u16::release_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::sub::u16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        sub.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        sub.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        sub.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        sub.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a2, $a0, 0
        sub.w             $a4, $a2, $a1
        xor               $a4, $a2, $a4
        and               $a4, $a4, $a3
        xor               $a4, $a2, $a4
        sc.w              $a4, $a0, 0
        beq               $a4, $zero, 0b
        ret

asm_test::sub::u32::acqrel_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::sub::u32::seqcst_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::sub::u32::acquire_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::sub::u32::relaxed_zero:
        amor.w            $a1, $zero, $a0
        ret

asm_test::sub::u32::release_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::sub::u32::acqrel:
        sub.w             $a1, $zero, $a1
        amadd_db.w        $a2, $a1, $a0
        ret

asm_test::sub::u32::seqcst:
        sub.w             $a1, $zero, $a1
        amadd_db.w        $a2, $a1, $a0
        ret

asm_test::sub::u32::acquire:
        sub.w             $a1, $zero, $a1
        amadd_db.w        $a2, $a1, $a0
        ret

asm_test::sub::u32::relaxed:
        sub.w             $a1, $zero, $a1
        amadd.w           $a2, $a1, $a0
        ret

asm_test::sub::u32::release:
        sub.w             $a1, $zero, $a1
        amadd_db.w        $a2, $a1, $a0
        ret

asm_test::sub::u64::acqrel_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::sub::u64::seqcst_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::sub::u64::acquire_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::sub::u64::relaxed_zero:
        amor.d            $a1, $zero, $a0
        ret

asm_test::sub::u64::release_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::sub::u64::acqrel:
        sub.d             $a1, $zero, $a1
        amadd_db.d        $a2, $a1, $a0
        ret

asm_test::sub::u64::seqcst:
        sub.d             $a1, $zero, $a1
        amadd_db.d        $a2, $a1, $a0
        ret

asm_test::sub::u64::acquire:
        sub.d             $a1, $zero, $a1
        amadd_db.d        $a2, $a1, $a0
        ret

asm_test::sub::u64::relaxed:
        sub.d             $a1, $zero, $a1
        amadd.d           $a2, $a1, $a0
        ret

asm_test::sub::u64::release:
        sub.d             $a1, $zero, $a1
        amadd_db.d        $a2, $a1, $a0
        ret

asm_test::xor::u8::acqrel_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::u8::seqcst_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::u8::acquire_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::u8::relaxed_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a1, $zero, $a0
        ret

asm_test::xor::u8::release_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::u8::acqrel:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::u8::seqcst:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::u8::acquire:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::u8::relaxed:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor.w           $a2, $a1, $a0
        ret

asm_test::xor::u8::release:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::u16::acqrel_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::u16::seqcst_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::u16::acquire_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::u16::relaxed_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a1, $zero, $a0
        ret

asm_test::xor::u16::release_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::u16::acqrel:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::u16::seqcst:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::u16::acquire:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::u16::relaxed:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor.w           $a2, $a1, $a0
        ret

asm_test::xor::u16::release:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::u32::acqrel_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::u32::seqcst_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::u32::acquire_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::u32::relaxed_zero:
        amor.w            $a1, $zero, $a0
        ret

asm_test::xor::u32::release_zero:
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::u32::acqrel:
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::u32::seqcst:
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::u32::acquire:
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::u32::relaxed:
        amxor.w           $a2, $a1, $a0
        ret

asm_test::xor::u32::release:
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::u64::acqrel_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::xor::u64::seqcst_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::xor::u64::acquire_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::xor::u64::relaxed_zero:
        amor.d            $a1, $zero, $a0
        ret

asm_test::xor::u64::release_zero:
        amor_db.d         $a1, $zero, $a0
        ret

asm_test::xor::u64::acqrel:
        amxor_db.d        $a2, $a1, $a0
        ret

asm_test::xor::u64::seqcst:
        amxor_db.d        $a2, $a1, $a0
        ret

asm_test::xor::u64::acquire:
        amxor_db.d        $a2, $a1, $a0
        ret

asm_test::xor::u64::relaxed:
        amxor.d           $a2, $a1, $a0
        ret

asm_test::xor::u64::release:
        amxor_db.d        $a2, $a1, $a0
        ret

asm_test::xor::bool::acqrel_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::bool::seqcst_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::bool::acqrel_false:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::bool::acquire_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::bool::relaxed_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor.w           $a2, $a1, $a0
        ret

asm_test::xor::bool::release_true:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a1, $a1, 3
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::bool::seqcst_false:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::bool::acquire_false:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::bool::relaxed_false:
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a1, $zero, $a0
        ret

asm_test::xor::bool::release_false:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::xor::bool::acqrel:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::bool::seqcst:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::bool::acquire:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a2, $a1, $a0
        ret

asm_test::xor::bool::relaxed:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor.w           $a2, $a1, $a0
        ret

asm_test::xor::bool::release:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        slli.d            $a2, $a2, 3
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a2, $a1, $a0
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

asm_test::load::f64::seqcst:
        ld.d              $a0, $a0, 0
        movgr2fr.d        $fa0, $a0
        dbar              16
        ret

asm_test::load::f64::acquire:
        ld.d              $a0, $a0, 0
        movgr2fr.d        $fa0, $a0
        dbar              20
        ret

asm_test::load::f64::relaxed:
        ld.d              $a0, $a0, 0
        movgr2fr.d        $fa0, $a0
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

asm_test::load::u64::seqcst:
        ld.d              $a0, $a0, 0
        dbar              16
        ret

asm_test::load::u64::acquire:
        ld.d              $a0, $a0, 0
        dbar              20
        ret

asm_test::load::u64::relaxed:
        ld.d              $a0, $a0, 0
        ret

asm_test::load::bool::seqcst:
        ld.b              $a0, $a0, 0
        sltu              $a0, $zero, $a0
        dbar              16
        ret

asm_test::load::bool::acquire:
        ld.b              $a0, $a0, 0
        sltu              $a0, $zero, $a0
        dbar              20
        ret

asm_test::load::bool::relaxed:
        ld.b              $a0, $a0, 0
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::u8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::swap::u8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::swap::u8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::swap::u8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::swap::u8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::swap::f32::acqrel:
        movfr2gr.s        $a1, $fa0
        amswap_db.w       $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::swap::f32::seqcst:
        movfr2gr.s        $a1, $fa0
        amswap_db.w       $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::swap::f32::acquire:
        movfr2gr.s        $a1, $fa0
        amswap_db.w       $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::swap::f32::relaxed:
        movfr2gr.s        $a1, $fa0
        amswap.w          $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::swap::f32::release:
        movfr2gr.s        $a1, $fa0
        amswap_db.w       $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::swap::f64::acqrel:
        movfr2gr.d        $a1, $fa0
        amswap_db.d       $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::swap::f64::seqcst:
        movfr2gr.d        $a1, $fa0
        amswap_db.d       $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::swap::f64::acquire:
        movfr2gr.d        $a1, $fa0
        amswap_db.d       $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::swap::f64::relaxed:
        movfr2gr.d        $a1, $fa0
        amswap.d          $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::swap::f64::release:
        movfr2gr.d        $a1, $fa0
        amswap_db.d       $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::swap::u16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::swap::u16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::swap::u16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::swap::u16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::swap::u16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        addi.w            $a5, $a1, 0
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::swap::u32::acqrel:
        amswap_db.w       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u32::seqcst:
        amswap_db.w       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u32::acquire:
        amswap_db.w       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u32::relaxed:
        amswap.w          $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u32::release:
        amswap_db.w       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u64::acqrel:
        amswap_db.d       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u64::seqcst:
        amswap_db.d       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u64::acquire:
        amswap_db.d       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u64::relaxed:
        amswap.d          $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u64::release:
        amswap_db.d       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::bool::acqrel_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::seqcst_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::acqrel_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::acquire_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::relaxed_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor.w            $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::release_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::seqcst_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::acquire_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::relaxed_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::release_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::acqrel:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret
0:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::seqcst:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret
0:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::acquire:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret
0:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::relaxed:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor.w            $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret
0:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::release:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret
0:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
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
        amswap_db.w       $zero, $a1, $a0
        ret

asm_test::store::f32::relaxed:
        movfr2gr.s        $a1, $fa0
        st.w              $a1, $a0, 0
        ret

asm_test::store::f32::release:
        movfr2gr.s        $a1, $fa0
        amswap_db.w       $zero, $a1, $a0
        ret

asm_test::store::f64::seqcst:
        movfr2gr.d        $a1, $fa0
        amswap_db.d       $zero, $a1, $a0
        ret

asm_test::store::f64::relaxed:
        movfr2gr.d        $a1, $fa0
        st.d              $a1, $a0, 0
        ret

asm_test::store::f64::release:
        movfr2gr.d        $a1, $fa0
        amswap_db.d       $zero, $a1, $a0
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
        amswap_db.w       $zero, $a1, $a0
        ret

asm_test::store::u32::relaxed:
        st.w              $a1, $a0, 0
        ret

asm_test::store::u32::release:
        amswap_db.w       $zero, $a1, $a0
        ret

asm_test::store::u64::seqcst:
        amswap_db.d       $zero, $a1, $a0
        ret

asm_test::store::u64::relaxed:
        st.d              $a1, $a0, 0
        ret

asm_test::store::u64::release:
        amswap_db.d       $zero, $a1, $a0
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
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amor_db.w         $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u8::seqcst:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amor_db.w         $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u8::acquire:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amor_db.w         $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u8::relaxed:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amor.w            $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u8::release:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amor_db.w         $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u16::acqrel:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amor_db.w         $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u16::seqcst:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amor_db.w         $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u16::acquire:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amor_db.w         $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u16::relaxed:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amor.w            $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u16::release:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a3, $a1, $a2
        amor_db.w         $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u32::acqrel:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u32::seqcst:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u32::acquire:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u32::relaxed:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amor.w            $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u32::release:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        amor_db.w         $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u64::acqrel:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        amor_db.d         $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u64::seqcst:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        amor_db.d         $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u64::acquire:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        amor_db.d         $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u64::relaxed:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        amor.d            $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_set::u64::release:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        amor_db.d         $a2, $a1, $a0
        and               $a0, $a2, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::u8::acqrel_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_or::u8::seqcst_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_or::u8::acqrel_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_or::u8::acquire_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_or::u8::relaxed_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        amor.w            $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_or::u8::release_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_or::u8::seqcst_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_or::u8::acquire_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_or::u8::relaxed_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_or::u8::release_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_or::u8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor_db.w         $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_or::u8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor_db.w         $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_or::u8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor_db.w         $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_or::u8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor.w            $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_or::u8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor_db.w         $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_or::u16::acqrel_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_or::u16::seqcst_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_or::u16::acqrel_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_or::u16::acquire_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_or::u16::relaxed_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        amor.w            $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_or::u16::release_all:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_or::u16::seqcst_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_or::u16::acquire_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_or::u16::relaxed_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_or::u16::release_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_or::u16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor_db.w         $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_or::u16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor_db.w         $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_or::u16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor_db.w         $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_or::u16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor.w            $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_or::u16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor_db.w         $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_or::u32::acqrel_all:
        addi.w            $a2, $zero, -1
        amswap_db.w       $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u32::seqcst_all:
        addi.w            $a2, $zero, -1
        amswap_db.w       $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u32::acqrel_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u32::acquire_all:
        addi.w            $a2, $zero, -1
        amswap_db.w       $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u32::relaxed_all:
        addi.w            $a2, $zero, -1
        amswap.w          $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u32::release_all:
        addi.w            $a2, $zero, -1
        amswap_db.w       $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u32::seqcst_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u32::acquire_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u32::relaxed_zero:
        amor.w            $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u32::release_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u32::acqrel:
        amor_db.w         $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_or::u32::seqcst:
        amor_db.w         $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_or::u32::acquire:
        amor_db.w         $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_or::u32::relaxed:
        amor.w            $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_or::u32::release:
        amor_db.w         $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_or::u64::acqrel_all:
        addi.w            $a2, $zero, -1
        amswap_db.d       $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u64::seqcst_all:
        addi.w            $a2, $zero, -1
        amswap_db.d       $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u64::acqrel_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u64::acquire_all:
        addi.w            $a2, $zero, -1
        amswap_db.d       $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u64::relaxed_all:
        addi.w            $a2, $zero, -1
        amswap.d          $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u64::release_all:
        addi.w            $a2, $zero, -1
        amswap_db.d       $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u64::seqcst_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u64::acquire_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u64::relaxed_zero:
        amor.d            $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u64::release_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_or::u64::acqrel:
        amor_db.d         $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_or::u64::seqcst:
        amor_db.d         $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_or::u64::acquire:
        amor_db.d         $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_or::u64::relaxed:
        amor.d            $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_or::u64::release:
        amor_db.d         $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_or::bool::acqrel_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::seqcst_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::acqrel_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::acquire_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::relaxed_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor.w            $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::release_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::seqcst_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::acquire_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::relaxed_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::release_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor_db.w         $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor_db.w         $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor_db.w         $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor.w            $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_or::bool::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amor_db.w         $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u8::acqrel:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        xori              $a4, $a1, 255
        sll.w             $a4, $a4, $a2
        orn               $a3, $a4, $a3
        amand_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u8::seqcst:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        xori              $a4, $a1, 255
        sll.w             $a4, $a4, $a2
        orn               $a3, $a4, $a3
        amand_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u8::acquire:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        xori              $a4, $a1, 255
        sll.w             $a4, $a4, $a2
        orn               $a3, $a4, $a3
        amand_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u8::relaxed:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        xori              $a4, $a1, 255
        sll.w             $a4, $a4, $a2
        orn               $a3, $a4, $a3
        amand.w           $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u8::release:
        andi              $a1, $a1, 7
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        xori              $a4, $a1, 255
        sll.w             $a4, $a4, $a2
        orn               $a3, $a4, $a3
        amand_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u16::acqrel:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a4, $a3, $a2
        xor               $a3, $a1, $a3
        sll.w             $a3, $a3, $a2
        orn               $a3, $a3, $a4
        amand_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u16::seqcst:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a4, $a3, $a2
        xor               $a3, $a1, $a3
        sll.w             $a3, $a3, $a2
        orn               $a3, $a3, $a4
        amand_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u16::acquire:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a4, $a3, $a2
        xor               $a3, $a1, $a3
        sll.w             $a3, $a3, $a2
        orn               $a3, $a3, $a4
        amand_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u16::relaxed:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a4, $a3, $a2
        xor               $a3, $a1, $a3
        sll.w             $a3, $a3, $a2
        orn               $a3, $a3, $a4
        amand.w           $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u16::release:
        andi              $a1, $a1, 15
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a4, $a3, $a2
        xor               $a3, $a1, $a3
        sll.w             $a3, $a3, $a2
        orn               $a3, $a3, $a4
        amand_db.w        $a4, $a3, $a0
        srl.w             $a0, $a4, $a2
        and               $a0, $a0, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u32::acqrel:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        nor               $a2, $a1, $zero
        amand_db.w        $a3, $a2, $a0
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u32::seqcst:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        nor               $a2, $a1, $zero
        amand_db.w        $a3, $a2, $a0
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u32::acquire:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        nor               $a2, $a1, $zero
        amand_db.w        $a3, $a2, $a0
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u32::relaxed:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        nor               $a2, $a1, $zero
        amand.w           $a3, $a2, $a0
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u32::release:
        ori               $a2, $zero, 1
        sll.w             $a1, $a2, $a1
        nor               $a2, $a1, $zero
        amand_db.w        $a3, $a2, $a0
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u64::acqrel:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        nor               $a2, $a1, $zero
        amand_db.d        $a3, $a2, $a0
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u64::seqcst:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        nor               $a2, $a1, $zero
        amand_db.d        $a3, $a2, $a0
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u64::acquire:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        nor               $a2, $a1, $zero
        amand_db.d        $a3, $a2, $a0
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u64::relaxed:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        nor               $a2, $a1, $zero
        amand.d           $a3, $a2, $a0
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::bit_clear::u64::release:
        ori               $a2, $zero, 1
        sll.d             $a1, $a2, $a1
        nor               $a2, $a1, $zero
        amand_db.d        $a3, $a2, $a0
        and               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_abs::f32::acqrel:
        lu12i.w           $a1, 524287
        ori               $a1, $a1, 4095
        amand_db.w        $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_abs::f32::seqcst:
        lu12i.w           $a1, 524287
        ori               $a1, $a1, 4095
        amand_db.w        $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_abs::f32::acquire:
        lu12i.w           $a1, 524287
        ori               $a1, $a1, 4095
        amand_db.w        $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_abs::f32::relaxed:
        lu12i.w           $a1, 524287
        ori               $a1, $a1, 4095
        amand.w           $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_abs::f32::release:
        lu12i.w           $a1, 524287
        ori               $a1, $a1, 4095
        amand_db.w        $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_abs::f64::acqrel:
        addi.w            $a1, $zero, -1
        lu52i.d           $a1, $a1, 2047
        amand_db.d        $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::fetch_abs::f64::seqcst:
        addi.w            $a1, $zero, -1
        lu52i.d           $a1, $a1, 2047
        amand_db.d        $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::fetch_abs::f64::acquire:
        addi.w            $a1, $zero, -1
        lu52i.d           $a1, $a1, 2047
        amand_db.d        $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::fetch_abs::f64::relaxed:
        addi.w            $a1, $zero, -1
        lu52i.d           $a1, $a1, 2047
        amand.d           $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::fetch_abs::f64::release:
        addi.w            $a1, $zero, -1
        lu52i.d           $a1, $a1, 2047
        amand_db.d        $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::fetch_add::u8::acqrel_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_add::u8::seqcst_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_add::u8::acquire_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_add::u8::relaxed_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_add::u8::release_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_add::u8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_add::u8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_add::u8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_add::u8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_add::u8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_add::f32::acqrel_zero:
        ld.w              $a1, $a0, 0
        movgr2fr.w        $fa0, $zero
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fadd.s            $fa1, $fa1, $fa0
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

asm_test::fetch_add::f32::seqcst_zero:
        ld.w              $a1, $a0, 0
        movgr2fr.w        $fa0, $zero
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fadd.s            $fa1, $fa1, $fa0
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

asm_test::fetch_add::f32::acquire_zero:
        ld.w              $a1, $a0, 0
        movgr2fr.w        $fa0, $zero
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fadd.s            $fa1, $fa1, $fa0
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

asm_test::fetch_add::f32::relaxed_zero:
        ld.w              $a1, $a0, 0
        movgr2fr.w        $fa0, $zero
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fadd.s            $fa1, $fa1, $fa0
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

asm_test::fetch_add::f32::release_zero:
        ld.w              $a1, $a0, 0
        movgr2fr.w        $fa0, $zero
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.w        $fa1, $a1
        fadd.s            $fa1, $fa1, $fa0
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

asm_test::fetch_add::f64::acqrel_zero:
        ld.d              $a1, $a0, 0
        movgr2fr.d        $fa0, $zero
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fadd.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_add::f64::seqcst_zero:
        ld.d              $a1, $a0, 0
        movgr2fr.d        $fa0, $zero
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fadd.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_add::f64::acquire_zero:
        ld.d              $a1, $a0, 0
        movgr2fr.d        $fa0, $zero
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fadd.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_add::f64::relaxed_zero:
        ld.d              $a1, $a0, 0
        movgr2fr.d        $fa0, $zero
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fadd.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_add::f64::release_zero:
        ld.d              $a1, $a0, 0
        movgr2fr.d        $fa0, $zero
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fadd.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_add::f64::acqrel:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fadd.d            $fa1, $fa0, $fa1
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_add::f64::seqcst:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fadd.d            $fa1, $fa0, $fa1
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_add::f64::acquire:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fadd.d            $fa1, $fa0, $fa1
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_add::f64::relaxed:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fadd.d            $fa1, $fa0, $fa1
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_add::f64::release:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fadd.d            $fa1, $fa0, $fa1
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_add::u16::acqrel_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_add::u16::seqcst_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_add::u16::acquire_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_add::u16::relaxed_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_add::u16::release_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_add::u16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_add::u16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_add::u16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_add::u16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_add::u16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        add.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_add::u32::acqrel_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_add::u32::seqcst_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_add::u32::acquire_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_add::u32::relaxed_zero:
        amor.w            $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_add::u32::release_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_add::u32::acqrel:
        amadd_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u32::seqcst:
        amadd_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u32::acquire:
        amadd_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u32::relaxed:
        amadd.w           $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u32::release:
        amadd_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u64::acqrel_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_add::u64::seqcst_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_add::u64::acquire_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_add::u64::relaxed_zero:
        amor.d            $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_add::u64::release_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_add::u64::acqrel:
        amadd_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u64::seqcst:
        amadd_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u64::acquire:
        amadd_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u64::relaxed:
        amadd.d           $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u64::release:
        amadd_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_and::u8::acqrel_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_and::u8::seqcst_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_and::u8::acqrel_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_and::u8::acquire_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_and::u8::relaxed_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_and::u8::release_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_and::u8::seqcst_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_and::u8::acquire_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_and::u8::relaxed_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_and::u8::release_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_and::u8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_and::u8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_and::u8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_and::u8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand.w           $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_and::u8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_and::u16::acqrel_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_and::u16::seqcst_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_and::u16::acqrel_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_and::u16::acquire_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_and::u16::relaxed_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_and::u16::release_all:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_and::u16::seqcst_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_and::u16::acquire_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_and::u16::relaxed_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_and::u16::release_zero:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_and::u16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_and::u16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_and::u16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_and::u16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand.w           $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_and::u16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_and::u32::acqrel_all:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u32::seqcst_all:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u32::acqrel_zero:
        amswap_db.w       $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u32::acquire_all:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u32::relaxed_all:
        amor.w            $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u32::release_all:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u32::seqcst_zero:
        amswap_db.w       $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u32::acquire_zero:
        amswap_db.w       $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u32::relaxed_zero:
        amswap.w          $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u32::release_zero:
        amswap_db.w       $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u32::acqrel:
        amand_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_and::u32::seqcst:
        amand_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_and::u32::acquire:
        amand_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_and::u32::relaxed:
        amand.w           $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_and::u32::release:
        amand_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_and::u64::acqrel_all:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u64::seqcst_all:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u64::acqrel_zero:
        amswap_db.d       $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u64::acquire_all:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u64::relaxed_all:
        amor.d            $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u64::release_all:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u64::seqcst_zero:
        amswap_db.d       $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u64::acquire_zero:
        amswap_db.d       $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u64::relaxed_zero:
        amswap.d          $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u64::release_zero:
        amswap_db.d       $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_and::u64::acqrel:
        amand_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_and::u64::seqcst:
        amand_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_and::u64::acquire:
        amand_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_and::u64::relaxed:
        amand.d           $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_and::u64::release:
        amand_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_and::bool::acqrel_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a1
        orn               $a2, $a3, $a2
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::seqcst_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a1
        orn               $a2, $a3, $a2
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::acqrel_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::acquire_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a1
        orn               $a2, $a3, $a2
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::relaxed_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a1
        orn               $a2, $a3, $a2
        amand.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::release_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        ori               $a3, $zero, 1
        sll.w             $a3, $a3, $a1
        orn               $a2, $a3, $a2
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::seqcst_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::acquire_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::relaxed_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::release_false:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        nor               $a2, $a2, $zero
        amand_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand.w           $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_and::bool::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
        orn               $a1, $a1, $a3
        amand_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_max::i8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        xori              $a3, $a3, 56
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_max::i8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        xori              $a3, $a3, 56
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_max::i8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        xori              $a3, $a3, 56
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_max::i8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        xori              $a3, $a3, 56
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_max::i8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        xori              $a3, $a3, 56
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
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

asm_test::fetch_max::f64::acqrel:
        ld.d              $a1, $a0, 0
        fmax.d            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fmax.d            $fa1, $fa1, $fa1
        fmax.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_max::f64::seqcst:
        ld.d              $a1, $a0, 0
        fmax.d            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fmax.d            $fa1, $fa1, $fa1
        fmax.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_max::f64::acquire:
        ld.d              $a1, $a0, 0
        fmax.d            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fmax.d            $fa1, $fa1, $fa1
        fmax.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_max::f64::relaxed:
        ld.d              $a1, $a0, 0
        fmax.d            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fmax.d            $fa1, $fa1, $fa1
        fmax.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_max::f64::release:
        ld.d              $a1, $a0, 0
        fmax.d            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fmax.d            $fa1, $fa1, $fa1
        fmax.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_max::i16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        ori               $a5, $zero, 48
        sub.d             $a3, $a5, $a3
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_max::i16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        ori               $a5, $zero, 48
        sub.d             $a3, $a5, $a3
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_max::i16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        ori               $a5, $zero, 48
        sub.d             $a3, $a5, $a3
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_max::i16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        ori               $a5, $zero, 48
        sub.d             $a3, $a5, $a3
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_max::i16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        ori               $a5, $zero, 48
        sub.d             $a3, $a5, $a3
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a7, $a1, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_max::i32::acqrel:
        ammax_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_max::i32::seqcst:
        ammax_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_max::i32::acquire:
        ammax_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_max::i32::relaxed:
        ammax.w           $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_max::i32::release:
        ammax_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_max::i64::acqrel:
        ammax_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_max::i64::seqcst:
        ammax_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_max::i64::acquire:
        ammax_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_max::i64::relaxed:
        ammax.d           $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_max::i64::release:
        ammax_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_min::i8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        xori              $a3, $a3, 56
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_min::i8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        xori              $a3, $a3, 56
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_min::i8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        xori              $a3, $a3, 56
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_min::i8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        xori              $a3, $a3, 56
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_min::i8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        ori               $a4, $zero, 255
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        xori              $a3, $a3, 56
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
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

asm_test::fetch_min::f64::acqrel:
        ld.d              $a1, $a0, 0
        fmax.d            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fmax.d            $fa1, $fa1, $fa1
        fmin.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_min::f64::seqcst:
        ld.d              $a1, $a0, 0
        fmax.d            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fmax.d            $fa1, $fa1, $fa1
        fmin.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_min::f64::acquire:
        ld.d              $a1, $a0, 0
        fmax.d            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fmax.d            $fa1, $fa1, $fa1
        fmin.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_min::f64::relaxed:
        ld.d              $a1, $a0, 0
        fmax.d            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fmax.d            $fa1, $fa1, $fa1
        fmin.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_min::f64::release:
        ld.d              $a1, $a0, 0
        fmax.d            $fa0, $fa0, $fa0
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fmax.d            $fa1, $fa1, $fa1
        fmin.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_min::i16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        ori               $a5, $zero, 48
        sub.d             $a3, $a5, $a3
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_min::i16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        ori               $a5, $zero, 48
        sub.d             $a3, $a5, $a3
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_min::i16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        ori               $a5, $zero, 48
        sub.d             $a3, $a5, $a3
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_min::i16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        ori               $a5, $zero, 48
        sub.d             $a3, $a5, $a3
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_min::i16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        andi              $a3, $a2, 24
        lu12i.w           $a4, 15
        ori               $a4, $a4, 4095
        sll.w             $a4, $a4, $a2
        sll.w             $a1, $a1, $a2
        ori               $a5, $zero, 48
        sub.d             $a3, $a5, $a3
0:
        ll.w              $a5, $a0, 0
        and               $a7, $a5, $a4
        move              $a6, $a5
        sll.w             $a7, $a7, $a3
        sra.w             $a7, $a7, $a3
        bge               $a1, $a7, 1f
        xor               $a6, $a5, $a1
        and               $a6, $a6, $a4
        xor               $a6, $a5, $a6
1:
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 0b
        srl.w             $a0, $a5, $a2
        ret

asm_test::fetch_min::i32::acqrel:
        ammin_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_min::i32::seqcst:
        ammin_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_min::i32::acquire:
        ammin_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_min::i32::relaxed:
        ammin.w           $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_min::i32::release:
        ammin_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_min::i64::acqrel:
        ammin_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_min::i64::seqcst:
        ammin_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_min::i64::acquire:
        ammin_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_min::i64::relaxed:
        ammin.d           $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_min::i64::release:
        ammin_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_neg::u8::acqrel:
        ld.b              $a1, $a0, 0
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nop
        nop
        nop
0:
        sub.d             $a4, $zero, $a1
        andi              $a1, $a1, 255
        sll.w             $a5, $a1, $a2
        andi              $a1, $a4, 255
        sll.w             $a1, $a1, $a2
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a1, $a4, $a2
        bne               $a5, $a6, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u8::seqcst:
        ld.b              $a1, $a0, 0
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nop
        nop
        nop
0:
        sub.d             $a4, $zero, $a1
        andi              $a1, $a1, 255
        sll.w             $a5, $a1, $a2
        andi              $a1, $a4, 255
        sll.w             $a1, $a1, $a2
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a1, $a4, $a2
        bne               $a5, $a6, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u8::acquire:
        ld.b              $a1, $a0, 0
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nop
        nop
        nop
0:
        sub.d             $a4, $zero, $a1
        andi              $a1, $a1, 255
        sll.w             $a5, $a1, $a2
        andi              $a1, $a4, 255
        sll.w             $a1, $a1, $a2
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a1, $a4, $a2
        bne               $a5, $a6, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u8::relaxed:
        ld.b              $a1, $a0, 0
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nop
        nop
        nop
0:
        sub.d             $a4, $zero, $a1
        andi              $a1, $a1, 255
        sll.w             $a5, $a1, $a2
        andi              $a1, $a4, 255
        sll.w             $a1, $a1, $a2
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a1, $a4, $a2
        bne               $a5, $a6, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u8::release:
        ld.b              $a1, $a0, 0
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        nop
        nop
        nop
0:
        sub.d             $a4, $zero, $a1
        andi              $a1, $a1, 255
        sll.w             $a5, $a1, $a2
        andi              $a1, $a4, 255
        sll.w             $a1, $a1, $a2
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a1, $a4, $a2
        bne               $a5, $a6, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::f32::acqrel:
        lu12i.w           $a1, -524288
        amxor_db.w        $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_neg::f32::seqcst:
        lu12i.w           $a1, -524288
        amxor_db.w        $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_neg::f32::acquire:
        lu12i.w           $a1, -524288
        amxor_db.w        $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_neg::f32::relaxed:
        lu12i.w           $a1, -524288
        amxor.w           $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_neg::f32::release:
        lu12i.w           $a1, -524288
        amxor_db.w        $a2, $a1, $a0
        movgr2fr.w        $fa0, $a2
        ret

asm_test::fetch_neg::f64::acqrel:
        lu52i.d           $a1, $zero, -2048
        amxor_db.d        $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::fetch_neg::f64::seqcst:
        lu52i.d           $a1, $zero, -2048
        amxor_db.d        $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::fetch_neg::f64::acquire:
        lu52i.d           $a1, $zero, -2048
        amxor_db.d        $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::fetch_neg::f64::relaxed:
        lu52i.d           $a1, $zero, -2048
        amxor.d           $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::fetch_neg::f64::release:
        lu52i.d           $a1, $zero, -2048
        amxor_db.d        $a2, $a1, $a0
        movgr2fr.d        $fa0, $a2
        ret

asm_test::fetch_neg::u16::acqrel:
        ld.h              $a1, $a0, 0
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        nop
        nop
0:
        sub.d             $a4, $zero, $a1
        bstrpick.d        $a1, $a1, 15, 0
        sll.w             $a5, $a1, $a2
        bstrpick.d        $a1, $a4, 15, 0
        sll.w             $a1, $a1, $a2
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a1, $a4, $a2
        bne               $a5, $a6, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u16::seqcst:
        ld.h              $a1, $a0, 0
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        nop
        nop
0:
        sub.d             $a4, $zero, $a1
        bstrpick.d        $a1, $a1, 15, 0
        sll.w             $a5, $a1, $a2
        bstrpick.d        $a1, $a4, 15, 0
        sll.w             $a1, $a1, $a2
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a1, $a4, $a2
        bne               $a5, $a6, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u16::acquire:
        ld.h              $a1, $a0, 0
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        nop
        nop
0:
        sub.d             $a4, $zero, $a1
        bstrpick.d        $a1, $a1, 15, 0
        sll.w             $a5, $a1, $a2
        bstrpick.d        $a1, $a4, 15, 0
        sll.w             $a1, $a1, $a2
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a1, $a4, $a2
        bne               $a5, $a6, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u16::relaxed:
        ld.h              $a1, $a0, 0
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        nop
        nop
0:
        sub.d             $a4, $zero, $a1
        bstrpick.d        $a1, $a1, 15, 0
        sll.w             $a5, $a1, $a2
        bstrpick.d        $a1, $a4, 15, 0
        sll.w             $a1, $a1, $a2
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a1, $a4, $a2
        bne               $a5, $a6, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u16::release:
        ld.h              $a1, $a0, 0
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        nop
        nop
0:
        sub.d             $a4, $zero, $a1
        bstrpick.d        $a1, $a1, 15, 0
        sll.w             $a5, $a1, $a2
        bstrpick.d        $a1, $a4, 15, 0
        sll.w             $a1, $a1, $a2
1:
        ll.w              $a4, $a0, 0
        and               $a6, $a4, $a3
        bne               $a6, $a5, 2f
        andn              $a6, $a4, $a3
        or                $a6, $a6, $a1
        sc.w              $a6, $a0, 0
        beq               $a6, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        and               $a6, $a4, $a3
        srl.w             $a1, $a4, $a2
        bne               $a5, $a6, 0b
        move              $a0, $a1
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

asm_test::fetch_neg::u64::acqrel:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.d             $a3, $zero, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u64::seqcst:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.d             $a3, $zero, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u64::acquire:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.d             $a3, $zero, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u64::relaxed:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.d             $a3, $zero, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        move              $a0, $a1
        ret

asm_test::fetch_neg::u64::release:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.d             $a3, $zero, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        move              $a0, $a1
        ret

asm_test::fetch_not::u8::acqrel:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_not::u8::seqcst:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_not::u8::acquire:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_not::u8::relaxed:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        amxor.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_not::u8::release:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 255
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_not::u16::acqrel:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_not::u16::seqcst:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_not::u16::acquire:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_not::u16::relaxed:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        amxor.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_not::u16::release:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a2, 15
        ori               $a2, $a2, 4095
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        ret

asm_test::fetch_not::u32::acqrel:
        addi.w            $a2, $zero, -1
        amxor_db.w        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_not::u32::seqcst:
        addi.w            $a2, $zero, -1
        amxor_db.w        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_not::u32::acquire:
        addi.w            $a2, $zero, -1
        amxor_db.w        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_not::u32::relaxed:
        addi.w            $a2, $zero, -1
        amxor.w           $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_not::u32::release:
        addi.w            $a2, $zero, -1
        amxor_db.w        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_not::u64::acqrel:
        addi.w            $a2, $zero, -1
        amxor_db.d        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_not::u64::seqcst:
        addi.w            $a2, $zero, -1
        amxor_db.d        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_not::u64::acquire:
        addi.w            $a2, $zero, -1
        amxor_db.d        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_not::u64::relaxed:
        addi.w            $a2, $zero, -1
        amxor.d           $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_not::u64::release:
        addi.w            $a2, $zero, -1
        amxor_db.d        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_not::bool::acqrel:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_not::bool::seqcst:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_not::bool::acquire:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_not::bool::relaxed:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_not::bool::release:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_sub::u8::acqrel_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_sub::u8::seqcst_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_sub::u8::acquire_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_sub::u8::relaxed_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_sub::u8::release_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_sub::u8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_sub::u8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_sub::u8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_sub::u8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_sub::u8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a3, $zero, 255
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_sub::f32::acqrel_zero:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
1:
        ll.w              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a3, $a2
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_sub::f32::seqcst_zero:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
1:
        ll.w              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a3, $a2
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_sub::f32::acquire_zero:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
1:
        ll.w              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a3, $a2
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_sub::f32::relaxed_zero:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
1:
        ll.w              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a3, $a2
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.w        $fa0, $a1
        ret

asm_test::fetch_sub::f32::release_zero:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
1:
        ll.w              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a3, $a2
        sc.w              $a3, $a0, 0
        beq               $a3, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.w        $fa0, $a1
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

asm_test::fetch_sub::f64::acqrel_zero:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a3, $a2
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_sub::f64::seqcst_zero:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a3, $a2
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_sub::f64::acquire_zero:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a3, $a2
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_sub::f64::relaxed_zero:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a3, $a2
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_sub::f64::release_zero:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a3, $a2
        sc.d              $a3, $a0, 0
        beq               $a3, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_sub::f64::acqrel:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fsub.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_sub::f64::seqcst:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fsub.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_sub::f64::acquire:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fsub.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_sub::f64::relaxed:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fsub.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_sub::f64::release:
        ld.d              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        movgr2fr.d        $fa1, $a1
        fsub.d            $fa1, $fa1, $fa0
        movfr2gr.d        $a3, $fa1
1:
        ll.d              $a1, $a0, 0
        bne               $a1, $a2, 2f
        move              $a4, $a3
        sc.d              $a4, $a0, 0
        beq               $a4, $zero, 1b
        b                 3f
2:
        dbar              1792
3:
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_sub::u16::acqrel_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_sub::u16::seqcst_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_sub::u16::acquire_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_sub::u16::relaxed_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_sub::u16::release_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_sub::u16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_sub::u16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_sub::u16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_sub::u16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_sub::u16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        lu12i.w           $a3, 15
        ori               $a3, $a3, 4095
        sll.w             $a3, $a3, $a2
        sll.w             $a1, $a1, $a2
0:
        ll.w              $a4, $a0, 0
        sub.w             $a5, $a4, $a1
        xor               $a5, $a4, $a5
        and               $a5, $a5, $a3
        xor               $a5, $a4, $a5
        sc.w              $a5, $a0, 0
        beq               $a5, $zero, 0b
        srl.w             $a0, $a4, $a2
        ret

asm_test::fetch_sub::u32::acqrel_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u32::seqcst_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u32::acquire_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u32::relaxed_zero:
        amor.w            $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u32::release_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u32::acqrel:
        sub.w             $a2, $zero, $a1
        amadd_db.w        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u32::seqcst:
        sub.w             $a2, $zero, $a1
        amadd_db.w        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u32::acquire:
        sub.w             $a2, $zero, $a1
        amadd_db.w        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u32::relaxed:
        sub.w             $a2, $zero, $a1
        amadd.w           $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u32::release:
        sub.w             $a2, $zero, $a1
        amadd_db.w        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u64::acqrel_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u64::seqcst_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u64::acquire_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u64::relaxed_zero:
        amor.d            $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u64::release_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u64::acqrel:
        sub.d             $a2, $zero, $a1
        amadd_db.d        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u64::seqcst:
        sub.d             $a2, $zero, $a1
        amadd_db.d        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u64::acquire:
        sub.d             $a2, $zero, $a1
        amadd_db.d        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u64::relaxed:
        sub.d             $a2, $zero, $a1
        amadd.d           $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u64::release:
        sub.d             $a2, $zero, $a1
        amadd_db.d        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_xor::u8::acqrel_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_xor::u8::seqcst_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_xor::u8::acquire_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_xor::u8::relaxed_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_xor::u8::release_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_xor::u8::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_xor::u8::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_xor::u8::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_xor::u8::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor.w           $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_xor::u8::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_xor::u16::acqrel_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_xor::u16::seqcst_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_xor::u16::acquire_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_xor::u16::relaxed_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_xor::u16::release_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_xor::u16::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_xor::u16::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_xor::u16::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_xor::u16::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor.w           $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_xor::u16::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        ret

asm_test::fetch_xor::u32::acqrel_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_xor::u32::seqcst_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_xor::u32::acquire_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_xor::u32::relaxed_zero:
        amor.w            $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_xor::u32::release_zero:
        amor_db.w         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_xor::u32::acqrel:
        amxor_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_xor::u32::seqcst:
        amxor_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_xor::u32::acquire:
        amxor_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_xor::u32::relaxed:
        amxor.w           $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_xor::u32::release:
        amxor_db.w        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_xor::u64::acqrel_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_xor::u64::seqcst_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_xor::u64::acquire_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_xor::u64::relaxed_zero:
        amor.d            $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_xor::u64::release_zero:
        amor_db.d         $a1, $zero, $a0
        move              $a0, $a1
        ret

asm_test::fetch_xor::u64::acqrel:
        amxor_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_xor::u64::seqcst:
        amxor_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_xor::u64::acquire:
        amxor_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_xor::u64::relaxed:
        amxor.d           $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_xor::u64::release:
        amxor_db.d        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_xor::bool::acqrel_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::seqcst_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::acqrel_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::acquire_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::relaxed_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor.w           $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::release_true:
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amxor_db.w        $a3, $a2, $a0
        srl.w             $a0, $a3, $a1
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::seqcst_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::acquire_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::relaxed_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::release_false:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::acqrel:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::seqcst:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::acquire:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::relaxed:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor.w           $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::fetch_xor::bool::release:
        slli.d            $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        sll.w             $a1, $a1, $a2
        amxor_db.w        $a3, $a1, $a0
        srl.w             $a0, $a3, $a2
        andi              $a0, $a0, 255
        sltu              $a0, $zero, $a0
        ret

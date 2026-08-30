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

asm_test::swap::u8::acqrel:
        amswap_db.b       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u8::seqcst:
        amswap_db.b       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u8::acquire:
        amswap_db.b       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u8::relaxed:
        amswap.b          $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u8::release:
        amswap_db.b       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u16::acqrel:
        amswap_db.h       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u16::seqcst:
        amswap_db.h       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u16::acquire:
        amswap_db.h       $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u16::relaxed:
        amswap.h          $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::swap::u16::release:
        amswap_db.h       $a2, $a1, $a0
        move              $a0, $a2
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

asm_test::fetch_add::u8::acqrel:
        amadd_db.b        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u8::seqcst:
        amadd_db.b        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u8::acquire:
        amadd_db.b        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u8::relaxed:
        amadd.b           $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u8::release:
        amadd_db.b        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u16::acqrel:
        amadd_db.h        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u16::seqcst:
        amadd_db.h        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u16::acquire:
        amadd_db.h        $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u16::relaxed:
        amadd.h           $a2, $a1, $a0
        move              $a0, $a2
        ret

asm_test::fetch_add::u16::release:
        amadd_db.h        $a2, $a1, $a0
        move              $a0, $a2
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

asm_test::fetch_sub::u8::acqrel:
        sub.w             $a2, $zero, $a1
        amadd_db.b        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u8::seqcst:
        sub.w             $a2, $zero, $a1
        amadd_db.b        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u8::acquire:
        sub.w             $a2, $zero, $a1
        amadd_db.b        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u8::relaxed:
        sub.w             $a2, $zero, $a1
        amadd.b           $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u8::release:
        sub.w             $a2, $zero, $a1
        amadd_db.b        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u16::acqrel:
        sub.w             $a2, $zero, $a1
        amadd_db.h        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u16::seqcst:
        sub.w             $a2, $zero, $a1
        amadd_db.h        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u16::acquire:
        sub.w             $a2, $zero, $a1
        amadd_db.h        $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u16::relaxed:
        sub.w             $a2, $zero, $a1
        amadd.h           $a1, $a2, $a0
        move              $a0, $a1
        ret

asm_test::fetch_sub::u16::release:
        sub.w             $a2, $zero, $a1
        amadd_db.h        $a1, $a2, $a0
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

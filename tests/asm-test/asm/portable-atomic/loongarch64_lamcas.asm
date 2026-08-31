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
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        nor               $a2, $a0, $zero
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u8::seqcst_all:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        nor               $a2, $a0, $zero
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u8::acqrel_zero:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u8::acquire_all:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        nor               $a2, $a0, $zero
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u8::relaxed_all:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        nor               $a2, $a0, $zero
        ext.w.b           $a3, $a0
        amcas.b           $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u8::release_all:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        nor               $a2, $a0, $zero
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u8::seqcst_zero:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u8::acquire_zero:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u8::relaxed_zero:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.b           $a3, $a0
        amcas.b           $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u8::release_zero:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u8::acqrel:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        and               $a3, $a0, $a1
        nor               $a3, $a3, $zero
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_nand::u8::seqcst:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        and               $a3, $a0, $a1
        nor               $a3, $a3, $zero
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_nand::u8::acquire:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        and               $a3, $a0, $a1
        nor               $a3, $a3, $zero
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_nand::u8::relaxed:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        and               $a3, $a0, $a1
        nor               $a3, $a3, $zero
        ext.w.b           $a4, $a0
        amcas.b           $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_nand::u8::release:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        and               $a3, $a0, $a1
        nor               $a3, $a3, $zero
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_nand::u16::acqrel_all:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        nor               $a2, $a0, $zero
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u16::seqcst_all:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        nor               $a2, $a0, $zero
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u16::acqrel_zero:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u16::acquire_all:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        nor               $a2, $a0, $zero
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u16::relaxed_all:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        nor               $a2, $a0, $zero
        ext.w.h           $a3, $a0
        amcas.h           $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u16::release_all:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        nor               $a2, $a0, $zero
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u16::seqcst_zero:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u16::acquire_zero:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u16::relaxed_zero:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.h           $a3, $a0
        amcas.h           $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u16::release_zero:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u16::acqrel:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        and               $a3, $a0, $a1
        nor               $a3, $a3, $zero
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_nand::u16::seqcst:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        and               $a3, $a0, $a1
        nor               $a3, $a3, $zero
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_nand::u16::acquire:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        and               $a3, $a0, $a1
        nor               $a3, $a3, $zero
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_nand::u16::relaxed:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        and               $a3, $a0, $a1
        nor               $a3, $a3, $zero
        ext.w.h           $a4, $a0
        amcas.h           $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_nand::u16::release:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        and               $a3, $a0, $a1
        nor               $a3, $a3, $zero
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_nand::u32::acqrel_all:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        nor               $a3, $a0, $zero
        amcas_db.w        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_nand::u32::seqcst_all:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        nor               $a3, $a0, $zero
        amcas_db.w        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_nand::u32::acqrel_zero:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        move              $a3, $a0
        amcas_db.w        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u32::acquire_all:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        nor               $a3, $a0, $zero
        amcas_db.w        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_nand::u32::relaxed_all:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        nor               $a3, $a0, $zero
        amcas.w           $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_nand::u32::release_all:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        nor               $a3, $a0, $zero
        amcas_db.w        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_nand::u32::seqcst_zero:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        move              $a3, $a0
        amcas_db.w        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u32::acquire_zero:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        move              $a3, $a0
        amcas_db.w        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u32::relaxed_zero:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        move              $a3, $a0
        amcas.w           $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u32::release_zero:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        move              $a3, $a0
        amcas_db.w        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u32::acqrel:
        move              $a2, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a3, $a0
        and               $a4, $a0, $a1
        nor               $a4, $a4, $zero
        amcas_db.w        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u32::seqcst:
        move              $a2, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a3, $a0
        and               $a4, $a0, $a1
        nor               $a4, $a4, $zero
        amcas_db.w        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u32::acquire:
        move              $a2, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a3, $a0
        and               $a4, $a0, $a1
        nor               $a4, $a4, $zero
        amcas_db.w        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u32::relaxed:
        move              $a2, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a3, $a0
        and               $a4, $a0, $a1
        nor               $a4, $a4, $zero
        amcas.w           $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u32::release:
        move              $a2, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a3, $a0
        and               $a4, $a0, $a1
        nor               $a4, $a4, $zero
        amcas_db.w        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u64::acqrel_all:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        nor               $a3, $a0, $zero
        amcas_db.d        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_nand::u64::seqcst_all:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        nor               $a3, $a0, $zero
        amcas_db.d        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_nand::u64::acqrel_zero:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        move              $a3, $a0
        amcas_db.d        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u64::acquire_all:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        nor               $a3, $a0, $zero
        amcas_db.d        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_nand::u64::relaxed_all:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        nor               $a3, $a0, $zero
        amcas.d           $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_nand::u64::release_all:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        nor               $a3, $a0, $zero
        amcas_db.d        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_nand::u64::seqcst_zero:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        move              $a3, $a0
        amcas_db.d        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u64::acquire_zero:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        move              $a3, $a0
        amcas_db.d        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u64::relaxed_zero:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        move              $a3, $a0
        amcas.d           $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u64::release_zero:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        move              $a3, $a0
        amcas_db.d        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u64::acqrel:
        move              $a2, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a3, $a0
        and               $a4, $a0, $a1
        nor               $a4, $a4, $zero
        amcas_db.d        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u64::seqcst:
        move              $a2, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a3, $a0
        and               $a4, $a0, $a1
        nor               $a4, $a4, $zero
        amcas_db.d        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u64::acquire:
        move              $a2, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a3, $a0
        and               $a4, $a0, $a1
        nor               $a4, $a4, $zero
        amcas_db.d        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u64::relaxed:
        move              $a2, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a3, $a0
        and               $a4, $a0, $a1
        nor               $a4, $a4, $zero
        amcas.d           $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_nand::u64::release:
        move              $a2, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a3, $a0
        and               $a4, $a0, $a1
        nor               $a4, $a4, $zero
        amcas_db.d        $a0, $a4, $a2
        bne               $a0, $a3, 0b
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
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        andi              $a3, $a0, 255
        sltu              $a3, $a1, $a3
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umax::u8::seqcst:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        andi              $a3, $a0, 255
        sltu              $a3, $a1, $a3
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umax::u8::acquire:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        andi              $a3, $a0, 255
        sltu              $a3, $a1, $a3
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umax::u8::relaxed:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        andi              $a3, $a0, 255
        sltu              $a3, $a1, $a3
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.b           $a4, $a0
        amcas.b           $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umax::u8::release:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        andi              $a3, $a0, 255
        sltu              $a3, $a1, $a3
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umax::u16::acqrel:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        bstrpick.d        $a3, $a0, 15, 0
        sltu              $a3, $a1, $a3
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umax::u16::seqcst:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        bstrpick.d        $a3, $a0, 15, 0
        sltu              $a3, $a1, $a3
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umax::u16::acquire:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        bstrpick.d        $a3, $a0, 15, 0
        sltu              $a3, $a1, $a3
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umax::u16::relaxed:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        bstrpick.d        $a3, $a0, 15, 0
        sltu              $a3, $a1, $a3
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.h           $a4, $a0
        amcas.h           $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umax::u16::release:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        bstrpick.d        $a3, $a0, 15, 0
        sltu              $a3, $a1, $a3
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
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
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        andi              $a3, $a0, 255
        sltu              $a3, $a1, $a3
        xori              $a3, $a3, 1
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umin::u8::seqcst:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        andi              $a3, $a0, 255
        sltu              $a3, $a1, $a3
        xori              $a3, $a3, 1
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umin::u8::acquire:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        andi              $a3, $a0, 255
        sltu              $a3, $a1, $a3
        xori              $a3, $a3, 1
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umin::u8::relaxed:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        andi              $a3, $a0, 255
        sltu              $a3, $a1, $a3
        xori              $a3, $a3, 1
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.b           $a4, $a0
        amcas.b           $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umin::u8::release:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        andi              $a3, $a0, 255
        sltu              $a3, $a1, $a3
        xori              $a3, $a3, 1
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umin::u16::acqrel:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        bstrpick.d        $a3, $a0, 15, 0
        sltu              $a3, $a1, $a3
        xori              $a3, $a3, 1
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umin::u16::seqcst:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        bstrpick.d        $a3, $a0, 15, 0
        sltu              $a3, $a1, $a3
        xori              $a3, $a3, 1
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umin::u16::acquire:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        bstrpick.d        $a3, $a0, 15, 0
        sltu              $a3, $a1, $a3
        xori              $a3, $a3, 1
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umin::u16::relaxed:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        bstrpick.d        $a3, $a0, 15, 0
        sltu              $a3, $a1, $a3
        xori              $a3, $a3, 1
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.h           $a4, $a0
        amcas.h           $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_umin::u16::release:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        bstrpick.d        $a3, $a0, 15, 0
        sltu              $a3, $a1, $a3
        xori              $a3, $a3, 1
        masknez           $a4, $a1, $a3
        maskeqz           $a3, $a0, $a3
        or                $a3, $a3, $a4
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
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
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::release_seqcst:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        ext.w.b           $a3, $a1
        amcas.b           $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::release_acquire:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u8::release_relaxed:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::f32::acqrel_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::seqcst_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::acqrel_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::acqrel_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::acquire_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::relaxed_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::release_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::seqcst_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::seqcst_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::acquire_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::acquire_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::relaxed_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::relaxed_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas.w           $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::release_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f32::release_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange::f64::acqrel_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::seqcst_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::acqrel_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::acqrel_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::acquire_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::relaxed_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::release_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::seqcst_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::seqcst_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::acquire_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::acquire_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::relaxed_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::relaxed_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas.d           $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::release_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::f64::release_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::release_seqcst:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        ext.w.h           $a3, $a1
        amcas.h           $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::release_acquire:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u16::release_relaxed:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::release_seqcst:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::acquire_acquire:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        move              $a3, $a1
        amcas.w           $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::release_acquire:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u32::release_relaxed:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::acqrel_seqcst:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::seqcst_seqcst:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::acqrel_acquire:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::acqrel_relaxed:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::acquire_seqcst:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::relaxed_seqcst:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::release_seqcst:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::seqcst_acquire:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::seqcst_relaxed:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::acquire_acquire:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::acquire_relaxed:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::relaxed_acquire:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::relaxed_relaxed:
        move              $a3, $a1
        amcas.d           $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::release_acquire:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange::u64::release_relaxed:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas.b           $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas.b           $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        ext.w.b           $a3, $a1
        amcas.b           $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::acqrel_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::acqrel_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::acquire_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::relaxed_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::release_seqcst:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::seqcst_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::acquire_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::acquire_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::relaxed_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::relaxed_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas.w           $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::release_acquire:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f32::release_relaxed:
        movfr2gr.s        $a1, $fa0
        movfr2gr.s        $a2, $fa1
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.w        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::acqrel_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::seqcst_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::acqrel_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::acqrel_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::acquire_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::relaxed_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::release_seqcst:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::seqcst_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::seqcst_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::acquire_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::acquire_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::relaxed_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::relaxed_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas.d           $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::release_acquire:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::f64::release_relaxed:
        movfr2gr.d        $a1, $fa0
        movfr2gr.d        $a2, $fa1
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        movgr2fr.d        $fa0, $a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        ext.w.h           $a3, $a1
        amcas.h           $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        xor               $a0, $a1, $a3
        sltu              $a0, $zero, $a0
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        move              $a3, $a1
        amcas.w           $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        move              $a3, $a1
        amcas_db.w        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::release_seqcst:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::acquire_acquire:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        move              $a3, $a1
        amcas.d           $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::release_acquire:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
        xor               $a0, $a3, $a1
        sltu              $a0, $zero, $a0
        move              $a1, $a3
        ret

asm_test::compare_exchange_weak::u64::release_relaxed:
        move              $a3, $a1
        amcas_db.d        $a3, $a2, $a0
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor.w            $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas.b           $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
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
        srl.w             $a2, $a4, $a2
        b                 3f
0:
        andi              $a2, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a3, $zero, $a0
        slli.d            $a0, $a2, 3
        srl.w             $a2, $a3, $a0
        b                 3f
1:
        ld.b              $a2, $a0, 0
2:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $zero, $a0
        bne               $a2, $a3, 2b
3:
        andi              $a0, $a2, 255
        sltu              $a2, $zero, $a0
        xor               $a0, $a1, $a2
        move              $a1, $a2
        ret

asm_test::or::u8::acqrel_all:
        ld.b              $a1, $a0, 0
        addi.w            $a2, $zero, -1
        nop
        nop
0:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::or::u8::seqcst_all:
        ld.b              $a1, $a0, 0
        addi.w            $a2, $zero, -1
        nop
        nop
0:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::or::u8::acqrel_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u8::acquire_all:
        ld.b              $a1, $a0, 0
        addi.w            $a2, $zero, -1
        nop
        nop
0:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::or::u8::relaxed_all:
        ld.b              $a1, $a0, 0
        addi.w            $a2, $zero, -1
        nop
        nop
0:
        ext.w.b           $a3, $a1
        amcas.b           $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::or::u8::release_all:
        ld.b              $a1, $a0, 0
        addi.w            $a2, $zero, -1
        nop
        nop
0:
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        bne               $a1, $a3, 0b
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
        ld.h              $a1, $a0, 0
        addi.w            $a2, $zero, -1
        nop
        nop
0:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::or::u16::seqcst_all:
        ld.h              $a1, $a0, 0
        addi.w            $a2, $zero, -1
        nop
        nop
0:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::or::u16::acqrel_zero:
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a1, $zero, $a0
        ret

asm_test::or::u16::acquire_all:
        ld.h              $a1, $a0, 0
        addi.w            $a2, $zero, -1
        nop
        nop
0:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::or::u16::relaxed_all:
        ld.h              $a1, $a0, 0
        addi.w            $a2, $zero, -1
        nop
        nop
0:
        ext.w.h           $a3, $a1
        amcas.h           $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::or::u16::release_all:
        ld.h              $a1, $a0, 0
        addi.w            $a2, $zero, -1
        nop
        nop
0:
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        bne               $a1, $a3, 0b
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
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        add.d             $a3, $a2, $a1
        ext.w.b           $a4, $a2
        amcas_db.b        $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::add::u8::seqcst:
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        add.d             $a3, $a2, $a1
        ext.w.b           $a4, $a2
        amcas_db.b        $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::add::u8::acquire:
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        add.d             $a3, $a2, $a1
        ext.w.b           $a4, $a2
        amcas_db.b        $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::add::u8::relaxed:
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        add.d             $a3, $a2, $a1
        ext.w.b           $a4, $a2
        amcas.b           $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::add::u8::release:
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        add.d             $a3, $a2, $a1
        ext.w.b           $a4, $a2
        amcas_db.b        $a2, $a3, $a0
        bne               $a2, $a4, 0b
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
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        add.d             $a3, $a2, $a1
        ext.w.h           $a4, $a2
        amcas_db.h        $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::add::u16::seqcst:
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        add.d             $a3, $a2, $a1
        ext.w.h           $a4, $a2
        amcas_db.h        $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::add::u16::acquire:
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        add.d             $a3, $a2, $a1
        ext.w.h           $a4, $a2
        amcas_db.h        $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::add::u16::relaxed:
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        add.d             $a3, $a2, $a1
        ext.w.h           $a4, $a2
        amcas.h           $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::add::u16::release:
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        add.d             $a3, $a2, $a1
        ext.w.h           $a4, $a2
        amcas_db.h        $a2, $a3, $a0
        bne               $a2, $a4, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        ret

asm_test::and::u8::acquire_zero:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        ret

asm_test::and::u8::relaxed_zero:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas.b           $a1, $zero, $a0
        bne               $a1, $a2, 0b
        ret

asm_test::and::u8::release_zero:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.h              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.h           $a2, $a1
        amcas_db.h        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.h              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.h           $a2, $a1
        amcas_db.h        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        ret

asm_test::and::u16::acquire_zero:
        ld.h              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.h           $a2, $a1
        amcas_db.h        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        ret

asm_test::and::u16::relaxed_zero:
        ld.h              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.h           $a2, $a1
        amcas.h           $a1, $zero, $a0
        bne               $a1, $a2, 0b
        ret

asm_test::and::u16::release_zero:
        ld.h              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.h           $a2, $a1
        amcas_db.h        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        ret

asm_test::and::bool::acquire_false:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        ret

asm_test::and::bool::relaxed_false:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas.b           $a1, $zero, $a0
        bne               $a1, $a2, 0b
        ret

asm_test::and::bool::release_false:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a2, $zero, $a1
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::neg::u8::seqcst:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a2, $zero, $a1
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::neg::u8::acquire:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a2, $zero, $a1
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::neg::u8::relaxed:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a2, $zero, $a1
        ext.w.b           $a3, $a1
        amcas.b           $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::neg::u8::release:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a2, $zero, $a1
        ext.w.b           $a3, $a1
        amcas_db.b        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::neg::u16::acqrel:
        ld.h              $a1, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a2, $zero, $a1
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::neg::u16::seqcst:
        ld.h              $a1, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a2, $zero, $a1
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::neg::u16::acquire:
        ld.h              $a1, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a2, $zero, $a1
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::neg::u16::relaxed:
        ld.h              $a1, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a2, $zero, $a1
        ext.w.h           $a3, $a1
        amcas.h           $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::neg::u16::release:
        ld.h              $a1, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a2, $zero, $a1
        ext.w.h           $a3, $a1
        amcas_db.h        $a1, $a2, $a0
        bne               $a1, $a3, 0b
        ret

asm_test::neg::u32::acqrel:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        sub.w             $a3, $zero, $a1
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas.w           $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas.d           $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a3, $a2, $a1
        ext.w.b           $a4, $a2
        amcas_db.b        $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::sub::u8::seqcst:
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a3, $a2, $a1
        ext.w.b           $a4, $a2
        amcas_db.b        $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::sub::u8::acquire:
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a3, $a2, $a1
        ext.w.b           $a4, $a2
        amcas_db.b        $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::sub::u8::relaxed:
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a3, $a2, $a1
        ext.w.b           $a4, $a2
        amcas.b           $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::sub::u8::release:
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a3, $a2, $a1
        ext.w.b           $a4, $a2
        amcas_db.b        $a2, $a3, $a0
        bne               $a2, $a4, 0b
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
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a3, $a2, $a1
        ext.w.h           $a4, $a2
        amcas_db.h        $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::sub::u16::seqcst:
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a3, $a2, $a1
        ext.w.h           $a4, $a2
        amcas_db.h        $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::sub::u16::acquire:
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a3, $a2, $a1
        ext.w.h           $a4, $a2
        amcas_db.h        $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::sub::u16::relaxed:
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a3, $a2, $a1
        ext.w.h           $a4, $a2
        amcas.h           $a2, $a3, $a0
        bne               $a2, $a4, 0b
        ret

asm_test::sub::u16::release:
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        sub.d             $a3, $a2, $a1
        ext.w.h           $a4, $a2
        amcas_db.h        $a2, $a3, $a0
        bne               $a2, $a4, 0b
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
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $a1, $a0
        bne               $a2, $a3, 0b
        move              $a0, $a2
        ret

asm_test::swap::u8::seqcst:
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $a1, $a0
        bne               $a2, $a3, 0b
        move              $a0, $a2
        ret

asm_test::swap::u8::acquire:
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $a1, $a0
        bne               $a2, $a3, 0b
        move              $a0, $a2
        ret

asm_test::swap::u8::relaxed:
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a3, $a2
        amcas.b           $a2, $a1, $a0
        bne               $a2, $a3, 0b
        move              $a0, $a2
        ret

asm_test::swap::u8::release:
        ld.b              $a2, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a3, $a2
        amcas_db.b        $a2, $a1, $a0
        bne               $a2, $a3, 0b
        move              $a0, $a2
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
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        ext.w.h           $a3, $a2
        amcas_db.h        $a2, $a1, $a0
        bne               $a2, $a3, 0b
        move              $a0, $a2
        ret

asm_test::swap::u16::seqcst:
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        ext.w.h           $a3, $a2
        amcas_db.h        $a2, $a1, $a0
        bne               $a2, $a3, 0b
        move              $a0, $a2
        ret

asm_test::swap::u16::acquire:
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        ext.w.h           $a3, $a2
        amcas_db.h        $a2, $a1, $a0
        bne               $a2, $a3, 0b
        move              $a0, $a2
        ret

asm_test::swap::u16::relaxed:
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        ext.w.h           $a3, $a2
        amcas.h           $a2, $a1, $a0
        bne               $a2, $a3, 0b
        move              $a0, $a2
        ret

asm_test::swap::u16::release:
        ld.h              $a2, $a0, 0
        nop
        nop
        nop
0:
        ext.w.h           $a3, $a2
        amcas_db.h        $a2, $a1, $a0
        bne               $a2, $a3, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        sltu              $a0, $zero, $a1
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        sltu              $a0, $zero, $a1
        ret

asm_test::swap::bool::acquire_false:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        sltu              $a0, $zero, $a1
        ret

asm_test::swap::bool::relaxed_false:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas.b           $a1, $zero, $a0
        bne               $a1, $a2, 0b
        sltu              $a0, $zero, $a1
        ret

asm_test::swap::bool::release_false:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        sltu              $a0, $zero, $a1
        ret

asm_test::swap::bool::acqrel:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a1, $a3, $a1
        andi              $a0, $a1, 255
        sltu              $a0, $zero, $a0
        ret
0:
        ld.b              $a1, $a0, 0
        nop
1:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 1b
        andi              $a0, $a1, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::seqcst:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a1, $a3, $a1
        andi              $a0, $a1, 255
        sltu              $a0, $zero, $a0
        ret
0:
        ld.b              $a1, $a0, 0
        nop
1:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 1b
        andi              $a0, $a1, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::acquire:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a1, $a3, $a1
        andi              $a0, $a1, 255
        sltu              $a0, $zero, $a0
        ret
0:
        ld.b              $a1, $a0, 0
        nop
1:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 1b
        andi              $a0, $a1, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::relaxed:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor.w            $a3, $a2, $a0
        srl.w             $a1, $a3, $a1
        andi              $a0, $a1, 255
        sltu              $a0, $zero, $a0
        ret
0:
        ld.b              $a1, $a0, 0
        nop
1:
        ext.w.b           $a2, $a1
        amcas.b           $a1, $zero, $a0
        bne               $a1, $a2, 1b
        andi              $a0, $a1, 255
        sltu              $a0, $zero, $a0
        ret

asm_test::swap::bool::release:
        beqz              $a1, 0f
        slli.d            $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        ori               $a2, $zero, 1
        sll.w             $a2, $a2, $a1
        amor_db.w         $a3, $a2, $a0
        srl.w             $a1, $a3, $a1
        andi              $a0, $a1, 255
        sltu              $a0, $zero, $a0
        ret
0:
        ld.b              $a1, $a0, 0
        nop
1:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 1b
        andi              $a0, $a1, 255
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
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_or::u8::seqcst_all:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_or::u8::acqrel_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_or::u8::acquire_all:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_or::u8::relaxed_all:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.b           $a3, $a0
        amcas.b           $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_or::u8::release_all:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
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
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_or::u16::seqcst_all:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_or::u16::acqrel_zero:
        andi              $a1, $a0, 3
        bstrins.d         $a0, $zero, 1, 0
        amor_db.w         $a2, $zero, $a0
        slli.d            $a0, $a1, 3
        srl.w             $a0, $a2, $a0
        ret

asm_test::fetch_or::u16::acquire_all:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_or::u16::relaxed_all:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.h           $a3, $a0
        amcas.h           $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_or::u16::release_all:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        addi.w            $a2, $zero, -1
        nop
0:
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
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
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        add.d             $a3, $a0, $a1
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_add::u8::seqcst:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        add.d             $a3, $a0, $a1
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_add::u8::acquire:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        add.d             $a3, $a0, $a1
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_add::u8::relaxed:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        add.d             $a3, $a0, $a1
        ext.w.b           $a4, $a0
        amcas.b           $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_add::u8::release:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        add.d             $a3, $a0, $a1
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas.w           $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas.w           $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas.d           $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas.d           $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        add.d             $a3, $a0, $a1
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_add::u16::seqcst:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        add.d             $a3, $a0, $a1
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_add::u16::acquire:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        add.d             $a3, $a0, $a1
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_add::u16::relaxed:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        add.d             $a3, $a0, $a1
        ext.w.h           $a4, $a0
        amcas.h           $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_add::u16::release:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        add.d             $a3, $a0, $a1
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
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
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a2, $a0
        amcas_db.b        $a0, $zero, $a1
        bne               $a0, $a2, 0b
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
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a2, $a0
        amcas_db.b        $a0, $zero, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_and::u8::acquire_zero:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a2, $a0
        amcas_db.b        $a0, $zero, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_and::u8::relaxed_zero:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a2, $a0
        amcas.b           $a0, $zero, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_and::u8::release_zero:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a2, $a0
        amcas_db.b        $a0, $zero, $a1
        bne               $a0, $a2, 0b
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
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a2, $a0
        amcas_db.h        $a0, $zero, $a1
        bne               $a0, $a2, 0b
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
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a2, $a0
        amcas_db.h        $a0, $zero, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_and::u16::acquire_zero:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a2, $a0
        amcas_db.h        $a0, $zero, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_and::u16::relaxed_zero:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a2, $a0
        amcas.h           $a0, $zero, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_and::u16::release_zero:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a2, $a0
        amcas_db.h        $a0, $zero, $a1
        bne               $a0, $a2, 0b
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        sltu              $a0, $zero, $a1
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
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        sltu              $a0, $zero, $a1
        ret

asm_test::fetch_and::bool::acquire_false:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        sltu              $a0, $zero, $a1
        ret

asm_test::fetch_and::bool::relaxed_false:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas.b           $a1, $zero, $a0
        bne               $a1, $a2, 0b
        sltu              $a0, $zero, $a1
        ret

asm_test::fetch_and::bool::release_false:
        ld.b              $a1, $a0, 0
        nop
        nop
        nop
0:
        ext.w.b           $a2, $a1
        amcas_db.b        $a1, $zero, $a0
        bne               $a1, $a2, 0b
        sltu              $a0, $zero, $a1
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
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a3, $a0
        slt               $a4, $a1, $a3
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.b        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_max::i8::seqcst:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a3, $a0
        slt               $a4, $a1, $a3
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.b        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_max::i8::acquire:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a3, $a0
        slt               $a4, $a1, $a3
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.b        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_max::i8::relaxed:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a3, $a0
        slt               $a4, $a1, $a3
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas.b           $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_max::i8::release:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a3, $a0
        slt               $a4, $a1, $a3
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.b        $a0, $a4, $a2
        bne               $a0, $a3, 0b
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas.w           $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas.d           $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_max::i16::acqrel:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a3, $a0
        slt               $a4, $a1, $a3
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.h        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_max::i16::seqcst:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a3, $a0
        slt               $a4, $a1, $a3
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.h        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_max::i16::acquire:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a3, $a0
        slt               $a4, $a1, $a3
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.h        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_max::i16::relaxed:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a3, $a0
        slt               $a4, $a1, $a3
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas.h           $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_max::i16::release:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a3, $a0
        slt               $a4, $a1, $a3
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.h        $a0, $a4, $a2
        bne               $a0, $a3, 0b
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
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a3, $a0
        slt               $a4, $a1, $a3
        xori              $a4, $a4, 1
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.b        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_min::i8::seqcst:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a3, $a0
        slt               $a4, $a1, $a3
        xori              $a4, $a4, 1
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.b        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_min::i8::acquire:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a3, $a0
        slt               $a4, $a1, $a3
        xori              $a4, $a4, 1
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.b        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_min::i8::relaxed:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a3, $a0
        slt               $a4, $a1, $a3
        xori              $a4, $a4, 1
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas.b           $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_min::i8::release:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        ext.w.b           $a3, $a0
        slt               $a4, $a1, $a3
        xori              $a4, $a4, 1
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.b        $a0, $a4, $a2
        bne               $a0, $a3, 0b
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas.w           $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas.d           $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
        bne               $a1, $a2, 0b
        movgr2fr.d        $fa0, $a1
        ret

asm_test::fetch_min::i16::acqrel:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a3, $a0
        slt               $a4, $a1, $a3
        xori              $a4, $a4, 1
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.h        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_min::i16::seqcst:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a3, $a0
        slt               $a4, $a1, $a3
        xori              $a4, $a4, 1
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.h        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_min::i16::acquire:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a3, $a0
        slt               $a4, $a1, $a3
        xori              $a4, $a4, 1
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.h        $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_min::i16::relaxed:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a3, $a0
        slt               $a4, $a1, $a3
        xori              $a4, $a4, 1
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas.h           $a0, $a4, $a2
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_min::i16::release:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        ext.w.h           $a3, $a0
        slt               $a4, $a1, $a3
        xori              $a4, $a4, 1
        masknez           $a5, $a1, $a4
        maskeqz           $a4, $a0, $a4
        or                $a4, $a4, $a5
        amcas_db.h        $a0, $a4, $a2
        bne               $a0, $a3, 0b
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
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a2, $zero, $a0
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_neg::u8::seqcst:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a2, $zero, $a0
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_neg::u8::acquire:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a2, $zero, $a0
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_neg::u8::relaxed:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a2, $zero, $a0
        ext.w.b           $a3, $a0
        amcas.b           $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_neg::u8::release:
        move              $a1, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a2, $zero, $a0
        ext.w.b           $a3, $a0
        amcas_db.b        $a0, $a2, $a1
        bne               $a0, $a3, 0b
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
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a2, $zero, $a0
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_neg::u16::seqcst:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a2, $zero, $a0
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_neg::u16::acquire:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a2, $zero, $a0
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_neg::u16::relaxed:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a2, $zero, $a0
        ext.w.h           $a3, $a0
        amcas.h           $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_neg::u16::release:
        move              $a1, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a2, $zero, $a0
        ext.w.h           $a3, $a0
        amcas_db.h        $a0, $a2, $a1
        bne               $a0, $a3, 0b
        ret

asm_test::fetch_neg::u32::acqrel:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        sub.w             $a3, $zero, $a0
        amcas_db.w        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_neg::u32::seqcst:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        sub.w             $a3, $zero, $a0
        amcas_db.w        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_neg::u32::acquire:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        sub.w             $a3, $zero, $a0
        amcas_db.w        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_neg::u32::relaxed:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        sub.w             $a3, $zero, $a0
        amcas.w           $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_neg::u32::release:
        move              $a1, $a0
        ld.w              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        sub.w             $a3, $zero, $a0
        amcas_db.w        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_neg::u64::acqrel:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        sub.d             $a3, $zero, $a0
        amcas_db.d        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_neg::u64::seqcst:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        sub.d             $a3, $zero, $a0
        amcas_db.d        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_neg::u64::acquire:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        sub.d             $a3, $zero, $a0
        amcas_db.d        $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_neg::u64::relaxed:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        sub.d             $a3, $zero, $a0
        amcas.d           $a0, $a3, $a1
        bne               $a0, $a2, 0b
        ret

asm_test::fetch_neg::u64::release:
        move              $a1, $a0
        ld.d              $a0, $a0, 0
        nop
        nop
0:
        move              $a2, $a0
        sub.d             $a3, $zero, $a0
        amcas_db.d        $a0, $a3, $a1
        bne               $a0, $a2, 0b
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
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a3, $a0, $a1
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_sub::u8::seqcst:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a3, $a0, $a1
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_sub::u8::acquire:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a3, $a0, $a1
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_sub::u8::relaxed:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a3, $a0, $a1
        ext.w.b           $a4, $a0
        amcas.b           $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_sub::u8::release:
        move              $a2, $a0
        ld.b              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a3, $a0, $a1
        ext.w.b           $a4, $a0
        amcas_db.b        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_sub::f32::acqrel_zero:
        ld.w              $a1, $a0, 0
        nop
        nop
        nop
0:
        move              $a2, $a1
        amcas_db.w        $a1, $a2, $a0
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
        amcas_db.w        $a1, $a2, $a0
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
        amcas_db.w        $a1, $a2, $a0
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
        amcas.w           $a1, $a2, $a0
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
        amcas_db.w        $a1, $a2, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas.w           $a1, $a3, $a0
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
        amcas_db.w        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a2, $a0
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
        amcas_db.d        $a1, $a2, $a0
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
        amcas_db.d        $a1, $a2, $a0
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
        amcas.d           $a1, $a2, $a0
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
        amcas_db.d        $a1, $a2, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        amcas.d           $a1, $a3, $a0
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
        amcas_db.d        $a1, $a3, $a0
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
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a3, $a0, $a1
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_sub::u16::seqcst:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a3, $a0, $a1
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_sub::u16::acquire:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a3, $a0, $a1
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_sub::u16::relaxed:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a3, $a0, $a1
        ext.w.h           $a4, $a0
        amcas.h           $a0, $a3, $a2
        bne               $a0, $a4, 0b
        ret

asm_test::fetch_sub::u16::release:
        move              $a2, $a0
        ld.h              $a0, $a0, 0
        nop
        nop
0:
        sub.d             $a3, $a0, $a1
        ext.w.h           $a4, $a0
        amcas_db.h        $a0, $a3, $a2
        bne               $a0, $a4, 0b
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

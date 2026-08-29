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

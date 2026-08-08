asm_test::fence::acqrel:
        push              {r11, lr}
        mov               r11, sp
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fence::seqcst:
        push              {r11, lr}
        mov               r11, sp
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fence::acquire:
        push              {r11, lr}
        mov               r11, sp
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fence::release:
        push              {r11, lr}
        mov               r11, sp
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

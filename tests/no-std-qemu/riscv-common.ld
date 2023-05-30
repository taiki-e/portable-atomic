/* SPDX-License-Identifier: Apache-2.0 OR MIT */
/* Adapted from https://github.com/taiki-e/semihosting/blob/HEAD/tests/no-std/riscv-common.ld. */

/* A common part of linker scripts for RISC-V test with QEMU.
 * This is intended to be included from riscv32.ld or riscv64.ld.
 */

SECTIONS
{
    . = FW_JUMP_ADDR;
    PROVIDE(__executable_start = .); /* for unwinding support */

    .text : {
        *(.text._start)
        *(.text .text.*)
    }
    PROVIDE(__etext = .); /* for unwinding support */
    .rodata : { *(.rodata .rodata.*) }
    .data : { *(.data .data.*) }

    /* for unwinding support */
    . = ALIGN(8);
    PROVIDE(__eh_frame = .);
    .eh_frame : { KEEP(*(.eh_frame)) *(.eh_frame.*) }

    . = ALIGN(STACK_ALIGN);
    PROVIDE(_stack = . + 8M);
}

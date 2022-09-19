/* Device specific memory layout for RISC-V test
 * Adapted from https://github.com/andre-richter/qemu-exit.
 *
 * SPDX-License-Identifier: MIT OR Apache-2.0
 *
 * Copyright (c) 2020-2022 Esteban Blanc <estblcsk@gmail.com>
 */

ENTRY(_start)

SECTIONS
{
    /* Set current address to the address where OpenSBI will jump */
    . = 0x80200000;

    .text : {
        *(.text._start)
        *(.text)
    }
    .rodata : { *(.rodata*) }

    PROVIDE(_stack = . + 1M);
    . = . + 1M;

    .heap :
	{
		PROVIDE(_heap_start = .);
		*(.heap)
                . = . + 8192;
		. = ALIGN(4);
		PROVIDE(_heap_end = .);
	}
}

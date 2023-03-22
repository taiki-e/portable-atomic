/* SPDX-License-Identifier: Apache-2.0 OR MIT */
/* Adapted from https://github.com/taiki-e/semihosting/blob/main/tests/no-std/riscv32.ld. */

/* Linker script for RISC-V RV32 test with QEMU */

ENTRY(_start)

/* https://github.com/riscv-software-src/opensbi/blob/v1.2/platform/generic/objects.mk#L25-L34 */
FW_JUMP_ADDR = 0x80000000 + 0x400000;
/* https://github.com/riscv-non-isa/riscv-eabi-spec/blob/HEAD/EABI.adoc#eabi-stack-alignment */
STACK_ALIGN = 8;

INCLUDE riscv-common.ld

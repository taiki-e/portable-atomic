/* SPDX-License-Identifier: Apache-2.0 OR MIT */
/* Adapted from https://github.com/taiki-e/semihosting/blob/HEAD/tests/no-std/riscv64.ld. */

/* Linker script for RISC-V RV64 test with QEMU */

ENTRY(_start)

/* https://github.com/riscv-software-src/opensbi/blob/v1.2/platform/generic/objects.mk#L25-L34 */
FW_JUMP_ADDR = 0x80000000 + 0x200000;
/* https://github.com/riscv-non-isa/riscv-eabi-spec/blob/HEAD/EABI.adoc#eabi-stack-alignment */
STACK_ALIGN = 16;

INCLUDE riscv-common.ld

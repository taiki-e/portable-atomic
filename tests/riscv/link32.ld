/* Linker script for riscv32 test
 * Adapted from https://github.com/andre-richter/qemu-exit/blob/v3.0.1/tests/riscv64_virt/link.ld.
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

  /* https://github.com/riscv-non-isa/riscv-eabi-spec/blob/HEAD/EABI.adoc#eabi-stack-alignment */
  . = ALIGN(8);
  PROVIDE(_stack = . + 1M);
}

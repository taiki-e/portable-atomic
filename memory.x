/* Device specific memory layout for Cortex-M test */

/* See https://docs.rs/cortex-m-rt for more. */

MEMORY
{
  FLASH : ORIGIN = 0x00000000, LENGTH = 256K
  RAM : ORIGIN = 0x20000000, LENGTH = 64K
}

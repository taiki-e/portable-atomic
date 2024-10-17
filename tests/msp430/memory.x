/* SPDX-License-Identifier: Apache-2.0 OR MIT */
/* Adapted from https://github.com/rust-embedded/msp430-quickstart/blob/535cd3c810ec6096a1dd0546ea290ed94aa6fd01/memory.x. */

MEMORY
{
  /* These values are correct for the msp430g2553 device. You will need to
     modify these values if using a different device. Room must be reserved
     for interrupt vectors plus reset vector and the end of the first 64kB
     of address space. */
  RAM : ORIGIN = 0x0200, LENGTH = 0x0200
  ROM : ORIGIN = 0xC000, LENGTH = 0x3FE0
  VECTORS : ORIGIN = 0xFFE0, LENGTH = 0x20
}

/* Stack begins at the end of RAM:
   _stack_start = ORIGIN(RAM) + LENGTH(RAM); */

/* TODO: Code (and data?) above 64kB mark, which is supported even without
   using MSP430X mode. */

# Implementation of 128-bit atomics

The table of targets that support 128-bit atomics and the instructions used:

| target_arch | load  | store | CAS  | RMW  | note |
| ----------- | ----- | ----- | ---- | ---- | ---- |
| x86_64 | cmpxchg16b or vmovdqa | cmpxchg16b or vmovdqa | cmpxchg16b | cmpxchg16b | cmpxchg16b target feature required. vmovdqa requires Intel or AMD CPU with AVX. <br> Both compile-time and run-time detection are supported for cmpxchg16b. vmovdqa is currently run-time detection only.  <br> Requires rustc 1.59+ when cmpxchg16b target feature is enabled at compile-time, otherwise requires nightly |
| aarch64 | ldxp/stxp or casp or ldp | ldxp/stxp or casp or stp | ldxp/stxp or casp | ldxp/stxp or casp | casp requires lse target feature, ldp/stp requires lse2 target feature. <br> Both compile-time and run-time detection are supported for lse. lse2 is currently compile-time detection only.  <br> Requires rustc 1.59+ |
| powerpc64 | lq | stq | lqarx/stqcx. | lqarx/stqcx. | Little endian or target CPU pwr8+. <br> Requires nightly |
| s390x | lpq | stpq | cdsg | cdsg | Requires nightly |

Run-time detections are enabled by default and can be disabled with `--cfg portable_atomic_no_outline_atomics`.

See [aarch64.rs](aarch64.rs) module-level comments for more details on the instructions used on aarch64.

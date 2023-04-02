# Implementation of 128-bit atomics

## 128-bit atomics instructions

Here is the table of targets that support 128-bit atomics and the instructions used:

| target_arch | load | store | CAS | RMW | note |
| ----------- | ---- | ----- | --- | --- | ---- |
| x86_64 | cmpxchg16b or vmovdqa | cmpxchg16b or vmovdqa | cmpxchg16b | cmpxchg16b | cmpxchg16b target feature required. vmovdqa requires Intel or AMD CPU with AVX. <br> Both compile-time and run-time detection are supported for cmpxchg16b. vmovdqa is currently run-time detection only.  <br> Requires rustc 1.59+ when cmpxchg16b target feature is enabled at compile-time, otherwise requires rustc 1.69+ |
| aarch64 | ldxp/stxp or casp or ldp | ldxp/stxp or casp or stp | ldxp/stxp or casp | ldxp/stxp or casp | casp requires lse target feature, ldp/stp requires lse2 target feature. <br> Both compile-time and run-time detection are supported for lse. lse2 is currently compile-time detection only.  <br> Requires rustc 1.59+ |
| powerpc64 | lq | stq | lqarx/stqcx. | lqarx/stqcx. | Little endian or target CPU pwr8+. <br> Requires nightly |
| s390x | lpq | stpq | cdsg | cdsg | Requires nightly |

On compiler versions or platforms where these are not supported, the fallback implementation is used.

See [aarch64.rs](aarch64.rs) module-level comments for more details on the instructions used on aarch64.

## Run-time feature detection

[detect](detect) module has run-time feature detection implementations.

Run-time detections are enabled by default and can be disabled with `--cfg portable_atomic_no_outline_atomics`.

Here is the table of targets that support run-time feature detection and the instruction or API used:

| target_arch | target_os/target_env | instruction/API |
| ----------- | -------------------- | --------------- |
| x86_64      | all (except for sgx) | cpuid           |
| aarch64     | linux/android        | getauxval       |
| aarch64     | freebsd              | elf_aux_info    |
| aarch64     | macos/openbsd        | sysctl          |
| aarch64     | windows              | IsProcessorFeaturePresent |
| aarch64     | fuchsia              | zx_system_get_features |

For targets not included in the above table, run-time detections are disabled and work the same as when `--cfg portable_atomic_no_outline_atomics` is set.

See [detect/auxv.rs](detect/auxv.rs) module-level comments for more details on Linux/Android/FreeBSD.

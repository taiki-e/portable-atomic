# Implementation of 64-bit atomics on 32-bit architectures

(See the [`atomic128` module](../atomic128) for 128-bit atomics on 64-bit architectures.)

## 64-bit atomics instructions

Here is the table of targets that support 64-bit atomics and the instructions used:

| target_arch | load | store | CAS | RMW | note |
| ----------- | ---- | ----- | --- | --- | ---- |
| x86 | cmpxchg8b or fild or movlps or movq | cmpxchg8b or fistp or movlps | cmpxchg8b | cmpxchg8b | provided by `core::sync::atomic` |
| arm | ldrexd | ldrexd/strexd | ldrexd/strexd | ldrexd/strexd | provided by `core::sync::atomic` for Armv6+, otherwise provided by us for Linux/Android using kuser_cmpxchg64 (see arm_linux.rs for more) |
| riscv32 | amocas.d | amocas.d | amocas.d | amocas.d | Experimental. Requires experimental-zacas target feature. Currently compile-time detection only due to LLVM marking it as experimental. <br> Requires 1.82+ (LLVM 19+) |

If `core::sync::atomic` provides 64-bit atomics, we use them.
On compiler versions or platforms where these are not supported, the fallback implementation is used.

## Run-time CPU feature detection

[detect](../detect) module has run-time CPU feature detection implementations.

Here is the table of targets that support run-time CPU feature detection and the instruction or API used:

| target_arch | target_os/target_env | instruction/API | features | note |
| ----------- | -------------------- | --------------- | -------- | ---- |
| riscv32     | linux                | riscv_hwprobe   | all      | Currently only used in tests due to LLVM marking zacas as experimental |

Run-time detection is enabled by default on most targets and can be disabled with `--cfg portable_atomic_no_outline_atomics`.

On some targets, run-time detection is disabled by default mainly for compatibility with older versions of operating systems or incomplete build environments, and can be enabled by `--cfg portable_atomic_outline_atomics`. (When both cfg are enabled, `*_no_*` cfg is preferred.)

For targets not included in the above table, run-time detection is always disabled and works the same as when `--cfg portable_atomic_no_outline_atomics` is set.

See also [docs on `portable_atomic_no_outline_atomics`](https://github.com/taiki-e/portable-atomic/blob/HEAD/README.md#optional-cfg-no-outline-atomics) in the top-level readme.

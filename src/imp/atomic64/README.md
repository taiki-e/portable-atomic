# 64-bit atomic implementations on 32-bit architectures

(See the [`atomic128` module](../atomic128) for 128-bit atomic implementations on 64-bit architectures.)

## 64-bit atomic instructions

Here is the table of targets that support 64-bit atomics and the instructions used:

| target_arch | load | store | CAS | RMW | note |
| ----------- | ---- | ----- | --- | --- | ---- |
| x86 | cmpxchg8b or fild or movlps or movq | cmpxchg8b or fistp or movlps | cmpxchg8b | cmpxchg8b | provided by `core::sync::atomic` |
| arm | ldrexd or ldrd | ldrexd/strexd or strd | ldrexd/strexd | ldrexd/strexd | ldrexd/strexd requires Armv6, ldrd/strd requires LPAE, ldrexd/strexd-only implementation for Armv{6,7} is provided by `core::sync::atomic` |
| riscv32 | amocas.d | amocas.d | amocas.d | amocas.d | Experimental because LLVM marking the corresponding target feature as experimental. Requires experimental-zacas target feature. Both compile-time and run-time detection are supported (run-time detection is currently disabled by default). <br> Requires 1.82+ (LLVM 19+) |
| hexagon | memd | memd | memd_locked | memd_locked |  |

On compiler versions or platforms where these are not supported, the fallback implementation is used.

## Comparison with core::sync::atomic::Atomic{I,U}64

Use assembly-based implementations if 64-bit atomics are not available in `core::sync::atomic`. Use partial assembly-based implementations in combination with `core::sync::atomic` if additional optimizations can be implemented. Otherwise, just use `core::sync::atomic` ([core_atomic.rs](../core_atomic.rs)).

## Run-time CPU feature detection

See the [`detect` module's readme](../detect/README.md) for run-time CPU feature detection.

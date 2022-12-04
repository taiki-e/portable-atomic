# portable-atomic

[![crates.io](https://img.shields.io/crates/v/portable-atomic?style=flat-square&logo=rust)](https://crates.io/crates/portable-atomic)
[![docs.rs](https://img.shields.io/badge/docs.rs-portable--atomic-blue?style=flat-square&logo=docs.rs)](https://docs.rs/portable-atomic)
[![license](https://img.shields.io/badge/license-Apache--2.0_OR_MIT-blue?style=flat-square)](#license)
[![rustc](https://img.shields.io/badge/rustc-1.34+-blue?style=flat-square&logo=rust)](https://www.rust-lang.org)
[![build status](https://img.shields.io/github/workflow/status/taiki-e/portable-atomic/CI/main?style=flat-square&logo=github)](https://github.com/taiki-e/portable-atomic/actions)
[![build status](https://img.shields.io/cirrus/github/taiki-e/portable-atomic/main?style=flat-square&logo=cirrusci)](https://cirrus-ci.com/github/taiki-e/portable-atomic)

Portable atomic types including support for 128-bit atomics, atomic float, etc.

- Provide all atomic integer types (`Atomic{I,U}{8,16,32,64}`) for all targets that can use atomic CAS. (i.e., all targets that can use `std`, and most no-std targets)
- Provide `AtomicI128` and `AtomicU128`.
- Provide `AtomicF32` and `AtomicF64`. (optional)
<!-- - Provide generic `Atomic<T>` type. (optional) -->
- Provide atomic load/store for targets where atomic is not available at all in the standard library. (RISC-V without A-extension, MSP430, AVR)
- Provide atomic CAS for targets where atomic CAS is not available in the standard library. (thumbv6m, pre-v6 ARM, RISC-V without A-extension, MSP430, AVR) ([optional and single-core only](#optional-cfg) for ARM and RISC-V, always enabled for MSP430 and AVR)
- Provide stable equivalents of the standard library's atomic types' unstable APIs, such as [`AtomicPtr::fetch_*`](https://github.com/rust-lang/rust/issues/99108), [`AtomicBool::fetch_not`](https://github.com/rust-lang/rust/issues/98485).
- Make features that require newer compilers, such as [fetch_max](https://doc.rust-lang.org/std/sync/atomic/struct.AtomicUsize.html#method.fetch_max), [fetch_min](https://doc.rust-lang.org/std/sync/atomic/struct.AtomicUsize.html#method.fetch_min), [fetch_update](https://doc.rust-lang.org/std/sync/atomic/struct.AtomicPtr.html#method.fetch_update), and [stronger CAS failure ordering](https://github.com/rust-lang/rust/pull/98383) available on Rust 1.34+.
- Provide workaround for bugs in the standard library's atomic-related APIs, such as [rust-lang/rust#100650], `fence`/`compiler_fence` on MSP430 that cause LLVM error, etc.

## Usage

Add this to your `Cargo.toml`:

```toml
[dependencies]
portable-atomic = "0.3"
```

The default features are mainly for users who use atomics larger than the pointer width.
If you don't need them, disabling the default features may reduce code size and compile time slightly.

```toml
[dependencies]
portable-atomic = { version = "0.3", default-features = false }
```

*Compiler support: requires rustc 1.34+*

## 128-bit atomics support

Native 128-bit atomic operations are available on x86_64 (Rust 1.59+), aarch64 (Rust 1.59+), powerpc64 (le or pwr8+, nightly only), and s390x (nightly only), otherwise the fallback implementation is used.

On x86_64, when the `outline-atomics` optional feature is not enabled and `cmpxchg16b` target feature is not enabled at compile-time, this uses the fallback implementation. `cmpxchg16b` target feature is enabled by default only on macOS.

They are usually implemented using inline assembly, and when using Miri or ThreadSanitizer that do not support inline assembly, core intrinsics are used instead of inline assembly if possible.

See [this list](https://github.com/taiki-e/portable-atomic/issues/10#issuecomment-1159368067) for details.

## Optional features

- **`fallback`** *(enabled by default)*<br>
  Enable fallback implementations.

  Disabling this allows only atomic types for which the platform natively supports atomic operations.

- **`outline-atomics`**<br>
  Enable run-time CPU feature detection.

  This allows maintaining support for older CPUs while using features that are not supported on older CPUs, such as CMPXCHG16B (x86_64) and FEAT_LSE (aarch64).

  Note:
  - Dynamic detection is currently only enabled in Rust 1.61+ for aarch64, in 1.59+ (AVX) or nightly (CMPXCHG16B) for x86_64, and in nightly for other platforms, otherwise it works the same as the default.
  - If the required target features are enabled at compile-time, the atomic operations are inlined.
  - This is compatible with no-std (as with all features except `std`).

  See also [this list](https://github.com/taiki-e/portable-atomic/issues/10#issuecomment-1159368067).

- **`float`**<br>
  Provide `AtomicF{32,64}`.
  Note that most of `fetch_*` operations of atomic floats are implemented using CAS loops, which can be slower than equivalent operations of atomic integers.

<!-- TODO
- **`generic`**<br>
  Provides generic `Atomic<T>` type.
-->

- **`std`**<br>
  Use `std`.

- **`serde`**<br>
  Implement `serde::{Serialize,Deserialize}` for atomic types.

  Note:
  - The MSRV when this feature enables depends on the MSRV of [serde].

## Optional cfg

- **`--cfg portable_atomic_unsafe_assume_single_core`**<br>
  Assume that the target is single-core.
  When this cfg is enabled, this crate provides atomic CAS for targets where atomic CAS is not available in the standard library by disabling interrupts.

  This cfg is `unsafe`, and note the following safety requirements:
  - Enabling this cfg for multi-core systems is always **unsound**.
  - This uses privileged instructions to disable interrupts, so it usually doesn't work on unprivileged mode.
    Enabling this cfg in an environment where privileged instructions are not available, or if the instructions used are not sufficient to disable interrupts in the system, it is also usually considered **unsound**, although the details are system-dependent.

    The following are known cases:
    - On pre-v6 ARM, this disables only IRQs by default. For many systems (e.g., GBA) this is enough. If the system need to disable both IRQs and FIQs, you need to pass the `--cfg portable_atomic_disable_fiq` together.
    - On RISC-V without A-extension, this generates code for machine-mode (M-mode) by default. If you pass the `--cfg portable_atomic_s_mode` together, this generates code for supervisor-mode (S-mode). In particular, `qemu-system-riscv*` uses [OpenSBI](https://github.com/riscv-software-src/opensbi) as the default firmware.

    See also [the `interrupt` module's readme](https://github.com/taiki-e/portable-atomic/blob/HEAD/src/imp/interrupt/README.md).

  This is intentionally not an optional feature. (If this is an optional feature, dependencies can implicitly enable the feature, resulting in the use of unsound code without the end-user being aware of it.)

  ARMv6-M (thumbv6m), pre-v6 ARM (e.g., thumbv4t, thumbv5te), RISC-V without A-extension are currently supported. See [#33] for support of multi-core systems.

  Since all MSP430 and AVR are single-core, we always provide atomic CAS for them without this cfg.

  Enabling this cfg for targets that have atomic CAS will result in a compile error.

  The cfg interface is kept between versions, so updating the portable-atomic is designed to not break downstream builds unless the portable-atomic types are exposed in the library's API.

  Feel free to submit an issue if your target is not supported yet.

## Related Projects

- [atomic-maybe-uninit]: Atomic operations on potentially uninitialized integers.
- [atomic-memcpy]: Byte-wise atomic memcpy.

[#33]: https://github.com/taiki-e/portable-atomic/issues/33
[atomic-maybe-uninit]: https://github.com/taiki-e/atomic-maybe-uninit
[atomic-memcpy]: https://github.com/taiki-e/atomic-memcpy
[rust-lang/rust#100650]: https://github.com/rust-lang/rust/issues/100650
[serde]: https://github.com/serde-rs/serde

## License

Licensed under either of [Apache License, Version 2.0](LICENSE-APACHE) or
[MIT license](LICENSE-MIT) at your option.

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall
be dual licensed as above, without any additional terms or conditions.

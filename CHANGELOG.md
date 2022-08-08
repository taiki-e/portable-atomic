# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](https://semver.org).

<!--
Note: In this file, do not use the hard wrap in the middle of a sentence for compatibility with GitHub comment style markdown rendering.
-->

## [Unreleased]

- Support atomic CAS on no-std pre-v6 ARM targets (e.g., thumbv4t-none-eabi) under `--cfg portable_atomic_arm_swp_lock`.

## [0.3.10] - 2022-08-03

- Optimize AArch64 128-bit atomic load when the `lse` target feature is enabled at compile-time. ([#20](https://github.com/taiki-e/portable-atomic/pull/20))

## [0.3.9] - 2022-08-03

- Fix build error on old Miri.

- Documentation improvements.

## [0.3.8] - 2022-08-02

- Make AArch64 and s390x 128-bit atomics compatible with Miri and ThreadSanitizer.

## [0.3.7] - 2022-07-31

- Provide stable equivalent of [`#![feature(strict_provenance_atomic_ptr)]`](https://github.com/rust-lang/rust/issues/99108). ([#23](https://github.com/taiki-e/portable-atomic/pull/23))

  - `AtomicPtr::fetch_ptr_{add,sub}`
  - `AtomicPtr::fetch_byte_{add,sub}`
  - `AtomicPtr::fetch_{or,and,xor}`

  These APIs are compatible with strict-provenance on `cfg(miri)`. Otherwise, they are compatible with permissive-provenance.
  Once `#![feature(strict_provenance_atomic_ptr)]` is stabilized, these APIs will be strict-provenance compatible in all cases from the version in which it is stabilized.

- Provide stable equivalent of [`#![feature(atomic_bool_fetch_not)]`](https://github.com/rust-lang/rust/issues/98485). ([#24](https://github.com/taiki-e/portable-atomic/pull/24))

  - `AtomicBool::fetch_not`

- Optimize x86_64 128-bit RMWs. ([#22](https://github.com/taiki-e/portable-atomic/pull/22))

- Optimize x86_64 outline-atomics.

- Optimize inline assemblies on ARM and AArch64.

- Revert [thumbv6m atomic load/store changes made in 0.3.5](https://github.com/taiki-e/portable-atomic/pull/18). This is because [rust-lang/rust#99595](https://github.com/rust-lang/rust/pull/99595) has been reverted, so this is no longer needed.

## [0.3.6] - 2022-07-26

- Fix build failure due to the existence of the `specs` directory.

- Documentation improvements.

- Optimize inline assemblies on x86_64, RISC-V, and MSP430.

## [0.3.5] - 2022-07-23

**Note:** This release has been yanked due to a bug fixed in 0.3.6.

- Provide thumbv6m atomic load/store which is planned to be removed from the standard library in [rust-lang/rust#99595](https://github.com/rust-lang/rust/pull/99595). ([#18](https://github.com/taiki-e/portable-atomic/pull/18))

- Optimize inline assemblies on AArch64, RISC-V, and powerpc64.

## [0.3.4] - 2022-06-25

- Optimize x86_64 128-bit atomic store.

## [0.3.3] - 2022-06-24

- Allow CAS failure ordering stronger than success ordering. ([#17](https://github.com/taiki-e/portable-atomic/pull/17))

## [0.3.2] - 2022-06-19

- Optimize x86_64 128-bit atomic load/store on Intel CPU with AVX. ([#16](https://github.com/taiki-e/portable-atomic/pull/16))

- Support native 128-bit atomic operations for powerpc64 (le or pwr8+, currently nightly-only).

- Fix behavior differences between stable and nightly. ([#15](https://github.com/taiki-e/portable-atomic/pull/15))

## [0.3.1] - 2022-06-16

- Optimize AArch64 128-bit atomic load/store when the `lse2` target feature is enabled at compile-time. ([#11](https://github.com/taiki-e/portable-atomic/pull/11))

- Relax ordering in `Debug` impl to reflect std changes. ([#12](https://github.com/taiki-e/portable-atomic/pull/12))

## [0.3.0] - 2022-03-25

- Support native 128-bit atomic operations for s390x (currently nightly-only).

- Add `AtomicF{32,64}::fetch_abs`.

- Add `#[must_use]` to constructors.

- Use 128-bit atomic operation mappings same as LLVM on AArch64.

- Remove `parking_lot` optional feature to allow the use of this crate within global allocators.

## [0.2.1] - 2022-03-17

- Implement AArch64 outline-atomics.

## [0.2.0] - 2022-03-10

- Remove `i128` feature. `Atomic{I,U}128` are now always enabled.

- Add `outline-atomics` feature. Currently, this is the same as the 0.1's `i128-dynamic`, except that `fallback` feature is not implicitly enabled.

- Remove `i128-dynamic` feature in favor of `outline-atomics` feature.

- Add `AtomicF{32,64}::as_bits`.

## [0.1.4] - 2022-03-02

- Support native 128-bit atomic operations for AArch64 at Rust 1.59+. This was previously supported only on nightly. ([#6](https://github.com/taiki-e/portable-atomic/pull/6))

## [0.1.3] - 2022-02-28

- Fix inline assembly for RISC-V without A-extension.

## [0.1.2] - 2022-02-26

**Note:** This release has been yanked due to a bug fixed in 0.1.3.

- Add `parking_lot` feature to use parking_lot in global locks of fallback implementation.

- Fix bug in cmpxchg16b support. ([#5](https://github.com/taiki-e/portable-atomic/pull/5))

## [0.1.1] - 2022-02-25

**Note:** This release has been yanked due to a bug fixed in 0.1.3.

- Fix doc cfg on `Atomic{I,U}128`.

## [0.1.0] - 2022-02-24

**Note:** This release has been yanked due to a bug fixed in 0.1.3.

Initial release

[Unreleased]: https://github.com/taiki-e/portable-atomic/compare/v0.3.10...HEAD
[0.3.10]: https://github.com/taiki-e/portable-atomic/compare/v0.3.9...v0.3.10
[0.3.9]: https://github.com/taiki-e/portable-atomic/compare/v0.3.8...v0.3.9
[0.3.8]: https://github.com/taiki-e/portable-atomic/compare/v0.3.7...v0.3.8
[0.3.7]: https://github.com/taiki-e/portable-atomic/compare/v0.3.6...v0.3.7
[0.3.6]: https://github.com/taiki-e/portable-atomic/compare/v0.3.5...v0.3.6
[0.3.5]: https://github.com/taiki-e/portable-atomic/compare/v0.3.4...v0.3.5
[0.3.4]: https://github.com/taiki-e/portable-atomic/compare/v0.3.3...v0.3.4
[0.3.3]: https://github.com/taiki-e/portable-atomic/compare/v0.3.2...v0.3.3
[0.3.2]: https://github.com/taiki-e/portable-atomic/compare/v0.3.1...v0.3.2
[0.3.1]: https://github.com/taiki-e/portable-atomic/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/taiki-e/portable-atomic/compare/v0.2.1...v0.3.0
[0.2.1]: https://github.com/taiki-e/portable-atomic/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/taiki-e/portable-atomic/compare/v0.1.4...v0.2.0
[0.1.4]: https://github.com/taiki-e/portable-atomic/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/taiki-e/portable-atomic/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/taiki-e/portable-atomic/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/taiki-e/portable-atomic/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/taiki-e/portable-atomic/releases/tag/v0.1.0

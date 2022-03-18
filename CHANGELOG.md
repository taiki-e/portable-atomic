# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](https://semver.org).

<!--
Note: In this file, do not use the hard wrap in the middle of a sentence for compatibility with GitHub comment style markdown rendering.
-->

## [Unreleased]

- Add `#[must_use]` to constructors.

## [0.2.1] - 2022-03-17

- Implement aarch64 outline-atomics.

## [0.2.0] - 2022-03-10

- Remove `i128` feature. `Atomic{I,U}128` are now always enabled.

- Add `outline-atomics` feature. Currently, this is the same as the 0.1's `i128-dynamic`, except that `fallback` feature is not implicitly enabled.

- Remove `i128-dynamic` feature in favor of `outline-atomics` feature.

- Add `AtomicF{32,64}::as_bits`.

## [0.1.4] - 2022-03-02

- Support 128-bit atomics for aarch64 at Rust 1.59+. This was previously supported only on nightly. ([#6](https://github.com/taiki-e/portable-atomic/pull/6))

## [0.1.3] - 2022-02-28

- Fix inline assembly for riscv without A-extension.

## [0.1.2] - 2022-02-26

- Add `parking_lot` feature to use parking_lot in global locks of fallback implementation.

- Fix bug in cmpxchg16b support. ([#5](https://github.com/taiki-e/portable-atomic/pull/5))

## [0.1.1] - 2022-02-25

- Fix doc cfg on `Atomic{I,U}128`.

## [0.1.0] - 2022-02-24

Initial release

[Unreleased]: https://github.com/taiki-e/portable-atomic/compare/v0.2.1...HEAD
[0.2.1]: https://github.com/taiki-e/portable-atomic/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/taiki-e/portable-atomic/compare/v0.1.4...v0.2.0
[0.1.4]: https://github.com/taiki-e/portable-atomic/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/taiki-e/portable-atomic/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/taiki-e/portable-atomic/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/taiki-e/portable-atomic/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/taiki-e/portable-atomic/releases/tag/v0.1.0

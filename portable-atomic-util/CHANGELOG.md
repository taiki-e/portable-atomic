# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](https://semver.org).

<!--
Note: In this file, do not use the hard wrap in the middle of a sentence for compatibility with GitHub comment style markdown rendering.
-->

## [Unreleased]

## [0.1.3] - 2023-05-06

- Enable `portable-atomic`'s `require-cas` feature to display helpful error messages to users on targets requiring additional action on the user side to provide atomic CAS. ([#100](https://github.com/taiki-e/portable-atomic/pull/100))

## [0.1.2] - 2023-04-04

- Implement `AsRef`, `Borrow`, and `Unpin` on `Arc`. ([#92](https://github.com/taiki-e/portable-atomic/pull/92) [#93](https://github.com/taiki-e/portable-atomic/pull/93), thanks @notgull)

## [0.1.1] - 2023-03-24

- Prevent weak counter overflow in `Arc::downgrade`. ([#83](https://github.com/taiki-e/portable-atomic/pull/83))

  This fixes [a potential unsoundness recently found in the standard library's `Arc`](https://github.com/rust-lang/rust/issues/108706).

## [0.1.0] - 2023-01-15

Initial release

[Unreleased]: https://github.com/taiki-e/portable-atomic/compare/portable-atomic-util-0.1.3...HEAD
[0.1.3]: https://github.com/taiki-e/portable-atomic/compare/portable-atomic-util-0.1.2...portable-atomic-util-0.1.3
[0.1.2]: https://github.com/taiki-e/portable-atomic/compare/portable-atomic-util-0.1.1...portable-atomic-util-0.1.2
[0.1.1]: https://github.com/taiki-e/portable-atomic/compare/portable-atomic-util-0.1.0...portable-atomic-util-0.1.1
[0.1.0]: https://github.com/taiki-e/portable-atomic/releases/tag/portable-atomic-util-0.1.0

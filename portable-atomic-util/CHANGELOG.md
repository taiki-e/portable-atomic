# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](https://semver.org).

<!--
Note: In this file, do not use the hard wrap in the middle of a sentence for compatibility with GitHub comment style markdown rendering.
-->

## [Unreleased]

- Prevent weak counter overflow in `Arc::downgrade`. ([#83](https://github.com/taiki-e/portable-atomic/pull/83))

  This fixes [a potential unsoundness recently found in the standard library's `Arc`](https://github.com/rust-lang/rust/issues/108706).

## [0.1.0] - 2023-01-15

Initial release

[Unreleased]: https://github.com/taiki-e/portable-atomic/compare/portable-atomic-util-0.1.0...HEAD
[0.1.0]: https://github.com/taiki-e/portable-atomic/releases/tag/portable-atomic-util-0.1.0

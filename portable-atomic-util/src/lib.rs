// SPDX-License-Identifier: Apache-2.0 OR MIT

/*!
<!-- tidy:crate-doc:start -->
Synchronization primitives built with [portable-atomic].

- Provide `Arc`. (optional, requires the `std` or `alloc` feature)
<!-- - Provide generic `Atomic<T>` type. (optional, requires the `generic` feature) -->

See [#1] for other primitives being considered for addition to this crate.

*Compiler support: requires rustc 1.34+*

## Optional features

- **`std`**<br>
  Use `std`.

  Note:
  - This implicitly enables the `alloc` feature.

- **`alloc`**<br>
  Use `alloc`.

  Note:
  - The MSRV when this feature is enabled and the `std` feature is *not* enabled is Rust 1.36 that `alloc` crate stabilized.

<!-- TODO: https://github.com/taiki-e/portable-atomic/issues/1
- **`generic`**<br>
  Provides generic `Atomic<T>` type.
-->

[portable-atomic]: https://github.com/taiki-e/portable-atomic
[#1]: https://github.com/taiki-e/portable-atomic/issues/1

<!-- tidy:crate-doc:end -->
*/

#![no_std]
#![doc(test(
    no_crate_inject,
    attr(
        deny(warnings, rust_2018_idioms, single_use_lifetimes),
        allow(dead_code, unused_variables)
    )
))]
#![warn(
    rust_2018_idioms,
    single_use_lifetimes,
    unreachable_pub,
    clippy::pedantic,
    // Lints that may help when writing public library.
    missing_debug_implementations,
    missing_docs,
    clippy::alloc_instead_of_core,
    clippy::exhaustive_enums,
    clippy::exhaustive_structs,
    clippy::impl_trait_in_params,
    // clippy::missing_inline_in_public_items,
    clippy::std_instead_of_alloc,
    clippy::std_instead_of_core,
    // Lints that may help when writing unsafe code.
    improper_ctypes,
    improper_ctypes_definitions,
    // unsafe_op_in_unsafe_fn, // set conditionally since it requires Rust 1.52
    clippy::as_ptr_cast_mut,
    clippy::default_union_representation,
    clippy::inline_asm_x86_att_syntax,
    clippy::trailing_empty_array,
    clippy::transmute_undefined_repr,
    clippy::undocumented_unsafe_blocks,
)]
#![cfg_attr(not(portable_atomic_no_unsafe_op_in_unsafe_fn), warn(unsafe_op_in_unsafe_fn))] // unsafe_op_in_unsafe_fn requires Rust 1.52
#![cfg_attr(portable_atomic_no_unsafe_op_in_unsafe_fn, allow(unused_unsafe))]
#![allow(
    clippy::cast_lossless,
    clippy::doc_markdown,
    clippy::float_cmp,
    clippy::inline_always,
    clippy::missing_errors_doc,
    clippy::module_inception,
    clippy::similar_names,
    clippy::single_match,
    clippy::type_complexity
)]
#![cfg_attr(docsrs, feature(doc_cfg))]

#[cfg(all(feature = "alloc", not(portable_atomic_no_alloc)))]
extern crate alloc;
#[cfg(all(feature = "std", portable_atomic_no_alloc))]
extern crate std as alloc;

#[cfg(any(all(feature = "alloc", not(portable_atomic_no_alloc)), feature = "std"))]
#[cfg_attr(docsrs, doc(cfg(any(feature = "alloc", feature = "std"))))]
mod arc;
#[cfg(any(all(feature = "alloc", not(portable_atomic_no_alloc)), feature = "std"))]
pub use arc::{Arc, Weak};

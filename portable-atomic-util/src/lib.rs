/*!
Synchronization primitives built with portable-atomic.

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
    missing_debug_implementations,
    missing_docs,
    rust_2018_idioms,
    single_use_lifetimes,
    unreachable_pub
)]
#![cfg_attr(not(portable_atomic_no_unsafe_op_in_unsafe_fn), warn(unsafe_op_in_unsafe_fn))] // unsafe_op_in_unsafe_fn requires Rust 1.52
#![cfg_attr(portable_atomic_no_unsafe_op_in_unsafe_fn, allow(unused_unsafe))]
#![warn(
    clippy::pedantic,
    // lints for public library
    clippy::alloc_instead_of_core,
    clippy::exhaustive_enums,
    clippy::exhaustive_structs,
    clippy::std_instead_of_alloc,
    clippy::std_instead_of_core,
    // lints that help writing unsafe code
    clippy::default_union_representation,
    clippy::trailing_empty_array,
    clippy::transmute_undefined_repr,
    clippy::undocumented_unsafe_blocks,
    // misc
    clippy::inline_asm_x86_att_syntax,
)]
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

#[cfg(any(test, feature = "std"))]
extern crate std;

#[cfg(all(feature = "alloc", not(portable_atomic_no_alloc)))]
extern crate alloc;
#[cfg(all(feature = "std", portable_atomic_no_alloc))]
extern crate std as alloc;

#[cfg(any(all(feature = "alloc", not(portable_atomic_no_alloc)), feature = "std"))]
#[cfg_attr(docsrs, doc(cfg(any(feature = "alloc", feature = "std"))))]
mod arc;
#[cfg(any(all(feature = "alloc", not(portable_atomic_no_alloc)), feature = "std"))]
pub use arc::{Arc, Weak};

#[cfg(feature = "generic")]
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
)]
pub mod generic;
#[cfg(feature = "generic")]
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
)]
pub use crate::generic::*;

#[cfg(feature = "derive")]
#[cfg(feature = "generic")]
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(docsrs, doc(cfg(all(feature = "generic", feature = "derive"))))]
pub use portable_atomic_derive::Atomicable;

// Not public API.
#[doc(hidden)]
#[cfg(feature = "derive")]
#[cfg(feature = "generic")]
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
)]
pub mod __private {
    pub use core::mem::{size_of, transmute};
    #[doc(hidden)]
    #[allow(clippy::missing_inline_in_public_items)]
    pub fn is_transmutable<T: crate::Transmutable>() {}
}

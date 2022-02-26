//! Portable atomic types.

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
    clippy::exhaustive_enums,
    clippy::exhaustive_structs,
    clippy::inline_asm_x86_att_syntax,
    clippy::missing_inline_in_public_items,
    clippy::pedantic,
    clippy::undocumented_unsafe_blocks
)]
#![allow(
    clippy::doc_markdown,
    clippy::float_cmp,
    clippy::inline_always,
    clippy::missing_errors_doc,
    clippy::module_inception,
    clippy::must_use_candidate,
    clippy::type_complexity
)]
// 128-bit atomic
#![cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_core_atomic_128),
    feature(integer_atomics)
)]
#![cfg_attr(
    any(all(test, portable_atomic_nightly), portable_atomic_cmpxchg16b_stdsimd),
    feature(stdsimd, cmpxchg16b_target_feature)
)]
// cfg(cfg_target_has_atomic) on old nightly
// This feature has not been changed since the change in nightly-2019-10-14
// until it was stabilized in nightly-2022-02-11, so it can be safely enabled in
// nightly, which is older than nightly-2022-02-11.
#![cfg_attr(portable_atomic_unstable_cfg_target_has_atomic, feature(cfg_target_has_atomic))]
// asm
#![cfg_attr(
    all(any(target_arch = "avr", target_arch = "msp430"), not(portable_atomic_no_asm)),
    feature(asm_experimental_arch)
)]
// asm on old nightly
#![cfg_attr(
    all(
        portable_atomic_nightly,
        any(
            thumbv6m,
            all(target_arch = "riscv32", portable_atomic_no_atomic_load_store),
            portable_atomic_cmpxchg16b
        ),
        portable_atomic_no_asm,
    ),
    feature(asm)
)]
// llvm_asm on old nightly
// TODO: remove use of llvm_asm when https://github.com/rust-lang/compiler-builtins/issues/400 fixed.
#![cfg_attr(
    all(any(target_arch = "avr", target_arch = "msp430"), portable_atomic_no_asm),
    feature(llvm_asm)
)]
// docs only
#![cfg_attr(docsrs, feature(doc_cfg))]

// There are currently no 8-bit, 128-bit, or higher builtin targets.
// Note that Rust (and C99) pointers must be at least 16-bits: https://github.com/rust-lang/rust/pull/49305
#[cfg(not(any(
    target_pointer_width = "16",
    target_pointer_width = "32",
    target_pointer_width = "64",
)))]
compile_error!(
    "portable-atomic currently only supports targets with {16,32,64}-bit pointer width; \
     if you need support for others, \
     please submit an issue at <https://github.com/taiki-e/portable-atomic>"
);

#[cfg(portable_atomic_unsafe_assume_single_core)]
#[cfg_attr(
    not(portable_atomic_cfg_target_has_atomic),
    cfg(any(
        not(portable_atomic_no_atomic_cas),
        not(any(thumbv6m, target_arch = "riscv32", target_pointer_width = "16"))
    ))
)]
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(
        target_has_atomic = "ptr",
        not(any(thumbv6m, target_arch = "riscv32", target_pointer_width = "16"))
    ))
)]
compile_error!(
    "cfg(portable_atomic_unsafe_assume_single_core) does not compatible with this target; \
     if you need cfg(portable_atomic_unsafe_assume_single_core) support for this target, \
     please submit an issue at <https://github.com/taiki-e/portable-atomic>"
);

#[cfg(any(test, feature = "std"))]
extern crate std;

#[macro_use]
mod utils;

#[cfg(test)]
#[macro_use]
mod tests;

#[doc(no_inline)]
pub use core::sync::atomic::{compiler_fence, fence, Ordering};

mod int;
#[cfg(feature = "i128")]
#[cfg_attr(
    not(portable_atomic_cfg_target_has_atomic),
    cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
)]
pub use crate::int::{AtomicI128, AtomicU128};
pub use crate::int::{AtomicI16, AtomicI8, AtomicIsize, AtomicU16, AtomicU8, AtomicUsize};
// cfg(any(target_has_atomic_load_store = "32", target_arch = "riscv32", portable_atomic_unsafe_assume_single_core))
#[cfg(any(not(target_pointer_width = "16"), portable_atomic_unsafe_assume_single_core))]
pub use crate::int::{AtomicI32, AtomicU32};
#[cfg_attr(
    not(portable_atomic_cfg_target_has_atomic),
    cfg(any(
        all(feature = "fallback", not(portable_atomic_no_atomic_cas)),
        not(portable_atomic_no_atomic_64),
        portable_atomic_unsafe_assume_single_core
    ))
)]
// cfg(any(target_has_atomic = "ptr", target_has_atomic_load_store = "64", portable_atomic_unsafe_assume_single_core))
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(
        all(feature = "fallback", target_has_atomic = "ptr"),
        target_has_atomic = "64",
        target_pointer_width = "64",
        portable_atomic_unsafe_assume_single_core
    ))
)]
pub use crate::int::{AtomicI64, AtomicU64};

mod misc;
pub use crate::misc::{AtomicBool, AtomicPtr};

#[cfg(feature = "float")]
// cfg(any(target_has_atomic_load_store = "32", target_arch = "riscv32", portable_atomic_unsafe_assume_single_core))
#[cfg(any(not(target_pointer_width = "16"), portable_atomic_unsafe_assume_single_core))]
#[cfg_attr(docsrs, doc(cfg(feature = "float")))]
mod float;
#[cfg(feature = "float")]
// cfg(any(target_has_atomic_load_store = "32", target_arch = "riscv32", portable_atomic_unsafe_assume_single_core))
#[cfg(any(not(target_pointer_width = "16"), portable_atomic_unsafe_assume_single_core))]
pub use crate::float::AtomicF32;
#[cfg(feature = "float")]
#[cfg_attr(
    not(portable_atomic_cfg_target_has_atomic),
    cfg(any(
        all(feature = "fallback", not(portable_atomic_no_atomic_cas)),
        not(portable_atomic_no_atomic_64),
        portable_atomic_unsafe_assume_single_core
    ))
)]
// cfg(any(target_has_atomic = "ptr", target_has_atomic_load_store = "64", portable_atomic_unsafe_assume_single_core))
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(
        all(feature = "fallback", target_has_atomic = "ptr"),
        target_has_atomic = "64",
        target_pointer_width = "64",
        portable_atomic_unsafe_assume_single_core
    ))
)]
pub use crate::float::AtomicF64;

mod imp;

#[cfg(feature = "serde")]
mod serde;

pub mod hint {
    //! Re-export of the [`core::hint`] module.
    //!
    //! The only difference from the [`core::hint`] module is that [`spin_loop`]
    //! is available in all rust versions that this crate supports.
    //!
    //! ```
    //! use portable_atomic::hint;
    //!
    //! hint::spin_loop();
    //! ```

    #[doc(no_inline)]
    pub use core::hint::*;

    /// Emits a machine instruction to signal the processor that it is running in
    /// a busy-wait spin-loop ("spin lock").
    ///
    /// Upon receiving the spin-loop signal the processor can optimize its behavior by,
    /// for example, saving power or switching hyper-threads.
    ///
    /// This function is different from [`thread::yield_now`] which directly
    /// yields to the system's scheduler, whereas `spin_loop` does not interact
    /// with the operating system.
    ///
    /// A common use case for `spin_loop` is implementing bounded optimistic
    /// spinning in a CAS loop in synchronization primitives. To avoid problems
    /// like priority inversion, it is strongly recommended that the spin loop is
    /// terminated after a finite amount of iterations and an appropriate blocking
    /// syscall is made.
    ///
    /// **Note:** On platforms that do not support receiving spin-loop hints this
    /// function does not do anything at all.
    ///
    /// [`thread::yield_now`]: std::thread::yield_now
    #[inline]
    pub fn spin_loop() {
        #[allow(deprecated)]
        core::sync::atomic::spin_loop_hint();
    }
}

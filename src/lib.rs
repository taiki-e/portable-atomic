/*!
Portable atomic types.

- Provide all atomic integer types (`Atomic{I,U}{8,16,32,64}`) for all targets that can use atomic CAS. (i.e., all targets that can use `std`, and most no-std targets)
- Provide `AtomicI128` and `AtomicU128`.
- Provide `AtomicF32` and `AtomicF64`. (optional)
<!-- - Provide generic `Atomic<T>` type. (optional) -->
- Provide atomic load/store for targets where atomic is not available at all in the standard library. (riscv without A-extension, msp430, avr)
- Provide atomic CAS for targets where atomic CAS is not available in the standard library. (thumbv6m, riscv without A-extension, msp430, avr) (optional, [single-core only](#optional-cfg))

## 128-bit atomics support (AtomicI128,AtomicU128)

Native 128-bit atomic operations are only available for x86_64 and aarch64 at Rust 1.59+, otherwise the fallback implementation is used.

On x86_64, when the `outline-atomics` optional feature is not enabled and `cmpxchg16b` target feature is not enabled at compile-time, this uses the fallback implementation. `cmpxchg16b` is enabled by default only on macOS.

## Optional features

- **`fallback`** *(enabled by default)*<br>
  Enable fallback implementations.

  Disabling this allows only atomic types for which the platform natively supports atomic operations.

- **`outline-atomics`**<br>
  Enable run-time CPU feature detection.

  This allows maintaining support for older CPUs while using features that are not supported on older CPUs, such as cmpxchg16b (x86_64) and LSE (aarch64).

  Note:
  - Dynamic detection is currently only enabled in nightly, otherwise it works the same as the default.
  - If the required target features are enabled at compile-time, the atomic operations are inlined.
  - This is compatible with no-std (as with all features except `std` and `parking_lot`).

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

- **`parking_lot`**<br>
  Use [parking_lot] in global locks of fallback implementation.

  Note:
  - This is not compatible with no-std.
  - The MSRV when this feature enables depends on the MSRV of [parking_lot].

## Optional cfg

- **`--cfg portable_atomic_unsafe_assume_single_core`**<br>
  Assume that the target is single-core.
  When this cfg is enabled, this crate provides atomic CAS for targets where atomic CAS is not available in the standard library.

  Note: This cfg is `unsafe`, and enabling this cfg for multi-core systems is **unsound**.

  This is intentionally not an optional feature. (If this is an optional feature, dependencies can implicitly enable the feature, resulting in the use of unsound code without the end-user being aware of it.)

[parking_lot]: https://github.com/Amanieu/parking_lot
[serde]: https://github.com/serde-rs/serde
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
    clippy::exhaustive_enums,
    clippy::exhaustive_structs,
    clippy::inline_asm_x86_att_syntax,
    clippy::missing_inline_in_public_items,
    clippy::pedantic,
    clippy::undocumented_unsafe_blocks
)]
#![allow(
    clippy::cast_lossless,
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
    any(all(test, portable_atomic_nightly), portable_atomic_lse_dynamic),
    feature(aarch64_target_feature)
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
            target_arch = "aarch64",
            target_arch = "x86_64",
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

mod misc;
pub use crate::misc::{AtomicBool, AtomicPtr};

mod imp;

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

#[cfg(doc)]
use core::sync::atomic::Ordering::{AcqRel, Acquire, Relaxed, Release, SeqCst};
use core::{fmt, marker::PhantomData};

use crate::utils::NoRefUnwindSafe;

macro_rules! atomic_int {
    (AtomicU32, $int_type:ident, $align:expr) => {
        atomic_int!(@int, AtomicU32, $int_type, $align);
        #[cfg(feature = "float")]
        atomic_int!(@float, AtomicF32, f32, AtomicU32, $int_type, $align);
    };
    (AtomicU64, $int_type:ident, $align:expr) => {
        atomic_int!(@int, AtomicU64, $int_type, $align);
        #[cfg(feature = "float")]
        atomic_int!(@float, AtomicF64, f64, AtomicU64, $int_type, $align);
    };
    ($atomic_type:ident, $int_type:ident, $align:expr) => {
        atomic_int!(@int, $atomic_type, $int_type, $align);
    };

    // Atomic{I,U}* impls
    (@int,
        $atomic_type:ident, $int_type:ident, $align:expr
    ) => {
        doc_comment! {
            concat!("An integer type which can be safely shared between threads.

This type has the same in-memory representation as the underlying integer type,
[`", stringify!($int_type), "`].

If the compiler or the platform supports atomic loads and stores of [`", stringify!($int_type),
"`], this type is a wrapper for the standard library's `", stringify!($atomic_type),
"`, otherwise synchronizes using global locks.
You can call [`", stringify!($atomic_type), "::is_lock_free()`] to check whether
atomic instructions or locks will be used.
"
            ),
            // We can use #[repr(transparent)] here, but #[repr(C, align(N))]
            // will show clearer docs.
            #[repr(C, align($align))]
            pub struct $atomic_type {
                inner: imp::$atomic_type,
                // Prevent RefUnwindSafe from being propagated from the std atomic type.
                _marker: PhantomData<NoRefUnwindSafe>,
            }
        }

        static_assert_layout!($atomic_type, $int_type);

        impl Default for $atomic_type {
            #[inline]
            fn default() -> Self {
                Self::new($int_type::default())
            }
        }

        impl From<$int_type> for $atomic_type {
            #[inline]
            fn from(v: $int_type) -> Self {
                Self::new(v)
            }
        }

        impl fmt::Debug for $atomic_type {
            #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                // std atomic types use SeqCst in Debug::fmt: https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L1378
                fmt::Debug::fmt(&self.load(Ordering::SeqCst), f)
            }
        }

        // UnwindSafe is implicitly implemented.
        #[cfg(not(portable_atomic_no_core_unwind_safe))]
        impl core::panic::RefUnwindSafe for $atomic_type {}
        #[cfg(all(portable_atomic_no_core_unwind_safe, feature = "std"))]
        impl std::panic::RefUnwindSafe for $atomic_type {}

        serde_impls!($atomic_type);

        impl $atomic_type {
            /// Creates a new atomic integer.
            #[inline]
            pub const fn new(v: $int_type) -> Self {
                Self { inner: imp::$atomic_type::new(v), _marker: PhantomData }
            }

            /// Returns `true` if operations on values of this type are lock-free.
            ///
            /// If the compiler or the platform doesn't support the necessary
            /// atomic instructions, global locks for every potentially
            /// concurrent atomic operation will be used.
            #[inline]
            pub fn is_lock_free() -> bool {
                <imp::$atomic_type as crate::utils::AtomicRepr>::is_lock_free()
            }

            /// Returns `true` if operations on values of this type are lock-free.
            ///
            /// If the compiler or the platform doesn't support the necessary
            /// atomic instructions, global locks for every potentially
            /// concurrent atomic operation will be used.
            ///
            /// **Note:** If the atomic operation relies on dynamic CPU feature detection,
            /// this type may be lock-free even if the function returns false.
            #[inline]
            pub const fn is_always_lock_free() -> bool {
                <imp::$atomic_type as crate::utils::AtomicRepr>::IS_ALWAYS_LOCK_FREE
            }

            /// Returns a mutable reference to the underlying integer.
            ///
            /// This is safe because the mutable reference guarantees that no other threads are
            /// concurrently accessing the atomic data.
            #[inline]
            pub fn get_mut(&mut self) -> &mut $int_type {
                self.inner.get_mut()
            }

            // TODO: Add from_mut once it is stable on other std atomic types.
            // https://github.com/rust-lang/rust/issues/76314

            /// Consumes the atomic and returns the contained value.
            ///
            /// This is safe because passing `self` by value guarantees that no other threads are
            /// concurrently accessing the atomic data.
            #[inline]
            pub fn into_inner(self) -> $int_type {
                self.inner.into_inner()
            }

            /// Loads a value from the atomic integer.
            ///
            /// `load` takes an [`Ordering`] argument which describes the memory ordering of this operation.
            /// Possible values are [`SeqCst`], [`Acquire`] and [`Relaxed`].
            ///
            /// # Panics
            ///
            /// Panics if `order` is [`Release`] or [`AcqRel`].
            #[inline]
            pub fn load(&self, order: Ordering) -> $int_type {
                self.inner.load(order)
            }

            /// Stores a value into the atomic integer.
            ///
            /// `store` takes an [`Ordering`] argument which describes the memory ordering of this operation.
            ///  Possible values are [`SeqCst`], [`Release`] and [`Relaxed`].
            ///
            /// # Panics
            ///
            /// Panics if `order` is [`Acquire`] or [`AcqRel`].
            #[inline]
            pub fn store(&self, val: $int_type, order: Ordering) {
                self.inner.store(val, order)
            }

            /// Stores a value into the atomic integer, returning the previous value.
            ///
            /// `swap` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.swap(val, order)
            }

            /// Stores a value into the atomic integer if the current value is the same as
            /// the `current` value.
            ///
            /// The return value is a result indicating whether the new value was written and
            /// containing the previous value. On success this value is guaranteed to be equal to
            /// `current`.
            ///
            /// `compare_exchange` takes two [`Ordering`] arguments to describe the memory
            /// ordering of this operation. `success` describes the required ordering for the
            /// read-modify-write operation that takes place if the comparison with `current` succeeds.
            /// `failure` describes the required ordering for the load operation that takes place when
            /// the comparison fails. Using [`Acquire`] as success ordering makes the store part
            /// of this operation [`Relaxed`], and using [`Release`] makes the successful load
            /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`]
            /// and must be equivalent to or weaker than the success ordering.
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
            pub fn compare_exchange(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                self.inner.compare_exchange(current, new, success, failure)
            }

            /// Stores a value into the atomic integer if the current value is the same as
            /// the `current` value.
            /// Unlike [`compare_exchange`](Self::compare_exchange)
            /// this function is allowed to spuriously fail even
            /// when the comparison succeeds, which can result in more efficient code on some
            /// platforms. The return value is a result indicating whether the new value was
            /// written and containing the previous value.
            ///
            /// `compare_exchange_weak` takes two [`Ordering`] arguments to describe the memory
            /// ordering of this operation. `success` describes the required ordering for the
            /// read-modify-write operation that takes place if the comparison with `current` succeeds.
            /// `failure` describes the required ordering for the load operation that takes place when
            /// the comparison fails. Using [`Acquire`] as success ordering makes the store part
            /// of this operation [`Relaxed`], and using [`Release`] makes the successful load
            /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`]
            /// and must be equivalent to or weaker than the success ordering.
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
            pub fn compare_exchange_weak(
                &self,
                current: $int_type,
                new: $int_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$int_type, $int_type> {
                self.inner.compare_exchange_weak(current, new, success, failure)
            }

            /// Adds to the current value, returning the previous value.
            ///
            /// This operation wraps around on overflow.
            ///
            /// `fetch_add` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_add(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_add(val, order)
            }

            /// Subtracts from the current value, returning the previous value.
            ///
            /// This operation wraps around on overflow.
            ///
            /// `fetch_sub` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_sub(val, order)
            }

            /// Bitwise "and" with the current value.
            ///
            /// Performs a bitwise "and" operation on the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_and` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_and(val, order)
            }

            /// Bitwise "nand" with the current value.
            ///
            /// Performs a bitwise "nand" operation on the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_nand` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_nand(val, order)
            }

            /// Bitwise "or" with the current value.
            ///
            /// Performs a bitwise "or" operation on the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_or` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_or(val, order)
            }

            /// Bitwise "xor" with the current value.
            ///
            /// Performs a bitwise "xor" operation on the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_xor` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_xor(val, order)
            }

            /// Fetches the value, and applies a function to it that returns an optional
            /// new value. Returns a `Result` of `Ok(previous_value)` if the function returned `Some(_)`, else
            /// `Err(previous_value)`.
            ///
            /// Note: This may call the function multiple times if the value has been changed from other threads in
            /// the meantime, as long as the function returns `Some(_)`, but the function will have been applied
            /// only once to the stored value.
            ///
            /// `fetch_update` takes two [`Ordering`] arguments to describe the memory ordering of this operation.
            /// The first describes the required ordering for when the operation finally succeeds while the second
            /// describes the required ordering for loads. These correspond to the success and failure orderings of
            /// [`compare_exchange`](Self::compare_exchange) respectively.
            ///
            /// Using [`Acquire`] as success ordering makes the store part
            /// of this operation [`Relaxed`], and using [`Release`] makes the final successful load
            /// [`Relaxed`]. The (failed) load ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`]
            /// and must be equivalent to or weaker than the success ordering.
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_update<F>(
                &self,
                set_order: Ordering,
                fetch_order: Ordering,
                mut f: F,
            ) -> Result<$int_type, $int_type>
            where
                F: FnMut($int_type) -> Option<$int_type>,
            {
                let mut prev = self.load(fetch_order);
                while let Some(next) = f(prev) {
                    match self.compare_exchange_weak(prev, next, set_order, fetch_order) {
                        x @ Ok(_) => return x,
                        Err(next_prev) => prev = next_prev,
                    }
                }
                Err(prev)
            }

            /// Maximum with the current value.
            ///
            /// Finds the maximum of the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_max` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                #[cfg(not(portable_atomic_no_atomic_min_max))]
                {
                    #[cfg(any(
                        all(
                            target_arch = "aarch64",
                            any(portable_atomic_target_feature_lse, target_feature = "lse"),
                        ),
                        armv5te,
                        all(target_arch = "mips", target_endian = "little"),
                        all(target_arch = "mips64", target_endian = "little"),
                        target_arch = "powerpc",
                        target_arch = "powerpc64",
                    ))]
                    {
                        // HACK: the following operations are currently broken (at least on qemu):
                        // - aarch64+lse's `AtomicI{8,16}::fetch_{max,min}` (release mode)
                        // - armv5te's `Atomic{I,U}{8,16}::fetch_{max,min}`
                        // - mipsel's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - mips64el's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - powerpc's `AtomicI{8,16}::fetch_{max,min}`
                        // - powerpc64's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - powerpc64le's `AtomicU{8,16}::fetch_{max,min}` (release mode + fat LTO)
                        if core::mem::size_of::<$int_type>() <= 2 {
                            return self
                                .fetch_update(
                                    order,
                                    crate::utils::strongest_failure_ordering(order),
                                    |x| Some(core::cmp::max(x, val)),
                                )
                                .unwrap();
                        }
                    }
                    self.inner.fetch_max(val, order)
                }
                #[cfg(portable_atomic_no_atomic_min_max)]
                {
                    self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                        Some(core::cmp::max(x, val))
                    })
                    .unwrap()
                }
            }

            /// Minimum with the current value.
            ///
            /// Finds the minimum of the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_min` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                #[cfg(not(portable_atomic_no_atomic_min_max))]
                {
                    #[cfg(any(
                        all(
                            target_arch = "aarch64",
                            any(portable_atomic_target_feature_lse, target_feature = "lse"),
                        ),
                        armv5te,
                        all(target_arch = "mips", target_endian = "little"),
                        all(target_arch = "mips64", target_endian = "little"),
                        target_arch = "powerpc",
                        target_arch = "powerpc64",
                    ))]
                    {
                        // HACK: the following operations are currently broken (at least on qemu):
                        // - aarch64's `AtomicI{8,16}::fetch_{max,min}` (release mode + lse)
                        // - armv5te's `Atomic{I,U}{8,16}::fetch_{max,min}`
                        // - mipsel's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - mips64el's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - powerpc's `AtomicI{8,16}::fetch_{max,min}`
                        // - powerpc64's `AtomicI{8,16}::fetch_{max,min}` (debug mode, at least)
                        // - powerpc64le's `AtomicU{8,16}::fetch_{max,min}` (release mode + fat LTO)
                        if core::mem::size_of::<$int_type>() <= 2 {
                            return self
                                .fetch_update(
                                    order,
                                    crate::utils::strongest_failure_ordering(order),
                                    |x| Some(core::cmp::min(x, val)),
                                )
                                .unwrap();
                        }
                    }
                    self.inner.fetch_min(val, order)
                }
                #[cfg(portable_atomic_no_atomic_min_max)]
                {
                    self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                        Some(core::cmp::min(x, val))
                    })
                    .unwrap()
                }
            }

            // TODO: Add as_mut_ptr once it is stable on other std atomic types.
            // https://github.com/rust-lang/rust/issues/66893
        }
    };

    // AtomicF* impls
    (@float,
        $atomic_type:ident, $float_type:ident, $atomic_int_type:ident, $int_type:ident, $align:expr
    ) => {
        doc_comment! {
            concat!("A floating point type which can be safely shared between threads.

This type has the same in-memory representation as the underlying floating point type,
[`", stringify!($float_type), "`].
"
            ),
            #[cfg_attr(docsrs, doc(cfg(feature = "float")))]
            #[repr(C, align($align))]
            pub struct $atomic_type {
                v: core::cell::UnsafeCell<$float_type>,
            }
        }

        static_assert_layout!($atomic_type, $float_type);

        impl Default for $atomic_type {
            #[inline]
            fn default() -> Self {
                Self::new($float_type::default())
            }
        }

        impl From<$float_type> for $atomic_type {
            #[inline]
            fn from(v: $float_type) -> Self {
                Self::new(v)
            }
        }

        impl fmt::Debug for $atomic_type {
            #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                // std atomic types use SeqCst in Debug::fmt: https://github.com/rust-lang/rust/blob/1.58.1/library/core/src/sync/atomic.rs#L1378
                fmt::Debug::fmt(&self.load(Ordering::SeqCst), f)
            }
        }

        // Send is implicitly implemented.
        unsafe impl Sync for $atomic_type {}

        // UnwindSafe is implicitly implemented.
        #[cfg(not(portable_atomic_no_core_unwind_safe))]
        impl core::panic::RefUnwindSafe for $atomic_type {}
        #[cfg(all(portable_atomic_no_core_unwind_safe, feature = "std"))]
        impl std::panic::RefUnwindSafe for $atomic_type {}

        serde_impls!($atomic_type);

        impl $atomic_type {
            /// Creates a new atomic float.
            #[inline]
            pub const fn new(v: $float_type) -> Self {
                Self { v: core::cell::UnsafeCell::new(v) }
            }

            /// Returns `true` if operations on values of this type are lock-free.
            ///
            /// If the compiler or the platform doesn't support the necessary
            /// atomic instructions, global locks for every potentially
            /// concurrent atomic operation will be used.
            #[inline]
            pub fn is_lock_free() -> bool {
                crate::$atomic_int_type::is_lock_free()
            }

            /// Returns `true` if operations on values of this type are lock-free.
            ///
            /// If the compiler or the platform doesn't support the necessary
            /// atomic instructions, global locks for every potentially
            /// concurrent atomic operation will be used.
            ///
            /// **Note:** If the atomic operation relies on dynamic CPU feature detection,
            /// this type may be lock-free even if the function returns false.
            #[inline]
            pub const fn is_always_lock_free() -> bool {
                crate::$atomic_int_type::is_always_lock_free()
            }

            /// Returns a mutable reference to the underlying float.
            ///
            /// This is safe because the mutable reference guarantees that no other threads are
            /// concurrently accessing the atomic data.
            #[inline]
            pub fn get_mut(&mut self) -> &mut $float_type {
                // clippy bug that does not recognize safety comments inside macros.
                #[allow(clippy::undocumented_unsafe_blocks)]
                // SAFETY: This is safe because the mutable reference guarantees that no other
                // threads are concurrently accessing the atomic data.
                unsafe {
                    &mut *self.v.get()
                }
            }

            // TODO: Add from_mut once it is stable on other std atomic types.
            // https://github.com/rust-lang/rust/issues/76314

            /// Consumes the atomic and returns the contained value.
            ///
            /// This is safe because passing `self` by value guarantees that no other threads are
            /// concurrently accessing the atomic data.
            #[inline]
            pub fn into_inner(self) -> $float_type {
                self.v.into_inner()
            }

            /// Loads a value from the atomic float.
            ///
            /// `load` takes an [`Ordering`] argument which describes the memory ordering of this operation.
            /// Possible values are [`SeqCst`], [`Acquire`] and [`Relaxed`].
            ///
            /// # Panics
            ///
            /// Panics if `order` is [`Release`] or [`AcqRel`].
            #[inline]
            pub fn load(&self, order: Ordering) -> $float_type {
                $float_type::from_bits(self.as_bits().load(order))
            }

            /// Stores a value into the atomic float.
            ///
            /// `store` takes an [`Ordering`] argument which describes the memory ordering of this operation.
            ///  Possible values are [`SeqCst`], [`Release`] and [`Relaxed`].
            ///
            /// # Panics
            ///
            /// Panics if `order` is [`Acquire`] or [`AcqRel`].
            #[inline]
            pub fn store(&self, val: $float_type, order: Ordering) {
                self.as_bits().store(val.to_bits(), order)
            }

            /// Stores a value into the atomic float, returning the previous value.
            ///
            /// `swap` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn swap(&self, val: $float_type, order: Ordering) -> $float_type {
                $float_type::from_bits(self.as_bits().swap(val.to_bits(), order))
            }

            /// Stores a value into the atomic float if the current value is the same as
            /// the `current` value.
            ///
            /// The return value is a result indicating whether the new value was written and
            /// containing the previous value. On success this value is guaranteed to be equal to
            /// `current`.
            ///
            /// `compare_exchange` takes two [`Ordering`] arguments to describe the memory
            /// ordering of this operation. `success` describes the required ordering for the
            /// read-modify-write operation that takes place if the comparison with `current` succeeds.
            /// `failure` describes the required ordering for the load operation that takes place when
            /// the comparison fails. Using [`Acquire`] as success ordering makes the store part
            /// of this operation [`Relaxed`], and using [`Release`] makes the successful load
            /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`]
            /// and must be equivalent to or weaker than the success ordering.
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
            pub fn compare_exchange(
                &self,
                current: $float_type,
                new: $float_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$float_type, $float_type> {
                match self.as_bits().compare_exchange(
                    current.to_bits(),
                    new.to_bits(),
                    success,
                    failure,
                ) {
                    Ok(v) => Ok($float_type::from_bits(v)),
                    Err(v) => Err($float_type::from_bits(v)),
                }
            }

            /// Stores a value into the atomic float if the current value is the same as
            /// the `current` value.
            /// Unlike [`compare_exchange`](Self::compare_exchange)
            /// this function is allowed to spuriously fail even
            /// when the comparison succeeds, which can result in more efficient code on some
            /// platforms. The return value is a result indicating whether the new value was
            /// written and containing the previous value.
            ///
            /// `compare_exchange_weak` takes two [`Ordering`] arguments to describe the memory
            /// ordering of this operation. `success` describes the required ordering for the
            /// read-modify-write operation that takes place if the comparison with `current` succeeds.
            /// `failure` describes the required ordering for the load operation that takes place when
            /// the comparison fails. Using [`Acquire`] as success ordering makes the store part
            /// of this operation [`Relaxed`], and using [`Release`] makes the successful load
            /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`]
            /// and must be equivalent to or weaker than the success ordering.
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
            pub fn compare_exchange_weak(
                &self,
                current: $float_type,
                new: $float_type,
                success: Ordering,
                failure: Ordering,
            ) -> Result<$float_type, $float_type> {
                match self.as_bits().compare_exchange_weak(
                    current.to_bits(),
                    new.to_bits(),
                    success,
                    failure,
                ) {
                    Ok(v) => Ok($float_type::from_bits(v)),
                    Err(v) => Err($float_type::from_bits(v)),
                }
            }

            /// Adds to the current value, returning the previous value.
            ///
            /// This operation wraps around on overflow.
            ///
            /// `fetch_add` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_add(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    Some(x + val)
                })
                .unwrap()
            }

            /// Subtracts from the current value, returning the previous value.
            ///
            /// This operation wraps around on overflow.
            ///
            /// `fetch_sub` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_sub(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    Some(x - val)
                })
                .unwrap()
            }

            /// Fetches the value, and applies a function to it that returns an optional
            /// new value. Returns a `Result` of `Ok(previous_value)` if the function returned `Some(_)`, else
            /// `Err(previous_value)`.
            ///
            /// Note: This may call the function multiple times if the value has been changed from other threads in
            /// the meantime, as long as the function returns `Some(_)`, but the function will have been applied
            /// only once to the stored value.
            ///
            /// `fetch_update` takes two [`Ordering`] arguments to describe the memory ordering of this operation.
            /// The first describes the required ordering for when the operation finally succeeds while the second
            /// describes the required ordering for loads. These correspond to the success and failure orderings of
            /// [`compare_exchange`](Self::compare_exchange) respectively.
            ///
            /// Using [`Acquire`] as success ordering makes the store part
            /// of this operation [`Relaxed`], and using [`Release`] makes the final successful load
            /// [`Relaxed`]. The (failed) load ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`]
            /// and must be equivalent to or weaker than the success ordering.
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_update<F>(
                &self,
                set_order: Ordering,
                fetch_order: Ordering,
                mut f: F,
            ) -> Result<$float_type, $float_type>
            where
                F: FnMut($float_type) -> Option<$float_type>,
            {
                let mut prev = self.load(fetch_order);
                while let Some(next) = f(prev) {
                    match self.compare_exchange_weak(prev, next, set_order, fetch_order) {
                        x @ Ok(_) => return x,
                        Err(next_prev) => prev = next_prev,
                    }
                }
                Err(prev)
            }

            /// Maximum with the current value.
            ///
            /// Finds the maximum of the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_max` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_max(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    Some(x.max(val))
                })
                .unwrap()
            }

            /// Minimum with the current value.
            ///
            /// Finds the minimum of the current value and the argument `val`, and
            /// sets the new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_min` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                not(portable_atomic_cfg_target_has_atomic),
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                portable_atomic_cfg_target_has_atomic,
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_min(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    Some(x.min(val))
                })
                .unwrap()
            }

            // TODO: Add as_mut_ptr once it is stable on other std atomic types.
            // https://github.com/rust-lang/rust/issues/66893

            doc_comment! {
                concat!("Raw transmutation to `", stringify!($atomic_int_type), "`.

See [`", stringify!($float_type) ,"::from_bits`] for some discussion of the
portability of this operation (there are almost no issues)."),
                #[inline]
                pub fn as_bits(&self) -> &crate::$atomic_int_type {
                    // clippy bug that does not recognize safety comments inside macros.
                    #[allow(clippy::undocumented_unsafe_blocks)]
                    // SAFETY: $atomic_type and $atomic_int_type have the same layout,
                    // and there is no concurrent access to the value that does not go through this method.
                    unsafe {
                        &*(self as *const $atomic_type as *const crate::$atomic_int_type)
                    }
                }
            }
        }
    };
}

#[cfg(target_pointer_width = "16")]
atomic_int!(AtomicIsize, isize, 2);
#[cfg(target_pointer_width = "16")]
atomic_int!(AtomicUsize, usize, 2);
#[cfg(target_pointer_width = "32")]
atomic_int!(AtomicIsize, isize, 4);
#[cfg(target_pointer_width = "32")]
atomic_int!(AtomicUsize, usize, 4);
#[cfg(target_pointer_width = "64")]
atomic_int!(AtomicIsize, isize, 8);
#[cfg(target_pointer_width = "64")]
atomic_int!(AtomicUsize, usize, 8);
#[cfg(target_pointer_width = "128")]
atomic_int!(AtomicIsize, isize, 16);
#[cfg(target_pointer_width = "128")]
atomic_int!(AtomicUsize, usize, 16);

atomic_int!(AtomicI8, i8, 1);
atomic_int!(AtomicU8, u8, 1);
atomic_int!(AtomicI16, i16, 2);
atomic_int!(AtomicU16, u16, 2);

// cfg(any(target_has_atomic_load_store = "32", target_arch = "riscv32", all(feature = "fallback", portable_atomic_unsafe_assume_single_core)))
#[cfg(any(
    not(target_pointer_width = "16"),
    all(feature = "fallback", portable_atomic_unsafe_assume_single_core)
))]
atomic_int!(AtomicI32, i32, 4);
#[cfg(any(
    not(target_pointer_width = "16"),
    all(feature = "fallback", portable_atomic_unsafe_assume_single_core)
))]
atomic_int!(AtomicU32, u32, 4);

// cfg(any(target_has_atomic = "ptr", target_has_atomic_load_store = "64", all(feature = "fallback", portable_atomic_unsafe_assume_single_core)))
#[cfg_attr(
    not(portable_atomic_cfg_target_has_atomic),
    cfg(any(
        all(feature = "fallback", not(portable_atomic_no_atomic_cas)),
        not(portable_atomic_no_atomic_64),
        target_pointer_width = "64",
        all(feature = "fallback", portable_atomic_unsafe_assume_single_core)
    ))
)]
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(
        all(feature = "fallback", target_has_atomic = "ptr"),
        target_has_atomic = "64",
        target_pointer_width = "64",
        all(feature = "fallback", portable_atomic_unsafe_assume_single_core)
    ))
)]
atomic_int!(AtomicI64, i64, 8);
#[cfg_attr(
    not(portable_atomic_cfg_target_has_atomic),
    cfg(any(
        all(feature = "fallback", not(portable_atomic_no_atomic_cas)),
        not(portable_atomic_no_atomic_64),
        target_pointer_width = "64",
        all(feature = "fallback", portable_atomic_unsafe_assume_single_core)
    ))
)]
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(
        all(feature = "fallback", target_has_atomic = "ptr"),
        target_has_atomic = "64",
        target_pointer_width = "64",
        all(feature = "fallback", portable_atomic_unsafe_assume_single_core)
    ))
)]
atomic_int!(AtomicU64, u64, 8);

#[cfg_attr(
    not(feature = "fallback"),
    cfg(any(
        portable_atomic_core_atomic_128,
        all(
            not(portable_atomic_core_atomic_128),
            any(not(portable_atomic_no_asm), portable_atomic_nightly),
            target_arch = "aarch64"
        ),
        all(
            not(portable_atomic_core_atomic_128),
            any(not(portable_atomic_no_asm), portable_atomic_nightly),
            any(
                portable_atomic_target_feature_cmpxchg16b,
                target_feature = "cmpxchg16b",
                portable_atomic_cmpxchg16b_dynamic
            ),
            target_arch = "x86_64",
        ),
    ))
)]
#[cfg_attr(
    all(feature = "fallback", not(portable_atomic_cfg_target_has_atomic)),
    cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(
    all(feature = "fallback", portable_atomic_cfg_target_has_atomic),
    cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
)]
atomic_int!(AtomicI128, i128, 16);
#[cfg_attr(
    not(feature = "fallback"),
    cfg(any(
        portable_atomic_core_atomic_128,
        all(
            not(portable_atomic_core_atomic_128),
            any(not(portable_atomic_no_asm), portable_atomic_nightly),
            target_arch = "aarch64"
        ),
        all(
            not(portable_atomic_core_atomic_128),
            any(not(portable_atomic_no_asm), portable_atomic_nightly),
            any(
                portable_atomic_target_feature_cmpxchg16b,
                target_feature = "cmpxchg16b",
                portable_atomic_cmpxchg16b_dynamic
            ),
            target_arch = "x86_64",
        ),
    ))
)]
#[cfg_attr(
    all(feature = "fallback", not(portable_atomic_cfg_target_has_atomic)),
    cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(
    all(feature = "fallback", portable_atomic_cfg_target_has_atomic),
    cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
)]
atomic_int!(AtomicU128, u128, 16);

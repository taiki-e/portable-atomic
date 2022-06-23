/*!
Portable atomic types including support for 128-bit atomics, atomic float, etc.

- Provide all atomic integer types (`Atomic{I,U}{8,16,32,64}`) for all targets that can use atomic CAS. (i.e., all targets that can use `std`, and most no-std targets)
- Provide `AtomicI128` and `AtomicU128`.
- Provide `AtomicF32` and `AtomicF64`. (optional)
<!-- - Provide generic `Atomic<T>` type. (optional) -->
- Provide atomic load/store for targets where atomic is not available at all in the standard library. (riscv without A-extension, msp430, avr)
- Provide atomic CAS for targets where atomic CAS is not available in the standard library. (thumbv6m, riscv without A-extension, msp430, avr) (optional, [single-core only](#optional-cfg))

## 128-bit atomics support

Native 128-bit atomic operations are available on x86_64 (Rust 1.59+), aarch64 (Rust 1.59+), powerpc64 (le or pwr8+, nightly only), and s390x (nightly only), otherwise the fallback implementation is used.

On x86_64, when the `outline-atomics` optional feature is not enabled and `cmpxchg16b` target feature is not enabled at compile-time, this uses the fallback implementation. `cmpxchg16b` target feature is enabled by default only on macOS.

## Optional features

- **`fallback`** *(enabled by default)*<br>
  Enable fallback implementations.

  Disabling this allows only atomic types for which the platform natively supports atomic operations.

- **`outline-atomics`**<br>
  Enable run-time CPU feature detection.

  This allows maintaining support for older CPUs while using features that are not supported on older CPUs, such as cmpxchg16b (x86_64) and LSE (aarch64).

  Note:
  - Dynamic detection is currently only enabled in Rust 1.61+ for aarch64 and in nightly for other platforms, otherwise it works the same as the default.
  - If the required target features are enabled at compile-time, the atomic operations are inlined.
  - This is compatible with no-std (as with all features except `std`).

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
  When this cfg is enabled, this crate provides atomic CAS for targets where atomic CAS is not available in the standard library.

  Note: This cfg is `unsafe`, and enabling this cfg for multi-core systems is **unsound**.

  This is intentionally not an optional feature. (If this is an optional feature, dependencies can implicitly enable the feature, resulting in the use of unsound code without the end-user being aware of it.)

  Enabling this cfg for targets that have atomic CAS will result in a compile error.

## Related Projects

- [atomic-maybe-uninit]: Atomic operations on potentially uninitialized integers.
- [atomic-memcpy]: Byte-wise atomic memcpy.

[atomic-memcpy]: https://github.com/taiki-e/atomic-memcpy
[atomic-maybe-uninit]: https://github.com/taiki-e/atomic-maybe-uninit
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
    clippy::default_union_representation,
    clippy::exhaustive_enums,
    clippy::exhaustive_structs,
    clippy::inline_asm_x86_att_syntax,
    clippy::missing_inline_in_public_items,
    clippy::pedantic,
    clippy::transmute_undefined_repr,
    clippy::undocumented_unsafe_blocks
)]
#![allow(
    clippy::cast_lossless,
    clippy::doc_markdown,
    clippy::float_cmp,
    clippy::inline_always,
    clippy::missing_errors_doc,
    clippy::module_inception,
    clippy::type_complexity
)]
// 128-bit atomic
#![cfg_attr(
    all(
        target_arch = "x86_64",
        any(
            all(test, portable_atomic_nightly),
            portable_atomic_cmpxchg16b_stdsimd,
            miri,
            sanitize_thread
        )
    ),
    feature(stdsimd, cmpxchg16b_target_feature)
)]
// cfg(cfg_target_has_atomic) on old nightly
// This feature has not been changed since the change in nightly-2019-10-14
// until it was stabilized in nightly-2022-02-11, so it can be safely enabled in
// nightly, which is older than nightly-2022-02-11.
#![cfg_attr(portable_atomic_unstable_cfg_target_has_atomic, feature(cfg_target_has_atomic))]
// asm
#![cfg_attr(
    all(
        portable_atomic_nightly,
        not(portable_atomic_no_asm),
        any(
            target_arch = "avr",
            target_arch = "msp430",
            target_arch = "powerpc64",
            target_arch = "s390x",
        ),
    ),
    feature(asm_experimental_arch)
)]
// asm on old nightly
#![cfg_attr(
    all(
        portable_atomic_nightly,
        portable_atomic_no_asm,
        any(
            portable_atomic_armv6m,
            all(target_arch = "riscv32", portable_atomic_no_atomic_load_store),
            target_arch = "aarch64",
            target_arch = "x86_64",
        ),
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
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(
        not(portable_atomic_no_atomic_cas),
        not(any(portable_atomic_armv6m, target_arch = "riscv32", target_pointer_width = "16"))
    ))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        target_has_atomic = "ptr",
        not(any(portable_atomic_armv6m, target_arch = "riscv32", target_pointer_width = "16"))
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
use core::{fmt, marker::PhantomData, ptr};

use crate::utils::NoRefUnwindSafe;

/// A boolean type which can be safely shared between threads.
///
/// This type has the same in-memory representation as a [`bool`].
///
/// If the compiler or the platform supports atomic loads and stores of `u8`,
/// this type is a wrapper for the standard library's
/// [`AtomicBool`](core::sync::atomic::AtomicBool).
// We can use #[repr(transparent)] here, but #[repr(C, align(N))]
// will show clearer docs.
#[repr(C, align(1))]
pub struct AtomicBool {
    inner: imp::AtomicBool,
    // Prevent RefUnwindSafe from being propagated from the std atomic type.
    _marker: PhantomData<NoRefUnwindSafe>,
}

static_assert_layout!(AtomicBool, bool);

impl Default for AtomicBool {
    /// Creates an `AtomicBool` initialized to `false`.
    #[inline]
    fn default() -> Self {
        Self::new(false)
    }
}

impl From<bool> for AtomicBool {
    /// Converts a `bool` into an `AtomicBool`.
    #[inline]
    fn from(b: bool) -> Self {
        Self::new(b)
    }
}

impl fmt::Debug for AtomicBool {
    #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // std atomic types use Relaxed in Debug::fmt: https://github.com/rust-lang/rust/blob/b2c9872c6c2c60c905e16bce0801934b86d15f95/library/core/src/sync/atomic.rs#L1520
        fmt::Debug::fmt(&self.load(Ordering::Relaxed), f)
    }
}

// UnwindSafe is implicitly implemented.
#[cfg(not(portable_atomic_no_core_unwind_safe))]
impl core::panic::RefUnwindSafe for AtomicBool {}
#[cfg(all(portable_atomic_no_core_unwind_safe, feature = "std"))]
impl std::panic::RefUnwindSafe for AtomicBool {}

serde_impls!(AtomicBool);

impl AtomicBool {
    /// Creates a new `AtomicBool`.
    #[inline]
    #[must_use]
    pub const fn new(v: bool) -> Self {
        Self { inner: imp::AtomicBool::new(v), _marker: PhantomData }
    }

    /// Returns `true` if operations on values of this type are lock-free.
    ///
    /// If the compiler or the platform doesn't support the necessary
    /// atomic instructions, global locks for every potentially
    /// concurrent atomic operation will be used.
    #[inline]
    #[must_use]
    pub fn is_lock_free() -> bool {
        imp::AtomicBool::is_lock_free()
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
    #[must_use]
    pub const fn is_always_lock_free() -> bool {
        imp::AtomicBool::is_always_lock_free()
    }

    /// Returns a mutable reference to the underlying [`bool`].
    ///
    /// This is safe because the mutable reference guarantees that no other threads are
    /// concurrently accessing the atomic data.
    #[inline]
    pub fn get_mut(&mut self) -> &mut bool {
        self.inner.get_mut()
    }

    // TODO: Add from_mut once it is stable on other std atomic types.
    // https://github.com/rust-lang/rust/issues/76314

    /// Consumes the atomic and returns the contained value.
    ///
    /// This is safe because passing `self` by value guarantees that no other threads are
    /// concurrently accessing the atomic data.
    #[inline]
    pub fn into_inner(self) -> bool {
        self.inner.into_inner()
    }

    /// Loads a value from the bool.
    ///
    /// `load` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. Possible values are [`SeqCst`], [`Acquire`] and [`Relaxed`].
    ///
    /// # Panics
    ///
    /// Panics if `order` is [`Release`] or [`AcqRel`].
    #[inline]
    pub fn load(&self, order: Ordering) -> bool {
        self.inner.load(order)
    }

    /// Stores a value into the bool.
    ///
    /// `store` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. Possible values are [`SeqCst`], [`Release`] and [`Relaxed`].
    ///
    /// # Panics
    ///
    /// Panics if `order` is [`Acquire`] or [`AcqRel`].
    #[inline]
    pub fn store(&self, val: bool, order: Ordering) {
        self.inner.store(val, order);
    }

    /// Stores a value into the bool, returning the previous value.
    ///
    /// `swap` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn swap(&self, val: bool, order: Ordering) -> bool {
        self.inner.swap(val, order)
    }

    /// Stores a value into the [`bool`] if the current value is the same as the `current` value.
    ///
    /// The return value is a result indicating whether the new value was written and containing
    /// the previous value. On success this value is guaranteed to be equal to `current`.
    ///
    /// `compare_exchange` takes two [`Ordering`] arguments to describe the memory
    /// ordering of this operation. `success` describes the required ordering for the
    /// read-modify-write operation that takes place if the comparison with `current` succeeds.
    /// `failure` describes the required ordering for the load operation that takes place when
    /// the comparison fails. Using [`Acquire`] as success ordering makes the store part
    /// of this operation [`Relaxed`], and using [`Release`] makes the successful load
    /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    pub fn compare_exchange(
        &self,
        current: bool,
        new: bool,
        success: Ordering,
        failure: Ordering,
    ) -> Result<bool, bool> {
        self.inner.compare_exchange(current, new, success, failure)
    }

    /// Stores a value into the [`bool`] if the current value is the same as the `current` value.
    ///
    /// Unlike [`AtomicBool::compare_exchange`], this function is allowed to spuriously fail even when the
    /// comparison succeeds, which can result in more efficient code on some platforms. The
    /// return value is a result indicating whether the new value was written and containing the
    /// previous value.
    ///
    /// `compare_exchange_weak` takes two [`Ordering`] arguments to describe the memory
    /// ordering of this operation. `success` describes the required ordering for the
    /// read-modify-write operation that takes place if the comparison with `current` succeeds.
    /// `failure` describes the required ordering for the load operation that takes place when
    /// the comparison fails. Using [`Acquire`] as success ordering makes the store part
    /// of this operation [`Relaxed`], and using [`Release`] makes the successful load
    /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    pub fn compare_exchange_weak(
        &self,
        current: bool,
        new: bool,
        success: Ordering,
        failure: Ordering,
    ) -> Result<bool, bool> {
        self.inner.compare_exchange_weak(current, new, success, failure)
    }

    /// Logical "and" with a boolean value.
    ///
    /// Performs a logical "and" operation on the current value and the argument `val`, and sets
    /// the new value to the result.
    ///
    /// Returns the previous value.
    ///
    /// `fetch_and` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn fetch_and(&self, val: bool, order: Ordering) -> bool {
        self.inner.fetch_and(val, order)
    }

    /// Logical "nand" with a boolean value.
    ///
    /// Performs a logical "nand" operation on the current value and the argument `val`, and sets
    /// the new value to the result.
    ///
    /// Returns the previous value.
    ///
    /// `fetch_nand` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn fetch_nand(&self, val: bool, order: Ordering) -> bool {
        self.inner.fetch_nand(val, order)
    }

    /// Logical "or" with a boolean value.
    ///
    /// Performs a logical "or" operation on the current value and the argument `val`, and sets the
    /// new value to the result.
    ///
    /// Returns the previous value.
    ///
    /// `fetch_or` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn fetch_or(&self, val: bool, order: Ordering) -> bool {
        self.inner.fetch_or(val, order)
    }

    /// Logical "xor" with a boolean value.
    ///
    /// Performs a logical "xor" operation on the current value and the argument `val`, and sets
    /// the new value to the result.
    ///
    /// Returns the previous value.
    ///
    /// `fetch_xor` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn fetch_xor(&self, val: bool, order: Ordering) -> bool {
        self.inner.fetch_xor(val, order)
    }

    // TODO: Add as_mut_ptr once it is stable on other std atomic types.
    // https://github.com/rust-lang/rust/issues/66893

    /// Fetches the value, and applies a function to it that returns an optional
    /// new value. Returns a `Result` of `Ok(previous_value)` if the function
    /// returned `Some(_)`, else `Err(previous_value)`.
    ///
    /// Note: This may call the function multiple times if the value has been
    /// changed from other threads in the meantime, as long as the function
    /// returns `Some(_)`, but the function will have been applied only once to
    /// the stored value.
    ///
    /// `fetch_update` takes two [`Ordering`] arguments to describe the memory
    /// ordering of this operation. The first describes the required ordering for
    /// when the operation finally succeeds while the second describes the
    /// required ordering for loads. These correspond to the success and failure
    /// orderings of [`AtomicBool::compare_exchange`] respectively.
    ///
    /// Using [`Acquire`] as success ordering makes the store part of this
    /// operation [`Relaxed`], and using [`Release`] makes the final successful
    /// load [`Relaxed`]. The (failed) load ordering can only be [`SeqCst`],
    /// [`Acquire`] or [`Relaxed`].
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn fetch_update<F>(
        &self,
        set_order: Ordering,
        fetch_order: Ordering,
        mut f: F,
    ) -> Result<bool, bool>
    where
        F: FnMut(bool) -> Option<bool>,
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
}

/// A raw pointer type which can be safely shared between threads.
///
/// This type has the same in-memory representation as a `*mut T`.
///
/// If the compiler or the platform supports atomic loads and stores of pointers,
/// this type is a wrapper for the standard library's
/// [`AtomicPtr`](core::sync::atomic::AtomicPtr).
// We can use #[repr(transparent)] here, but #[repr(C, align(N))]
// will show clearer docs.
#[cfg_attr(target_pointer_width = "16", repr(C, align(2)))]
#[cfg_attr(target_pointer_width = "32", repr(C, align(4)))]
#[cfg_attr(target_pointer_width = "64", repr(C, align(8)))]
#[cfg_attr(target_pointer_width = "128", repr(C, align(16)))]
pub struct AtomicPtr<T> {
    inner: imp::AtomicPtr<T>,
    // Prevent RefUnwindSafe from being propagated from the std atomic type.
    _marker: PhantomData<NoRefUnwindSafe>,
}

static_assert_layout!(AtomicPtr<()>, *mut ());

impl<T> Default for AtomicPtr<T> {
    /// Creates a null `AtomicPtr<T>`.
    #[inline]
    fn default() -> Self {
        Self::new(ptr::null_mut())
    }
}

impl<T> From<*mut T> for AtomicPtr<T> {
    #[inline]
    fn from(p: *mut T) -> Self {
        Self::new(p)
    }
}

impl<T> fmt::Debug for AtomicPtr<T> {
    #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // std atomic types use Relaxed in Debug::fmt: https://github.com/rust-lang/rust/blob/b2c9872c6c2c60c905e16bce0801934b86d15f95/library/core/src/sync/atomic.rs#L1520
        fmt::Debug::fmt(&self.load(Ordering::Relaxed), f)
    }
}

impl<T> fmt::Pointer for AtomicPtr<T> {
    #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // std atomic types use Relaxed in Debug::fmt: https://github.com/rust-lang/rust/blob/b2c9872c6c2c60c905e16bce0801934b86d15f95/library/core/src/sync/atomic.rs#L1520
        fmt::Pointer::fmt(&self.load(Ordering::Relaxed), f)
    }
}

// UnwindSafe is implicitly implemented.
#[cfg(not(portable_atomic_no_core_unwind_safe))]
impl<T> core::panic::RefUnwindSafe for AtomicPtr<T> {}
#[cfg(all(portable_atomic_no_core_unwind_safe, feature = "std"))]
impl<T> std::panic::RefUnwindSafe for AtomicPtr<T> {}

impl<T> AtomicPtr<T> {
    /// Creates a new `AtomicPtr`.
    #[inline]
    #[must_use]
    pub const fn new(p: *mut T) -> Self {
        Self { inner: imp::AtomicPtr::new(p), _marker: PhantomData }
    }

    /// Returns `true` if operations on values of this type are lock-free.
    ///
    /// If the compiler or the platform doesn't support the necessary
    /// atomic instructions, global locks for every potentially
    /// concurrent atomic operation will be used.
    #[inline]
    #[must_use]
    pub fn is_lock_free() -> bool {
        <imp::AtomicPtr<T>>::is_lock_free()
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
    #[must_use]
    pub const fn is_always_lock_free() -> bool {
        <imp::AtomicPtr<T>>::is_always_lock_free()
    }

    /// Returns a mutable reference to the underlying pointer.
    ///
    /// This is safe because the mutable reference guarantees that no other threads are
    /// concurrently accessing the atomic data.
    #[inline]
    pub fn get_mut(&mut self) -> &mut *mut T {
        self.inner.get_mut()
    }

    // TODO: Add from_mut once it is stable on other std atomic types.
    // https://github.com/rust-lang/rust/issues/76314

    /// Consumes the atomic and returns the contained value.
    ///
    /// This is safe because passing `self` by value guarantees that no other threads are
    /// concurrently accessing the atomic data.
    #[inline]
    pub fn into_inner(self) -> *mut T {
        self.inner.into_inner()
    }

    /// Loads a value from the pointer.
    ///
    /// `load` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. Possible values are [`SeqCst`], [`Acquire`] and [`Relaxed`].
    ///
    /// # Panics
    ///
    /// Panics if `order` is [`Release`] or [`AcqRel`].
    #[inline]
    pub fn load(&self, order: Ordering) -> *mut T {
        self.inner.load(order)
    }

    /// Stores a value into the pointer.
    ///
    /// `store` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. Possible values are [`SeqCst`], [`Release`] and [`Relaxed`].
    ///
    /// # Panics
    ///
    /// Panics if `order` is [`Acquire`] or [`AcqRel`].
    #[inline]
    pub fn store(&self, ptr: *mut T, order: Ordering) {
        self.inner.store(ptr, order);
    }

    /// Stores a value into the pointer, returning the previous value.
    ///
    /// `swap` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn swap(&self, ptr: *mut T, order: Ordering) -> *mut T {
        self.inner.swap(ptr, order)
    }

    /// Stores a value into the pointer if the current value is the same as the `current` value.
    ///
    /// The return value is a result indicating whether the new value was written and containing
    /// the previous value. On success this value is guaranteed to be equal to `current`.
    ///
    /// `compare_exchange` takes two [`Ordering`] arguments to describe the memory
    /// ordering of this operation. `success` describes the required ordering for the
    /// read-modify-write operation that takes place if the comparison with `current` succeeds.
    /// `failure` describes the required ordering for the load operation that takes place when
    /// the comparison fails. Using [`Acquire`] as success ordering makes the store part
    /// of this operation [`Relaxed`], and using [`Release`] makes the successful load
    /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    pub fn compare_exchange(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        self.inner.compare_exchange(current, new, success, failure)
    }

    /// Stores a value into the pointer if the current value is the same as the `current` value.
    ///
    /// Unlike [`AtomicPtr::compare_exchange`], this function is allowed to spuriously fail even when the
    /// comparison succeeds, which can result in more efficient code on some platforms. The
    /// return value is a result indicating whether the new value was written and containing the
    /// previous value.
    ///
    /// `compare_exchange_weak` takes two [`Ordering`] arguments to describe the memory
    /// ordering of this operation. `success` describes the required ordering for the
    /// read-modify-write operation that takes place if the comparison with `current` succeeds.
    /// `failure` describes the required ordering for the load operation that takes place when
    /// the comparison fails. Using [`Acquire`] as success ordering makes the store part
    /// of this operation [`Relaxed`], and using [`Release`] makes the successful load
    /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    pub fn compare_exchange_weak(
        &self,
        current: *mut T,
        new: *mut T,
        success: Ordering,
        failure: Ordering,
    ) -> Result<*mut T, *mut T> {
        self.inner.compare_exchange_weak(current, new, success, failure)
    }

    /// Fetches the value, and applies a function to it that returns an optional
    /// new value. Returns a `Result` of `Ok(previous_value)` if the function
    /// returned `Some(_)`, else `Err(previous_value)`.
    ///
    /// Note: This may call the function multiple times if the value has been
    /// changed from other threads in the meantime, as long as the function
    /// returns `Some(_)`, but the function will have been applied only once to
    /// the stored value.
    ///
    /// `fetch_update` takes two [`Ordering`] arguments to describe the memory
    /// ordering of this operation. The first describes the required ordering for
    /// when the operation finally succeeds while the second describes the
    /// required ordering for loads. These correspond to the success and failure
    /// orderings of [`AtomicPtr::compare_exchange`] respectively.
    ///
    /// Using [`Acquire`] as success ordering makes the store part of this
    /// operation [`Relaxed`], and using [`Release`] makes the final successful
    /// load [`Relaxed`]. The (failed) load ordering can only be [`SeqCst`],
    /// [`Acquire`] or [`Relaxed`].
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
    )]
    #[inline]
    pub fn fetch_update<F>(
        &self,
        set_order: Ordering,
        fetch_order: Ordering,
        mut f: F,
    ) -> Result<*mut T, *mut T>
    where
        F: FnMut(*mut T) -> Option<*mut T>,
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
}

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
                // std atomic types use Relaxed in Debug::fmt: https://github.com/rust-lang/rust/blob/b2c9872c6c2c60c905e16bce0801934b86d15f95/library/core/src/sync/atomic.rs#L1520
                fmt::Debug::fmt(&self.load(Ordering::Relaxed), f)
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
            #[must_use]
            pub const fn new(v: $int_type) -> Self {
                Self { inner: imp::$atomic_type::new(v), _marker: PhantomData }
            }

            /// Returns `true` if operations on values of this type are lock-free.
            ///
            /// If the compiler or the platform doesn't support the necessary
            /// atomic instructions, global locks for every potentially
            /// concurrent atomic operation will be used.
            #[inline]
            #[must_use]
            pub fn is_lock_free() -> bool {
                <imp::$atomic_type>::is_lock_free()
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
            #[must_use]
            pub const fn is_always_lock_free() -> bool {
                <imp::$atomic_type>::is_always_lock_free()
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
            /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].
            #[cfg_attr(
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
            /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].
            #[cfg_attr(
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
            /// [`Relaxed`]. The (failed) load ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].
            #[cfg_attr(
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_max(val, order)
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                self.inner.fetch_min(val, order)
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
                // std atomic types use Relaxed in Debug::fmt: https://github.com/rust-lang/rust/blob/b2c9872c6c2c60c905e16bce0801934b86d15f95/library/core/src/sync/atomic.rs#L1520
                fmt::Debug::fmt(&self.load(Ordering::Relaxed), f)
            }
        }

        // Send is implicitly implemented.
        // SAFETY: any data races are prevented by atomic operations.
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
            #[must_use]
            pub const fn new(v: $float_type) -> Self {
                Self { v: core::cell::UnsafeCell::new(v) }
            }

            /// Returns `true` if operations on values of this type are lock-free.
            ///
            /// If the compiler or the platform doesn't support the necessary
            /// atomic instructions, global locks for every potentially
            /// concurrent atomic operation will be used.
            #[inline]
            #[must_use]
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
            #[must_use]
            pub const fn is_always_lock_free() -> bool {
                crate::$atomic_int_type::is_always_lock_free()
            }

            /// Returns a mutable reference to the underlying float.
            ///
            /// This is safe because the mutable reference guarantees that no other threads are
            /// concurrently accessing the atomic data.
            #[inline]
            pub fn get_mut(&mut self) -> &mut $float_type {
                // SAFETY: This is safe because the mutable reference guarantees that no other
                // threads are concurrently accessing the atomic data.
                unsafe { &mut *self.v.get() }
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
            /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].
            #[cfg_attr(
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
            /// [`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].
            #[cfg_attr(
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
            /// [`Relaxed`]. The (failed) load ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].
            #[cfg_attr(
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
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
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_min(&self, val: $float_type, order: Ordering) -> $float_type {
                self.fetch_update(order, crate::utils::strongest_failure_ordering(order), |x| {
                    Some(x.min(val))
                })
                .unwrap()
            }

            /// Computes the absolute value of the current value, and sets the
            /// new value to the result.
            ///
            /// Returns the previous value.
            ///
            /// `fetch_abs` takes an [`Ordering`] argument which describes the memory ordering
            /// of this operation. All ordering modes are possible. Note that using
            /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
            /// using [`Release`] makes the load part [`Relaxed`].
            #[cfg_attr(
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
            )]
            #[inline]
            pub fn fetch_abs(&self, order: Ordering) -> $float_type {
                const ABS_MASK: $int_type = !0 / 2;
                $float_type::from_bits(self.as_bits().fetch_and(ABS_MASK, order))
            }

            // TODO: Add as_mut_ptr once it is stable on other std atomic types.
            // https://github.com/rust-lang/rust/issues/66893

            doc_comment! {
                concat!("Raw transmutation to `", stringify!($atomic_int_type), "`.

See [`", stringify!($float_type) ,"::from_bits`] for some discussion of the
portability of this operation (there are almost no issues)."),
                #[inline]
                pub fn as_bits(&self) -> &crate::$atomic_int_type {
                    // SAFETY: $atomic_type and $atomic_int_type have the same layout,
                    // and there is no concurrent access to the value that does not go through this method.
                    unsafe { &*(self as *const $atomic_type as *const crate::$atomic_int_type) }
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
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(
        all(feature = "fallback", not(portable_atomic_no_atomic_cas)),
        not(portable_atomic_no_atomic_64),
        target_pointer_width = "64",
        all(feature = "fallback", portable_atomic_unsafe_assume_single_core)
    ))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        all(feature = "fallback", target_has_atomic = "ptr"),
        target_has_atomic = "64",
        target_pointer_width = "64",
        all(feature = "fallback", portable_atomic_unsafe_assume_single_core)
    ))
)]
atomic_int!(AtomicI64, i64, 8);
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(
        all(feature = "fallback", not(portable_atomic_no_atomic_cas)),
        not(portable_atomic_no_atomic_64),
        target_pointer_width = "64",
        all(feature = "fallback", portable_atomic_unsafe_assume_single_core)
    ))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
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
        all(any(not(portable_atomic_no_asm), portable_atomic_nightly), target_arch = "aarch64"),
        all(
            any(not(portable_atomic_no_asm), portable_atomic_nightly),
            any(
                target_feature = "cmpxchg16b",
                portable_atomic_target_feature = "cmpxchg16b",
                portable_atomic_cmpxchg16b_dynamic
            ),
            target_arch = "x86_64",
        ),
        all(
            all(not(portable_atomic_no_asm), portable_atomic_nightly),
            any(
                target_endian = "little",
                target_feature = "quadword-atomics",
                portable_atomic_target_feature = "quadword-atomics"
            ),
            target_arch = "powerpc64"
        ),
        all(all(not(portable_atomic_no_asm), portable_atomic_nightly), target_arch = "s390x"),
    ))
)]
#[cfg_attr(
    all(feature = "fallback", portable_atomic_no_cfg_target_has_atomic),
    cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(
    all(feature = "fallback", not(portable_atomic_no_cfg_target_has_atomic)),
    cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
)]
atomic_int!(AtomicI128, i128, 16);
#[cfg_attr(
    not(feature = "fallback"),
    cfg(any(
        all(any(not(portable_atomic_no_asm), portable_atomic_nightly), target_arch = "aarch64"),
        all(
            any(not(portable_atomic_no_asm), portable_atomic_nightly),
            any(
                target_feature = "cmpxchg16b",
                portable_atomic_target_feature = "cmpxchg16b",
                portable_atomic_cmpxchg16b_dynamic
            ),
            target_arch = "x86_64",
        ),
        all(
            all(not(portable_atomic_no_asm), portable_atomic_nightly),
            any(
                target_endian = "little",
                target_feature = "quadword-atomics",
                portable_atomic_target_feature = "quadword-atomics"
            ),
            target_arch = "powerpc64"
        ),
        all(all(not(portable_atomic_no_asm), portable_atomic_nightly), target_arch = "s390x"),
    ))
)]
#[cfg_attr(
    all(feature = "fallback", portable_atomic_no_cfg_target_has_atomic),
    cfg(any(not(portable_atomic_no_atomic_cas), portable_atomic_unsafe_assume_single_core))
)]
#[cfg_attr(
    all(feature = "fallback", not(portable_atomic_no_cfg_target_has_atomic)),
    cfg(any(target_has_atomic = "ptr", portable_atomic_unsafe_assume_single_core))
)]
atomic_int!(AtomicU128, u128, 16);

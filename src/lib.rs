/*!
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
    Enabling this cfg in an environment where privileged instructions are not available is also usually considered **unsound**, although the details are system-dependent.
  - On pre-v6 ARM, this currently disables only IRQs.
    Enabling this cfg in an environment where FIQs must also be disabled is also considered **unsound**.

  This is intentionally not an optional feature. (If this is an optional feature, dependencies can implicitly enable the feature, resulting in the use of unsound code without the end-user being aware of it.)

  Enabling this cfg for targets that have atomic CAS will result in a compile error.

  ARMv6-M (thumbv6m), pre-v6 ARM (e.g., thumbv4t, thumbv5te), RISC-V without A-extension are currently supported. See [#33] for support of multi-core systems.

  Since all MSP430 and AVR are single-core, we always provide atomic CAS for them without this cfg.

  Feel free to submit an issue if your target is not supported yet.

## Related Projects

- [atomic-maybe-uninit]: Atomic operations on potentially uninitialized integers.
- [atomic-memcpy]: Byte-wise atomic memcpy.

[#33]: https://github.com/taiki-e/portable-atomic/issues/33
[atomic-maybe-uninit]: https://github.com/taiki-e/atomic-maybe-uninit
[atomic-memcpy]: https://github.com/taiki-e/atomic-memcpy
[rust-lang/rust#100650]: https://github.com/rust-lang/rust/issues/100650
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
    clippy::missing_inline_in_public_items,
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
// x86_64 128-bit atomic (fallback + dynamic detection only)
// we use cfg set by build script to determine whether this feature is available or not.
#![cfg_attr(
    all(
        portable_atomic_nightly,
        target_arch = "x86_64",
        any(
            test,
            all(
                portable_atomic_cmpxchg16b_dynamic,
                not(any(
                    target_feature = "cmpxchg16b",
                    portable_atomic_target_feature = "cmpxchg16b",
                ))
            )
        )
    ),
    feature(cmpxchg16b_target_feature)
)]
// asm_experimental_arch
// AVR and MSP430 are tier 3 platforms and require nightly anyway.
// On tier 2 platforms (powerpc64 and s390x), we use cfg set by build script to
// determine whether this feature is available or not.
#![cfg_attr(
    all(
        portable_atomic_nightly,
        not(portable_atomic_no_asm),
        any(
            target_arch = "avr",
            target_arch = "msp430",
            all(
                portable_atomic_asm_experimental_arch,
                target_arch = "powerpc64",
                any(
                    target_feature = "quadword-atomics",
                    portable_atomic_target_feature = "quadword-atomics"
                )
            ),
            all(portable_atomic_asm_experimental_arch, target_arch = "s390x"),
        ),
    ),
    feature(asm_experimental_arch)
)]
// non-Linux armv4t (tier 3)
#![cfg_attr(
    all(
        portable_atomic_nightly,
        target_arch = "arm",
        not(target_has_atomic = "ptr"),
        not(any(target_feature = "v6", portable_atomic_target_feature = "v6")),
        any(test, portable_atomic_unsafe_assume_single_core)
    ),
    feature(isa_attribute)
)]
// Old nightly only
// These features are already stable or have already been removed from compilers,
// and can safely be enabled for old nightly as long as version detection works.
// cfg(cfg_target_has_atomic) on old nightly
#![cfg_attr(portable_atomic_unstable_cfg_target_has_atomic, feature(cfg_target_has_atomic))]
// asm on old nightly
#![cfg_attr(
    all(
        portable_atomic_nightly,
        portable_atomic_no_asm,
        any(
            all(
                any(target_arch = "arm", target_arch = "riscv32", target_arch = "riscv64"),
                not(target_has_atomic = "ptr")
            ),
            target_arch = "aarch64",
            target_arch = "x86_64",
        ),
    ),
    feature(asm)
)]
// llvm_asm on old nightly
#![cfg_attr(
    all(any(target_arch = "avr", target_arch = "msp430"), portable_atomic_no_asm),
    feature(llvm_asm)
)]
// Miri and/or ThreadSanitizer only
// They do not support inline assembly, so we need to use unstable features instead of it.
// Since they require nightly compilers anyway, we can use the unstable features.
#![cfg_attr(
    all(
        any(target_arch = "aarch64", target_arch = "powerpc64", target_arch = "s390x"),
        any(all(test, portable_atomic_nightly), miri, portable_atomic_sanitize_thread)
    ),
    feature(core_intrinsics)
)]
#![cfg_attr(
    all(
        target_arch = "x86_64",
        any(all(test, portable_atomic_nightly), miri, portable_atomic_sanitize_thread)
    ),
    feature(stdsimd)
)]
#![cfg_attr(
    all(miri, portable_atomic_unstable_strict_provenance_atomic_ptr),
    feature(strict_provenance_atomic_ptr)
)]
// docs.rs only
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
        not(any(
            portable_atomic_armv6m,
            all(
                target_arch = "arm",
                not(any(target_feature = "v6", portable_atomic_target_feature = "v6"))
            ),
            all(
                any(target_arch = "riscv32", target_arch = "riscv64"),
                portable_atomic_no_atomic_cas
            ),
            target_pointer_width = "16"
        ))
    ))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        target_has_atomic = "ptr",
        not(any(
            portable_atomic_armv6m,
            all(
                target_arch = "arm",
                not(any(target_feature = "v6", portable_atomic_target_feature = "v6"))
            ),
            all(
                any(target_arch = "riscv32", target_arch = "riscv64"),
                not(target_has_atomic = "ptr")
            ),
            target_pointer_width = "16"
        ))
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
pub use core::sync::atomic::Ordering;

#[doc(no_inline)]
// LLVM doesn't support fence/compiler_fence for MSP430.
#[cfg(not(target_arch = "msp430"))]
pub use core::sync::atomic::{compiler_fence, fence};
#[cfg(target_arch = "msp430")]
pub use imp::msp430::{compiler_fence, fence};

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
/// If the compiler and the platform support atomic loads and stores of `u8`,
/// this type is a wrapper for the standard library's
/// [`AtomicBool`](core::sync::atomic::AtomicBool). If the platform supports it
/// but the compiler does not, atomic operations are implemented using inline
/// assembly.
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
        // std atomic types use Relaxed in Debug::fmt: https://github.com/rust-lang/rust/blob/1.63.0/library/core/src/sync/atomic.rs#L1527
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::AtomicBool;
    ///
    /// let atomic_true = AtomicBool::new(true);
    /// let atomic_false = AtomicBool::new(false);
    /// ```
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::AtomicBool;
    ///
    /// let is_lock_free = AtomicBool::is_lock_free();
    /// ```
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::AtomicBool;
    ///
    /// const IS_ALWAYS_LOCK_FREE: bool = AtomicBool::is_always_lock_free();
    /// ```
    #[inline]
    #[must_use]
    pub const fn is_always_lock_free() -> bool {
        imp::AtomicBool::is_always_lock_free()
    }

    /// Returns a mutable reference to the underlying [`bool`].
    ///
    /// This is safe because the mutable reference guarantees that no other threads are
    /// concurrently accessing the atomic data.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicBool, Ordering};
    ///
    /// let mut some_bool = AtomicBool::new(true);
    /// assert_eq!(*some_bool.get_mut(), true);
    /// *some_bool.get_mut() = false;
    /// assert_eq!(some_bool.load(Ordering::SeqCst), false);
    /// ```
    #[inline]
    pub fn get_mut(&mut self) -> &mut bool {
        self.inner.get_mut()
    }

    // TODO: Add from_mut/get_mut_slice/from_mut_slice once it is stable on std atomic types.
    // https://github.com/rust-lang/rust/issues/76314

    /// Consumes the atomic and returns the contained value.
    ///
    /// This is safe because passing `self` by value guarantees that no other threads are
    /// concurrently accessing the atomic data.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::AtomicBool;
    ///
    /// let some_bool = AtomicBool::new(true);
    /// assert_eq!(some_bool.into_inner(), true);
    /// ```
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicBool, Ordering};
    ///
    /// let some_bool = AtomicBool::new(true);
    ///
    /// assert_eq!(some_bool.load(Ordering::Relaxed), true);
    /// ```
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicBool, Ordering};
    ///
    /// let some_bool = AtomicBool::new(true);
    ///
    /// some_bool.store(false, Ordering::Relaxed);
    /// assert_eq!(some_bool.load(Ordering::Relaxed), false);
    /// ```
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub fn store(&self, val: bool, order: Ordering) {
        self.inner.store(val, order);
    }

    /// Stores a value into the bool, returning the previous value.
    ///
    /// `swap` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicBool, Ordering};
    ///
    /// let some_bool = AtomicBool::new(true);
    ///
    /// assert_eq!(some_bool.swap(false, Ordering::Relaxed), true);
    /// assert_eq!(some_bool.load(Ordering::Relaxed), false);
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430",
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
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
    ///
    /// # Panics
    ///
    /// Panics if `failure` is [`Release`], [`AcqRel`].
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicBool, Ordering};
    ///
    /// let some_bool = AtomicBool::new(true);
    ///
    /// assert_eq!(
    ///     some_bool.compare_exchange(true, false, Ordering::Acquire, Ordering::Relaxed),
    ///     Ok(true)
    /// );
    /// assert_eq!(some_bool.load(Ordering::Relaxed), false);
    ///
    /// assert_eq!(
    ///     some_bool.compare_exchange(true, true, Ordering::SeqCst, Ordering::Acquire),
    ///     Err(false)
    /// );
    /// assert_eq!(some_bool.load(Ordering::Relaxed), false);
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
    ///
    /// # Panics
    ///
    /// Panics if `failure` is [`Release`], [`AcqRel`].
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicBool, Ordering};
    ///
    /// let val = AtomicBool::new(false);
    ///
    /// let new = true;
    /// let mut old = val.load(Ordering::Relaxed);
    /// loop {
    ///     match val.compare_exchange_weak(old, new, Ordering::SeqCst, Ordering::Relaxed) {
    ///         Ok(_) => break,
    ///         Err(x) => old = x,
    ///     }
    /// }
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicBool, Ordering};
    ///
    /// let foo = AtomicBool::new(true);
    /// assert_eq!(foo.fetch_and(false, Ordering::SeqCst), true);
    /// assert_eq!(foo.load(Ordering::SeqCst), false);
    ///
    /// let foo = AtomicBool::new(true);
    /// assert_eq!(foo.fetch_and(true, Ordering::SeqCst), true);
    /// assert_eq!(foo.load(Ordering::SeqCst), true);
    ///
    /// let foo = AtomicBool::new(false);
    /// assert_eq!(foo.fetch_and(false, Ordering::SeqCst), false);
    /// assert_eq!(foo.load(Ordering::SeqCst), false);
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicBool, Ordering};
    ///
    /// let foo = AtomicBool::new(true);
    /// assert_eq!(foo.fetch_nand(false, Ordering::SeqCst), true);
    /// assert_eq!(foo.load(Ordering::SeqCst), true);
    ///
    /// let foo = AtomicBool::new(true);
    /// assert_eq!(foo.fetch_nand(true, Ordering::SeqCst), true);
    /// assert_eq!(foo.load(Ordering::SeqCst) as usize, 0);
    /// assert_eq!(foo.load(Ordering::SeqCst), false);
    ///
    /// let foo = AtomicBool::new(false);
    /// assert_eq!(foo.fetch_nand(false, Ordering::SeqCst), false);
    /// assert_eq!(foo.load(Ordering::SeqCst), true);
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicBool, Ordering};
    ///
    /// let foo = AtomicBool::new(true);
    /// assert_eq!(foo.fetch_or(false, Ordering::SeqCst), true);
    /// assert_eq!(foo.load(Ordering::SeqCst), true);
    ///
    /// let foo = AtomicBool::new(true);
    /// assert_eq!(foo.fetch_or(true, Ordering::SeqCst), true);
    /// assert_eq!(foo.load(Ordering::SeqCst), true);
    ///
    /// let foo = AtomicBool::new(false);
    /// assert_eq!(foo.fetch_or(false, Ordering::SeqCst), false);
    /// assert_eq!(foo.load(Ordering::SeqCst), false);
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicBool, Ordering};
    ///
    /// let foo = AtomicBool::new(true);
    /// assert_eq!(foo.fetch_xor(false, Ordering::SeqCst), true);
    /// assert_eq!(foo.load(Ordering::SeqCst), true);
    ///
    /// let foo = AtomicBool::new(true);
    /// assert_eq!(foo.fetch_xor(true, Ordering::SeqCst), true);
    /// assert_eq!(foo.load(Ordering::SeqCst), false);
    ///
    /// let foo = AtomicBool::new(false);
    /// assert_eq!(foo.fetch_xor(false, Ordering::SeqCst), false);
    /// assert_eq!(foo.load(Ordering::SeqCst), false);
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[inline]
    pub fn fetch_xor(&self, val: bool, order: Ordering) -> bool {
        self.inner.fetch_xor(val, order)
    }

    /// Logical "not" with a boolean value.
    ///
    /// Performs a logical "not" operation on the current value, and sets
    /// the new value to the result.
    ///
    /// Returns the previous value.
    ///
    /// `fetch_not` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicBool, Ordering};
    ///
    /// let foo = AtomicBool::new(true);
    /// assert_eq!(foo.fetch_not(Ordering::SeqCst), true);
    /// assert_eq!(foo.load(Ordering::SeqCst), false);
    ///
    /// let foo = AtomicBool::new(false);
    /// assert_eq!(foo.fetch_not(Ordering::SeqCst), false);
    /// assert_eq!(foo.load(Ordering::SeqCst), true);
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[inline]
    pub fn fetch_not(&self, order: Ordering) -> bool {
        self.fetch_xor(true, order)
    }

    // TODO: Add as_mut_ptr once it is stable on std atomic types.
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
    ///
    /// # Panics
    ///
    /// Panics if `fetch_order` is [`Release`], [`AcqRel`].
    ///
    /// # Examples
    ///
    /// ```rust
    /// use portable_atomic::{AtomicBool, Ordering};
    ///
    /// let x = AtomicBool::new(false);
    /// assert_eq!(x.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |_| None), Err(false));
    /// assert_eq!(x.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |x| Some(!x)), Ok(false));
    /// assert_eq!(x.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |x| Some(!x)), Ok(true));
    /// assert_eq!(x.load(Ordering::SeqCst), false);
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
/// If the compiler and the platform support atomic loads and stores of pointers,
/// this type is a wrapper for the standard library's
/// [`AtomicPtr`](core::sync::atomic::AtomicPtr). If the platform supports it
/// but the compiler does not, atomic operations are implemented using inline
/// assembly.
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
        // std atomic types use Relaxed in Debug::fmt: https://github.com/rust-lang/rust/blob/1.63.0/library/core/src/sync/atomic.rs#L1527
        fmt::Debug::fmt(&self.load(Ordering::Relaxed), f)
    }
}

impl<T> fmt::Pointer for AtomicPtr<T> {
    #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // std atomic types use Relaxed in Debug::fmt: https://github.com/rust-lang/rust/blob/1.63.0/library/core/src/sync/atomic.rs#L1527
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::AtomicPtr;
    ///
    /// let ptr = &mut 5;
    /// let atomic_ptr = AtomicPtr::new(ptr);
    /// ```
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::AtomicPtr;
    ///
    /// let is_lock_free = AtomicPtr::<()>::is_lock_free();
    /// ```
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::AtomicPtr;
    ///
    /// const IS_ALWAYS_LOCK_FREE: bool = AtomicPtr::<()>::is_always_lock_free();
    /// ```
    #[inline]
    #[must_use]
    pub const fn is_always_lock_free() -> bool {
        <imp::AtomicPtr<T>>::is_always_lock_free()
    }

    /// Returns a mutable reference to the underlying pointer.
    ///
    /// This is safe because the mutable reference guarantees that no other threads are
    /// concurrently accessing the atomic data.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicPtr, Ordering};
    ///
    /// let mut data = 10;
    /// let mut atomic_ptr = AtomicPtr::new(&mut data);
    /// let mut other_data = 5;
    /// *atomic_ptr.get_mut() = &mut other_data;
    /// assert_eq!(unsafe { *atomic_ptr.load(Ordering::SeqCst) }, 5);
    /// ```
    #[inline]
    pub fn get_mut(&mut self) -> &mut *mut T {
        self.inner.get_mut()
    }

    // TODO: Add from_mut/get_mut_slice/from_mut_slice once it is stable on std atomic types.
    // https://github.com/rust-lang/rust/issues/76314

    /// Consumes the atomic and returns the contained value.
    ///
    /// This is safe because passing `self` by value guarantees that no other threads are
    /// concurrently accessing the atomic data.
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::AtomicPtr;
    ///
    /// let mut data = 5;
    /// let atomic_ptr = AtomicPtr::new(&mut data);
    /// assert_eq!(unsafe { *atomic_ptr.into_inner() }, 5);
    /// ```
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicPtr, Ordering};
    ///
    /// let ptr = &mut 5;
    /// let some_ptr = AtomicPtr::new(ptr);
    ///
    /// let value = some_ptr.load(Ordering::Relaxed);
    /// ```
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicPtr, Ordering};
    ///
    /// let ptr = &mut 5;
    /// let some_ptr = AtomicPtr::new(ptr);
    ///
    /// let other_ptr = &mut 10;
    ///
    /// some_ptr.store(other_ptr, Ordering::Relaxed);
    /// ```
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
    pub fn store(&self, ptr: *mut T, order: Ordering) {
        self.inner.store(ptr, order);
    }

    /// Stores a value into the pointer, returning the previous value.
    ///
    /// `swap` takes an [`Ordering`] argument which describes the memory ordering
    /// of this operation. All ordering modes are possible. Note that using
    /// [`Acquire`] makes the store part of this operation [`Relaxed`], and
    /// using [`Release`] makes the load part [`Relaxed`].
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicPtr, Ordering};
    ///
    /// let ptr = &mut 5;
    /// let some_ptr = AtomicPtr::new(ptr);
    ///
    /// let other_ptr = &mut 10;
    ///
    /// let value = some_ptr.swap(other_ptr, Ordering::Relaxed);
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
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
    ///
    /// # Panics
    ///
    /// Panics if `failure` is [`Release`], [`AcqRel`].
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicPtr, Ordering};
    ///
    /// let ptr = &mut 5;
    /// let some_ptr = AtomicPtr::new(ptr);
    ///
    /// let other_ptr = &mut 10;
    ///
    /// let value = some_ptr.compare_exchange(ptr, other_ptr, Ordering::SeqCst, Ordering::Relaxed);
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
    ///
    /// # Panics
    ///
    /// Panics if `failure` is [`Release`], [`AcqRel`].
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicPtr, Ordering};
    ///
    /// let some_ptr = AtomicPtr::new(&mut 5);
    ///
    /// let new = &mut 10;
    /// let mut old = some_ptr.load(Ordering::Relaxed);
    /// loop {
    ///     match some_ptr.compare_exchange_weak(old, new, Ordering::SeqCst, Ordering::Relaxed) {
    ///         Ok(_) => break,
    ///         Err(x) => old = x,
    ///     }
    /// }
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[inline]
    #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
    ///
    /// # Panics
    ///
    /// Panics if `fetch_order` is [`Release`], [`AcqRel`].
    ///
    /// # Examples
    ///
    /// ```rust
    /// use portable_atomic::{AtomicPtr, Ordering};
    ///
    /// let ptr: *mut _ = &mut 5;
    /// let some_ptr = AtomicPtr::new(ptr);
    ///
    /// let new: *mut _ = &mut 10;
    /// assert_eq!(some_ptr.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |_| None), Err(ptr));
    /// let result = some_ptr.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |x| {
    ///     if x == ptr {
    ///         Some(new)
    ///     } else {
    ///         None
    ///     }
    /// });
    /// assert_eq!(result, Ok(ptr));
    /// assert_eq!(some_ptr.load(Ordering::SeqCst), new);
    /// ```
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[inline]
    #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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

    /// Offsets the pointer's address by adding `val` (in units of `T`),
    /// returning the previous pointer.
    ///
    /// This is equivalent to using [`wrapping_add`] to atomically perform the
    /// equivalent of `ptr = ptr.wrapping_add(val);`.
    ///
    /// This method operates in units of `T`, which means that it cannot be used
    /// to offset the pointer by an amount which is not a multiple of
    /// `size_of::<T>()`. This can sometimes be inconvenient, as you may want to
    /// work with a deliberately misaligned pointer. In such cases, you may use
    /// the [`fetch_byte_add`](Self::fetch_byte_add) method instead.
    ///
    /// `fetch_ptr_add` takes an [`Ordering`] argument which describes the
    /// memory ordering of this operation. All ordering modes are possible. Note
    /// that using [`Acquire`] makes the store part of this operation
    /// [`Relaxed`], and using [`Release`] makes the load part [`Relaxed`].
    ///
    /// [`wrapping_add`]: https://doc.rust-lang.org/std/primitive.pointer.html#method.wrapping_add
    ///
    /// # Examples
    ///
    /// ```
    /// # #![allow(unstable_name_collisions)]
    /// use portable_atomic::{AtomicPtr, Ordering};
    /// use sptr::Strict; // stable polyfill for strict provenance
    ///
    /// let atom = AtomicPtr::<i64>::new(core::ptr::null_mut());
    /// assert_eq!(atom.fetch_ptr_add(1, Ordering::Relaxed).addr(), 0);
    /// // Note: units of `size_of::<i64>()`.
    /// assert_eq!(atom.load(Ordering::Relaxed).addr(), 8);
    /// ```
    #[inline]
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    pub fn fetch_ptr_add(&self, val: usize, order: Ordering) -> *mut T {
        self.fetch_byte_add(val.wrapping_mul(core::mem::size_of::<T>()), order)
    }

    /// Offsets the pointer's address by subtracting `val` (in units of `T`),
    /// returning the previous pointer.
    ///
    /// This is equivalent to using [`wrapping_sub`] to atomically perform the
    /// equivalent of `ptr = ptr.wrapping_sub(val);`.
    ///
    /// This method operates in units of `T`, which means that it cannot be used
    /// to offset the pointer by an amount which is not a multiple of
    /// `size_of::<T>()`. This can sometimes be inconvenient, as you may want to
    /// work with a deliberately misaligned pointer. In such cases, you may use
    /// the [`fetch_byte_sub`](Self::fetch_byte_sub) method instead.
    ///
    /// `fetch_ptr_sub` takes an [`Ordering`] argument which describes the memory
    /// ordering of this operation. All ordering modes are possible. Note that
    /// using [`Acquire`] makes the store part of this operation [`Relaxed`],
    /// and using [`Release`] makes the load part [`Relaxed`].
    ///
    /// [`wrapping_sub`]: https://doc.rust-lang.org/std/primitive.pointer.html#method.wrapping_sub
    ///
    /// # Examples
    ///
    /// ```
    /// use portable_atomic::{AtomicPtr, Ordering};
    ///
    /// let array = [1i32, 2i32];
    /// let atom = AtomicPtr::new(array.as_ptr().wrapping_add(1) as *mut _);
    ///
    /// assert!(core::ptr::eq(atom.fetch_ptr_sub(1, Ordering::Relaxed), &array[1],));
    /// assert!(core::ptr::eq(atom.load(Ordering::Relaxed), &array[0]));
    /// ```
    #[inline]
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    pub fn fetch_ptr_sub(&self, val: usize, order: Ordering) -> *mut T {
        self.fetch_byte_sub(val.wrapping_mul(core::mem::size_of::<T>()), order)
    }

    /// Offsets the pointer's address by adding `val` *bytes*, returning the
    /// previous pointer.
    ///
    /// This is equivalent to using [`wrapping_add`] and [`cast`] to atomically
    /// perform `ptr = ptr.cast::<u8>().wrapping_add(val).cast::<T>()`.
    ///
    /// `fetch_byte_add` takes an [`Ordering`] argument which describes the
    /// memory ordering of this operation. All ordering modes are possible. Note
    /// that using [`Acquire`] makes the store part of this operation
    /// [`Relaxed`], and using [`Release`] makes the load part [`Relaxed`].
    ///
    /// [`wrapping_add`]: https://doc.rust-lang.org/std/primitive.pointer.html#method.wrapping_add
    /// [`cast`]: https://doc.rust-lang.org/std/primitive.pointer.html#method.cast
    ///
    /// # Examples
    ///
    /// ```
    /// # #![allow(unstable_name_collisions)]
    /// use portable_atomic::{AtomicPtr, Ordering};
    /// use sptr::Strict; // stable polyfill for strict provenance
    ///
    /// let atom = AtomicPtr::<i64>::new(core::ptr::null_mut());
    /// assert_eq!(atom.fetch_byte_add(1, Ordering::Relaxed).addr(), 0);
    /// // Note: in units of bytes, not `size_of::<i64>()`.
    /// assert_eq!(atom.load(Ordering::Relaxed).addr(), 1);
    /// ```
    #[inline]
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    pub fn fetch_byte_add(&self, val: usize, order: Ordering) -> *mut T {
        // Ideally, we would always use AtomicPtr::fetch_* since it is strict-provenance
        // compatible, but it is unstable. So, for now use it only on cfg(miri).
        // Code using AtomicUsize::fetch_* via casts is still permissive-provenance
        // compatible and is sound.
        // TODO: Once `#![feature(strict_provenance_atomic_ptr)]` is stabilized,
        // use AtomicPtr::fetch_* in all cases from the version in which it is stabilized.
        #[cfg(all(miri, portable_atomic_unstable_strict_provenance_atomic_ptr))]
        {
            self.inner.fetch_byte_add(val, order)
        }
        #[cfg(not(all(miri, portable_atomic_unstable_strict_provenance_atomic_ptr)))]
        {
            self.as_atomic_usize().fetch_add(val, order) as *mut T
        }
    }

    /// Offsets the pointer's address by subtracting `val` *bytes*, returning the
    /// previous pointer.
    ///
    /// This is equivalent to using [`wrapping_sub`] and [`cast`] to atomically
    /// perform `ptr = ptr.cast::<u8>().wrapping_sub(val).cast::<T>()`.
    ///
    /// `fetch_byte_sub` takes an [`Ordering`] argument which describes the
    /// memory ordering of this operation. All ordering modes are possible. Note
    /// that using [`Acquire`] makes the store part of this operation
    /// [`Relaxed`], and using [`Release`] makes the load part [`Relaxed`].
    ///
    /// [`wrapping_sub`]: https://doc.rust-lang.org/std/primitive.pointer.html#method.wrapping_sub
    /// [`cast`]: https://doc.rust-lang.org/std/primitive.pointer.html#method.cast
    ///
    /// # Examples
    ///
    /// ```
    /// # #![allow(unstable_name_collisions)]
    /// use portable_atomic::{AtomicPtr, Ordering};
    /// use sptr::Strict; // stable polyfill for strict provenance
    ///
    /// let atom = AtomicPtr::<i64>::new(sptr::invalid_mut(1));
    /// assert_eq!(atom.fetch_byte_sub(1, Ordering::Relaxed).addr(), 1);
    /// assert_eq!(atom.load(Ordering::Relaxed).addr(), 0);
    /// ```
    #[inline]
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    pub fn fetch_byte_sub(&self, val: usize, order: Ordering) -> *mut T {
        // Ideally, we would always use AtomicPtr::fetch_* since it is strict-provenance
        // compatible, but it is unstable. So, for now use it only on cfg(miri).
        // Code using AtomicUsize::fetch_* via casts is still permissive-provenance
        // compatible and is sound.
        // TODO: Once `#![feature(strict_provenance_atomic_ptr)]` is stabilized,
        // use AtomicPtr::fetch_* in all cases from the version in which it is stabilized.
        #[cfg(all(miri, portable_atomic_unstable_strict_provenance_atomic_ptr))]
        {
            self.inner.fetch_byte_sub(val, order)
        }
        #[cfg(not(all(miri, portable_atomic_unstable_strict_provenance_atomic_ptr)))]
        {
            self.as_atomic_usize().fetch_sub(val, order) as *mut T
        }
    }

    /// Performs a bitwise "or" operation on the address of the current pointer,
    /// and the argument `val`, and stores a pointer with provenance of the
    /// current pointer and the resulting address.
    ///
    /// This is equivalent equivalent to using [`map_addr`] to atomically
    /// perform `ptr = ptr.map_addr(|a| a | val)`. This can be used in tagged
    /// pointer schemes to atomically set tag bits.
    ///
    /// **Caveat**: This operation returns the previous value. To compute the
    /// stored value without losing provenance, you may use [`map_addr`]. For
    /// example: `a.fetch_or(val).map_addr(|a| a | val)`.
    ///
    /// `fetch_or` takes an [`Ordering`] argument which describes the memory
    /// ordering of this operation. All ordering modes are possible. Note that
    /// using [`Acquire`] makes the store part of this operation [`Relaxed`],
    /// and using [`Release`] makes the load part [`Relaxed`].
    ///
    /// This API and its claimed semantics are part of the Strict Provenance
    /// experiment, see the [module documentation for `ptr`][crate::ptr] for
    /// details.
    ///
    /// [`map_addr`]: https://doc.rust-lang.org/std/primitive.pointer.html#method.map_addr
    ///
    /// # Examples
    ///
    /// ```
    /// # #![allow(unstable_name_collisions)]
    /// use portable_atomic::{AtomicPtr, Ordering};
    /// use sptr::Strict; // stable polyfill for strict provenance
    ///
    /// let pointer = &mut 3i64 as *mut i64;
    ///
    /// let atom = AtomicPtr::<i64>::new(pointer);
    /// // Tag the bottom bit of the pointer.
    /// assert_eq!(atom.fetch_or(1, Ordering::Relaxed).addr() & 1, 0);
    /// // Extract and untag.
    /// let tagged = atom.load(Ordering::Relaxed);
    /// assert_eq!(tagged.addr() & 1, 1);
    /// assert_eq!(tagged.map_addr(|p| p & !1), pointer);
    /// ```
    #[inline]
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    pub fn fetch_or(&self, val: usize, order: Ordering) -> *mut T {
        // Ideally, we would always use AtomicPtr::fetch_* since it is strict-provenance
        // compatible, but it is unstable. So, for now use it only on cfg(miri).
        // Code using AtomicUsize::fetch_* via casts is still permissive-provenance
        // compatible and is sound.
        // TODO: Once `#![feature(strict_provenance_atomic_ptr)]` is stabilized,
        // use AtomicPtr::fetch_* in all cases from the version in which it is stabilized.
        #[cfg(all(miri, portable_atomic_unstable_strict_provenance_atomic_ptr))]
        {
            self.inner.fetch_or(val, order)
        }
        #[cfg(not(all(miri, portable_atomic_unstable_strict_provenance_atomic_ptr)))]
        {
            self.as_atomic_usize().fetch_or(val, order) as *mut T
        }
    }

    /// Performs a bitwise "and" operation on the address of the current
    /// pointer, and the argument `val`, and stores a pointer with provenance of
    /// the current pointer and the resulting address.
    ///
    /// This is equivalent equivalent to using [`map_addr`] to atomically
    /// perform `ptr = ptr.map_addr(|a| a & val)`. This can be used in tagged
    /// pointer schemes to atomically unset tag bits.
    ///
    /// **Caveat**: This operation returns the previous value. To compute the
    /// stored value without losing provenance, you may use [`map_addr`]. For
    /// example: `a.fetch_and(val).map_addr(|a| a & val)`.
    ///
    /// `fetch_and` takes an [`Ordering`] argument which describes the memory
    /// ordering of this operation. All ordering modes are possible. Note that
    /// using [`Acquire`] makes the store part of this operation [`Relaxed`],
    /// and using [`Release`] makes the load part [`Relaxed`].
    ///
    /// This API and its claimed semantics are part of the Strict Provenance
    /// experiment, see the [module documentation for `ptr`][crate::ptr] for
    /// details.
    ///
    /// [`map_addr`]: https://doc.rust-lang.org/std/primitive.pointer.html#method.map_addr
    ///
    /// # Examples
    ///
    /// ```
    /// # #![allow(unstable_name_collisions)]
    /// use portable_atomic::{AtomicPtr, Ordering};
    /// use sptr::Strict; // stable polyfill for strict provenance
    ///
    /// let pointer = &mut 3i64 as *mut i64;
    /// // A tagged pointer
    /// let atom = AtomicPtr::<i64>::new(pointer.map_addr(|a| a | 1));
    /// assert_eq!(atom.fetch_or(1, Ordering::Relaxed).addr() & 1, 1);
    /// // Untag, and extract the previously tagged pointer.
    /// let untagged = atom.fetch_and(!1, Ordering::Relaxed).map_addr(|a| a & !1);
    /// assert_eq!(untagged, pointer);
    /// ```
    #[inline]
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    pub fn fetch_and(&self, val: usize, order: Ordering) -> *mut T {
        // Ideally, we would always use AtomicPtr::fetch_* since it is strict-provenance
        // compatible, but it is unstable. So, for now use it only on cfg(miri).
        // Code using AtomicUsize::fetch_* via casts is still permissive-provenance
        // compatible and is sound.
        // TODO: Once `#![feature(strict_provenance_atomic_ptr)]` is stabilized,
        // use AtomicPtr::fetch_* in all cases from the version in which it is stabilized.
        #[cfg(all(miri, portable_atomic_unstable_strict_provenance_atomic_ptr))]
        {
            self.inner.fetch_and(val, order)
        }
        #[cfg(not(all(miri, portable_atomic_unstable_strict_provenance_atomic_ptr)))]
        {
            self.as_atomic_usize().fetch_and(val, order) as *mut T
        }
    }

    /// Performs a bitwise "xor" operation on the address of the current
    /// pointer, and the argument `val`, and stores a pointer with provenance of
    /// the current pointer and the resulting address.
    ///
    /// This is equivalent equivalent to using [`map_addr`] to atomically
    /// perform `ptr = ptr.map_addr(|a| a ^ val)`. This can be used in tagged
    /// pointer schemes to atomically toggle tag bits.
    ///
    /// **Caveat**: This operation returns the previous value. To compute the
    /// stored value without losing provenance, you may use [`map_addr`]. For
    /// example: `a.fetch_xor(val).map_addr(|a| a ^ val)`.
    ///
    /// `fetch_xor` takes an [`Ordering`] argument which describes the memory
    /// ordering of this operation. All ordering modes are possible. Note that
    /// using [`Acquire`] makes the store part of this operation [`Relaxed`],
    /// and using [`Release`] makes the load part [`Relaxed`].
    ///
    /// This API and its claimed semantics are part of the Strict Provenance
    /// experiment, see the [module documentation for `ptr`][crate::ptr] for
    /// details.
    ///
    /// [`map_addr`]: https://doc.rust-lang.org/std/primitive.pointer.html#method.map_addr
    ///
    /// # Examples
    ///
    /// ```
    /// # #![allow(unstable_name_collisions)]
    /// use portable_atomic::{AtomicPtr, Ordering};
    /// use sptr::Strict; // stable polyfill for strict provenance
    ///
    /// let pointer = &mut 3i64 as *mut i64;
    /// let atom = AtomicPtr::<i64>::new(pointer);
    ///
    /// // Toggle a tag bit on the pointer.
    /// atom.fetch_xor(1, Ordering::Relaxed);
    /// assert_eq!(atom.load(Ordering::Relaxed).addr() & 1, 1);
    /// ```
    #[inline]
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    pub fn fetch_xor(&self, val: usize, order: Ordering) -> *mut T {
        // Ideally, we would always use AtomicPtr::fetch_* since it is strict-provenance
        // compatible, but it is unstable. So, for now use it only on cfg(miri).
        // Code using AtomicUsize::fetch_* via casts is still permissive-provenance
        // compatible and is sound.
        // TODO: Once `#![feature(strict_provenance_atomic_ptr)]` is stabilized,
        // use AtomicPtr::fetch_* in all cases from the version in which it is stabilized.
        #[cfg(all(miri, portable_atomic_unstable_strict_provenance_atomic_ptr))]
        {
            self.inner.fetch_xor(val, order)
        }
        #[cfg(not(all(miri, portable_atomic_unstable_strict_provenance_atomic_ptr)))]
        {
            self.as_atomic_usize().fetch_xor(val, order) as *mut T
        }
    }

    #[cfg(not(all(miri, portable_atomic_unstable_strict_provenance_atomic_ptr)))]
    #[inline]
    #[cfg_attr(
        portable_atomic_no_cfg_target_has_atomic,
        cfg(any(
            not(portable_atomic_no_atomic_cas),
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    #[cfg_attr(
        not(portable_atomic_no_cfg_target_has_atomic),
        cfg(any(
            target_has_atomic = "ptr",
            portable_atomic_unsafe_assume_single_core,
            target_arch = "avr",
            target_arch = "msp430"
        ))
    )]
    fn as_atomic_usize(&self) -> &AtomicUsize {
        let [] = [(); core::mem::size_of::<AtomicPtr<()>>() - core::mem::size_of::<AtomicUsize>()];
        let [] =
            [(); core::mem::align_of::<AtomicPtr<()>>() - core::mem::align_of::<AtomicUsize>()];
        // SAFETY: AtomicPtr and AtomicUsize have the same layout,
        // and both access data in the same way.
        unsafe { &*(self as *const AtomicPtr<T> as *const AtomicUsize) }
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

If the compiler and the platform support atomic loads and stores of [`", stringify!($int_type),
"`], this type is a wrapper for the standard library's `", stringify!($atomic_type),
"`. If the platform supports it but the compiler does not, atomic operations are implemented using
inline assembly. Otherwise synchronizes using global locks.
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
                // std atomic types use Relaxed in Debug::fmt: https://github.com/rust-lang/rust/blob/1.63.0/library/core/src/sync/atomic.rs#L1527
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
            doc_comment! {
                concat!(
                    "Creates a new atomic integer.

# Examples

```
use portable_atomic::", stringify!($atomic_type), ";

let atomic_forty_two = ", stringify!($atomic_type), "::new(42);
```"
                ),
                #[inline]
                #[must_use]
                pub const fn new(v: $int_type) -> Self {
                    Self { inner: imp::$atomic_type::new(v), _marker: PhantomData }
                }
            }

            doc_comment! {
                concat!("Returns `true` if operations on values of this type are lock-free.

If the compiler or the platform doesn't support the necessary
atomic instructions, global locks for every potentially
concurrent atomic operation will be used.

# Examples

```
use portable_atomic::", stringify!($atomic_type), ";

let is_lock_free = ", stringify!($atomic_type), "::is_lock_free();
```"),
                #[inline]
                #[must_use]
                pub fn is_lock_free() -> bool {
                    <imp::$atomic_type>::is_lock_free()
                }
            }

            doc_comment! {
                concat!("Returns `true` if operations on values of this type are lock-free.

If the compiler or the platform doesn't support the necessary
atomic instructions, global locks for every potentially
concurrent atomic operation will be used.

**Note:** If the atomic operation relies on dynamic CPU feature detection,
this type may be lock-free even if the function returns false.

# Examples

```
use portable_atomic::", stringify!($atomic_type), ";

const IS_ALWAYS_LOCK_FREE: bool = ", stringify!($atomic_type), "::is_always_lock_free();
```"),
                #[inline]
                #[must_use]
                pub const fn is_always_lock_free() -> bool {
                    <imp::$atomic_type>::is_always_lock_free()
                }
            }

            doc_comment! {
                concat!("Returns a mutable reference to the underlying integer.\n
This is safe because the mutable reference guarantees that no other threads are
concurrently accessing the atomic data.

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let mut some_var = ", stringify!($atomic_type), "::new(10);
assert_eq!(*some_var.get_mut(), 10);
*some_var.get_mut() = 5;
assert_eq!(some_var.load(Ordering::SeqCst), 5);
```"),
                #[inline]
                pub fn get_mut(&mut self) -> &mut $int_type {
                    self.inner.get_mut()
                }
            }

            // TODO: Add from_mut/get_mut_slice/from_mut_slice once it is stable on std atomic types.
            // https://github.com/rust-lang/rust/issues/76314

            doc_comment! {
                concat!("Consumes the atomic and returns the contained value.

This is safe because passing `self` by value guarantees that no other threads are
concurrently accessing the atomic data.

# Examples

```
use portable_atomic::", stringify!($atomic_type), ";

let some_var = ", stringify!($atomic_type), "::new(5);
assert_eq!(some_var.into_inner(), 5);
```"),
                #[inline]
                pub fn into_inner(self) -> $int_type {
                    self.inner.into_inner()
                }
            }

            doc_comment! {
                concat!("Loads a value from the atomic integer.

`load` takes an [`Ordering`] argument which describes the memory ordering of this operation.
Possible values are [`SeqCst`], [`Acquire`] and [`Relaxed`].

# Panics

Panics if `order` is [`Release`] or [`AcqRel`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let some_var = ", stringify!($atomic_type), "::new(5);

assert_eq!(some_var.load(Ordering::Relaxed), 5);
```"),
                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub fn load(&self, order: Ordering) -> $int_type {
                    self.inner.load(order)
                }
            }

            doc_comment! {
                concat!("Stores a value into the atomic integer.

`store` takes an [`Ordering`] argument which describes the memory ordering of this operation.
Possible values are [`SeqCst`], [`Release`] and [`Relaxed`].

# Panics

Panics if `order` is [`Acquire`] or [`AcqRel`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let some_var = ", stringify!($atomic_type), "::new(5);

some_var.store(10, Ordering::Relaxed);
assert_eq!(some_var.load(Ordering::Relaxed), 10);
```"),
                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub fn store(&self, val: $int_type, order: Ordering) {
                    self.inner.store(val, order)
                }
            }

            doc_comment! {
                concat!("Stores a value into the atomic integer, returning the previous value.

`swap` takes an [`Ordering`] argument which describes the memory ordering
of this operation. All ordering modes are possible. Note that using
[`Acquire`] makes the store part of this operation [`Relaxed`], and
using [`Release`] makes the load part [`Relaxed`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let some_var = ", stringify!($atomic_type), "::new(5);

assert_eq!(some_var.swap(10, Ordering::Relaxed), 5);
```"),
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[inline]
                pub fn swap(&self, val: $int_type, order: Ordering) -> $int_type {
                    self.inner.swap(val, order)
                }
            }

            doc_comment! {
                concat!("Stores a value into the atomic integer if the current value is the same as
the `current` value.

The return value is a result indicating whether the new value was written and
containing the previous value. On success this value is guaranteed to be equal to
`current`.

`compare_exchange` takes two [`Ordering`] arguments to describe the memory
ordering of this operation. `success` describes the required ordering for the
read-modify-write operation that takes place if the comparison with `current` succeeds.
`failure` describes the required ordering for the load operation that takes place when
the comparison fails. Using [`Acquire`] as success ordering makes the store part
of this operation [`Relaxed`], and using [`Release`] makes the successful load
[`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].

# Panics

Panics if `failure` is [`Release`], [`AcqRel`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let some_var = ", stringify!($atomic_type), "::new(5);

assert_eq!(
    some_var.compare_exchange(5, 10, Ordering::Acquire, Ordering::Relaxed),
    Ok(5),
);
assert_eq!(some_var.load(Ordering::Relaxed), 10);

assert_eq!(
    some_var.compare_exchange(6, 12, Ordering::SeqCst, Ordering::Acquire),
    Err(10),
);
assert_eq!(some_var.load(Ordering::Relaxed), 10);
```"),
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[inline]
                #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub fn compare_exchange(
                    &self,
                    current: $int_type,
                    new: $int_type,
                    success: Ordering,
                    failure: Ordering,
                ) -> Result<$int_type, $int_type> {
                    self.inner.compare_exchange(current, new, success, failure)
                }
            }

            doc_comment! {
                concat!("Stores a value into the atomic integer if the current value is the same as
the `current` value.
Unlike [`compare_exchange`](Self::compare_exchange)
this function is allowed to spuriously fail even
when the comparison succeeds, which can result in more efficient code on some
platforms. The return value is a result indicating whether the new value was
written and containing the previous value.

`compare_exchange_weak` takes two [`Ordering`] arguments to describe the memory
ordering of this operation. `success` describes the required ordering for the
read-modify-write operation that takes place if the comparison with `current` succeeds.
`failure` describes the required ordering for the load operation that takes place when
the comparison fails. Using [`Acquire`] as success ordering makes the store part
of this operation [`Relaxed`], and using [`Release`] makes the successful load
[`Relaxed`]. The failure ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].

# Panics

Panics if `failure` is [`Release`], [`AcqRel`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let val = ", stringify!($atomic_type), "::new(4);

let mut old = val.load(Ordering::Relaxed);
loop {
    let new = old * 2;
    match val.compare_exchange_weak(old, new, Ordering::SeqCst, Ordering::Relaxed) {
        Ok(_) => break,
        Err(x) => old = x,
    }
}
```"),
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[inline]
                #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
                pub fn compare_exchange_weak(
                    &self,
                    current: $int_type,
                    new: $int_type,
                    success: Ordering,
                    failure: Ordering,
                ) -> Result<$int_type, $int_type> {
                    self.inner.compare_exchange_weak(current, new, success, failure)
                }
            }

            doc_comment! {
                concat!("Adds to the current value, returning the previous value.

This operation wraps around on overflow.

`fetch_add` takes an [`Ordering`] argument which describes the memory ordering
of this operation. All ordering modes are possible. Note that using
[`Acquire`] makes the store part of this operation [`Relaxed`], and
using [`Release`] makes the load part [`Relaxed`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let foo = ", stringify!($atomic_type), "::new(0);
assert_eq!(foo.fetch_add(10, Ordering::SeqCst), 0);
assert_eq!(foo.load(Ordering::SeqCst), 10);
```"),
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[inline]
                pub fn fetch_add(&self, val: $int_type, order: Ordering) -> $int_type {
                    self.inner.fetch_add(val, order)
                }
            }

            doc_comment! {
                concat!("Subtracts from the current value, returning the previous value.

This operation wraps around on overflow.

`fetch_sub` takes an [`Ordering`] argument which describes the memory ordering
of this operation. All ordering modes are possible. Note that using
[`Acquire`] makes the store part of this operation [`Relaxed`], and
using [`Release`] makes the load part [`Relaxed`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let foo = ", stringify!($atomic_type), "::new(20);
assert_eq!(foo.fetch_sub(10, Ordering::SeqCst), 20);
assert_eq!(foo.load(Ordering::SeqCst), 10);
```"),
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[inline]
                pub fn fetch_sub(&self, val: $int_type, order: Ordering) -> $int_type {
                    self.inner.fetch_sub(val, order)
                }
            }

            doc_comment! {
                concat!("Bitwise \"and\" with the current value.

Performs a bitwise \"and\" operation on the current value and the argument `val`, and
sets the new value to the result.

Returns the previous value.

`fetch_and` takes an [`Ordering`] argument which describes the memory ordering
of this operation. All ordering modes are possible. Note that using
[`Acquire`] makes the store part of this operation [`Relaxed`], and
using [`Release`] makes the load part [`Relaxed`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let foo = ", stringify!($atomic_type), "::new(0b101101);
assert_eq!(foo.fetch_and(0b110011, Ordering::SeqCst), 0b101101);
assert_eq!(foo.load(Ordering::SeqCst), 0b100001);
```"),
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[inline]
                pub fn fetch_and(&self, val: $int_type, order: Ordering) -> $int_type {
                    self.inner.fetch_and(val, order)
                }
            }

            doc_comment! {
                concat!("Bitwise \"nand\" with the current value.

Performs a bitwise \"nand\" operation on the current value and the argument `val`, and
sets the new value to the result.

Returns the previous value.

`fetch_nand` takes an [`Ordering`] argument which describes the memory ordering
of this operation. All ordering modes are possible. Note that using
[`Acquire`] makes the store part of this operation [`Relaxed`], and
using [`Release`] makes the load part [`Relaxed`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let foo = ", stringify!($atomic_type), "::new(0x13);
assert_eq!(foo.fetch_nand(0x31, Ordering::SeqCst), 0x13);
assert_eq!(foo.load(Ordering::SeqCst), !(0x13 & 0x31));
```"),
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[inline]
                pub fn fetch_nand(&self, val: $int_type, order: Ordering) -> $int_type {
                    self.inner.fetch_nand(val, order)
                }
            }

            doc_comment! {
                concat!("Bitwise \"or\" with the current value.

Performs a bitwise \"or\" operation on the current value and the argument `val`, and
sets the new value to the result.

Returns the previous value.

`fetch_or` takes an [`Ordering`] argument which describes the memory ordering
of this operation. All ordering modes are possible. Note that using
[`Acquire`] makes the store part of this operation [`Relaxed`], and
using [`Release`] makes the load part [`Relaxed`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let foo = ", stringify!($atomic_type), "::new(0b101101);
assert_eq!(foo.fetch_or(0b110011, Ordering::SeqCst), 0b101101);
assert_eq!(foo.load(Ordering::SeqCst), 0b111111);
```"),
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[inline]
                pub fn fetch_or(&self, val: $int_type, order: Ordering) -> $int_type {
                    self.inner.fetch_or(val, order)
                }
            }

            doc_comment! {
                concat!("Bitwise \"xor\" with the current value.

Performs a bitwise \"xor\" operation on the current value and the argument `val`, and
sets the new value to the result.

Returns the previous value.

`fetch_xor` takes an [`Ordering`] argument which describes the memory ordering
of this operation. All ordering modes are possible. Note that using
[`Acquire`] makes the store part of this operation [`Relaxed`], and
using [`Release`] makes the load part [`Relaxed`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let foo = ", stringify!($atomic_type), "::new(0b101101);
assert_eq!(foo.fetch_xor(0b110011, Ordering::SeqCst), 0b101101);
assert_eq!(foo.load(Ordering::SeqCst), 0b011110);
```"),
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[inline]
                pub fn fetch_xor(&self, val: $int_type, order: Ordering) -> $int_type {
                    self.inner.fetch_xor(val, order)
                }
            }

            doc_comment! {
                concat!("Fetches the value, and applies a function to it that returns an optional
new value. Returns a `Result` of `Ok(previous_value)` if the function returned `Some(_)`, else
`Err(previous_value)`.

Note: This may call the function multiple times if the value has been changed from other threads in
the meantime, as long as the function returns `Some(_)`, but the function will have been applied
only once to the stored value.

`fetch_update` takes two [`Ordering`] arguments to describe the memory ordering of this operation.
The first describes the required ordering for when the operation finally succeeds while the second
describes the required ordering for loads. These correspond to the success and failure orderings of
[`compare_exchange`](Self::compare_exchange) respectively.

Using [`Acquire`] as success ordering makes the store part
of this operation [`Relaxed`], and using [`Release`] makes the final successful load
[`Relaxed`]. The (failed) load ordering can only be [`SeqCst`], [`Acquire`] or [`Relaxed`].

# Panics

Panics if `fetch_order` is [`Release`], [`AcqRel`].

# Examples

```rust
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let x = ", stringify!($atomic_type), "::new(7);
assert_eq!(x.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |_| None), Err(7));
assert_eq!(x.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |x| Some(x + 1)), Ok(7));
assert_eq!(x.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |x| Some(x + 1)), Ok(8));
assert_eq!(x.load(Ordering::SeqCst), 9);
```"),
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[inline]
                #[cfg_attr(
                    all(debug_assertions, not(portable_atomic_no_track_caller)),
                    track_caller
                )]
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
            }

            doc_comment! {
                concat!("Maximum with the current value.

Finds the maximum of the current value and the argument `val`, and
sets the new value to the result.

Returns the previous value.

`fetch_max` takes an [`Ordering`] argument which describes the memory ordering
of this operation. All ordering modes are possible. Note that using
[`Acquire`] makes the store part of this operation [`Relaxed`], and
using [`Release`] makes the load part [`Relaxed`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let foo = ", stringify!($atomic_type), "::new(23);
assert_eq!(foo.fetch_max(42, Ordering::SeqCst), 23);
assert_eq!(foo.load(Ordering::SeqCst), 42);
```

If you want to obtain the maximum value in one step, you can use the following:

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let foo = ", stringify!($atomic_type), "::new(23);
let bar = 42;
let max_foo = foo.fetch_max(bar, Ordering::SeqCst).max(bar);
assert!(max_foo == 42);
```"),
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[inline]
                pub fn fetch_max(&self, val: $int_type, order: Ordering) -> $int_type {
                    self.inner.fetch_max(val, order)
                }
            }

            doc_comment! {
                concat!("Minimum with the current value.

Finds the minimum of the current value and the argument `val`, and
sets the new value to the result.

Returns the previous value.

`fetch_min` takes an [`Ordering`] argument which describes the memory ordering
of this operation. All ordering modes are possible. Note that using
[`Acquire`] makes the store part of this operation [`Relaxed`], and
using [`Release`] makes the load part [`Relaxed`].

# Examples

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let foo = ", stringify!($atomic_type), "::new(23);
assert_eq!(foo.fetch_min(42, Ordering::Relaxed), 23);
assert_eq!(foo.load(Ordering::Relaxed), 23);
assert_eq!(foo.fetch_min(22, Ordering::Relaxed), 23);
assert_eq!(foo.load(Ordering::Relaxed), 22);
```

If you want to obtain the minimum value in one step, you can use the following:

```
use portable_atomic::{", stringify!($atomic_type), ", Ordering};

let foo = ", stringify!($atomic_type), "::new(23);
let bar = 12;
let min_foo = foo.fetch_min(bar, Ordering::SeqCst).min(bar);
assert_eq!(min_foo, 12);
```"),
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(any(
                        not(portable_atomic_no_atomic_cas),
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(any(
                        target_has_atomic = "ptr",
                        portable_atomic_unsafe_assume_single_core,
                        target_arch = "avr",
                        target_arch = "msp430"
                    ))
                )]
                #[inline]
                pub fn fetch_min(&self, val: $int_type, order: Ordering) -> $int_type {
                    self.inner.fetch_min(val, order)
                }
            }

            // TODO: Add as_mut_ptr once it is stable on std atomic types.
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
                // std atomic types use Relaxed in Debug::fmt: https://github.com/rust-lang/rust/blob/1.63.0/library/core/src/sync/atomic.rs#L1527
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
                // SAFETY: the mutable reference guarantees unique ownership.
                // (UnsafeCell::get_mut requires Rust 1.50)
                unsafe { &mut *self.v.get() }
            }

            // TODO: Add from_mut once it is stable on std atomic types.
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
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(
                    target_has_atomic = "ptr",
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
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
            ///
            /// # Panics
            ///
            /// Panics if `failure` is [`Release`], [`AcqRel`].
            #[cfg_attr(
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(
                    target_has_atomic = "ptr",
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[inline]
            #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
            ///
            /// # Panics
            ///
            /// Panics if `failure` is [`Release`], [`AcqRel`].
            #[cfg_attr(
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(
                    target_has_atomic = "ptr",
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[inline]
            #[cfg_attr(docsrs, doc(alias = "compare_and_swap"))]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(
                    target_has_atomic = "ptr",
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
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
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(
                    target_has_atomic = "ptr",
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
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
            ///
            /// # Panics
            ///
            /// Panics if `fetch_order` is [`Release`], [`AcqRel`].
            #[cfg_attr(
                portable_atomic_no_cfg_target_has_atomic,
                cfg(any(
                    not(portable_atomic_no_atomic_cas),
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(
                    target_has_atomic = "ptr",
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[inline]
            #[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
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
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(
                    target_has_atomic = "ptr",
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
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
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(
                    target_has_atomic = "ptr",
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
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
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[cfg_attr(
                not(portable_atomic_no_cfg_target_has_atomic),
                cfg(any(
                    target_has_atomic = "ptr",
                    portable_atomic_unsafe_assume_single_core,
                    target_arch = "avr",
                    target_arch = "msp430"
                ))
            )]
            #[inline]
            pub fn fetch_abs(&self, order: Ordering) -> $float_type {
                const ABS_MASK: $int_type = !0 / 2;
                $float_type::from_bits(self.as_bits().fetch_and(ABS_MASK, order))
            }

            // TODO: Add as_mut_ptr once it is stable on std atomic types.
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

#[cfg(any(not(target_pointer_width = "16"), feature = "fallback"))]
atomic_int!(AtomicI32, i32, 4);
#[cfg(any(not(target_pointer_width = "16"), feature = "fallback"))]
atomic_int!(AtomicU32, u32, 4);

// cfg(any(target_has_atomic = "ptr", target_has_atomic_load_store = "64", all(feature = "fallback", portable_atomic_unsafe_assume_single_core)))
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(
        all(
            feature = "fallback",
            any(
                not(portable_atomic_no_atomic_cas),
                portable_atomic_unsafe_assume_single_core,
                target_arch = "avr",
                target_arch = "msp430"
            )
        ),
        not(portable_atomic_no_atomic_64),
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
    ))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        all(
            feature = "fallback",
            any(
                target_has_atomic = "ptr",
                portable_atomic_unsafe_assume_single_core,
                target_arch = "avr",
                target_arch = "msp430"
            )
        ),
        target_has_atomic = "64",
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
    ))
)]
atomic_int!(AtomicI64, i64, 8);
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(
        all(
            feature = "fallback",
            any(
                not(portable_atomic_no_atomic_cas),
                portable_atomic_unsafe_assume_single_core,
                target_arch = "avr",
                target_arch = "msp430"
            )
        ),
        not(portable_atomic_no_atomic_64),
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
    ))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        all(
            feature = "fallback",
            any(
                target_has_atomic = "ptr",
                portable_atomic_unsafe_assume_single_core,
                target_arch = "avr",
                target_arch = "msp430"
            )
        ),
        target_has_atomic = "64",
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
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
            portable_atomic_asm_experimental_arch,
            any(
                target_feature = "quadword-atomics",
                portable_atomic_target_feature = "quadword-atomics"
            ),
            target_arch = "powerpc64"
        ),
        all(portable_atomic_asm_experimental_arch, target_arch = "s390x"),
    ))
)]
#[cfg_attr(
    all(feature = "fallback", portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        not(portable_atomic_no_atomic_cas),
        portable_atomic_unsafe_assume_single_core,
        target_arch = "avr",
        target_arch = "msp430"
    ))
)]
#[cfg_attr(
    all(feature = "fallback", not(portable_atomic_no_cfg_target_has_atomic)),
    cfg(any(
        target_has_atomic = "ptr",
        portable_atomic_unsafe_assume_single_core,
        target_arch = "avr",
        target_arch = "msp430"
    ))
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
            portable_atomic_asm_experimental_arch,
            any(
                target_feature = "quadword-atomics",
                portable_atomic_target_feature = "quadword-atomics"
            ),
            target_arch = "powerpc64"
        ),
        all(portable_atomic_asm_experimental_arch, target_arch = "s390x"),
    ))
)]
#[cfg_attr(
    all(feature = "fallback", portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        not(portable_atomic_no_atomic_cas),
        portable_atomic_unsafe_assume_single_core,
        target_arch = "avr",
        target_arch = "msp430"
    ))
)]
#[cfg_attr(
    all(feature = "fallback", not(portable_atomic_no_cfg_target_has_atomic)),
    cfg(any(
        target_has_atomic = "ptr",
        portable_atomic_unsafe_assume_single_core,
        target_arch = "avr",
        target_arch = "msp430"
    ))
)]
atomic_int!(AtomicU128, u128, 16);

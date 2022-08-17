#![cfg_attr(not(all(test, feature = "float")), allow(dead_code, unused_macros))]

use core::{cell::UnsafeCell, ops, sync::atomic::Ordering};

use crate::hint;

#[cfg(not(portable_atomic_no_underscore_consts))]
macro_rules! static_assert {
    ($cond:expr $(,)?) => {
        const _: [(); true as usize] = [(); $crate::utils::_assert_is_bool($cond) as usize];
    };
}
#[cfg(not(portable_atomic_no_underscore_consts))]
pub(crate) const fn _assert_is_bool(v: bool) -> bool {
    v
}
#[cfg(portable_atomic_no_underscore_consts)]
macro_rules! static_assert {
    ($($tt:tt)*) => {};
}

macro_rules! static_assert_layout {
    ($atomic_type:ty, $value_type:ident, $align:expr) => {
        static_assert!(
            core::mem::align_of::<$atomic_type>() == core::mem::size_of::<$atomic_type>()
        );
        static_assert!(core::mem::size_of::<$atomic_type>() == core::mem::size_of::<$value_type>());
        static_assert!(core::mem::align_of::<$atomic_type>() == $align);
    };
    ($atomic_type:ty, bool) => {
        static_assert_layout!($atomic_type, u8);
    };
    ($atomic_type:ty, i8) => {
        static_assert_layout!($atomic_type, u8);
    };
    ($atomic_type:ty, u8) => {
        static_assert_layout!($atomic_type, u8, 1);
    };
    ($atomic_type:ty, i16) => {
        static_assert_layout!($atomic_type, u16);
    };
    ($atomic_type:ty, u16) => {
        static_assert_layout!($atomic_type, u16, 2);
    };
    ($atomic_type:ty, i32) => {
        static_assert_layout!($atomic_type, u32);
    };
    ($atomic_type:ty, u32) => {
        static_assert_layout!($atomic_type, u32, 4);
    };
    ($atomic_type:ty, f32) => {
        static_assert_layout!($atomic_type, u32);
    };
    ($atomic_type:ty, i64) => {
        static_assert_layout!($atomic_type, u64);
    };
    ($atomic_type:ty, u64) => {
        static_assert_layout!($atomic_type, u64, 8);
    };
    ($atomic_type:ty, f64) => {
        static_assert_layout!($atomic_type, u64);
    };
    ($atomic_type:ty, i128) => {
        static_assert_layout!($atomic_type, u128);
    };
    ($atomic_type:ty, u128) => {
        static_assert_layout!($atomic_type, u128, 16);
    };
    ($atomic_type:ty, *mut ()) => {
        static_assert_layout!($atomic_type, usize);
    };
    ($atomic_type:ty, isize) => {
        static_assert_layout!($atomic_type, usize);
    };
    ($atomic_type:ty, usize) => {
        #[cfg(target_pointer_width = "16")]
        static_assert_layout!($atomic_type, usize, 2);
        #[cfg(target_pointer_width = "32")]
        static_assert_layout!($atomic_type, usize, 4);
        #[cfg(target_pointer_width = "64")]
        static_assert_layout!($atomic_type, usize, 8);
        #[cfg(target_pointer_width = "128")]
        static_assert_layout!($atomic_type, usize, 16);
    };
}

/// Informs the compiler that this point in the code is not reachable, enabling
/// further optimizations.
///
/// In release mode, this macro calls `core::hint::unreachable_unchecked`.
/// In debug mode, this macro calls `unreachable!` just in case.
///
/// Note: When using `unreachable!`, the compiler cannot eliminate the
/// unreachable branch in some compiler versions, even if the only pattern not
/// covered is `#[non_exhaustive]`: <https://godbolt.org/z/68MnGa4o5>
///
/// # Safety
///
/// Reaching this function is completely undefined behavior.
#[allow(unused_macros)]
macro_rules! unreachable_unchecked {
    ($($tt:tt)*) => {
        if cfg!(debug_assertions) {
            unreachable!($($tt)*);
        } else {
            // SAFETY: the caller must uphold the safety contract for `unreachable_unchecked`.
            // (To force the caller to use unsafe block for this macro, do not use
            // unsafe block here.)
            core::hint::unreachable_unchecked()
        }
    };
}

macro_rules! doc_comment {
    ($doc:expr, $($tt:tt)*) => {
        #[doc = $doc]
        $($tt)*
    };
}

macro_rules! serde_impls {
    ($atomic_type:ident) => {
        #[cfg(feature = "serde")]
        #[cfg_attr(docsrs, doc(cfg(feature = "serde")))]
        impl serde::Serialize for $atomic_type {
            #[allow(clippy::missing_inline_in_public_items)] // serde doesn't use inline on std atomic's Serialize/Deserialize impl
            fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
            where
                S: serde::Serializer,
            {
                // https://github.com/serde-rs/serde/blob/v1.0.136/serde/src/ser/impls.rs#L918-L919
                self.load(Ordering::SeqCst).serialize(serializer)
            }
        }
        #[cfg(feature = "serde")]
        #[cfg_attr(docsrs, doc(cfg(feature = "serde")))]
        impl<'de> serde::Deserialize<'de> for $atomic_type {
            #[allow(clippy::missing_inline_in_public_items)] // serde doesn't use inline on std atomic's Serialize/Deserialize impl
            fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
            where
                D: serde::Deserializer<'de>,
            {
                serde::Deserialize::deserialize(deserializer).map(Self::new)
            }
        }
    };
}

// Adapted from https://github.com/BurntSushi/memchr/blob/2.4.1/src/memchr/x86/mod.rs#L9-L71.
#[allow(unused_macros)]
macro_rules! ifunc {
    // if the functions are unsafe, this macro is also unsafe.
    (unsafe fn($($arg_pat:ident: $arg_ty:ty),*) $(-> $ret_ty:ty)?; $if_block:expr) => {{
        type FnRaw = *mut ();
        type FnTy = unsafe fn($($arg_ty),*) $(-> $ret_ty)?;
        static FUNC: core::sync::atomic::AtomicPtr<()>
            = core::sync::atomic::AtomicPtr::new(detect as FnRaw);
        #[cold]
        unsafe fn detect($($arg_pat: $arg_ty),*) $(-> $ret_ty)? {
            let func: FnTy = $if_block;
            FUNC.store(func as FnRaw, core::sync::atomic::Ordering::Relaxed);
            // SAFETY: the caller must uphold the safety contract.
            unsafe { func($($arg_pat),*) }
        }
        // SAFETY: `FnTy` is a function pointer, which is always safe to transmute with a `*mut ()`.
        // the caller must uphold the remaining safety contract.
        // (To force the caller to use unsafe block for this macro, do not use
        // unsafe block here.)
        let func = FUNC.load(core::sync::atomic::Ordering::Relaxed);
        core::mem::transmute::<FnRaw, FnTy>(func)($($arg_pat),*)
    }};
    (fn($($arg_pat:ident: $arg_ty:ty),*) $(-> $ret_ty:ty)?; $if_block:expr) => {{
        type FnRaw = *mut ();
        type FnTy = fn($($arg_ty),*) $(-> $ret_ty)?;
        static FUNC: core::sync::atomic::AtomicPtr<()>
            = core::sync::atomic::AtomicPtr::new(detect as FnRaw);
        #[cold]
        fn detect($($arg_pat: $arg_ty),*) $(-> $ret_ty)? {
            let func: FnTy = $if_block;
            FUNC.store(func as FnRaw, core::sync::atomic::Ordering::Relaxed);
            func($($arg_pat),*)
        }
        // SAFETY: `FnTy` is a function pointer, which is always safe to transmute with a `*mut ()`.
        let func = unsafe {
            core::mem::transmute::<FnRaw, FnTy>(FUNC.load(core::sync::atomic::Ordering::Relaxed))
        };
        func($($arg_pat),*)
    }};
}

pub(crate) struct NoRefUnwindSafe(UnsafeCell<()>);
// SAFETY: this is a marker type and we'll never access the value.
unsafe impl Sync for NoRefUnwindSafe {}

// https://github.com/rust-lang/rust/blob/1.63.0/library/core/src/sync/atomic.rs#L2563
#[inline]
pub(crate) fn strongest_failure_ordering(order: Ordering) -> Ordering {
    match order {
        Ordering::Release | Ordering::Relaxed => Ordering::Relaxed,
        Ordering::SeqCst => Ordering::SeqCst,
        Ordering::Acquire | Ordering::AcqRel => Ordering::Acquire,
        _ => unreachable!("{:?}", order),
    }
}

// https://github.com/rust-lang/rust/blob/7b68106ffb71f853ea32f0e0dc0785d9d647cbbf/library/core/src/sync/atomic.rs#L2624
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub(crate) fn assert_load_ordering(order: Ordering) {
    match order {
        Ordering::Acquire | Ordering::Relaxed | Ordering::SeqCst => {}
        Ordering::Release => panic!("there is no such thing as a release load"),
        Ordering::AcqRel => panic!("there is no such thing as an acquire-release load"),
        _ => unreachable!("{:?}", order),
    }
}

// https://github.com/rust-lang/rust/blob/7b68106ffb71f853ea32f0e0dc0785d9d647cbbf/library/core/src/sync/atomic.rs#L2610
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub(crate) fn assert_store_ordering(order: Ordering) {
    match order {
        Ordering::Release | Ordering::Relaxed | Ordering::SeqCst => {}
        Ordering::Acquire => panic!("there is no such thing as an acquire store"),
        Ordering::AcqRel => panic!("there is no such thing as an acquire-release store"),
        _ => unreachable!("{:?}", order),
    }
}

#[allow(dead_code)]
#[inline]
pub(crate) fn assert_swap_ordering(order: Ordering) {
    match order {
        Ordering::AcqRel
        | Ordering::Acquire
        | Ordering::Relaxed
        | Ordering::Release
        | Ordering::SeqCst => {}
        _ => unreachable!("{:?}", order),
    }
}

// https://github.com/rust-lang/rust/pull/98383
// https://github.com/rust-lang/rust/blob/7b68106ffb71f853ea32f0e0dc0785d9d647cbbf/library/core/src/sync/atomic.rs#L2686
#[inline]
#[cfg_attr(all(debug_assertions, not(portable_atomic_no_track_caller)), track_caller)]
pub(crate) fn assert_compare_exchange_ordering(success: Ordering, failure: Ordering) {
    match success {
        Ordering::AcqRel
        | Ordering::Acquire
        | Ordering::Relaxed
        | Ordering::Release
        | Ordering::SeqCst => {}
        _ => unreachable!("{:?}, {:?}", success, failure),
    }
    match failure {
        Ordering::Acquire | Ordering::Relaxed | Ordering::SeqCst => {}
        Ordering::Release => panic!("there is no such thing as a release failure ordering"),
        Ordering::AcqRel => panic!("there is no such thing as an acquire-release failure ordering"),
        _ => unreachable!("{:?}, {:?}", success, failure),
    }
}

// https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0418r2.html
#[allow(dead_code)]
#[inline]
pub(crate) fn upgrade_success_ordering(success: Ordering, failure: Ordering) -> Ordering {
    match (success, failure) {
        (Ordering::Relaxed, Ordering::Acquire) => Ordering::Acquire,
        (Ordering::Release, Ordering::Acquire) => Ordering::AcqRel,
        (_, Ordering::SeqCst) => Ordering::SeqCst,
        _ => success,
    }
}

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.7/crossbeam-utils/src/cache_padded.rs.
/// Pads and aligns a value to the length of a cache line.
// Starting from Intel's Sandy Bridge, spatial prefetcher is now pulling pairs of 64-byte cache
// lines at a time, so we have to align to 128 bytes rather than 64.
//
// Sources:
// - https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-optimization-manual.pdf
// - https://github.com/facebook/folly/blob/1b5288e6eea6df074758f877c849b6e73bbb9fbb/folly/lang/Align.h#L107
//
// ARM's big.LITTLE architecture has asymmetric cores and "big" cores have 128-byte cache line size.
//
// Sources:
// - https://www.mono-project.com/news/2016/09/12/arm64-icache/
//
// powerpc64 has 128-byte cache line size.
//
// Sources:
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_ppc64x.go#L9
#[cfg_attr(
    any(target_arch = "x86_64", target_arch = "aarch64", target_arch = "powerpc64"),
    repr(align(128))
)]
// arm, mips, mips64, and riscv64 have 32-byte cache line size.
//
// Sources:
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_arm.go#L7
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_mips.go#L7
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_mipsle.go#L7
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_mips64x.go#L9
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_riscv64.go#L7
#[cfg_attr(
    any(
        target_arch = "arm",
        target_arch = "mips",
        target_arch = "mips64",
        target_arch = "riscv64",
    ),
    repr(align(32))
)]
// s390x has 256-byte cache line size.
//
// Sources:
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_s390x.go#L7
#[cfg_attr(target_arch = "s390x", repr(align(256)))]
// x86 and wasm have 64-byte cache line size.
//
// Sources:
// - https://github.com/golang/go/blob/dda2991c2ea0c5914714469c4defc2562a907230/src/internal/cpu/cpu_x86.go#L9
// - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_wasm.go#L7
//
// All others are assumed to have 64-byte cache line size.
#[cfg_attr(
    not(any(
        target_arch = "x86_64",
        target_arch = "aarch64",
        target_arch = "powerpc64",
        target_arch = "arm",
        target_arch = "mips",
        target_arch = "mips64",
        target_arch = "riscv64",
        target_arch = "s390x",
    )),
    repr(align(64))
)]
pub(crate) struct CachePadded<T> {
    value: T,
}

impl<T> CachePadded<T> {
    #[inline]
    pub(crate) const fn new(value: T) -> Self {
        Self { value }
    }
}

impl<T> ops::Deref for CachePadded<T> {
    type Target = T;

    #[inline]
    fn deref(&self) -> &T {
        &self.value
    }
}

impl<T> ops::DerefMut for CachePadded<T> {
    #[inline]
    fn deref_mut(&mut self) -> &mut T {
        &mut self.value
    }
}

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.7/crossbeam-utils/src/backoff.rs.
// Adjusted to reduce spinning.
/// Performs exponential backoff in spin loops.
pub(crate) struct Backoff {
    step: u32,
}

// https://github.com/oneapi-src/oneTBB/blob/v2021.5.0/include/oneapi/tbb/detail/_utils.h#L46-L48
const SPIN_LIMIT: u32 = 4;

impl Backoff {
    #[inline]
    pub(crate) fn new() -> Self {
        Self { step: 0 }
    }

    #[inline]
    pub(crate) fn snooze(&mut self) {
        if self.step <= SPIN_LIMIT {
            for _ in 0..1 << self.step {
                hint::spin_loop();
            }
            self.step += 1;
        } else {
            #[cfg(not(feature = "std"))]
            for _ in 0..1 << self.step {
                hint::spin_loop();
            }

            #[cfg(feature = "std")]
            std::thread::yield_now();
        }
    }
}

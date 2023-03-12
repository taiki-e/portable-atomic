#![cfg_attr(not(all(test, feature = "float")), allow(dead_code, unused_macros))]

use core::sync::atomic::Ordering;

macro_rules! static_assert {
    ($cond:expr $(,)?) => {{
        let [] = [(); true as usize - $crate::utils::_assert_is_bool($cond) as usize];
    }};
}
pub(crate) const fn _assert_is_bool(v: bool) -> bool {
    v
}

macro_rules! static_assert_layout {
    ($atomic_type:ty, $value_type:ty) => {
        static_assert!(
            core::mem::align_of::<$atomic_type>() == core::mem::size_of::<$atomic_type>()
        );
        static_assert!(core::mem::size_of::<$atomic_type>() == core::mem::size_of::<$value_type>());
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
                // https://github.com/serde-rs/serde/blob/v1.0.152/serde/src/ser/impls.rs#L958-L959
                self.load(Ordering::Relaxed).serialize(serializer)
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
#[cfg(not(portable_atomic_no_outline_atomics))]
#[cfg(any(target_arch = "aarch64", all(target_arch = "x86_64", not(target_env = "sgx"))))]
macro_rules! ifunc {
    (unsafe fn($($arg_pat:ident: $arg_ty:ty),*) $(-> $ret_ty:ty)? { $($detect_body:tt)* }) => {{
        type FnTy = unsafe fn($($arg_ty),*) $(-> $ret_ty)?;
        static FUNC: core::sync::atomic::AtomicPtr<()>
            = core::sync::atomic::AtomicPtr::new(detect as *mut ());
        #[cold]
        unsafe fn detect($($arg_pat: $arg_ty),*) $(-> $ret_ty)? {
            let func: FnTy = { $($detect_body)* };
            FUNC.store(func as *mut (), core::sync::atomic::Ordering::Relaxed);
            // SAFETY: the caller must uphold the safety contract for the function returned by $detect_body.
            unsafe { func($($arg_pat),*) }
        }
        // SAFETY: `FnTy` is a function pointer, which is always safe to transmute with a `*mut ()`.
        // (To force the caller to use unsafe block for this macro, do not use
        // unsafe block here.)
        let func = {
            core::mem::transmute::<*mut (), FnTy>(FUNC.load(core::sync::atomic::Ordering::Relaxed))
        };
        // SAFETY: the caller must uphold the safety contract for the function returned by $body.
        // (To force the caller to use unsafe block for this macro, do not use
        // unsafe block here.)
        func($($arg_pat),*)
    }};
}

macro_rules! const_fn {
    (
        const_if: #[cfg($($cfg:tt)+)];
        $(#[$($attr:tt)*])* $vis:vis const fn $($rest:tt)*
    ) => {
        #[cfg($($cfg)+)]
        $(#[$($attr)*])*
        $vis const fn $($rest)*
        #[cfg(not($($cfg)+))]
        $(#[$($attr)*])*
        $vis fn $($rest)*
    };
}

// We do not provide `nand` because it cannot be optimized on neither x86 nor MSP430.
// https://godbolt.org/z/x88voWGov
macro_rules! no_fetch_ops_impl {
    ($atomic_type:ident, bool) => {
        impl $atomic_type {
            #[inline]
            pub(crate) fn and(&self, val: bool, order: Ordering) {
                self.fetch_and(val, order);
            }
            #[inline]
            pub(crate) fn or(&self, val: bool, order: Ordering) {
                self.fetch_or(val, order);
            }
            #[inline]
            pub(crate) fn xor(&self, val: bool, order: Ordering) {
                self.fetch_xor(val, order);
            }
        }
    };
    ($atomic_type:ident, $int_type:ident) => {
        impl $atomic_type {
            #[inline]
            pub(crate) fn add(&self, val: $int_type, order: Ordering) {
                self.fetch_add(val, order);
            }
            #[inline]
            pub(crate) fn sub(&self, val: $int_type, order: Ordering) {
                self.fetch_sub(val, order);
            }
            #[inline]
            pub(crate) fn and(&self, val: $int_type, order: Ordering) {
                self.fetch_and(val, order);
            }
            #[inline]
            pub(crate) fn or(&self, val: $int_type, order: Ordering) {
                self.fetch_or(val, order);
            }
            #[inline]
            pub(crate) fn xor(&self, val: $int_type, order: Ordering) {
                self.fetch_xor(val, order);
            }
        }
    };
}
macro_rules! bit_opts_fetch_impl {
    ($atomic_type:ident, $int_type:ident) => {
        impl $atomic_type {
            #[inline]
            pub(crate) fn bit_set(&self, bit: u32, order: Ordering) -> bool {
                let mask = (1 as $int_type).wrapping_shl(bit);
                self.fetch_or(mask, order) & mask != 0
            }
            #[inline]
            pub(crate) fn bit_clear(&self, bit: u32, order: Ordering) -> bool {
                let mask = (1 as $int_type).wrapping_shl(bit);
                self.fetch_and(!mask, order) & mask != 0
            }
            #[inline]
            pub(crate) fn bit_toggle(&self, bit: u32, order: Ordering) -> bool {
                let mask = (1 as $int_type).wrapping_shl(bit);
                self.fetch_xor(mask, order) & mask != 0
            }
        }
    };
}

// https://github.com/rust-lang/rust/blob/1.67.0/library/core/src/sync/atomic.rs#L2956
#[allow(dead_code)]
#[inline]
pub(crate) fn strongest_failure_ordering(order: Ordering) -> Ordering {
    match order {
        Ordering::Release | Ordering::Relaxed => Ordering::Relaxed,
        Ordering::SeqCst => Ordering::SeqCst,
        Ordering::Acquire | Ordering::AcqRel => Ordering::Acquire,
        _ => unreachable!("{:?}", order),
    }
}

// https://github.com/rust-lang/rust/blob/1.67.0/library/core/src/sync/atomic.rs#L2983
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

// https://github.com/rust-lang/rust/blob/1.67.0/library/core/src/sync/atomic.rs#L2968
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

// The function called in dynamic detection cannot be inlined, so we use
// unreachable_unchecked! macro to remove the panic path (see also macro docs).
// Since Ordering is non_exhaustive, the caller of such a function must use this
// assertion to prevent UB due to the addition of new orderings.
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
// https://github.com/rust-lang/rust/blob/1.67.0/library/core/src/sync/atomic.rs#L3049
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

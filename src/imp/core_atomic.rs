//! Re-exports of the standard library's atomic types.

macro_rules! atomic {
    ($($atomic_type:ident),*) => {$(
        pub(crate) use core::sync::atomic::$atomic_type;
        impl crate::utils::AtomicRepr for $atomic_type {
            const IS_ALWAYS_LOCK_FREE: bool = true;
            #[inline]
            fn is_lock_free() -> bool {
                true
            }
        }
    )*};
}

pub(crate) use core::sync::atomic::AtomicPtr;
impl<T> crate::utils::AtomicRepr for AtomicPtr<T> {
    const IS_ALWAYS_LOCK_FREE: bool = true;
    #[inline]
    fn is_lock_free() -> bool {
        true
    }
}

atomic!(AtomicBool, AtomicIsize, AtomicUsize);
atomic!(AtomicI8, AtomicI16, AtomicU8, AtomicU16);
#[cfg(not(target_pointer_width = "16"))] // cfg(target_has_atomic_load_store = "32")
atomic!(AtomicI32, AtomicU32);
#[cfg_attr(not(portable_atomic_cfg_target_has_atomic), cfg(not(portable_atomic_no_atomic_64)))]
#[cfg_attr(
    portable_atomic_cfg_target_has_atomic,
    cfg(any(target_has_atomic = "64", target_pointer_width = "64")) // cfg(target_has_atomic_load_store = "64")
)]
atomic!(AtomicI64, AtomicU64);
#[cfg(portable_atomic_atomic_128)]
atomic!(AtomicI128, AtomicU128);

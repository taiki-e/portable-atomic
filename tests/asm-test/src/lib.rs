// SPDX-License-Identifier: Apache-2.0 OR MIT

#![no_std]
#![allow(unused, internal_features, unsafe_op_in_unsafe_fn)]
#![cfg_attr(feature = "core", feature(cfg_target_has_atomic, core_intrinsics))]
#![cfg_attr(feature = "core", cfg(not(target_arch = "xtensa")))] // TODO: new atomic intrinsics not available yet

// TODO: bit_* (for x86 opt), float (for aarch64 opt)

// -----------------------------------------------------------------------------
// feature = "portable-atomic"

#[cfg(feature = "portable-atomic")]
pub mod load {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A) -> T {
                        a.load(Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A) -> T {
                        a.load(Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A) -> T {
                        a.load(Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(bool);
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
pub mod store {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) {
                        a.store(val, Ordering::Relaxed);
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) {
                        a.store(val, Ordering::Release);
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) {
                        a.store(val, Ordering::SeqCst);
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(bool);
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod swap {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) -> T {
                        a.swap(val, Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) -> T {
                        a.swap(val, Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) -> T {
                        a.swap(val, Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) -> T {
                        a.swap(val, Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) -> T {
                        a.swap(val, Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(bool);
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod compare_exchange {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::Relaxed,
                            Ordering::Relaxed,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn relaxed_acquire(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::Relaxed,
                            Ordering::Acquire,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn relaxed_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::Relaxed,
                            Ordering::SeqCst,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn acquire_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::Acquire,
                            Ordering::Relaxed,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn acquire_acquire(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::Acquire,
                            Ordering::Acquire,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn acquire_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::Acquire,
                            Ordering::SeqCst,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn release_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::Release,
                            Ordering::Relaxed,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn release_acquire(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::Release,
                            Ordering::Acquire,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn release_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::Release,
                            Ordering::SeqCst,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::AcqRel,
                            Ordering::Relaxed,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel_acquire(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::AcqRel,
                            Ordering::Acquire,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::AcqRel,
                            Ordering::SeqCst,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::SeqCst,
                            Ordering::Relaxed,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst_acquire(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::SeqCst,
                            Ordering::Acquire,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange(
                            old,
                            new,
                            Ordering::SeqCst,
                            Ordering::SeqCst,
                        )
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(bool);
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod compare_exchange_weak {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::Relaxed,
                            Ordering::Relaxed,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn relaxed_acquire(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::Relaxed,
                            Ordering::Acquire,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn relaxed_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::Relaxed,
                            Ordering::SeqCst,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn acquire_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::Acquire,
                            Ordering::Relaxed,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn acquire_acquire(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::Acquire,
                            Ordering::Acquire,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn acquire_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::Acquire,
                            Ordering::SeqCst,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn release_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::Release,
                            Ordering::Relaxed,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn release_acquire(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::Release,
                            Ordering::Acquire,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn release_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::Release,
                            Ordering::SeqCst,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::AcqRel,
                            Ordering::Relaxed,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel_acquire(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::AcqRel,
                            Ordering::Acquire,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::AcqRel,
                            Ordering::SeqCst,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::SeqCst,
                            Ordering::Relaxed,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst_acquire(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::SeqCst,
                            Ordering::Acquire,
                        )
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                        a.compare_exchange_weak(
                            old,
                            new,
                            Ordering::SeqCst,
                            Ordering::SeqCst,
                        )
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(bool);
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod fetch_add {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) -> T {
                        a.fetch_add(val, Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) -> T {
                        a.fetch_add(val, Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) -> T {
                        a.fetch_add(val, Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) -> T {
                        a.fetch_add(val, Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) -> T {
                        a.fetch_add(val, Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod add {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) {
                        a.add(val, Ordering::Relaxed);
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) {
                        a.add(val, Ordering::Acquire);
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) {
                        a.add(val, Ordering::Release);
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) {
                        a.add(val, Ordering::AcqRel);
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) {
                        a.add(val, Ordering::SeqCst);
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod fetch_sub {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) -> T {
                        a.fetch_sub(val, Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) -> T {
                        a.fetch_sub(val, Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) -> T {
                        a.fetch_sub(val, Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) -> T {
                        a.fetch_sub(val, Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) -> T {
                        a.fetch_sub(val, Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod sub {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) {
                        a.sub(val, Ordering::Relaxed);
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) {
                        a.sub(val, Ordering::Acquire);
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) {
                        a.sub(val, Ordering::Release);
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) {
                        a.sub(val, Ordering::AcqRel);
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) {
                        a.sub(val, Ordering::SeqCst);
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod fetch_and {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) -> T {
                        a.fetch_and(val, Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) -> T {
                        a.fetch_and(val, Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) -> T {
                        a.fetch_and(val, Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) -> T {
                        a.fetch_and(val, Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) -> T {
                        a.fetch_and(val, Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(bool);
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod and {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) {
                        a.and(val, Ordering::Relaxed);
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) {
                        a.and(val, Ordering::Acquire);
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) {
                        a.and(val, Ordering::Release);
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) {
                        a.and(val, Ordering::AcqRel);
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) {
                        a.and(val, Ordering::SeqCst);
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod fetch_nand {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) -> T {
                        a.fetch_nand(val, Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) -> T {
                        a.fetch_nand(val, Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) -> T {
                        a.fetch_nand(val, Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) -> T {
                        a.fetch_nand(val, Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) -> T {
                        a.fetch_nand(val, Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(bool);
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod fetch_or {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) -> T {
                        a.fetch_or(val, Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) -> T {
                        a.fetch_or(val, Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) -> T {
                        a.fetch_or(val, Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) -> T {
                        a.fetch_or(val, Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) -> T {
                        a.fetch_or(val, Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(bool);
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod or {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) {
                        a.or(val, Ordering::Relaxed);
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) {
                        a.or(val, Ordering::Acquire);
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) {
                        a.or(val, Ordering::Release);
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) {
                        a.or(val, Ordering::AcqRel);
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) {
                        a.or(val, Ordering::SeqCst);
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod fetch_xor {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) -> T {
                        a.fetch_xor(val, Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) -> T {
                        a.fetch_xor(val, Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) -> T {
                        a.fetch_xor(val, Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) -> T {
                        a.fetch_xor(val, Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) -> T {
                        a.fetch_xor(val, Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(bool);
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod xor {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) {
                        a.xor(val, Ordering::Relaxed);
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) {
                        a.xor(val, Ordering::Acquire);
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) {
                        a.xor(val, Ordering::Release);
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) {
                        a.xor(val, Ordering::AcqRel);
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) {
                        a.xor(val, Ordering::SeqCst);
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod fetch_not {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A) -> T {
                        a.fetch_not(Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A) -> T {
                        a.fetch_not(Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A) -> T {
                        a.fetch_not(Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A) -> T {
                        a.fetch_not(Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A) -> T {
                        a.fetch_not(Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(bool);
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod not {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A) {
                        a.not(Ordering::Relaxed);
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A) {
                        a.not(Ordering::Acquire);
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A) {
                        a.not(Ordering::Release);
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A) {
                        a.not(Ordering::AcqRel);
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A) {
                        a.not(Ordering::SeqCst);
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod fetch_neg {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A) -> T {
                        a.fetch_neg(Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A) -> T {
                        a.fetch_neg(Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A) -> T {
                        a.fetch_neg(Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A) -> T {
                        a.fetch_neg(Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A) -> T {
                        a.fetch_neg(Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod neg {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A) {
                        a.neg(Ordering::Relaxed);
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A) {
                        a.neg(Ordering::Acquire);
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A) {
                        a.neg(Ordering::Release);
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A) {
                        a.neg(Ordering::AcqRel);
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A) {
                        a.neg(Ordering::SeqCst);
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod fetch_max {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) -> T {
                        a.fetch_max(val, Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) -> T {
                        a.fetch_max(val, Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) -> T {
                        a.fetch_max(val, Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) -> T {
                        a.fetch_max(val, Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) -> T {
                        a.fetch_max(val, Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(i8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(i16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(i32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(i64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(i64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(i128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod fetch_umax {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) -> T {
                        a.fetch_max(val, Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) -> T {
                        a.fetch_max(val, Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) -> T {
                        a.fetch_max(val, Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) -> T {
                        a.fetch_max(val, Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) -> T {
                        a.fetch_max(val, Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod fetch_min {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) -> T {
                        a.fetch_min(val, Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) -> T {
                        a.fetch_min(val, Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) -> T {
                        a.fetch_min(val, Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) -> T {
                        a.fetch_min(val, Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) -> T {
                        a.fetch_min(val, Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(i8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(i16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(i32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(i64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(i64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(i128);
    }
}
#[cfg(feature = "portable-atomic")]
#[cfg(any(
    target_has_atomic = "ptr",
    target_arch = "avr",
    target_arch = "msp430",
    target_feature = "zalrsc",
    target_feature = "zacas",
    portable_atomic_unsafe_assume_single_core,
))]
pub mod fetch_umin {
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    use core::sync::atomic::Ordering;
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    #[inline(never)]
                    pub unsafe fn relaxed(a: A, val: T) -> T {
                        a.fetch_min(val, Ordering::Relaxed)
                    }
                    #[inline(never)]
                    pub unsafe fn acquire(a: A, val: T) -> T {
                        a.fetch_min(val, Ordering::Acquire)
                    }
                    #[inline(never)]
                    pub unsafe fn release(a: A, val: T) -> T {
                        a.fetch_min(val, Ordering::Release)
                    }
                    #[inline(never)]
                    pub unsafe fn acqrel(a: A, val: T) -> T {
                        a.fetch_min(val, Ordering::AcqRel)
                    }
                    #[inline(never)]
                    pub unsafe fn seqcst(a: A, val: T) -> T {
                        a.fetch_min(val, Ordering::SeqCst)
                    }
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
    }
}

// -----------------------------------------------------------------------------
// feature = "core"

#[cfg(feature = "core")]
macro_rules! atomic_update {
    ($t:ident) => {
        mod $t {
            use core::intrinsics::AtomicOrdering;
            pub(crate) use core::sync::atomic::Ordering;
            #[inline(always)]
            pub(crate) unsafe fn atomic_update<F>(dst: *mut $t, order: Ordering, mut f: F) -> $t
            where
                F: FnMut($t) -> $t,
            {
                // This is a private function and all instances of `f` only operate on the value
                // loaded, so there is no need to synchronize the first load/failed CAS.
                let mut old = core::intrinsics::atomic_load::<_, { AtomicOrdering::Relaxed }>(dst);
                loop {
                    let next = f(old);
                    let (x, ok) = match order {
                        Ordering::Relaxed => core::intrinsics::atomic_cxchgweak::<
                            _,
                            { AtomicOrdering::Relaxed },
                            { AtomicOrdering::Relaxed },
                        >(dst, old, next),
                        Ordering::Acquire => core::intrinsics::atomic_cxchgweak::<
                            _,
                            { AtomicOrdering::Acquire },
                            { AtomicOrdering::Relaxed },
                        >(dst, old, next),
                        Ordering::Release => core::intrinsics::atomic_cxchgweak::<
                            _,
                            { AtomicOrdering::Release },
                            { AtomicOrdering::Relaxed },
                        >(dst, old, next),
                        Ordering::AcqRel => core::intrinsics::atomic_cxchgweak::<
                            _,
                            { AtomicOrdering::AcqRel },
                            { AtomicOrdering::Relaxed },
                        >(dst, old, next),
                        Ordering::SeqCst => core::intrinsics::atomic_cxchgweak::<
                            _,
                            { AtomicOrdering::SeqCst },
                            { AtomicOrdering::Relaxed },
                        >(dst, old, next),
                        _ => unreachable!(),
                    };
                    if ok {
                        return x;
                    }
                    old = x;
                }
            }
        }
    };
}
#[cfg(feature = "core")]
#[cfg(target_has_atomic = "8")]
atomic_update!(u8);
#[cfg(feature = "core")]
#[cfg(target_has_atomic = "16")]
atomic_update!(u16);
#[cfg(feature = "core")]
#[cfg(target_has_atomic = "32")]
atomic_update!(u32);
#[cfg(feature = "core")]
#[cfg(target_has_atomic = "64")]
atomic_update!(u64);
#[cfg(feature = "core")]
#[cfg(any(
    target_arch = "aarch64",
    target_arch = "arm64ec",
    all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
    target_arch = "s390x",
    all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
))]
atomic_update!(u128);
#[cfg(feature = "core")]
pub mod load {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A) -> T {
                    core::intrinsics::atomic_load::<_, { AtomicOrdering::Relaxed }>(a)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A) -> T {
                    core::intrinsics::atomic_load::<_, { AtomicOrdering::Acquire }>(a)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A) -> T {
                    core::intrinsics::atomic_load::<_, { AtomicOrdering::SeqCst }>(a)
                }
            }
        };
    }
    #[cfg(target_has_atomic_load_store = "8")]
    t!(u8);
    #[cfg(target_has_atomic_load_store = "16")]
    t!(u16);
    #[cfg(target_has_atomic_load_store = "32")]
    t!(u32);
    #[cfg(target_has_atomic_load_store = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
}
#[cfg(feature = "core")]
pub mod store {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) {
                    core::intrinsics::atomic_store::<_, { AtomicOrdering::Relaxed }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) {
                    core::intrinsics::atomic_store::<_, { AtomicOrdering::Release }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) {
                    core::intrinsics::atomic_store::<_, { AtomicOrdering::SeqCst }>(a, val)
                }
            }
        };
    }
    #[cfg(target_has_atomic_load_store = "8")]
    t!(u8);
    #[cfg(target_has_atomic_load_store = "16")]
    t!(u16);
    #[cfg(target_has_atomic_load_store = "32")]
    t!(u32);
    #[cfg(target_has_atomic_load_store = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
}
#[cfg(feature = "core")]
pub mod swap {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    core::intrinsics::atomic_xchg::<_, { AtomicOrdering::Relaxed }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    core::intrinsics::atomic_xchg::<_, { AtomicOrdering::Acquire }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    core::intrinsics::atomic_xchg::<_, { AtomicOrdering::Release }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    core::intrinsics::atomic_xchg::<_, { AtomicOrdering::AcqRel }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    core::intrinsics::atomic_xchg::<_, { AtomicOrdering::SeqCst }>(a, val)
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(u8);
    #[cfg(target_has_atomic = "16")]
    t!(u16);
    #[cfg(target_has_atomic = "32")]
    t!(u32);
    #[cfg(target_has_atomic = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
}
#[cfg(feature = "core")]
pub mod compare_exchange {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::Relaxed },
                        { AtomicOrdering::Relaxed },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn relaxed_acquire(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::Relaxed },
                        { AtomicOrdering::Acquire },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn relaxed_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::Relaxed },
                        { AtomicOrdering::SeqCst },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn acquire_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::Acquire },
                        { AtomicOrdering::Relaxed },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn acquire_acquire(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::Acquire },
                        { AtomicOrdering::Acquire },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn acquire_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::Acquire },
                        { AtomicOrdering::SeqCst },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn release_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::Release },
                        { AtomicOrdering::Relaxed },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn release_acquire(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::Release },
                        { AtomicOrdering::Acquire },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn release_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::Release },
                        { AtomicOrdering::SeqCst },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn acqrel_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::AcqRel },
                        { AtomicOrdering::Relaxed },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn acqrel_acquire(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::AcqRel },
                        { AtomicOrdering::Acquire },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn acqrel_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::AcqRel },
                        { AtomicOrdering::SeqCst },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn seqcst_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::SeqCst },
                        { AtomicOrdering::Relaxed },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn seqcst_acquire(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::SeqCst },
                        { AtomicOrdering::Acquire },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn seqcst_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchg::<
                        _,
                        { AtomicOrdering::SeqCst },
                        { AtomicOrdering::SeqCst },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(u8);
    #[cfg(target_has_atomic = "16")]
    t!(u16);
    #[cfg(target_has_atomic = "32")]
    t!(u32);
    #[cfg(target_has_atomic = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
}
#[cfg(feature = "core")]
pub mod compare_exchange_weak {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::Relaxed },
                        { AtomicOrdering::Relaxed },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn relaxed_acquire(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::Relaxed },
                        { AtomicOrdering::Acquire },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn relaxed_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::Relaxed },
                        { AtomicOrdering::SeqCst },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn acquire_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::Acquire },
                        { AtomicOrdering::Relaxed },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn acquire_acquire(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::Acquire },
                        { AtomicOrdering::Acquire },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn acquire_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::Acquire },
                        { AtomicOrdering::SeqCst },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn release_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::Release },
                        { AtomicOrdering::Relaxed },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn release_acquire(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::Release },
                        { AtomicOrdering::Acquire },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn release_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::Release },
                        { AtomicOrdering::SeqCst },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn acqrel_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::AcqRel },
                        { AtomicOrdering::Relaxed },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn acqrel_acquire(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::AcqRel },
                        { AtomicOrdering::Acquire },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn acqrel_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::AcqRel },
                        { AtomicOrdering::SeqCst },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn seqcst_relaxed(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::SeqCst },
                        { AtomicOrdering::Relaxed },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn seqcst_acquire(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::SeqCst },
                        { AtomicOrdering::Acquire },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
                #[inline(never)]
                pub unsafe fn seqcst_seqcst(a: A, old: T, new: T) -> Result<T, T> {
                    let (val, ok) = core::intrinsics::atomic_cxchgweak::<
                        _,
                        { AtomicOrdering::SeqCst },
                        { AtomicOrdering::SeqCst },
                    >(a, old, new);
                    if ok { Ok(val) } else { Err(val) }
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(u8);
    #[cfg(target_has_atomic = "16")]
    t!(u16);
    #[cfg(target_has_atomic = "32")]
    t!(u32);
    #[cfg(target_has_atomic = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
}
#[cfg(feature = "core")]
pub mod fetch_add {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    core::intrinsics::atomic_xadd::<_, _, { AtomicOrdering::Relaxed }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    core::intrinsics::atomic_xadd::<_, _, { AtomicOrdering::Acquire }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    core::intrinsics::atomic_xadd::<_, _, { AtomicOrdering::Release }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    core::intrinsics::atomic_xadd::<_, _, { AtomicOrdering::AcqRel }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    core::intrinsics::atomic_xadd::<_, _, { AtomicOrdering::SeqCst }>(a, val)
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(u8);
    #[cfg(target_has_atomic = "16")]
    t!(u16);
    #[cfg(target_has_atomic = "32")]
    t!(u32);
    #[cfg(target_has_atomic = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
}
#[cfg(feature = "core")]
pub mod fetch_sub {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    core::intrinsics::atomic_xsub::<_, _, { AtomicOrdering::Relaxed }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    core::intrinsics::atomic_xsub::<_, _, { AtomicOrdering::Acquire }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    core::intrinsics::atomic_xsub::<_, _, { AtomicOrdering::Release }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    core::intrinsics::atomic_xsub::<_, _, { AtomicOrdering::AcqRel }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    core::intrinsics::atomic_xsub::<_, _, { AtomicOrdering::SeqCst }>(a, val)
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(u8);
    #[cfg(target_has_atomic = "16")]
    t!(u16);
    #[cfg(target_has_atomic = "32")]
    t!(u32);
    #[cfg(target_has_atomic = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
}
#[cfg(feature = "core")]
pub mod fetch_and {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    core::intrinsics::atomic_and::<_, _, { AtomicOrdering::Relaxed }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    core::intrinsics::atomic_and::<_, _, { AtomicOrdering::Acquire }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    core::intrinsics::atomic_and::<_, _, { AtomicOrdering::Release }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    core::intrinsics::atomic_and::<_, _, { AtomicOrdering::AcqRel }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    core::intrinsics::atomic_and::<_, _, { AtomicOrdering::SeqCst }>(a, val)
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(u8);
    #[cfg(target_has_atomic = "16")]
    t!(u16);
    #[cfg(target_has_atomic = "32")]
    t!(u32);
    #[cfg(target_has_atomic = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
}
#[cfg(feature = "core")]
pub mod fetch_nand {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    core::intrinsics::atomic_nand::<_, _, { AtomicOrdering::Relaxed }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    core::intrinsics::atomic_nand::<_, _, { AtomicOrdering::Acquire }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    core::intrinsics::atomic_nand::<_, _, { AtomicOrdering::Release }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    core::intrinsics::atomic_nand::<_, _, { AtomicOrdering::AcqRel }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    core::intrinsics::atomic_nand::<_, _, { AtomicOrdering::SeqCst }>(a, val)
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(u8);
    #[cfg(target_has_atomic = "16")]
    t!(u16);
    #[cfg(target_has_atomic = "32")]
    t!(u32);
    #[cfg(target_has_atomic = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
}
#[cfg(feature = "core")]
pub mod fetch_or {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    core::intrinsics::atomic_or::<_, _, { AtomicOrdering::Relaxed }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    core::intrinsics::atomic_or::<_, _, { AtomicOrdering::Acquire }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    core::intrinsics::atomic_or::<_, _, { AtomicOrdering::Release }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    core::intrinsics::atomic_or::<_, _, { AtomicOrdering::AcqRel }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    core::intrinsics::atomic_or::<_, _, { AtomicOrdering::SeqCst }>(a, val)
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(u8);
    #[cfg(target_has_atomic = "16")]
    t!(u16);
    #[cfg(target_has_atomic = "32")]
    t!(u32);
    #[cfg(target_has_atomic = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
}
#[cfg(feature = "core")]
pub mod fetch_xor {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    core::intrinsics::atomic_xor::<_, _, { AtomicOrdering::Relaxed }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    core::intrinsics::atomic_xor::<_, _, { AtomicOrdering::Acquire }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    core::intrinsics::atomic_xor::<_, _, { AtomicOrdering::Release }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    core::intrinsics::atomic_xor::<_, _, { AtomicOrdering::AcqRel }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    core::intrinsics::atomic_xor::<_, _, { AtomicOrdering::SeqCst }>(a, val)
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(u8);
    #[cfg(target_has_atomic = "16")]
    t!(u16);
    #[cfg(target_has_atomic = "32")]
    t!(u32);
    #[cfg(target_has_atomic = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
}
#[cfg(feature = "core")]
pub mod fetch_not {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A) -> T {
                    core::intrinsics::atomic_xor::<_, _, { AtomicOrdering::Relaxed }>(a, T::MAX)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A) -> T {
                    core::intrinsics::atomic_xor::<_, _, { AtomicOrdering::Acquire }>(a, T::MAX)
                }
                #[inline(never)]
                pub unsafe fn release(a: A) -> T {
                    core::intrinsics::atomic_xor::<_, _, { AtomicOrdering::Release }>(a, T::MAX)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A) -> T {
                    core::intrinsics::atomic_xor::<_, _, { AtomicOrdering::AcqRel }>(a, T::MAX)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A) -> T {
                    core::intrinsics::atomic_xor::<_, _, { AtomicOrdering::SeqCst }>(a, T::MAX)
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(u8);
    #[cfg(target_has_atomic = "16")]
    t!(u16);
    #[cfg(target_has_atomic = "32")]
    t!(u32);
    #[cfg(target_has_atomic = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
}
#[cfg(feature = "core")]
pub mod fetch_neg {
    macro_rules! u {
        ($t:ident) => {
            pub mod $t {
                use crate::$t::*;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A) -> T {
                    atomic_update(a, Ordering::Relaxed, $t::wrapping_neg)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A) -> T {
                    atomic_update(a, Ordering::Acquire, $t::wrapping_neg)
                }
                #[inline(never)]
                pub unsafe fn release(a: A) -> T {
                    atomic_update(a, Ordering::Release, $t::wrapping_neg)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A) -> T {
                    atomic_update(a, Ordering::AcqRel, $t::wrapping_neg)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A) -> T {
                    atomic_update(a, Ordering::SeqCst, $t::wrapping_neg)
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    u!(u8);
    #[cfg(target_has_atomic = "16")]
    u!(u16);
    #[cfg(target_has_atomic = "32")]
    u!(u32);
    #[cfg(target_has_atomic = "64")]
    u!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    u!(u128);
}
#[cfg(feature = "core")]
pub mod fetch_max {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    core::intrinsics::atomic_max::<_, { AtomicOrdering::Relaxed }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    core::intrinsics::atomic_max::<_, { AtomicOrdering::Acquire }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    core::intrinsics::atomic_max::<_, { AtomicOrdering::Release }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    core::intrinsics::atomic_max::<_, { AtomicOrdering::AcqRel }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    core::intrinsics::atomic_max::<_, { AtomicOrdering::SeqCst }>(a, val)
                }
            }
        };
    }
    macro_rules! u {
        ($t:ident, $u:ident) => {
            pub mod $t {
                use crate::$u::*;
                type T = $t;
                type U = $u;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    atomic_update(a.cast::<U>(), Ordering::Relaxed, |x| {
                        core::cmp::max(x as T, val) as U
                    }) as T
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    atomic_update(a.cast::<U>(), Ordering::Acquire, |x| {
                        core::cmp::max(x as T, val) as U
                    }) as T
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    atomic_update(a.cast::<U>(), Ordering::Release, |x| {
                        core::cmp::max(x as T, val) as U
                    }) as T
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    atomic_update(a.cast::<U>(), Ordering::AcqRel, |x| {
                        core::cmp::max(x as T, val) as U
                    }) as T
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    atomic_update(a.cast::<U>(), Ordering::SeqCst, |x| {
                        core::cmp::max(x as T, val) as U
                    }) as T
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(i8);
    #[cfg(target_has_atomic = "16")]
    t!(i16);
    #[cfg(target_has_atomic = "32")]
    t!(i32);
    #[cfg(target_has_atomic = "64")]
    t!(i64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        // all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(i128);
    #[cfg(all(target_arch = "powerpc64", target_feature = "quadword-atomics"))]
    u!(i128, u128);
}
#[cfg(feature = "core")]
pub mod fetch_umax {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    core::intrinsics::atomic_umax::<_, { AtomicOrdering::Relaxed }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    core::intrinsics::atomic_umax::<_, { AtomicOrdering::Acquire }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    core::intrinsics::atomic_umax::<_, { AtomicOrdering::Release }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    core::intrinsics::atomic_umax::<_, { AtomicOrdering::AcqRel }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    core::intrinsics::atomic_umax::<_, { AtomicOrdering::SeqCst }>(a, val)
                }
            }
        };
    }
    macro_rules! u {
        ($t:ident) => {
            pub mod $t {
                use crate::$t::*;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    atomic_update(a, Ordering::Relaxed, |x| core::cmp::max(x, val))
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    atomic_update(a, Ordering::Acquire, |x| core::cmp::max(x, val))
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    atomic_update(a, Ordering::Release, |x| core::cmp::max(x, val))
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    atomic_update(a, Ordering::AcqRel, |x| core::cmp::max(x, val))
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    atomic_update(a, Ordering::SeqCst, |x| core::cmp::max(x, val))
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(u8);
    #[cfg(target_has_atomic = "16")]
    t!(u16);
    #[cfg(target_has_atomic = "32")]
    t!(u32);
    #[cfg(target_has_atomic = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        // all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
    #[cfg(all(target_arch = "powerpc64", target_feature = "quadword-atomics"))]
    u!(u128);
}
#[cfg(feature = "core")]
pub mod fetch_min {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    core::intrinsics::atomic_min::<_, { AtomicOrdering::Relaxed }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    core::intrinsics::atomic_min::<_, { AtomicOrdering::Acquire }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    core::intrinsics::atomic_min::<_, { AtomicOrdering::Release }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    core::intrinsics::atomic_min::<_, { AtomicOrdering::AcqRel }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    core::intrinsics::atomic_min::<_, { AtomicOrdering::SeqCst }>(a, val)
                }
            }
        };
    }
    macro_rules! u {
        ($t:ident, $u:ident) => {
            pub mod $t {
                use crate::$u::*;
                type T = $t;
                type U = $u;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    atomic_update(a.cast::<U>(), Ordering::Relaxed, |x| {
                        core::cmp::min(x as T, val) as U
                    }) as T
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    atomic_update(a.cast::<U>(), Ordering::Acquire, |x| {
                        core::cmp::min(x as T, val) as U
                    }) as T
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    atomic_update(a.cast::<U>(), Ordering::Release, |x| {
                        core::cmp::min(x as T, val) as U
                    }) as T
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    atomic_update(a.cast::<U>(), Ordering::AcqRel, |x| {
                        core::cmp::min(x as T, val) as U
                    }) as T
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    atomic_update(a.cast::<U>(), Ordering::SeqCst, |x| {
                        core::cmp::min(x as T, val) as U
                    }) as T
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(i8);
    #[cfg(target_has_atomic = "16")]
    t!(i16);
    #[cfg(target_has_atomic = "32")]
    t!(i32);
    #[cfg(target_has_atomic = "64")]
    t!(i64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        // all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(i128);
    #[cfg(all(target_arch = "powerpc64", target_feature = "quadword-atomics"))]
    u!(i128, u128);
}
#[cfg(feature = "core")]
pub mod fetch_umin {
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                use core::intrinsics::AtomicOrdering;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    core::intrinsics::atomic_umin::<_, { AtomicOrdering::Relaxed }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    core::intrinsics::atomic_umin::<_, { AtomicOrdering::Acquire }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    core::intrinsics::atomic_umin::<_, { AtomicOrdering::Release }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    core::intrinsics::atomic_umin::<_, { AtomicOrdering::AcqRel }>(a, val)
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    core::intrinsics::atomic_umin::<_, { AtomicOrdering::SeqCst }>(a, val)
                }
            }
        };
    }
    macro_rules! u {
        ($t:ident) => {
            pub mod $t {
                use crate::$t::*;
                type T = $t;
                type A = *mut T;
                #[inline(never)]
                pub unsafe fn relaxed(a: A, val: T) -> T {
                    atomic_update(a, Ordering::Relaxed, |x| core::cmp::min(x, val))
                }
                #[inline(never)]
                pub unsafe fn acquire(a: A, val: T) -> T {
                    atomic_update(a, Ordering::Acquire, |x| core::cmp::min(x, val))
                }
                #[inline(never)]
                pub unsafe fn release(a: A, val: T) -> T {
                    atomic_update(a, Ordering::Release, |x| core::cmp::min(x, val))
                }
                #[inline(never)]
                pub unsafe fn acqrel(a: A, val: T) -> T {
                    atomic_update(a, Ordering::AcqRel, |x| core::cmp::min(x, val))
                }
                #[inline(never)]
                pub unsafe fn seqcst(a: A, val: T) -> T {
                    atomic_update(a, Ordering::SeqCst, |x| core::cmp::min(x, val))
                }
            }
        };
    }
    #[cfg(target_has_atomic = "8")]
    t!(u8);
    #[cfg(target_has_atomic = "16")]
    t!(u16);
    #[cfg(target_has_atomic = "32")]
    t!(u32);
    #[cfg(target_has_atomic = "64")]
    t!(u64);
    #[cfg(any(
        target_arch = "aarch64",
        target_arch = "arm64ec",
        // all(target_arch = "powerpc64", target_feature = "quadword-atomics"),
        target_arch = "s390x",
        all(target_arch = "x86_64", target_feature = "cmpxchg16b"),
    ))]
    t!(u128);
    #[cfg(all(target_arch = "powerpc64", target_feature = "quadword-atomics"))]
    u!(u128);
}

// SPDX-License-Identifier: Apache-2.0 OR MIT

#![no_std]
#![allow(unused, internal_features, unsafe_op_in_unsafe_fn, clippy::missing_safety_doc)]
#![cfg_attr(feature = "core", feature(cfg_target_has_atomic, core_intrinsics))]

// TODO: bit_* (for x86 opt)

// -----------------------------------------------------------------------------
// feature = "portable-atomic"

#[cfg(feature = "portable-atomic")]
pub mod fence {
    macro_rules! fence {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name() {
                portable_atomic::fence(core::sync::atomic::Ordering::$order);
            }
        };
    }
    fence!(acquire, Acquire);
    fence!(release, Release);
    fence!(acqrel, AcqRel);
    fence!(seqcst, SeqCst);
}
#[cfg(feature = "portable-atomic")]
pub mod load {
    macro_rules! load {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A) -> T {
                a.load(core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    load!(relaxed, Relaxed);
                    load!(acquire, Acquire);
                    load!(seqcst, SeqCst);
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
        // t!(f16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
        t!(f32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
        t!(f64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    //     t!(f64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
        // t!(f128);
    }
}
#[cfg(feature = "portable-atomic")]
pub mod store {
    macro_rules! store {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) {
                a.store(val, core::sync::atomic::Ordering::$order);
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    store!(relaxed, Relaxed);
                    store!(release, Release);
                    store!(seqcst, SeqCst);
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
        // t!(f16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
        t!(f32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
        t!(f64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    //     t!(f64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
        // t!(f128);
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
    macro_rules! swap {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                a.swap(val, core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    swap!(relaxed, Relaxed);
                    swap!(acquire, Acquire);
                    swap!(release, Release);
                    swap!(acqrel, AcqRel);
                    swap!(seqcst, SeqCst);
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
        // t!(f16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
        t!(f32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
        t!(f64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    //     t!(f64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
        // t!(f128);
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
    macro_rules! cmpxchg {
        ($name:ident, $success:ident, $failure:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, old: T, new: T) -> Result<T, T> {
                a.compare_exchange(
                    old,
                    new,
                    core::sync::atomic::Ordering::$success,
                    core::sync::atomic::Ordering::$failure,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    cmpxchg!(relaxed_relaxed, Relaxed, Relaxed);
                    cmpxchg!(relaxed_acquire, Relaxed, Acquire);
                    cmpxchg!(relaxed_seqcst, Relaxed, SeqCst);
                    cmpxchg!(acquire_relaxed, Acquire, Relaxed);
                    cmpxchg!(acquire_acquire, Acquire, Acquire);
                    cmpxchg!(acquire_seqcst, Acquire, SeqCst);
                    cmpxchg!(release_relaxed, Release, Relaxed);
                    cmpxchg!(release_acquire, Release, Acquire);
                    cmpxchg!(release_seqcst, Release, SeqCst);
                    cmpxchg!(acqrel_relaxed, AcqRel, Relaxed);
                    cmpxchg!(acqrel_acquire, AcqRel, Acquire);
                    cmpxchg!(acqrel_seqcst, AcqRel, SeqCst);
                    cmpxchg!(seqcst_relaxed, SeqCst, Relaxed);
                    cmpxchg!(seqcst_acquire, SeqCst, Acquire);
                    cmpxchg!(seqcst_seqcst, SeqCst, SeqCst);
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
        // t!(f16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
        t!(f32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
        t!(f64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    //     t!(f64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
        // t!(f128);
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
    macro_rules! cmpxchg_weak {
        ($name:ident, $success:ident, $failure:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, old: T, new: T) -> Result<T, T> {
                a.compare_exchange_weak(
                    old,
                    new,
                    core::sync::atomic::Ordering::$success,
                    core::sync::atomic::Ordering::$failure,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    cmpxchg_weak!(relaxed_relaxed, Relaxed, Relaxed);
                    cmpxchg_weak!(relaxed_acquire, Relaxed, Acquire);
                    cmpxchg_weak!(relaxed_seqcst, Relaxed, SeqCst);
                    cmpxchg_weak!(acquire_relaxed, Acquire, Relaxed);
                    cmpxchg_weak!(acquire_acquire, Acquire, Acquire);
                    cmpxchg_weak!(acquire_seqcst, Acquire, SeqCst);
                    cmpxchg_weak!(release_relaxed, Release, Relaxed);
                    cmpxchg_weak!(release_acquire, Release, Acquire);
                    cmpxchg_weak!(release_seqcst, Release, SeqCst);
                    cmpxchg_weak!(acqrel_relaxed, AcqRel, Relaxed);
                    cmpxchg_weak!(acqrel_acquire, AcqRel, Acquire);
                    cmpxchg_weak!(acqrel_seqcst, AcqRel, SeqCst);
                    cmpxchg_weak!(seqcst_relaxed, SeqCst, Relaxed);
                    cmpxchg_weak!(seqcst_acquire, SeqCst, Acquire);
                    cmpxchg_weak!(seqcst_seqcst, SeqCst, SeqCst);
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
        // t!(f16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
        t!(f32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
        t!(f64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    //     t!(f64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
        // t!(f128);
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
    macro_rules! fetch_add {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                a.fetch_add(val, core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_add!(relaxed, Relaxed);
                    fetch_add!(acquire, Acquire);
                    fetch_add!(release, Release);
                    fetch_add!(acqrel, AcqRel);
                    fetch_add!(seqcst, SeqCst);
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
        // t!(f16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
        t!(f32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
        t!(f64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    //     t!(f64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
        // t!(f128);
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
    macro_rules! add {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) {
                a.add(val, core::sync::atomic::Ordering::$order);
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    add!(relaxed, Relaxed);
                    add!(acquire, Acquire);
                    add!(release, Release);
                    add!(acqrel, AcqRel);
                    add!(seqcst, SeqCst);
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
    macro_rules! fetch_sub {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                a.fetch_sub(val, core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_sub!(relaxed, Relaxed);
                    fetch_sub!(acquire, Acquire);
                    fetch_sub!(release, Release);
                    fetch_sub!(acqrel, AcqRel);
                    fetch_sub!(seqcst, SeqCst);
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
        // t!(f16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
        t!(f32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
        t!(f64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    //     t!(f64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
        // t!(f128);
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
    macro_rules! sub {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) {
                a.sub(val, core::sync::atomic::Ordering::$order);
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    sub!(relaxed, Relaxed);
                    sub!(acquire, Acquire);
                    sub!(release, Release);
                    sub!(acqrel, AcqRel);
                    sub!(seqcst, SeqCst);
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
    macro_rules! fetch_and {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                a.fetch_and(val, core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_and!(relaxed, Relaxed);
                    fetch_and!(acquire, Acquire);
                    fetch_and!(release, Release);
                    fetch_and!(acqrel, AcqRel);
                    fetch_and!(seqcst, SeqCst);
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
    macro_rules! and {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) {
                a.and(val, core::sync::atomic::Ordering::$order);
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    and!(relaxed, Relaxed);
                    and!(acquire, Acquire);
                    and!(release, Release);
                    and!(acqrel, AcqRel);
                    and!(seqcst, SeqCst);
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
pub mod fetch_nand {
    macro_rules! fetch_nand {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                a.fetch_nand(val, core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_nand!(relaxed, Relaxed);
                    fetch_nand!(acquire, Acquire);
                    fetch_nand!(release, Release);
                    fetch_nand!(acqrel, AcqRel);
                    fetch_nand!(seqcst, SeqCst);
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
    macro_rules! fetch_or {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                a.fetch_or(val, core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_or!(relaxed, Relaxed);
                    fetch_or!(acquire, Acquire);
                    fetch_or!(release, Release);
                    fetch_or!(acqrel, AcqRel);
                    fetch_or!(seqcst, SeqCst);
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
    macro_rules! or {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) {
                a.or(val, core::sync::atomic::Ordering::$order);
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    or!(relaxed, Relaxed);
                    or!(acquire, Acquire);
                    or!(release, Release);
                    or!(acqrel, AcqRel);
                    or!(seqcst, SeqCst);
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
pub mod fetch_xor {
    macro_rules! fetch_xor {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                a.fetch_xor(val, core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_xor!(relaxed, Relaxed);
                    fetch_xor!(acquire, Acquire);
                    fetch_xor!(release, Release);
                    fetch_xor!(acqrel, AcqRel);
                    fetch_xor!(seqcst, SeqCst);
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
    macro_rules! xor {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) {
                a.xor(val, core::sync::atomic::Ordering::$order);
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    xor!(relaxed, Relaxed);
                    xor!(acquire, Acquire);
                    xor!(release, Release);
                    xor!(acqrel, AcqRel);
                    xor!(seqcst, SeqCst);
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
pub mod fetch_not {
    macro_rules! fetch_not {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A) -> T {
                a.fetch_not(core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_not!(relaxed, Relaxed);
                    fetch_not!(acquire, Acquire);
                    fetch_not!(release, Release);
                    fetch_not!(acqrel, AcqRel);
                    fetch_not!(seqcst, SeqCst);
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
    macro_rules! not {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A) {
                a.not(core::sync::atomic::Ordering::$order);
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    not!(relaxed, Relaxed);
                    not!(acquire, Acquire);
                    not!(release, Release);
                    not!(acqrel, AcqRel);
                    not!(seqcst, SeqCst);
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
pub mod fetch_neg {
    macro_rules! fetch_neg {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A) -> T {
                a.fetch_neg(core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_neg!(relaxed, Relaxed);
                    fetch_neg!(acquire, Acquire);
                    fetch_neg!(release, Release);
                    fetch_neg!(acqrel, AcqRel);
                    fetch_neg!(seqcst, SeqCst);
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(u8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(u16);
        // t!(f16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(u32);
        t!(f32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(u64);
        t!(f64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(u64);
    //     t!(f64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(u128);
        // t!(f128);
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
    macro_rules! neg {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A) {
                a.neg(core::sync::atomic::Ordering::$order);
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    neg!(relaxed, Relaxed);
                    neg!(acquire, Acquire);
                    neg!(release, Release);
                    neg!(acqrel, AcqRel);
                    neg!(seqcst, SeqCst);
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
pub mod fetch_abs {
    macro_rules! fetch_abs {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A) -> T {
                a.fetch_abs(core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_abs!(relaxed, Relaxed);
                    fetch_abs!(acquire, Acquire);
                    fetch_abs!(release, Release);
                    fetch_abs!(acqrel, AcqRel);
                    fetch_abs!(seqcst, SeqCst);
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_16! {
        // t!(f16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(f32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(f64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(f64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        // t!(f128);
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
    macro_rules! fetch_max {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                a.fetch_max(val, core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_max!(relaxed, Relaxed);
                    fetch_max!(acquire, Acquire);
                    fetch_max!(release, Release);
                    fetch_max!(acqrel, AcqRel);
                    fetch_max!(seqcst, SeqCst);
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(i8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(i16);
        // t!(f16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(i32);
        t!(f32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(i64);
        t!(f64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(i64);
    //     t!(f64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(i128);
        // t!(f128);
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
    macro_rules! fetch_umax {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                a.fetch_max(val, core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_umax!(relaxed, Relaxed);
                    fetch_umax!(acquire, Acquire);
                    fetch_umax!(release, Release);
                    fetch_umax!(acqrel, AcqRel);
                    fetch_umax!(seqcst, SeqCst);
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
    macro_rules! fetch_min {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                a.fetch_min(val, core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_min!(relaxed, Relaxed);
                    fetch_min!(acquire, Acquire);
                    fetch_min!(release, Release);
                    fetch_min!(acqrel, AcqRel);
                    fetch_min!(seqcst, SeqCst);
                }
            }
        };
    }
    portable_atomic::cfg_has_atomic_8! {
        t!(i8);
    }
    portable_atomic::cfg_has_atomic_16! {
        t!(i16);
        // t!(f16);
    }
    portable_atomic::cfg_has_atomic_32! {
        t!(i32);
        t!(f32);
    }
    portable_atomic::cfg_has_atomic_64! {
        t!(i64);
        t!(f64);
    }
    // #[cfg(all(target_arch = "arm", target_os = "linux"))] // TODO
    // portable_atomic::cfg_no_atomic_64! {
    //     t!(i64);
    //     t!(f64);
    // }
    portable_atomic::cfg_has_atomic_128! {
        t!(i128);
        // t!(f128);
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
    macro_rules! fetch_umin {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                a.fetch_min(val, core::sync::atomic::Ordering::$order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            paste::paste! {
                pub mod $t {
                    type T = $t;
                    type A = &'static portable_atomic::[<Atomic $t:camel>];
                    fetch_umin!(relaxed, Relaxed);
                    fetch_umin!(acquire, Acquire);
                    fetch_umin!(release, Release);
                    fetch_umin!(acqrel, AcqRel);
                    fetch_umin!(seqcst, SeqCst);
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
#[cfg(not(target_arch = "xtensa"))]
macro_rules! atomic_load {
    ($ptr:ident, $order:ident) => {
        core::intrinsics::atomic_load::<
            _,
            { core::intrinsics::AtomicOrdering::$order },
            /* VOLATILE */ false,
        >($ptr)
    };
}
#[cfg(feature = "core")]
#[cfg(target_arch = "xtensa")] // xtensa toolchain is based on stable
macro_rules! atomic_load {
    ($ptr:ident, $order:ident) => {
        core::intrinsics::atomic_load::<_, { core::intrinsics::AtomicOrdering::$order }>($ptr)
    };
}
#[cfg(feature = "core")]
#[cfg(not(target_arch = "xtensa"))]
macro_rules! atomic_store {
    ($ptr:ident, $val:ident, $order:ident) => {
        core::intrinsics::atomic_store::<
            _,
            { core::intrinsics::AtomicOrdering::$order },
            /* VOLATILE */ false,
        >($ptr, $val)
    };
}
#[cfg(feature = "core")]
#[cfg(target_arch = "xtensa")] // xtensa toolchain is based on stable
macro_rules! atomic_store {
    ($ptr:ident, $val:ident, $order:ident) => {
        core::intrinsics::atomic_store::<_, { core::intrinsics::AtomicOrdering::$order }>(
            $ptr, $val,
        )
    };
}
#[cfg(feature = "core")]
macro_rules! atomic_cxchg {
    ($ptr:ident, $old:ident, $new:ident, $success:ident, $failure:ident) => {
        core::intrinsics::atomic_cxchg::<
            _,
            { core::intrinsics::AtomicOrdering::$success },
            { core::intrinsics::AtomicOrdering::$failure },
        >($ptr, $old, $new)
    };
}
#[cfg(feature = "core")]
macro_rules! atomic_cxchgweak {
    ($ptr:ident, $old:ident, $new:ident, $success:ident, $failure:ident) => {
        core::intrinsics::atomic_cxchgweak::<
            _,
            { core::intrinsics::AtomicOrdering::$success },
            { core::intrinsics::AtomicOrdering::$failure },
        >($ptr, $old, $new)
    };
}

#[cfg(feature = "core")]
macro_rules! atomic_update {
    ($t:ident) => {
        mod $t {
            pub(crate) use core::sync::atomic::Ordering;
            #[inline(always)]
            pub(crate) unsafe fn atomic_update<F>(dst: *mut $t, order: Ordering, mut f: F) -> $t
            where
                F: FnMut($t) -> $t,
            {
                // This is a private function and all instances of `f` only operate on the value
                // loaded, so there is no need to synchronize the first load/failed CAS.
                let mut old = atomic_load!(dst, Relaxed);
                loop {
                    let next = f(old);
                    let (x, ok) = match order {
                        Ordering::Relaxed => atomic_cxchgweak!(dst, old, next, Relaxed, Relaxed),
                        Ordering::Acquire => atomic_cxchgweak!(dst, old, next, Acquire, Relaxed),
                        Ordering::Release => atomic_cxchgweak!(dst, old, next, Release, Relaxed),
                        Ordering::AcqRel => atomic_cxchgweak!(dst, old, next, AcqRel, Relaxed),
                        Ordering::SeqCst => atomic_cxchgweak!(dst, old, next, SeqCst, Relaxed),
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
#[cfg(not(target_arch = "msp430"))]
pub mod fence {
    macro_rules! fence {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name() {
                core::sync::atomic::fence(core::sync::atomic::Ordering::$order);
            }
        };
    }
    fence!(acquire, Acquire);
    fence!(release, Release);
    fence!(acqrel, AcqRel);
    fence!(seqcst, SeqCst);
}
#[cfg(feature = "core")]
pub mod load {
    macro_rules! load {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A) -> T {
                atomic_load!(a, $order)
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                load!(relaxed, Relaxed);
                load!(acquire, Acquire);
                load!(seqcst, SeqCst);
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
    macro_rules! store {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) {
                atomic_store!(a, val, $order);
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                store!(relaxed, Relaxed);
                store!(release, Release);
                store!(seqcst, SeqCst);
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
    macro_rules! swap {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                core::intrinsics::atomic_xchg::<_, { core::intrinsics::AtomicOrdering::$order }>(
                    a, val,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                swap!(relaxed, Relaxed);
                swap!(acquire, Acquire);
                swap!(release, Release);
                swap!(acqrel, AcqRel);
                swap!(seqcst, SeqCst);
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
    macro_rules! cmpxchg {
        ($name:ident, $success:ident, $failure:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, old: T, new: T) -> Result<T, T> {
                let (val, ok) = atomic_cxchg!(a, old, new, $success, $failure);
                if ok { Ok(val) } else { Err(val) }
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                cmpxchg!(relaxed_relaxed, Relaxed, Relaxed);
                cmpxchg!(relaxed_acquire, Relaxed, Acquire);
                cmpxchg!(relaxed_seqcst, Relaxed, SeqCst);
                cmpxchg!(acquire_relaxed, Acquire, Relaxed);
                cmpxchg!(acquire_acquire, Acquire, Acquire);
                cmpxchg!(acquire_seqcst, Acquire, SeqCst);
                cmpxchg!(release_relaxed, Release, Relaxed);
                cmpxchg!(release_acquire, Release, Acquire);
                cmpxchg!(release_seqcst, Release, SeqCst);
                cmpxchg!(acqrel_relaxed, AcqRel, Relaxed);
                cmpxchg!(acqrel_acquire, AcqRel, Acquire);
                cmpxchg!(acqrel_seqcst, AcqRel, SeqCst);
                cmpxchg!(seqcst_relaxed, SeqCst, Relaxed);
                cmpxchg!(seqcst_acquire, SeqCst, Acquire);
                cmpxchg!(seqcst_seqcst, SeqCst, SeqCst);
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
    macro_rules! cmpxchg_weak {
        ($name:ident, $success:ident, $failure:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, old: T, new: T) -> Result<T, T> {
                let (val, ok) = atomic_cxchgweak!(a, old, new, $success, $failure);
                if ok { Ok(val) } else { Err(val) }
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                cmpxchg_weak!(relaxed_relaxed, Relaxed, Relaxed);
                cmpxchg_weak!(relaxed_acquire, Relaxed, Acquire);
                cmpxchg_weak!(relaxed_seqcst, Relaxed, SeqCst);
                cmpxchg_weak!(acquire_relaxed, Acquire, Relaxed);
                cmpxchg_weak!(acquire_acquire, Acquire, Acquire);
                cmpxchg_weak!(acquire_seqcst, Acquire, SeqCst);
                cmpxchg_weak!(release_relaxed, Release, Relaxed);
                cmpxchg_weak!(release_acquire, Release, Acquire);
                cmpxchg_weak!(release_seqcst, Release, SeqCst);
                cmpxchg_weak!(acqrel_relaxed, AcqRel, Relaxed);
                cmpxchg_weak!(acqrel_acquire, AcqRel, Acquire);
                cmpxchg_weak!(acqrel_seqcst, AcqRel, SeqCst);
                cmpxchg_weak!(seqcst_relaxed, SeqCst, Relaxed);
                cmpxchg_weak!(seqcst_acquire, SeqCst, Acquire);
                cmpxchg_weak!(seqcst_seqcst, SeqCst, SeqCst);
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
    macro_rules! fetch_add {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                core::intrinsics::atomic_xadd::<_, _, { core::intrinsics::AtomicOrdering::$order }>(
                    a, val,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                fetch_add!(relaxed, Relaxed);
                fetch_add!(acquire, Acquire);
                fetch_add!(release, Release);
                fetch_add!(acqrel, AcqRel);
                fetch_add!(seqcst, SeqCst);
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
    macro_rules! fetch_sub {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                core::intrinsics::atomic_xsub::<_, _, { core::intrinsics::AtomicOrdering::$order }>(
                    a, val,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                fetch_sub!(relaxed, Relaxed);
                fetch_sub!(acquire, Acquire);
                fetch_sub!(release, Release);
                fetch_sub!(acqrel, AcqRel);
                fetch_sub!(seqcst, SeqCst);
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
    macro_rules! fetch_and {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                core::intrinsics::atomic_and::<_, _, { core::intrinsics::AtomicOrdering::$order }>(
                    a, val,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                fetch_and!(relaxed, Relaxed);
                fetch_and!(acquire, Acquire);
                fetch_and!(release, Release);
                fetch_and!(acqrel, AcqRel);
                fetch_and!(seqcst, SeqCst);
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
    macro_rules! fetch_nand {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                core::intrinsics::atomic_nand::<_, _, { core::intrinsics::AtomicOrdering::$order }>(
                    a, val,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                fetch_nand!(relaxed, Relaxed);
                fetch_nand!(acquire, Acquire);
                fetch_nand!(release, Release);
                fetch_nand!(acqrel, AcqRel);
                fetch_nand!(seqcst, SeqCst);
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
    macro_rules! fetch_or {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                core::intrinsics::atomic_or::<_, _, { core::intrinsics::AtomicOrdering::$order }>(
                    a, val,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                fetch_or!(relaxed, Relaxed);
                fetch_or!(acquire, Acquire);
                fetch_or!(release, Release);
                fetch_or!(acqrel, AcqRel);
                fetch_or!(seqcst, SeqCst);
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
    macro_rules! fetch_xor {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                core::intrinsics::atomic_xor::<_, _, { core::intrinsics::AtomicOrdering::$order }>(
                    a, val,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                fetch_xor!(relaxed, Relaxed);
                fetch_xor!(acquire, Acquire);
                fetch_xor!(release, Release);
                fetch_xor!(acqrel, AcqRel);
                fetch_xor!(seqcst, SeqCst);
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
    macro_rules! fetch_not {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A) -> T {
                core::intrinsics::atomic_xor::<_, _, { core::intrinsics::AtomicOrdering::$order }>(
                    a,
                    T::MAX,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                fetch_not!(relaxed, Relaxed);
                fetch_not!(acquire, Acquire);
                fetch_not!(release, Release);
                fetch_not!(acqrel, AcqRel);
                fetch_not!(seqcst, SeqCst);
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
    macro_rules! fetch_max {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                core::intrinsics::atomic_max::<_, { core::intrinsics::AtomicOrdering::$order }>(
                    a, val,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                fetch_max!(relaxed, Relaxed);
                fetch_max!(acquire, Acquire);
                fetch_max!(release, Release);
                fetch_max!(acqrel, AcqRel);
                fetch_max!(seqcst, SeqCst);
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
    macro_rules! fetch_umax {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                core::intrinsics::atomic_umax::<_, { core::intrinsics::AtomicOrdering::$order }>(
                    a, val,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                fetch_umax!(relaxed, Relaxed);
                fetch_umax!(acquire, Acquire);
                fetch_umax!(release, Release);
                fetch_umax!(acqrel, AcqRel);
                fetch_umax!(seqcst, SeqCst);
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
    macro_rules! fetch_min {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                core::intrinsics::atomic_min::<_, { core::intrinsics::AtomicOrdering::$order }>(
                    a, val,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                fetch_min!(relaxed, Relaxed);
                fetch_min!(acquire, Acquire);
                fetch_min!(release, Release);
                fetch_min!(acqrel, AcqRel);
                fetch_min!(seqcst, SeqCst);
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
    macro_rules! fetch_umin {
        ($name:ident, $order:ident) => {
            #[inline(never)]
            pub unsafe fn $name(a: A, val: T) -> T {
                core::intrinsics::atomic_umin::<_, { core::intrinsics::AtomicOrdering::$order }>(
                    a, val,
                )
            }
        };
    }
    macro_rules! t {
        ($t:ident) => {
            pub mod $t {
                type T = $t;
                type A = *mut T;
                fetch_umin!(relaxed, Relaxed);
                fetch_umin!(acquire, Acquire);
                fetch_umin!(release, Release);
                fetch_umin!(acqrel, AcqRel);
                fetch_umin!(seqcst, SeqCst);
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

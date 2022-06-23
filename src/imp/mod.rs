// -----------------------------------------------------------------------------
// Lock-free implementations

// cfg(target_has_atomic_load_store = "ptr")
#[cfg(not(portable_atomic_no_atomic_load_store))]
#[cfg(any(test, not(portable_atomic_unsafe_assume_single_core)))]
mod core_atomic;

#[cfg(any(not(portable_atomic_no_asm), portable_atomic_nightly))]
#[cfg(target_arch = "aarch64")]
#[path = "atomic128/aarch64.rs"]
mod aarch64;

#[cfg(any(not(portable_atomic_no_asm), portable_atomic_nightly))]
#[cfg(any(
    target_feature = "cmpxchg16b",
    portable_atomic_target_feature = "cmpxchg16b",
    portable_atomic_cmpxchg16b_dynamic
))]
#[cfg(target_arch = "x86_64")]
#[path = "atomic128/x86_64.rs"]
mod x86_64;

#[cfg(all(not(portable_atomic_no_asm), portable_atomic_nightly))]
#[cfg(any(
    target_endian = "little",
    target_feature = "quadword-atomics",
    portable_atomic_target_feature = "quadword-atomics"
))]
#[cfg(target_arch = "powerpc64")]
#[path = "atomic128/powerpc64.rs"]
mod powerpc64;

#[cfg(all(not(portable_atomic_no_asm), portable_atomic_nightly))]
#[cfg(target_arch = "s390x")]
#[path = "atomic128/s390x.rs"]
mod s390x;

#[cfg(target_arch = "msp430")]
mod msp430;

#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(any(test, portable_atomic_no_atomic_cas)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(test, not(target_has_atomic = "ptr")))
)]
#[cfg(any(target_arch = "riscv32", target_arch = "riscv64"))]
mod riscv;

// -----------------------------------------------------------------------------
// Lock-based fallback implementations

#[cfg(feature = "fallback")]
#[cfg(any(
    test,
    not(any(
        all(any(not(portable_atomic_no_asm), portable_atomic_nightly), target_arch = "aarch64"),
        all(
            any(not(portable_atomic_no_asm), portable_atomic_nightly),
            any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b"),
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
))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
mod fallback;

// -----------------------------------------------------------------------------
// Critical section based fallback implementations

// On avr, we always use critical section based fallback implementation.
// avr can be safely assumed to be single-core, so this is sound.
// <https://github.com/llvm/llvm-project/blob/llvmorg-14.0.0/llvm/lib/Target/AVR/AVRExpandPseudoInsts.cpp#L1080>
#[cfg(any(test, portable_atomic_unsafe_assume_single_core, target_arch = "avr"))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(any(test, portable_atomic_no_atomic_cas)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(test, not(target_has_atomic = "ptr")))
)]
#[cfg(any(
    portable_atomic_armv6m,
    target_arch = "avr",
    target_arch = "msp430",
    target_arch = "riscv32",
    target_arch = "riscv64",
))]
#[cfg(target_os = "none")]
mod interrupt;

// -----------------------------------------------------------------------------

// Atomic{Isize,Usize,Bool,Ptr}, Atomic{I,U}{8,16}
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(
        not(portable_atomic_no_atomic_cas),
        all(
            not(portable_atomic_no_atomic_load_store),
            not(portable_atomic_unsafe_assume_single_core)
        )
    ))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        target_has_atomic = "ptr",
        all(
            not(portable_atomic_no_atomic_load_store),
            not(portable_atomic_unsafe_assume_single_core)
        )
    ))
)]
pub(crate) use self::core_atomic::{
    AtomicBool, AtomicI16, AtomicI8, AtomicIsize, AtomicPtr, AtomicU16, AtomicU8, AtomicUsize,
};
#[cfg(not(portable_atomic_unsafe_assume_single_core))]
#[cfg(target_arch = "msp430")]
pub(crate) use self::msp430::{
    AtomicBool, AtomicI16, AtomicI8, AtomicIsize, AtomicPtr, AtomicU16, AtomicU8, AtomicUsize,
};
#[cfg(not(portable_atomic_unsafe_assume_single_core))]
#[cfg(target_arch = "riscv32")]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(portable_atomic_no_atomic_cas))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(not(target_has_atomic = "ptr")))]
pub(crate) use self::riscv::{
    AtomicBool, AtomicI16, AtomicI8, AtomicIsize, AtomicPtr, AtomicU16, AtomicU8, AtomicUsize,
};
// no core Atomic{Isize,Usize,Bool,Ptr}/Atomic{I,U}{8,16} & assume single core => critical section based fallback
#[cfg(any(portable_atomic_unsafe_assume_single_core, target_arch = "avr"))]
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(portable_atomic_no_atomic_cas, target_arch = "avr"))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(not(target_has_atomic = "ptr"), target_arch = "avr"))
)]
pub(crate) use self::interrupt::{
    AtomicBool, AtomicI16, AtomicI8, AtomicIsize, AtomicPtr, AtomicU16, AtomicU8, AtomicUsize,
};

// Atomic{I,U}32
#[cfg(not(target_pointer_width = "16"))]
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(
        not(portable_atomic_no_atomic_cas),
        all(
            not(portable_atomic_no_atomic_load_store),
            not(portable_atomic_unsafe_assume_single_core)
        )
    ))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        target_has_atomic = "ptr",
        all(
            not(portable_atomic_no_atomic_load_store),
            not(portable_atomic_unsafe_assume_single_core)
        )
    ))
)]
pub(crate) use self::core_atomic::{AtomicI32, AtomicU32};
#[cfg(not(portable_atomic_unsafe_assume_single_core))]
#[cfg(target_arch = "riscv32")]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(portable_atomic_no_atomic_cas))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(not(target_has_atomic = "ptr")))]
pub(crate) use self::riscv::{AtomicI32, AtomicU32};
// no core Atomic{I,U}32 & no CAS & assume single core => critical section based fallback
#[cfg(any(target_pointer_width = "32", target_pointer_width = "64", feature = "fallback"))]
#[cfg(portable_atomic_unsafe_assume_single_core)]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(portable_atomic_no_atomic_cas))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(not(target_has_atomic = "ptr")))]
pub(crate) use self::interrupt::{AtomicI32, AtomicU32};

// Atomic{I,U}64
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_64)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(target_has_atomic = "64", target_pointer_width = "64"))
)]
pub(crate) use self::core_atomic::{AtomicI64, AtomicU64};
// no core Atomic{I,U}64 & has CAS => use lock-base fallback
#[cfg(feature = "fallback")]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(portable_atomic_no_atomic_64))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(not(target_has_atomic = "64")))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
pub(crate) use self::fallback::{AtomicI64, AtomicU64};
// no core Atomic{I,U}64 & no CAS & assume single core => critical section based fallback
#[cfg(any(target_pointer_width = "64", feature = "fallback"))]
#[cfg(portable_atomic_unsafe_assume_single_core)]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(portable_atomic_no_atomic_cas))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(not(target_has_atomic = "ptr")))]
pub(crate) use self::interrupt::{AtomicI64, AtomicU64};

// Atomic{I,U}128
// aarch64 stable
#[cfg(all(
    any(not(portable_atomic_no_asm), portable_atomic_nightly),
    target_arch = "aarch64"
))]
pub(crate) use self::aarch64::{AtomicI128, AtomicU128};
// no core Atomic{I,U}128 & has cmpxchg16b => use cmpxchg16b
#[cfg(all(
    any(not(portable_atomic_no_asm), portable_atomic_nightly),
    any(
        target_feature = "cmpxchg16b",
        portable_atomic_target_feature = "cmpxchg16b",
        portable_atomic_cmpxchg16b_dynamic
    ),
    target_arch = "x86_64",
))]
pub(crate) use self::x86_64::{AtomicI128, AtomicU128};
// powerpc64
#[cfg(all(not(portable_atomic_no_asm), portable_atomic_nightly))]
#[cfg(any(
    target_endian = "little",
    target_feature = "quadword-atomics",
    portable_atomic_target_feature = "quadword-atomics"
))]
#[cfg(target_arch = "powerpc64")]
pub(crate) use self::powerpc64::{AtomicI128, AtomicU128};
// s390x
#[cfg(all(not(portable_atomic_no_asm), portable_atomic_nightly))]
#[cfg(target_arch = "s390x")]
pub(crate) use self::s390x::{AtomicI128, AtomicU128};
// no core Atomic{I,U}128 & has CAS => use lock-base fallback
#[cfg(feature = "fallback")]
#[cfg(not(any(
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
)))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
pub(crate) use self::fallback::{AtomicI128, AtomicU128};
// no core Atomic{I,U}128 & no CAS & assume_single_core => critical section based fallback
#[cfg(feature = "fallback")]
#[cfg(portable_atomic_unsafe_assume_single_core)]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(portable_atomic_no_atomic_cas))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(not(target_has_atomic = "ptr")))]
pub(crate) use self::interrupt::{AtomicI128, AtomicU128};

// -----------------------------------------------------------------------------
// Lock-free implementations

// cfg(target_has_atomic_load_store = "ptr")
#[cfg(not(any(
    portable_atomic_no_atomic_load_store,
    portable_atomic_unsafe_assume_single_core,
    target_arch = "avr",
    target_arch = "msp430",
)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(not(all(
        any(target_arch = "riscv32", target_arch = "riscv64"),
        not(target_has_atomic = "ptr")
    )))
)]
mod core_atomic;

// Miri and Sanitizer do not support inline assembly.
#[cfg(all(any(miri, portable_atomic_sanitize_thread), portable_atomic_new_atomic_intrinsics))]
#[cfg(target_arch = "aarch64")]
#[path = "atomic128/intrinsics.rs"]
mod aarch64;
#[cfg(not(all(
    any(miri, portable_atomic_sanitize_thread),
    portable_atomic_new_atomic_intrinsics
)))]
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

// Miri and Sanitizer do not support inline assembly.
#[cfg(all(any(miri, portable_atomic_sanitize_thread), portable_atomic_llvm15))]
#[cfg(portable_atomic_asm_experimental_arch)]
#[cfg(any(
    target_feature = "quadword-atomics",
    portable_atomic_target_feature = "quadword-atomics"
))]
#[cfg(target_arch = "powerpc64")]
#[path = "atomic128/intrinsics.rs"]
mod powerpc64;
#[cfg(not(all(any(miri, portable_atomic_sanitize_thread), portable_atomic_llvm15)))]
#[cfg(portable_atomic_asm_experimental_arch)]
#[cfg(any(
    target_feature = "quadword-atomics",
    portable_atomic_target_feature = "quadword-atomics"
))]
#[cfg(target_arch = "powerpc64")]
#[path = "atomic128/powerpc64.rs"]
mod powerpc64;

#[cfg(portable_atomic_asm_experimental_arch)]
#[cfg(target_arch = "s390x")]
#[path = "atomic128/s390x.rs"]
mod s390x;

#[cfg(target_arch = "msp430")]
pub(crate) mod msp430;

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
            portable_atomic_asm_experimental_arch,
            any(
                target_feature = "quadword-atomics",
                portable_atomic_target_feature = "quadword-atomics"
            ),
            target_arch = "powerpc64"
        ),
        all(portable_atomic_asm_experimental_arch, target_arch = "s390x"),
    ))
))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
mod fallback;

// -----------------------------------------------------------------------------
// Critical section based fallback implementations

// On AVR, we always use critical section based fallback implementation.
// AVR can be safely assumed to be single-core, so this is sound.
// https://github.com/llvm/llvm-project/blob/llvmorg-15.0.0/llvm/lib/Target/AVR/AVRExpandPseudoInsts.cpp#L1008
// MSP430 as well.
#[cfg(any(
    all(test, target_os = "none"),
    portable_atomic_unsafe_assume_single_core,
    target_arch = "avr",
    target_arch = "msp430",
))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(any(test, portable_atomic_no_atomic_cas)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(test, not(target_has_atomic = "ptr")))
)]
#[cfg(any(
    target_arch = "arm",
    target_arch = "avr",
    target_arch = "msp430",
    target_arch = "riscv32",
    target_arch = "riscv64",
))]
mod interrupt;

// -----------------------------------------------------------------------------
// Atomic float implementations

#[cfg(feature = "float")]
pub(crate) mod float;

// -----------------------------------------------------------------------------

// Atomic{Isize,Usize,Bool,Ptr}, Atomic{I,U}{8,16}
#[cfg(not(any(
    portable_atomic_no_atomic_load_store,
    portable_atomic_unsafe_assume_single_core,
    target_arch = "avr",
    target_arch = "msp430",
)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(not(all(
        any(target_arch = "riscv32", target_arch = "riscv64"),
        not(target_has_atomic = "ptr")
    )))
)]
pub(crate) use self::core_atomic::{
    AtomicBool, AtomicI16, AtomicI8, AtomicIsize, AtomicPtr, AtomicU16, AtomicU8, AtomicUsize,
};
// RISC-V without A-extension
#[cfg(not(portable_atomic_unsafe_assume_single_core))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(portable_atomic_no_atomic_cas))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(not(target_has_atomic = "ptr")))]
#[cfg(any(target_arch = "riscv32", target_arch = "riscv64"))]
pub(crate) use self::riscv::{
    AtomicBool, AtomicI16, AtomicI8, AtomicIsize, AtomicPtr, AtomicU16, AtomicU8, AtomicUsize,
};
// no core Atomic{Isize,Usize,Bool,Ptr}/Atomic{I,U}{8,16} & assume single core => critical section based fallback
#[cfg(any(
    portable_atomic_unsafe_assume_single_core,
    target_arch = "avr",
    target_arch = "msp430"
))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(portable_atomic_no_atomic_cas))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(not(target_has_atomic = "ptr")))]
pub(crate) use self::interrupt::{
    AtomicBool, AtomicI16, AtomicI8, AtomicIsize, AtomicPtr, AtomicU16, AtomicU8, AtomicUsize,
};

// Atomic{I,U}32
#[cfg(not(any(
    portable_atomic_no_atomic_load_store,
    portable_atomic_unsafe_assume_single_core,
    target_arch = "avr",
    target_arch = "msp430",
)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(not(all(
        any(target_arch = "riscv32", target_arch = "riscv64"),
        not(target_has_atomic = "ptr")
    )))
)]
pub(crate) use self::core_atomic::{AtomicI32, AtomicU32};
// RISC-V without A-extension
#[cfg(not(portable_atomic_unsafe_assume_single_core))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(portable_atomic_no_atomic_cas))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(not(target_has_atomic = "ptr")))]
#[cfg(any(target_arch = "riscv32", target_arch = "riscv64"))]
pub(crate) use self::riscv::{AtomicI32, AtomicU32};
// no core Atomic{I,U}32 & no CAS & assume single core => critical section based fallback
#[cfg(any(not(target_pointer_width = "16"), feature = "fallback"))]
#[cfg(any(
    portable_atomic_unsafe_assume_single_core,
    target_arch = "avr",
    target_arch = "msp430"
))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(portable_atomic_no_atomic_cas))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(not(target_has_atomic = "ptr")))]
pub(crate) use self::interrupt::{AtomicI32, AtomicU32};

// Atomic{I,U}64
#[cfg(not(any(
    portable_atomic_no_atomic_load_store,
    portable_atomic_unsafe_assume_single_core,
)))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_64)))]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        target_has_atomic = "64",
        all(
            not(any(target_pointer_width = "16", target_pointer_width = "32")),
            not(all(
                any(target_arch = "riscv32", target_arch = "riscv64"),
                not(target_has_atomic = "ptr")
            ))
        )
    ))
)]
pub(crate) use self::core_atomic::{AtomicI64, AtomicU64};
// RISC-V without A-extension
#[cfg(not(portable_atomic_unsafe_assume_single_core))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(portable_atomic_no_atomic_cas))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(not(target_has_atomic = "ptr")))]
#[cfg(target_arch = "riscv64")]
pub(crate) use self::riscv::{AtomicI64, AtomicU64};
// no core Atomic{I,U}64 & has CAS => use lock-base fallback
#[cfg(feature = "fallback")]
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(all(portable_atomic_no_atomic_64, not(portable_atomic_no_atomic_cas)))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(all(not(target_has_atomic = "64"), target_has_atomic = "ptr"))
)]
pub(crate) use self::fallback::{AtomicI64, AtomicU64};
// no core Atomic{I,U}64 & no CAS & assume single core => critical section based fallback
#[cfg(any(
    not(any(target_pointer_width = "16", target_pointer_width = "32")),
    feature = "fallback"
))]
#[cfg(any(
    portable_atomic_unsafe_assume_single_core,
    target_arch = "avr",
    target_arch = "msp430"
))]
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
#[cfg(portable_atomic_asm_experimental_arch)]
#[cfg(any(
    target_feature = "quadword-atomics",
    portable_atomic_target_feature = "quadword-atomics"
))]
#[cfg(target_arch = "powerpc64")]
pub(crate) use self::powerpc64::{AtomicI128, AtomicU128};
// s390x
#[cfg(portable_atomic_asm_experimental_arch)]
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
        portable_atomic_asm_experimental_arch,
        any(
            target_feature = "quadword-atomics",
            portable_atomic_target_feature = "quadword-atomics"
        ),
        target_arch = "powerpc64"
    ),
    all(portable_atomic_asm_experimental_arch, target_arch = "s390x"),
)))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
pub(crate) use self::fallback::{AtomicI128, AtomicU128};
// no core Atomic{I,U}128 & no CAS & assume_single_core => critical section based fallback
#[cfg(feature = "fallback")]
#[cfg(any(
    portable_atomic_unsafe_assume_single_core,
    target_arch = "avr",
    target_arch = "msp430"
))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(portable_atomic_no_atomic_cas))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(not(target_has_atomic = "ptr")))]
pub(crate) use self::interrupt::{AtomicI128, AtomicU128};

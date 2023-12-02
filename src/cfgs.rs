#[cfg(not(all(
    portable_atomic_no_atomic_load_store,
    not(any(
        target_arch = "avr",
        target_arch = "msp430",
        target_arch = "riscv32",
        target_arch = "riscv64",
        feature = "critical-section",
    )),
)))]
#[macro_use]
mod atomic_8_16_macros {
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_has_atomic_load_store_8 {
        ($($tt:tt)*) => {
            $($tt)*
        };
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_no_atomic_load_store_8 {
        ($($tt:tt)*) => {};
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_has_atomic_load_store_16 {
        ($($tt:tt)*) => {
            $($tt)*
        };
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_no_atomic_load_store_16 {
        ($($tt:tt)*) => {};
    }
}
#[cfg(all(
    portable_atomic_no_atomic_load_store,
    not(any(
        target_arch = "avr",
        target_arch = "msp430",
        target_arch = "riscv32",
        target_arch = "riscv64",
        feature = "critical-section",
    )),
))]
#[macro_use]
mod atomic_8_16_macros {
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_has_atomic_load_store_8 {
        ($($tt:tt)*) => {};
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_no_atomic_load_store_8 {
        ($($tt:tt)*) => {
            $($tt)*
        };
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_has_atomic_load_store_16 {
        ($($tt:tt)*) => {};
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_no_atomic_load_store_16 {
        ($($tt:tt)*) => {
            $($tt)*
        };
    }
}

#[cfg(all(
    any(not(target_pointer_width = "16"), feature = "fallback"),
    not(all(
        portable_atomic_no_atomic_load_store,
        not(any(
            target_arch = "avr",
            target_arch = "msp430",
            target_arch = "riscv32",
            target_arch = "riscv64",
            feature = "critical-section",
        )),
    )),
))]
#[macro_use]
mod atomic_32_macros {
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_has_atomic_load_store_32 {
        ($($tt:tt)*) => {
            $($tt)*
        };
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_no_atomic_load_store_32 {
        ($($tt:tt)*) => {};
    }
}
#[cfg(not(all(
    any(not(target_pointer_width = "16"), feature = "fallback"),
    not(all(
        portable_atomic_no_atomic_load_store,
        not(any(
            target_arch = "avr",
            target_arch = "msp430",
            target_arch = "riscv32",
            target_arch = "riscv64",
            feature = "critical-section",
        )),
    )),
)))]
#[macro_use]
mod atomic_32_macros {
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_has_atomic_load_store_32 {
        ($($tt:tt)*) => {};
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_no_atomic_load_store_32 {
        ($($tt:tt)*) => {
            $($tt)*
        };
    }
}

#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(
        all(
            feature = "fallback",
            any(
                not(portable_atomic_no_atomic_cas),
                portable_atomic_unsafe_assume_single_core,
                feature = "critical-section",
                target_arch = "avr",
                target_arch = "msp430",
            ),
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
                feature = "critical-section",
                target_arch = "avr",
                target_arch = "msp430",
            ),
        ),
        target_has_atomic = "64",
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
    ))
)]
#[macro_use]
mod atomic_64_macros {
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_has_atomic_load_store_64 {
        ($($tt:tt)*) => {
            $($tt)*
        };
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_no_atomic_load_store_64 {
        ($($tt:tt)*) => {};
    }
}
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(not(any(
        all(
            feature = "fallback",
            any(
                not(portable_atomic_no_atomic_cas),
                portable_atomic_unsafe_assume_single_core,
                feature = "critical-section",
                target_arch = "avr",
                target_arch = "msp430",
            ),
        ),
        not(portable_atomic_no_atomic_64),
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
    )))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(not(any(
        all(
            feature = "fallback",
            any(
                target_has_atomic = "ptr",
                portable_atomic_unsafe_assume_single_core,
                feature = "critical-section",
                target_arch = "avr",
                target_arch = "msp430",
            ),
        ),
        target_has_atomic = "64",
        not(any(target_pointer_width = "16", target_pointer_width = "32")),
    )))
)]
#[macro_use]
mod atomic_64_macros {
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_has_atomic_load_store_64 {
        ($($tt:tt)*) => {};
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_no_atomic_load_store_64 {
        ($($tt:tt)*) => {
            $($tt)*
        };
    }
}

#[cfg_attr(
    not(feature = "fallback"),
    cfg(any(
        all(
            target_arch = "aarch64",
            any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
        ),
        all(
            target_arch = "x86_64",
            any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
            any(
                target_feature = "cmpxchg16b",
                portable_atomic_target_feature = "cmpxchg16b",
                all(
                    feature = "fallback",
                    not(portable_atomic_no_cmpxchg16b_target_feature),
                    not(portable_atomic_no_outline_atomics),
                    not(any(target_env = "sgx", miri)),
                ),
            ),
        ),
        all(
            target_arch = "powerpc64",
            portable_atomic_unstable_asm_experimental_arch,
            any(
                target_feature = "quadword-atomics",
                portable_atomic_target_feature = "quadword-atomics",
                all(
                    feature = "fallback",
                    not(portable_atomic_no_outline_atomics),
                    portable_atomic_outline_atomics, // TODO(powerpc64): currently disabled by default
                    any(
                        all(
                            target_os = "linux",
                            any(
                                target_env = "gnu",
                                all(
                                    any(target_env = "musl", target_env = "ohos"),
                                    not(target_feature = "crt-static"),
                                ),
                                portable_atomic_outline_atomics,
                            ),
                        ),
                        target_os = "android",
                        target_os = "freebsd",
                    ),
                    not(any(miri, portable_atomic_sanitize_thread)),
                ),
            ),
        ),
        all(target_arch = "s390x", portable_atomic_unstable_asm_experimental_arch),
    ))
)]
#[cfg_attr(
    all(feature = "fallback", portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        not(portable_atomic_no_atomic_cas),
        portable_atomic_unsafe_assume_single_core,
        feature = "critical-section",
        target_arch = "avr",
        target_arch = "msp430",
    ))
)]
#[cfg_attr(
    all(feature = "fallback", not(portable_atomic_no_cfg_target_has_atomic)),
    cfg(any(
        target_has_atomic = "ptr",
        portable_atomic_unsafe_assume_single_core,
        feature = "critical-section",
        target_arch = "avr",
        target_arch = "msp430",
    ))
)]
#[macro_use]
mod atomic_128_macros {
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_has_atomic_load_store_128 {
        ($($tt:tt)*) => {
            $($tt)*
        };
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_no_atomic_load_store_128 {
        ($($tt:tt)*) => {};
    }
}
#[cfg_attr(
    not(feature = "fallback"),
    cfg(not(any(
        all(
            target_arch = "aarch64",
            any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
        ),
        all(
            target_arch = "x86_64",
            any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
            any(
                target_feature = "cmpxchg16b",
                portable_atomic_target_feature = "cmpxchg16b",
                all(
                    feature = "fallback",
                    not(portable_atomic_no_cmpxchg16b_target_feature),
                    not(portable_atomic_no_outline_atomics),
                    not(any(target_env = "sgx", miri)),
                ),
            ),
        ),
        all(
            target_arch = "powerpc64",
            portable_atomic_unstable_asm_experimental_arch,
            any(
                target_feature = "quadword-atomics",
                portable_atomic_target_feature = "quadword-atomics",
                all(
                    feature = "fallback",
                    not(portable_atomic_no_outline_atomics),
                    portable_atomic_outline_atomics, // TODO(powerpc64): currently disabled by default
                    any(
                        all(
                            target_os = "linux",
                            any(
                                target_env = "gnu",
                                all(
                                    any(target_env = "musl", target_env = "ohos"),
                                    not(target_feature = "crt-static"),
                                ),
                                portable_atomic_outline_atomics,
                            ),
                        ),
                        target_os = "android",
                        target_os = "freebsd",
                    ),
                    not(any(miri, portable_atomic_sanitize_thread)),
                ),
            ),
        ),
        all(target_arch = "s390x", portable_atomic_unstable_asm_experimental_arch),
    )))
)]
#[cfg_attr(
    all(feature = "fallback", portable_atomic_no_cfg_target_has_atomic),
    cfg(not(any(
        not(portable_atomic_no_atomic_cas),
        portable_atomic_unsafe_assume_single_core,
        feature = "critical-section",
        target_arch = "avr",
        target_arch = "msp430",
    )))
)]
#[cfg_attr(
    all(feature = "fallback", not(portable_atomic_no_cfg_target_has_atomic)),
    cfg(not(any(
        target_has_atomic = "ptr",
        portable_atomic_unsafe_assume_single_core,
        feature = "critical-section",
        target_arch = "avr",
        target_arch = "msp430",
    )))
)]
#[macro_use]
mod atomic_128_macros {
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_has_atomic_load_store_128 {
        ($($tt:tt)*) => {};
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_no_atomic_load_store_128 {
        ($($tt:tt)*) => {
            $($tt)*
        };
    }
}

#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(any(
        not(portable_atomic_no_atomic_cas),
        portable_atomic_unsafe_assume_single_core,
        feature = "critical-section",
        target_arch = "avr",
        target_arch = "msp430",
    ))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(any(
        target_has_atomic = "ptr",
        portable_atomic_unsafe_assume_single_core,
        feature = "critical-section",
        target_arch = "avr",
        target_arch = "msp430",
    ))
)]
#[macro_use]
mod atomic_cas_macros {
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_has_atomic_cas {
        ($($tt:tt)*) => {
            $($tt)*
        };
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_no_atomic_cas {
        ($($tt:tt)*) => {};
    }
}
#[cfg_attr(
    portable_atomic_no_cfg_target_has_atomic,
    cfg(not(any(
        not(portable_atomic_no_atomic_cas),
        portable_atomic_unsafe_assume_single_core,
        feature = "critical-section",
        target_arch = "avr",
        target_arch = "msp430",
    )))
)]
#[cfg_attr(
    not(portable_atomic_no_cfg_target_has_atomic),
    cfg(not(any(
        target_has_atomic = "ptr",
        portable_atomic_unsafe_assume_single_core,
        feature = "critical-section",
        target_arch = "avr",
        target_arch = "msp430",
    )))
)]
#[macro_use]
mod atomic_cas_macros {
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_has_atomic_cas {
        ($($tt:tt)*) => {};
    }
    #[doc(hidden)] // Not public API. (please submit an issue if you want this to be public API)
    #[macro_export]
    macro_rules! cfg_no_atomic_cas {
        ($($tt:tt)*) => {
            $($tt)*
        };
    }
}

// Check that all cfg_ macros work.
mod check {
    crate::cfg_has_atomic_load_store_8! { type _Atomic8 = (); }
    crate::cfg_no_atomic_load_store_8! { type _Atomic8 = (); }
    crate::cfg_has_atomic_load_store_16! { type _Atomic16 = (); }
    crate::cfg_no_atomic_load_store_16! { type _Atomic16 = (); }
    crate::cfg_has_atomic_load_store_32! { type _Atomic32 = (); }
    crate::cfg_no_atomic_load_store_32! { type _Atomic32 = (); }
    crate::cfg_has_atomic_load_store_64! { type _Atomic64 = (); }
    crate::cfg_no_atomic_load_store_64! { type _Atomic64 = (); }
    crate::cfg_has_atomic_load_store_128! { type _Atomic128 = (); }
    crate::cfg_no_atomic_load_store_128! { type _Atomic128 = (); }
    crate::cfg_has_atomic_load_store_ptr! { type _AtomicPtr = (); }
    crate::cfg_no_atomic_load_store_ptr! { type _AtomicPtr = (); }
    crate::cfg_has_atomic_8! { type __Atomic8 = (); }
    crate::cfg_no_atomic_8! { type __Atomic8 = (); }
    crate::cfg_has_atomic_16! { type __Atomic16 = (); }
    crate::cfg_no_atomic_16! { type __Atomic16 = (); }
    crate::cfg_has_atomic_32! { type __Atomic32 = (); }
    crate::cfg_no_atomic_32! { type __Atomic32 = (); }
    crate::cfg_has_atomic_64! { type __Atomic64 = (); }
    crate::cfg_no_atomic_64! { type __Atomic64 = (); }
    crate::cfg_has_atomic_128! { type __Atomic128 = (); }
    crate::cfg_no_atomic_128! { type __Atomic128 = (); }
    crate::cfg_has_atomic_ptr! { type __AtomicPtr = (); }
    crate::cfg_no_atomic_ptr! { type __AtomicPtr = (); }
    crate::cfg_has_atomic_cas! { type ___AtomicPtr = (); }
    crate::cfg_no_atomic_cas! { type ___AtomicPtr = (); }
    #[allow(unused_imports)]
    use {
        _Atomic128 as _, _Atomic16 as _, _Atomic32 as _, _Atomic64 as _, _Atomic8 as _,
        _AtomicPtr as _, __Atomic128 as _, __Atomic16 as _, __Atomic32 as _, __Atomic64 as _,
        __Atomic8 as _, __AtomicPtr as _, ___AtomicPtr as _,
    };
}

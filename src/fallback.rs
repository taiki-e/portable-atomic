#![allow(missing_docs, clippy::missing_safety_doc)] // TODO

use core::{fmt, marker::PhantomData, mem};

pub trait LockStrategy: private::LockStrategy {}

#[derive(Clone, Copy)]
#[repr(transparent)] // force zero sized
pub struct GlobalLock(pub(crate) PhantomData<()>);

static_assert!(mem::size_of::<GlobalLock>() == 0);

impl fmt::Debug for GlobalLock {
    #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str("GlobalLock")
    }
}

pub struct LocalLock {
    #[cfg(any(
        test,
        not(any(
            all(
                any(not(portable_atomic_no_asm), portable_atomic_nightly),
                target_arch = "aarch64"
            ),
            all(
                any(not(portable_atomic_no_asm), portable_atomic_nightly),
                any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b"),
                target_arch = "x86_64",
            ),
            all(
                portable_atomic_asm_experimental_arch,
                any(
                    target_endian = "little",
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
    pub(crate) lock: crate::imp::fallback::seq_lock::SeqLock,
    pub(crate) _priv: (),
}

impl fmt::Debug for LocalLock {
    #[allow(clippy::missing_inline_in_public_items)] // fmt is not hot path
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str("LocalLock")
    }
}

pub(crate) mod private {
    use core::marker::PhantomData;

    #[allow(missing_debug_implementations)]
    #[doc(hidden)]
    pub struct SeqLock<'a> {
        #[cfg(any(
            test,
            not(any(
                all(
                    any(not(portable_atomic_no_asm), portable_atomic_nightly),
                    target_arch = "aarch64"
                ),
                all(
                    any(not(portable_atomic_no_asm), portable_atomic_nightly),
                    any(
                        target_feature = "cmpxchg16b",
                        portable_atomic_target_feature = "cmpxchg16b"
                    ),
                    target_arch = "x86_64",
                ),
                all(
                    portable_atomic_asm_experimental_arch,
                    any(
                        target_endian = "little",
                        target_feature = "quadword-atomics",
                        portable_atomic_target_feature = "quadword-atomics"
                    ),
                    target_arch = "powerpc64"
                ),
                all(portable_atomic_asm_experimental_arch, target_arch = "s390x"),
            ))
        ))]
        #[cfg_attr(
            portable_atomic_no_cfg_target_has_atomic,
            cfg(not(portable_atomic_no_atomic_cas))
        )]
        #[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
        pub(crate) lock: &'a crate::imp::fallback::seq_lock::SeqLock,
        _priv: PhantomData<&'a ()>,
    }

    pub trait LockStrategy: Sized + Send + Sync {
        fn lock(&self, addr: usize) -> SeqLock<'_>;
    }

    impl super::LockStrategy for super::GlobalLock {}
    impl LockStrategy for super::GlobalLock {
        fn lock(&self, addr: usize) -> SeqLock<'_> {
            let _ = addr;
            SeqLock {
                #[cfg(any(
                    test,
                    not(any(
                        all(
                            any(not(portable_atomic_no_asm), portable_atomic_nightly),
                            target_arch = "aarch64"
                        ),
                        all(
                            any(not(portable_atomic_no_asm), portable_atomic_nightly),
                            any(
                                target_feature = "cmpxchg16b",
                                portable_atomic_target_feature = "cmpxchg16b"
                            ),
                            target_arch = "x86_64",
                        ),
                        all(
                            portable_atomic_asm_experimental_arch,
                            any(
                                target_endian = "little",
                                target_feature = "quadword-atomics",
                                portable_atomic_target_feature = "quadword-atomics"
                            ),
                            target_arch = "powerpc64"
                        ),
                        all(portable_atomic_asm_experimental_arch, target_arch = "s390x"),
                    ))
                ))]
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(not(portable_atomic_no_atomic_cas))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(target_has_atomic = "ptr")
                )]
                lock: crate::imp::fallback::seq_lock::imp::global_lock(addr),
                _priv: PhantomData,
            }
        }
    }

    impl super::LockStrategy for super::LocalLock {}
    impl LockStrategy for super::LocalLock {
        fn lock(&self, _addr: usize) -> SeqLock<'_> {
            SeqLock {
                #[cfg(any(
                    test,
                    not(any(
                        all(
                            any(not(portable_atomic_no_asm), portable_atomic_nightly),
                            target_arch = "aarch64"
                        ),
                        all(
                            any(not(portable_atomic_no_asm), portable_atomic_nightly),
                            any(
                                target_feature = "cmpxchg16b",
                                portable_atomic_target_feature = "cmpxchg16b"
                            ),
                            target_arch = "x86_64",
                        ),
                        all(
                            portable_atomic_asm_experimental_arch,
                            any(
                                target_endian = "little",
                                target_feature = "quadword-atomics",
                                portable_atomic_target_feature = "quadword-atomics"
                            ),
                            target_arch = "powerpc64"
                        ),
                        all(portable_atomic_asm_experimental_arch, target_arch = "s390x"),
                    ))
                ))]
                #[cfg_attr(
                    portable_atomic_no_cfg_target_has_atomic,
                    cfg(not(portable_atomic_no_atomic_cas))
                )]
                #[cfg_attr(
                    not(portable_atomic_no_cfg_target_has_atomic),
                    cfg(target_has_atomic = "ptr")
                )]
                lock: &self.lock,
                _priv: PhantomData,
            }
        }
    }
}

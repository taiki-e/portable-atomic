// SPDX-License-Identifier: Apache-2.0 OR MIT

#![allow(
    clippy::alloc_instead_of_core,
    clippy::std_instead_of_alloc,
    clippy::std_instead_of_core,
    clippy::undocumented_unsafe_blocks,
    clippy::wildcard_imports
)]

#[macro_use]
pub(crate) mod helper;

use test_helper as _; // For critical-section test

use super::*;

test_atomic_bool_pub!();
test_atomic_ptr_pub!();

test_atomic_int_pub!(isize);
test_atomic_int_pub!(usize);
test_atomic_int_pub!(i8);
test_atomic_int_pub!(u8);
test_atomic_int_pub!(i16);
test_atomic_int_pub!(u16);
test_atomic_int_pub!(i32);
test_atomic_int_pub!(u32);
test_atomic_int_pub!(i64);
test_atomic_int_pub!(u64);
#[cfg(not(all(valgrind, target_arch = "powerpc64")))] // TODO(powerpc64): Hang (as of Valgrind 3.26)
test_atomic_int_pub!(i128);
#[cfg(not(all(valgrind, target_arch = "powerpc64")))] // TODO(powerpc64): Hang (as of Valgrind 3.26)
test_atomic_int_pub!(u128);

#[cfg(all(feature = "float", portable_atomic_unstable_f16))]
test_atomic_float_pub!(f16);
#[cfg(feature = "float")]
test_atomic_float_pub!(f32);
#[cfg(feature = "float")]
// TODO: rustc bug: https://github.com/rust-lang/rust/issues/114479
#[cfg(not(all(not(debug_assertions), target_arch = "x86", not(target_feature = "sse2"))))]
test_atomic_float_pub!(f64);
#[cfg(all(feature = "float", portable_atomic_unstable_f128))]
test_atomic_float_pub!(f128);

#[deny(improper_ctypes)]
extern "C" {
    fn _atomic_bool_ffi_safety(_: AtomicBool);
    fn _atomic_ptr_ffi_safety(_: AtomicPtr<u8>);
    fn _atomic_isize_ffi_safety(_: AtomicIsize);
    fn _atomic_usize_ffi_safety(_: AtomicUsize);
    fn _atomic_i8_ffi_safety(_: AtomicI8);
    fn _atomic_u8_ffi_safety(_: AtomicU8);
    fn _atomic_i16_ffi_safety(_: AtomicI16);
    fn _atomic_u16_ffi_safety(_: AtomicU16);
    fn _atomic_i32_ffi_safety(_: AtomicI32);
    fn _atomic_u32_ffi_safety(_: AtomicU32);
    fn _atomic_i64_ffi_safety(_: AtomicI64);
    fn _atomic_u64_ffi_safety(_: AtomicU64);
    #[rustversion::since(1.89)] // https://github.com/rust-lang/rust/pull/137306
    fn _atomic_i128_ffi_safety(_: AtomicI128);
    #[rustversion::since(1.89)] // https://github.com/rust-lang/rust/pull/137306
    fn _atomic_u128_ffi_safety(_: AtomicU128);
    #[cfg(all(feature = "float", portable_atomic_unstable_f16))]
    fn _atomic_f16_ffi_safety(_: AtomicF16);
    #[cfg(feature = "float")]
    fn _atomic_f32_ffi_safety(_: AtomicF32);
    #[cfg(feature = "float")]
    fn _atomic_f64_ffi_safety(_: AtomicF64);
    #[cfg(all(feature = "float", portable_atomic_unstable_f128))]
    fn _atomic_f128_ffi_safety(_: AtomicF128);
}

#[test]
fn test_is_lock_free() {
    assert!(AtomicI8::is_always_lock_free());
    assert!(AtomicI8::is_lock_free());
    assert!(AtomicU8::is_always_lock_free());
    assert!(AtomicU8::is_lock_free());
    assert!(AtomicI16::is_always_lock_free());
    assert!(AtomicI16::is_lock_free());
    assert!(AtomicU16::is_always_lock_free());
    assert!(AtomicU16::is_lock_free());
    #[cfg(all(feature = "float", portable_atomic_unstable_f16))]
    assert!(AtomicF16::is_always_lock_free());
    #[cfg(all(feature = "float", portable_atomic_unstable_f16))]
    assert!(AtomicF16::is_lock_free());
    assert!(AtomicI32::is_always_lock_free());
    assert!(AtomicI32::is_lock_free());
    assert!(AtomicU32::is_always_lock_free());
    assert!(AtomicU32::is_lock_free());
    #[cfg(feature = "float")]
    assert!(AtomicF32::is_always_lock_free());
    #[cfg(feature = "float")]
    assert!(AtomicF32::is_lock_free());
    #[cfg(not(portable_atomic_no_cfg_target_has_atomic))]
    {
        if cfg!(any(
            target_has_atomic = "64",
            all(
                target_arch = "riscv32",
                not(any(miri, portable_atomic_sanitize_thread)),
                any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
                any(target_feature = "zacas", portable_atomic_target_feature = "zacas"),
            ),
        )) {
            assert!(AtomicI64::is_always_lock_free());
            assert!(AtomicI64::is_lock_free());
            assert!(AtomicU64::is_always_lock_free());
            assert!(AtomicU64::is_lock_free());
            #[cfg(feature = "float")]
            assert!(AtomicF64::is_always_lock_free());
            #[cfg(feature = "float")]
            assert!(AtomicF64::is_lock_free());
        } else if cfg!(all(
            feature = "fallback",
            target_arch = "arm",
            not(any(miri, portable_atomic_sanitize_thread)),
            any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
            any(target_os = "linux", target_os = "android"),
            not(any(target_feature = "v6", portable_atomic_target_feature = "v6")),
            not(portable_atomic_no_outline_atomics),
            not(target_has_atomic = "64"),
            not(portable_atomic_test_detect_false),
        )) {
            assert!(!AtomicI64::is_always_lock_free());
            assert!(!AtomicU64::is_always_lock_free());
            #[cfg(feature = "float")]
            assert!(!AtomicF64::is_always_lock_free());
            assert!(AtomicI64::is_lock_free());
            assert!(AtomicU64::is_lock_free());
            #[cfg(feature = "float")]
            assert!(AtomicF64::is_lock_free());
        } else {
            assert!(!AtomicI64::is_always_lock_free());
            assert!(!AtomicU64::is_always_lock_free());
            #[cfg(feature = "float")]
            assert!(!AtomicF64::is_always_lock_free());
            #[cfg(not(target_arch = "riscv32"))]
            {
                assert!(!AtomicI64::is_lock_free());
                assert!(!AtomicU64::is_lock_free());
                #[cfg(feature = "float")]
                assert!(!AtomicF64::is_lock_free());
            }
            #[cfg(target_arch = "riscv32")]
            {
                // TODO(riscv): check detect.has_zacas
            }
        }
    }
    if cfg!(portable_atomic_no_asm) && cfg!(not(portable_atomic_unstable_asm)) {
        assert!(!AtomicI128::is_always_lock_free());
        assert!(!AtomicI128::is_lock_free());
        assert!(!AtomicU128::is_always_lock_free());
        assert!(!AtomicU128::is_lock_free());
        #[cfg(all(feature = "float", portable_atomic_unstable_f128))]
        assert!(!AtomicF128::is_always_lock_free());
        #[cfg(all(feature = "float", portable_atomic_unstable_f128))]
        assert!(!AtomicF128::is_lock_free());
    } else if cfg!(any(
        all(
            target_arch = "aarch64",
            not(all(
                any(miri, portable_atomic_sanitize_thread),
                not(portable_atomic_atomic_intrinsics),
            )),
            any(not(portable_atomic_no_asm), portable_atomic_unstable_asm),
        ),
        all(
            target_arch = "arm64ec",
            not(all(
                any(miri, portable_atomic_sanitize_thread),
                not(portable_atomic_atomic_intrinsics),
            )),
            not(portable_atomic_no_asm),
        ),
        all(
            target_arch = "x86_64",
            any(target_feature = "cmpxchg16b", portable_atomic_target_feature = "cmpxchg16b"),
        ),
        all(
            target_arch = "riscv64",
            any(target_feature = "zacas", portable_atomic_target_feature = "zacas"),
        ),
        all(
            target_arch = "powerpc64",
            not(all(
                any(miri, portable_atomic_sanitize_thread),
                not(portable_atomic_atomic_intrinsics),
            )),
            not(portable_atomic_no_asm),
            any(
                target_feature = "quadword-atomics",
                portable_atomic_target_feature = "quadword-atomics",
            ),
        ),
        all(
            target_arch = "s390x",
            not(all(
                any(miri, portable_atomic_sanitize_thread),
                not(portable_atomic_atomic_intrinsics),
            )),
            not(portable_atomic_no_asm),
        ),
    )) {
        assert!(AtomicI128::is_always_lock_free());
        assert!(AtomicI128::is_lock_free());
        assert!(AtomicU128::is_always_lock_free());
        assert!(AtomicU128::is_lock_free());
        #[cfg(all(feature = "float", portable_atomic_unstable_f128))]
        assert!(AtomicF128::is_always_lock_free());
        #[cfg(all(feature = "float", portable_atomic_unstable_f128))]
        assert!(AtomicF128::is_lock_free());
    } else {
        assert!(!AtomicI128::is_always_lock_free());
        assert!(!AtomicU128::is_always_lock_free());
        #[cfg(all(feature = "float", portable_atomic_unstable_f128))]
        assert!(!AtomicF128::is_always_lock_free());
        #[cfg(not(any(
            target_arch = "x86_64",
            target_arch = "powerpc64",
            target_arch = "riscv64",
        )))]
        {
            assert!(!AtomicI128::is_lock_free());
            assert!(!AtomicU128::is_lock_free());
            #[cfg(all(feature = "float", portable_atomic_unstable_f128))]
            assert!(!AtomicF128::is_lock_free());
        }
        #[cfg(target_arch = "x86_64")]
        {
            let has_cmpxchg16b = cfg!(all(
                feature = "fallback",
                not(portable_atomic_no_outline_atomics),
                not(any(target_env = "sgx", miri)),
                not(portable_atomic_test_detect_false),
            )) && std::is_x86_feature_detected!("cmpxchg16b");
            assert_eq!(AtomicI128::is_lock_free(), has_cmpxchg16b);
            assert_eq!(AtomicU128::is_lock_free(), has_cmpxchg16b);
            #[cfg(all(feature = "float", portable_atomic_unstable_f128))]
            assert_eq!(AtomicF128::is_lock_free(), has_cmpxchg16b);
        }
        #[cfg(target_arch = "powerpc64")]
        {
            // TODO(powerpc64): is_powerpc_feature_detected is unstable
        }
        #[cfg(target_arch = "riscv64")]
        {
            // TODO(riscv): check detect.has_zacas
        }
    }
}

#[cfg(feature = "serde")]
#[test]
fn test_serde() {
    use std::{eprint, eprintln, fmt};

    use serde::{
        de::{Deserialize, Deserializer},
        ser::{Serialize, Serializer},
    };
    use serde_test::{Token, assert_tokens};

    #[derive(Debug)]
    struct DebugPartialEq<T>(T);
    impl<T: fmt::Debug> PartialEq for DebugPartialEq<T> {
        fn eq(&self, other: &Self) -> bool {
            std::format!("{:?}", self) == std::format!("{:?}", other)
        }
    }
    impl<T: Serialize> Serialize for DebugPartialEq<T> {
        fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
        where
            S: Serializer,
        {
            self.0.serialize(serializer)
        }
    }
    impl<'de, T: Deserialize<'de>> Deserialize<'de> for DebugPartialEq<T> {
        fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
        where
            D: Deserializer<'de>,
        {
            T::deserialize(deserializer).map(Self)
        }
    }

    macro_rules! t {
        ($atomic_type:ty, $value_type:ident $(as $token_value_type:ident)?, $token_type:ident) => {
            eprint!("test_serde {} ... ", stringify!($value_type));
            assert_tokens(&DebugPartialEq(<$atomic_type>::new($value_type::MAX)), &[
                Token::$token_type($value_type::MAX $(as $token_value_type)?),
            ]);
            assert_tokens(&DebugPartialEq(<$atomic_type>::new($value_type::MIN)), &[
                Token::$token_type($value_type::MIN $(as $token_value_type)?),
            ]);
            eprintln!("ok");
        };
    }

    assert_tokens(&DebugPartialEq(AtomicBool::new(true)), &[Token::Bool(true)]);
    assert_tokens(&DebugPartialEq(AtomicBool::new(false)), &[Token::Bool(false)]);
    t!(AtomicIsize, isize as i64, I64);
    t!(AtomicUsize, usize as u64, U64);
    t!(AtomicI8, i8, I8);
    t!(AtomicU8, u8, U8);
    t!(AtomicI16, i16, I16);
    t!(AtomicU16, u16, U16);
    t!(AtomicI32, i32, I32);
    t!(AtomicU32, u32, U32);
    t!(AtomicI64, i64, I64);
    t!(AtomicU64, u64, U64);
    #[cfg(not(all(valgrind, target_arch = "powerpc64")))] // TODO(powerpc64): Hang (as of Valgrind 3.26)
    t!(AtomicI128, i128, I128);
    #[cfg(not(all(valgrind, target_arch = "powerpc64")))] // TODO(powerpc64): Hang (as of Valgrind 3.26)
    t!(AtomicU128, u128, U128);
    // TODO(f16_and_f128): Test f16 & f128 once stabilized.
    #[cfg(feature = "float")]
    t!(AtomicF32, f32, F32);
    #[cfg(feature = "float")]
    t!(AtomicF64, f64, F64);
}

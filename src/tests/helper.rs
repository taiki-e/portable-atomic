use core::{ops, sync::atomic::Ordering};

macro_rules! __test_atomic_common {
    ($atomic_type:ty, $value_type:ty) => {
        #[test]
        fn assert_auto_traits() {
            fn _assert<T: Send + Sync + Unpin + std::panic::UnwindSafe>() {}
            _assert::<$atomic_type>();
        }
        #[test]
        fn alignment() {
            // https://github.com/rust-lang/rust/blob/1.59.0/library/core/tests/atomic.rs#L165
            assert_eq!(core::mem::align_of::<$atomic_type>(), core::mem::size_of::<$atomic_type>());
            assert_eq!(core::mem::size_of::<$atomic_type>(), core::mem::size_of::<$value_type>());
        }
    };
}
macro_rules! __test_atomic_pub_common {
    ($atomic_type:ty, $value_type:ty) => {
        #[test]
        fn assert_ref_unwind_safe() {
            #[cfg(not(all(portable_atomic_no_core_unwind_safe, not(feature = "std"))))]
            static_assertions::assert_impl_all!($atomic_type: std::panic::RefUnwindSafe);
            #[cfg(all(portable_atomic_no_core_unwind_safe, not(feature = "std")))]
            static_assertions::assert_not_impl_all!($atomic_type: std::panic::RefUnwindSafe);
        }
        #[test]
        fn is_lock_free() {
            const IS_ALWAYS_LOCK_FREE: bool = <$atomic_type>::is_always_lock_free();
            assert_eq!(IS_ALWAYS_LOCK_FREE, <$atomic_type>::is_always_lock_free());
            let is_lock_free = <$atomic_type>::is_lock_free();
            if IS_ALWAYS_LOCK_FREE {
                // If is_always_lock_free is true, then is_lock_free must always be true.
                assert!(is_lock_free);
            }
        }
    };
}

macro_rules! __test_atomic_int_load_store {
    ($atomic_type:ty, $int_type:ident, single_thread) => {
        __test_atomic_common!($atomic_type, $int_type);
        use crate::tests::helper::*;
        #[test]
        fn accessor() {
            let mut a = <$atomic_type>::new(10);
            assert_eq!(*a.get_mut(), 10);
            *a.get_mut() = 5;
            assert_eq!(a.into_inner(), 5);
        }
        #[test]
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(10);
            test_load_ordering(|order| VAR.load(order));
            test_store_ordering(|order| VAR.store(10, order));
            for (load_order, store_order) in load_orderings().iter().copied().zip(store_orderings())
            {
                assert_eq!(VAR.load(load_order), 10);
                VAR.store(5, store_order);
                assert_eq!(VAR.load(load_order), 5);
                VAR.store(10, store_order);
                let a = <$atomic_type>::new(1);
                assert_eq!(a.load(load_order), 1);
                a.store(2, store_order);
                assert_eq!(a.load(load_order), 2);
            }
        }
    };
    ($atomic_type:ty, $int_type:ident) => {
        __test_atomic_int_load_store!($atomic_type, $int_type, single_thread);
        use crossbeam_utils::thread;
        #[test]
        fn stress_load_store() {
            let iterations = if cfg!(miri) { 500 } else { 25_000 };
            let threads = if cfg!(debug_assertions) { 2 } else { fastrand::usize(2..=8) };
            let a = <$atomic_type>::new(0);
            std::eprintln!("threads={}", threads);
            thread::scope(|s| {
                for _ in 0..threads {
                    s.spawn(|_| {
                        for _ in 0..iterations {
                            let v = fastrand::$int_type(..);
                            a.store(v, rand_store_ordering());
                        }
                    });
                    s.spawn(|_| {
                        for _ in 0..iterations {
                            a.load(rand_load_ordering());
                        }
                    });
                }
            })
            .unwrap();
        }
    };
}
macro_rules! __test_atomic_float_load_store {
    ($atomic_type:ty, $float_type:ident, single_thread) => {
        __test_atomic_common!($atomic_type, $float_type);
        use crate::tests::helper::*;
        #[test]
        fn accessor() {
            let mut a = <$atomic_type>::new(10.0);
            assert_eq!(*a.get_mut(), 10.0);
            *a.get_mut() = 5.0;
            assert_eq!(a.into_inner(), 5.0);
        }
        #[test]
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(10.0);
            test_load_ordering(|order| VAR.load(order));
            test_store_ordering(|order| VAR.store(10.0, order));
            assert_eq!(VAR.load(Ordering::SeqCst), 10.0);
            VAR.store(5.0, Ordering::SeqCst);
            assert_eq!(VAR.load(Ordering::SeqCst), 5.0);
            let a = <$atomic_type>::new(1.0);
            assert_eq!(a.load(Ordering::SeqCst), 1.0);
            a.store(2.0, Ordering::SeqCst);
            assert_eq!(a.load(Ordering::SeqCst), 2.0);
        }
    };
    ($atomic_type:ty, $float_type:ident) => {
        __test_atomic_float_load_store!($atomic_type, $float_type, single_thread);
        // TODO: multi thread
    };
}
macro_rules! __test_atomic_bool_load_store {
    ($atomic_type:ty, single_thread) => {
        __test_atomic_common!($atomic_type, bool);
        use crate::tests::helper::*;
        #[test]
        fn accessor() {
            let mut a = <$atomic_type>::new(false);
            assert_eq!(*a.get_mut(), false);
            *a.get_mut() = true;
            assert_eq!(a.into_inner(), true);
        }
        #[test]
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(false);
            test_load_ordering(|order| VAR.load(order));
            test_store_ordering(|order| VAR.store(false, order));
            assert_eq!(VAR.load(Ordering::SeqCst), false);
            VAR.store(true, Ordering::SeqCst);
            assert_eq!(VAR.load(Ordering::SeqCst), true);
            let a = <$atomic_type>::new(true);
            assert_eq!(a.load(Ordering::SeqCst), true);
            a.store(false, Ordering::SeqCst);
            assert_eq!(a.load(Ordering::SeqCst), false);
        }
    };
    ($atomic_type:ty) => {
        __test_atomic_bool_load_store!($atomic_type, single_thread);
        // TODO: multi thread
    };
}
macro_rules! __test_atomic_ptr_load_store {
    ($atomic_type:ty, single_thread) => {
        __test_atomic_common!($atomic_type, *mut u8);
        use crate::tests::helper::*;
        use std::ptr;
        #[test]
        fn accessor() {
            let mut v = 1;
            let mut a = <$atomic_type>::new(ptr::null_mut());
            assert!(a.get_mut().is_null());
            *a.get_mut() = &mut v;
            assert!(!a.into_inner().is_null());
        }
        #[test]
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(ptr::null_mut());
            test_load_ordering(|order| VAR.load(order));
            test_store_ordering(|order| VAR.store(ptr::null_mut(), order));
            let mut v = 1_u8;
            let p = &mut v as *mut u8;
            assert_eq!(VAR.load(Ordering::SeqCst), ptr::null_mut());
            VAR.store(p, Ordering::SeqCst);
            assert_eq!(VAR.load(Ordering::SeqCst), p);
            let a = <$atomic_type>::new(p);
            assert_eq!(a.load(Ordering::SeqCst), p);
            a.store(ptr::null_mut(), Ordering::SeqCst);
            assert_eq!(a.load(Ordering::SeqCst), ptr::null_mut());
        }
    };
    ($atomic_type:ty) => {
        __test_atomic_ptr_load_store!($atomic_type, single_thread);
        // TODO: multi thread
    };
}

macro_rules! __test_atomic_int {
    ($atomic_type:ty, $int_type:ident, single_thread) => {
        use core::$int_type;
        #[test]
        fn swap() {
            let a = <$atomic_type>::new(5);
            test_swap_ordering(|order| a.swap(5, order));
            for order in swap_orderings() {
                assert_eq!(a.swap(10, order), 5);
                assert_eq!(a.swap(5, order), 10);
            }
        }
        #[test]
        fn compare_exchange() {
            let a = <$atomic_type>::new(5);
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange(5, 5, success, failure)
            });
            assert_eq!(a.compare_exchange(5, 10, Ordering::Acquire, Ordering::Relaxed), Ok(5));
            assert_eq!(a.load(Ordering::Relaxed), 10);
            assert_eq!(a.compare_exchange(6, 12, Ordering::SeqCst, Ordering::Acquire), Err(10));
            assert_eq!(a.load(Ordering::Relaxed), 10);
        }
        #[test]
        fn compare_exchange_weak() {
            let a = <$atomic_type>::new(4);
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange_weak(4, 4, success, failure)
            });
            assert_eq!(a.compare_exchange_weak(6, 8, Ordering::SeqCst, Ordering::Acquire), Err(4));
            let mut old = a.load(Ordering::Relaxed);
            loop {
                let new = old * 2;
                match a.compare_exchange_weak(old, new, Ordering::SeqCst, Ordering::Relaxed) {
                    Ok(_) => break,
                    Err(x) => old = x,
                }
            }
            assert_eq!(a.load(Ordering::Relaxed), 8);
        }
        #[test]
        fn fetch_add() {
            let a = <$atomic_type>::new(0);
            test_swap_ordering(|order| a.fetch_add(0, order));
            assert_eq!(a.fetch_add(10, Ordering::SeqCst), 0);
            assert_eq!(a.load(Ordering::SeqCst), 10);
            let a = <$atomic_type>::new($int_type::MAX);
            assert_eq!(a.fetch_add(1, Ordering::SeqCst), $int_type::MAX);
            assert_eq!(a.load(Ordering::SeqCst), $int_type::MAX.wrapping_add(1));
        }
        #[test]
        fn fetch_sub() {
            let a = <$atomic_type>::new(20);
            test_swap_ordering(|order| a.fetch_sub(0, order));
            assert_eq!(a.fetch_sub(10, Ordering::SeqCst), 20);
            assert_eq!(a.load(Ordering::SeqCst), 10);
            let a = <$atomic_type>::new($int_type::MIN);
            assert_eq!(a.fetch_sub(1, Ordering::SeqCst), $int_type::MIN);
            assert_eq!(a.load(Ordering::SeqCst), $int_type::MIN.wrapping_sub(1));
        }
        #[test]
        fn fetch_and() {
            let a = <$atomic_type>::new(0b101101);
            test_swap_ordering(|order| a.fetch_and(0b101101, order));
            assert_eq!(a.fetch_and(0b110011, Ordering::SeqCst), 0b101101);
            assert_eq!(a.load(Ordering::SeqCst), 0b100001);
        }
        #[test]
        fn fetch_nand() {
            let a = <$atomic_type>::new(0x13);
            test_swap_ordering(|order| a.fetch_nand(0x31, order));
            let a = <$atomic_type>::new(0x13);
            assert_eq!(a.fetch_nand(0x31, Ordering::SeqCst), 0x13);
            assert_eq!(a.load(Ordering::SeqCst), !(0x13 & 0x31));
        }
        #[test]
        fn fetch_or() {
            let a = <$atomic_type>::new(0b101101);
            test_swap_ordering(|order| a.fetch_or(0, order));
            assert_eq!(a.fetch_or(0b110011, Ordering::SeqCst), 0b101101);
            assert_eq!(a.load(Ordering::SeqCst), 0b111111);
        }
        #[test]
        fn fetch_xor() {
            let a = <$atomic_type>::new(0b101101);
            test_swap_ordering(|order| a.fetch_xor(0, order));
            let a = <$atomic_type>::new(0b101101);
            assert_eq!(a.fetch_xor(0b110011, Ordering::SeqCst), 0b101101);
            assert_eq!(a.load(Ordering::SeqCst), 0b011110);
        }
        #[test]
        fn fetch_max() {
            let a = <$atomic_type>::new(23);
            test_swap_ordering(|order| a.fetch_max(23, order));
            assert_eq!(a.fetch_max(22, Ordering::SeqCst), 23);
            assert_eq!(a.load(Ordering::SeqCst), 23);
            assert_eq!(a.fetch_max(24, Ordering::SeqCst), 23);
            assert_eq!(a.load(Ordering::SeqCst), 24);
        }
        #[test]
        fn fetch_min() {
            let a = <$atomic_type>::new(23);
            test_swap_ordering(|order| a.fetch_min(23, order));
            assert_eq!(a.fetch_min(24, Ordering::SeqCst), 23);
            assert_eq!(a.load(Ordering::SeqCst), 23);
            assert_eq!(a.fetch_min(22, Ordering::SeqCst), 23);
            assert_eq!(a.load(Ordering::SeqCst), 22);
        }
        mod quickcheck {
            use super::super::*;
            use crate::tests::helper::*;
            ::quickcheck::quickcheck! {
                fn fetch_add(x: $int_type, y: $int_type) -> bool {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_add(y, rand_swap_ordering()), x);
                    assert_eq!(a.load(rand_load_ordering()), x.wrapping_add(y));
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_add(x, rand_swap_ordering()), y);
                    assert_eq!(a.load(rand_load_ordering()), y.wrapping_add(x));
                    true
                }
                fn fetch_sub(x: $int_type, y: $int_type) -> bool {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_sub(y, rand_swap_ordering()), x);
                    assert_eq!(a.load(rand_load_ordering()), x.wrapping_sub(y));
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_sub(x, rand_swap_ordering()), y);
                    assert_eq!(a.load(rand_load_ordering()), y.wrapping_sub(x));
                    true
                }
                fn fetch_and(x: $int_type, y: $int_type) -> bool {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_and(y, rand_swap_ordering()), x);
                    assert_eq!(a.load(rand_load_ordering()), x & y);
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_and(x, rand_swap_ordering()), y);
                    assert_eq!(a.load(rand_load_ordering()), y & x);
                    true
                }
                fn fetch_nand(x: $int_type, y: $int_type) -> bool {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_nand(y, rand_swap_ordering()), x);
                    assert_eq!(a.load(rand_load_ordering()), !(x & y));
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_nand(x, rand_swap_ordering()), y);
                    assert_eq!(a.load(rand_load_ordering()), !(y & x));
                    true
                }
                fn fetch_or(x: $int_type, y: $int_type) -> bool {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_or(y, rand_swap_ordering()), x);
                    assert_eq!(a.load(rand_load_ordering()), x | y);
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_or(x, rand_swap_ordering()), y);
                    assert_eq!(a.load(rand_load_ordering()), y | x);
                    true
                }
                fn fetch_xor(x: $int_type, y: $int_type) -> bool {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_xor(y, rand_swap_ordering()), x);
                    assert_eq!(a.load(rand_load_ordering()), x ^ y);
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_xor(x, rand_swap_ordering()), y);
                    assert_eq!(a.load(rand_load_ordering()), y ^ x);
                    true
                }
                fn fetch_max(x: $int_type, y: $int_type) -> bool {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_max(y, rand_swap_ordering()), x);
                    assert_eq!(a.load(rand_load_ordering()), core::cmp::max(x, y));
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_max(x, rand_swap_ordering()), y);
                    assert_eq!(a.load(rand_load_ordering()), core::cmp::max(y, x));
                    true
                }
                fn fetch_min(x: $int_type, y: $int_type) -> bool {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_min(y, rand_swap_ordering()), x);
                    assert_eq!(a.load(rand_load_ordering()), core::cmp::min(x, y));
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_min(x, rand_swap_ordering()), y);
                    assert_eq!(a.load(rand_load_ordering()), core::cmp::min(y, x));
                    true
                }
            }
        }
    };
    ($atomic_type:ty, $int_type:ident) => {
        __test_atomic_int!($atomic_type, $int_type, single_thread);
        #[test]
        fn stress() {
            let iterations = if cfg!(miri) { 500 } else { 25_000 };
            let threads = if cfg!(debug_assertions) { 2 } else { fastrand::usize(2..=8) };
            let a = <$atomic_type>::new(0);
            std::eprintln!("threads={}", threads);
            thread::scope(|s| {
                for _ in 0..threads {
                    s.spawn(|_| {
                        for _ in 0..iterations {
                            let v = fastrand::$int_type(..);
                            a.store(v, rand_store_ordering());
                        }
                    });
                    s.spawn(|_| {
                        for _ in 0..iterations {
                            a.load(rand_load_ordering());
                        }
                    });
                    s.spawn(|_| {
                        for i in 0..iterations {
                            let old = if i % 2 == 0 {
                                fastrand::$int_type(..)
                            } else {
                                a.load(rand_load_ordering())
                            };
                            let new = fastrand::$int_type(..);
                            let o = rand_compare_exchange_ordering();
                            let _ = a.compare_exchange(old, new, o.0, o.1);
                        }
                    });
                }
            })
            .unwrap();
        }
    };
}
macro_rules! __test_atomic_float {
    ($atomic_type:ty, $float_type:ident, single_thread) => {
        use core::$float_type;
        #[test]
        fn swap() {
            let a = <$atomic_type>::new(5.0);
            test_swap_ordering(|order| a.swap(5.0, order));
            assert_eq!(a.swap(10.0, Ordering::SeqCst), 5.0);
            assert_eq!(a.load(Ordering::SeqCst), 10.0);
        }
        #[test]
        fn compare_exchange() {
            let a = <$atomic_type>::new(5.0);
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange(5.0, 5.0, success, failure)
            });
            assert_eq!(
                a.compare_exchange(5.0, 10.0, Ordering::Acquire, Ordering::Relaxed),
                Ok(5.0),
            );
            assert_eq!(a.load(Ordering::Relaxed), 10.0);
            assert_eq!(
                a.compare_exchange(6.0, 12.0, Ordering::SeqCst, Ordering::Acquire),
                Err(10.0),
            );
            assert_eq!(a.load(Ordering::Relaxed), 10.0);
        }
        #[test]
        fn compare_exchange_weak() {
            let a = <$atomic_type>::new(4.0);
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange_weak(4.0, 4.0, success, failure)
            });
            assert_eq!(
                a.compare_exchange_weak(6.0, 8.0, Ordering::SeqCst, Ordering::Acquire),
                Err(4.0),
            );
            let mut old = a.load(Ordering::Relaxed);
            loop {
                let new = old * 2.0;
                match a.compare_exchange_weak(old, new, Ordering::SeqCst, Ordering::Relaxed) {
                    Ok(_) => break,
                    Err(x) => old = x,
                }
            }
            assert_eq!(a.load(Ordering::Relaxed), 8.0);
        }
        #[test]
        fn fetch_add() {
            let a = <$atomic_type>::new(0.0);
            test_swap_ordering(|order| a.fetch_add(0.0, order));
            assert_eq!(a.fetch_add(10.0, Ordering::SeqCst), 0.0);
            assert_eq!(a.load(Ordering::SeqCst), 10.0);
            let a = <$atomic_type>::new($float_type::MAX);
            assert_eq!(a.fetch_add(1.0, Ordering::SeqCst), $float_type::MAX);
            assert_eq!(a.load(Ordering::SeqCst), $float_type::MAX + 1.0);
        }
        #[test]
        fn fetch_sub() {
            let a = <$atomic_type>::new(20.0);
            test_swap_ordering(|order| a.fetch_sub(0.0, order));
            assert_eq!(a.fetch_sub(10.0, Ordering::SeqCst), 20.0);
            assert_eq!(a.load(Ordering::SeqCst), 10.0);
            let a = <$atomic_type>::new($float_type::MIN);
            assert_eq!(a.fetch_sub(1.0, Ordering::SeqCst), $float_type::MIN);
            assert_eq!(a.load(Ordering::SeqCst), $float_type::MIN - 1.0);
        }
        #[test]
        fn fetch_max() {
            let a = <$atomic_type>::new(23.0);
            test_swap_ordering(|order| a.fetch_max(23.0, order));
            assert_eq!(a.fetch_max(22.0, Ordering::SeqCst), 23.0);
            assert_eq!(a.load(Ordering::SeqCst), 23.0);
            assert_eq!(a.fetch_max(24.0, Ordering::SeqCst), 23.0);
            assert_eq!(a.load(Ordering::SeqCst), 24.0);
        }
        #[test]
        fn fetch_min() {
            let a = <$atomic_type>::new(23.0);
            test_swap_ordering(|order| a.fetch_min(23.0, order));
            assert_eq!(a.fetch_min(24.0, Ordering::SeqCst), 23.0);
            assert_eq!(a.load(Ordering::SeqCst), 23.0);
            assert_eq!(a.fetch_min(22.0, Ordering::SeqCst), 23.0);
            assert_eq!(a.load(Ordering::SeqCst), 22.0);
        }
        // TODO: quickcheck
    };
    ($atomic_type:ty, $float_type:ident) => {
        __test_atomic_float!($atomic_type, $float_type, single_thread);
        // TODO: multi thread
    };
}
macro_rules! __test_atomic_bool {
    ($atomic_type:ty, single_thread) => {
        #[test]
        fn swap() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| a.swap(true, order));
            assert_eq!(a.swap(false, Ordering::SeqCst), true);
            assert_eq!(a.load(Ordering::SeqCst), false);
        }
        #[test]
        fn compare_exchange() {
            let a = <$atomic_type>::new(true);
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange(true, true, success, failure)
            });
            assert_eq!(
                a.compare_exchange(true, false, Ordering::Acquire, Ordering::Relaxed),
                Ok(true),
            );
            assert_eq!(a.load(Ordering::Relaxed), false);
            assert_eq!(
                a.compare_exchange(true, true, Ordering::SeqCst, Ordering::Acquire),
                Err(false),
            );
            assert_eq!(a.load(Ordering::Relaxed), false);
        }
        #[test]
        fn compare_exchange_weak() {
            let a = <$atomic_type>::new(false);
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange_weak(false, false, success, failure)
            });
            assert_eq!(
                a.compare_exchange_weak(true, true, Ordering::SeqCst, Ordering::Acquire),
                Err(false),
            );
            let mut old = a.load(Ordering::Relaxed);
            let new = true;
            loop {
                match a.compare_exchange_weak(old, new, Ordering::SeqCst, Ordering::Relaxed) {
                    Ok(_) => break,
                    Err(x) => old = x,
                }
            }
            assert_eq!(a.load(Ordering::Relaxed), true);
        }
        #[test]
        fn fetch_and() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| assert_eq!(a.fetch_and(true, order), true));
            assert_eq!(a.fetch_and(false, Ordering::SeqCst), true);
            assert_eq!(a.load(Ordering::SeqCst), false);
            let a = <$atomic_type>::new(true);
            assert_eq!(a.fetch_and(true, Ordering::SeqCst), true);
            assert_eq!(a.load(Ordering::SeqCst), true);
            let a = <$atomic_type>::new(false);
            assert_eq!(a.fetch_and(false, Ordering::SeqCst), false);
            assert_eq!(a.load(Ordering::SeqCst), false);
        }
        #[test]
        fn fetch_nand() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| assert_eq!(a.fetch_nand(false, order), true));
            assert_eq!(a.fetch_nand(false, Ordering::SeqCst), true);
            assert_eq!(a.load(Ordering::SeqCst), true);
            let a = <$atomic_type>::new(true);
            assert_eq!(a.fetch_nand(true, Ordering::SeqCst), true);
            assert_eq!(a.load(Ordering::SeqCst) as usize, 0);
            assert_eq!(a.load(Ordering::SeqCst), false);
            let a = <$atomic_type>::new(false);
            assert_eq!(a.fetch_nand(false, Ordering::SeqCst), false);
            assert_eq!(a.load(Ordering::SeqCst), true);
        }
        #[test]
        fn fetch_or() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| assert_eq!(a.fetch_or(false, order), true));
            assert_eq!(a.fetch_or(false, Ordering::SeqCst), true);
            assert_eq!(a.load(Ordering::SeqCst), true);
            let a = <$atomic_type>::new(true);
            assert_eq!(a.fetch_or(true, Ordering::SeqCst), true);
            assert_eq!(a.load(Ordering::SeqCst), true);
            let a = <$atomic_type>::new(false);
            assert_eq!(a.fetch_or(false, Ordering::SeqCst), false);
            assert_eq!(a.load(Ordering::SeqCst), false);
        }
        #[test]
        fn fetch_xor() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| assert_eq!(a.fetch_xor(false, order), true));
            assert_eq!(a.fetch_xor(false, Ordering::SeqCst), true);
            assert_eq!(a.load(rand_load_ordering()), true);
            let a = <$atomic_type>::new(true);
            assert_eq!(a.fetch_xor(true, Ordering::SeqCst), true);
            assert_eq!(a.load(rand_load_ordering()), false);
            let a = <$atomic_type>::new(false);
            assert_eq!(a.fetch_xor(false, Ordering::SeqCst), false);
            assert_eq!(a.load(rand_load_ordering()), false);
        }
        mod quickcheck {
            use super::super::*;
            use crate::tests::helper::*;
            ::quickcheck::quickcheck! {
                fn fetch_and(x: bool, y: bool) -> bool {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_and(y, rand_swap_ordering()), x);
                    assert_eq!(a.load(rand_load_ordering()), x & y);
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_and(x, rand_swap_ordering()), y);
                    assert_eq!(a.load(rand_load_ordering()), y & x);
                    true
                }
                fn fetch_nand(x: bool, y: bool) -> bool {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_nand(y, rand_swap_ordering()), x);
                    assert_eq!(a.load(rand_load_ordering()), !(x & y));
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_nand(x, rand_swap_ordering()), y);
                    assert_eq!(a.load(rand_load_ordering()), !(y & x));
                    true
                }
                fn fetch_or(x: bool, y: bool) -> bool {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_or(y, rand_swap_ordering()), x);
                    assert_eq!(a.load(rand_load_ordering()), x | y);
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_or(x, rand_swap_ordering()), y);
                    assert_eq!(a.load(rand_load_ordering()), y | x);
                    true
                }
                fn fetch_xor(x: bool, y: bool) -> bool {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_xor(y, rand_swap_ordering()), x);
                    assert_eq!(a.load(rand_load_ordering()), x ^ y);
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_xor(x, rand_swap_ordering()), y);
                    assert_eq!(a.load(rand_load_ordering()), y ^ x);
                    true
                }
            }
        }
    };
    ($atomic_type:ty) => {
        __test_atomic_bool!($atomic_type, single_thread);
        // TODO: multi thread
    };
}
macro_rules! __test_atomic_ptr {
    ($atomic_type:ty, single_thread) => {
        #[test]
        fn swap() {
            let a = <$atomic_type>::new(ptr::null_mut());
            test_swap_ordering(|order| a.swap(ptr::null_mut(), order));
            let x = &mut 1;
            assert_eq!(a.swap(x, Ordering::SeqCst), ptr::null_mut());
            assert_eq!(a.load(Ordering::SeqCst), x as _);
        }
        #[test]
        fn compare_exchange() {
            let a = <$atomic_type>::new(ptr::null_mut());
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange(ptr::null_mut(), ptr::null_mut(), success, failure)
            });
            let x = &mut 1;
            assert_eq!(
                a.compare_exchange(ptr::null_mut(), x, Ordering::Acquire, Ordering::Relaxed),
                Ok(ptr::null_mut()),
            );
            assert_eq!(a.load(Ordering::Relaxed), x as _);
            assert_eq!(
                a.compare_exchange(
                    ptr::null_mut(),
                    ptr::null_mut(),
                    Ordering::SeqCst,
                    Ordering::Acquire
                ),
                Err(x as _),
            );
            assert_eq!(a.load(Ordering::Relaxed), x as _);
        }
        #[test]
        fn compare_exchange_weak() {
            let a = <$atomic_type>::new(ptr::null_mut());
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange_weak(ptr::null_mut(), ptr::null_mut(), success, failure)
            });
            let x = &mut 1;
            assert_eq!(
                a.compare_exchange_weak(x, x, Ordering::SeqCst, Ordering::Acquire),
                Err(ptr::null_mut()),
            );
            let mut old = a.load(Ordering::Relaxed);
            loop {
                match a.compare_exchange_weak(old, x, Ordering::SeqCst, Ordering::Relaxed) {
                    Ok(_) => break,
                    Err(x) => old = x,
                }
            }
            assert_eq!(a.load(Ordering::Relaxed), x as _);
        }
    };
    ($atomic_type:ty) => {
        __test_atomic_ptr!($atomic_type, single_thread);
        // TODO: multi thread
    };
}

macro_rules! __test_atomic_int_pub {
    ($atomic_type:ty, $int_type:ident) => {
        __test_atomic_pub_common!($atomic_type, $int_type);
        #[test]
        fn fetch_update() {
            let a = <$atomic_type>::new(7);
            test_compare_exchange_ordering(|set, fetch| a.fetch_update(set, fetch, |x| Some(x)));
            assert_eq!(a.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |_| None), Err(7));
            assert_eq!(a.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |x| Some(x + 1)), Ok(7));
            assert_eq!(a.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |x| Some(x + 1)), Ok(8));
            assert_eq!(a.load(Ordering::SeqCst), 9);
        }
        #[test]
        fn impls() {
            let a = <$atomic_type>::default();
            let b = <$atomic_type>::from(0);
            assert_eq!(a.load(Ordering::SeqCst), b.load(Ordering::SeqCst));
            assert_eq!(std::format!("{:?}", a), std::format!("{:?}", a.load(Ordering::SeqCst)));
        }
    };
}
macro_rules! __test_atomic_float_pub {
    ($atomic_type:ty, $float_type:ident) => {
        __test_atomic_pub_common!($atomic_type, $float_type);
        #[test]
        fn fetch_update() {
            let a = <$atomic_type>::new(7.0);
            test_compare_exchange_ordering(|set, fetch| a.fetch_update(set, fetch, |x| Some(x)));
            assert_eq!(a.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |_| None), Err(7.0));
            assert_eq!(
                a.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |x| Some(x + 1.0)),
                Ok(7.0)
            );
            assert_eq!(
                a.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |x| Some(x + 1.0)),
                Ok(8.0)
            );
            assert_eq!(a.load(Ordering::SeqCst), 9.0);
        }
        #[test]
        fn impls() {
            let a = <$atomic_type>::default();
            let b = <$atomic_type>::from(0.0);
            assert_eq!(a.load(Ordering::SeqCst), b.load(Ordering::SeqCst));
            assert_eq!(std::format!("{:?}", a), std::format!("{:?}", a.load(Ordering::SeqCst)));
        }
    };
}
macro_rules! __test_atomic_bool_pub {
    ($atomic_type:ty) => {
        __test_atomic_pub_common!($atomic_type, bool);
        #[test]
        fn fetch_update() {
            let a = <$atomic_type>::new(false);
            test_compare_exchange_ordering(|set, fetch| a.fetch_update(set, fetch, |x| Some(x)));
            assert_eq!(a.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |_| None), Err(false));
            assert_eq!(a.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |x| Some(!x)), Ok(false));
            assert_eq!(a.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |x| Some(!x)), Ok(true));
            assert_eq!(a.load(Ordering::SeqCst), false);
        }
        #[test]
        fn impls() {
            let a = <$atomic_type>::default();
            let b = <$atomic_type>::from(false);
            assert_eq!(a.load(Ordering::SeqCst), b.load(Ordering::SeqCst));
            assert_eq!(std::format!("{:?}", a), std::format!("{:?}", a.load(Ordering::SeqCst)));
        }
    };
}
macro_rules! __test_atomic_ptr_pub {
    ($atomic_type:ty) => {
        __test_atomic_pub_common!($atomic_type, *mut u8);
        #[test]
        fn fetch_update() {
            let a = <$atomic_type>::new(ptr::null_mut());
            test_compare_exchange_ordering(|set, fetch| a.fetch_update(set, fetch, |x| Some(x)));
            assert_eq!(
                a.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |_| None),
                Err(ptr::null_mut())
            );
            assert_eq!(
                a.fetch_update(Ordering::SeqCst, Ordering::SeqCst, |_| Some(
                    &a as *const _ as *mut _
                )),
                Ok(ptr::null_mut())
            );
            assert_eq!(a.load(Ordering::SeqCst), &a as *const _ as *mut _);
        }
        #[test]
        fn impls() {
            let a = <$atomic_type>::default();
            let b = <$atomic_type>::from(ptr::null_mut());
            assert_eq!(a.load(Ordering::SeqCst), b.load(Ordering::SeqCst));
            assert_eq!(std::format!("{:?}", a), std::format!("{:?}", a.load(Ordering::SeqCst)));
            assert_eq!(std::format!("{:p}", a), std::format!("{:p}", a.load(Ordering::SeqCst)));
        }
    };
}

#[allow(unused_macros)] // for riscv
macro_rules! test_atomic_int_load_store {
    ($int_type:ident) => {
        paste::paste! {
            mod [<test_atomic_ $int_type>] {
                use super::*;
                __test_atomic_int_load_store!([<Atomic $int_type:camel>], $int_type);
            }
        }
    };
}
#[allow(unused_macros)] // for riscv
macro_rules! test_atomic_bool_load_store {
    () => {
        mod test_atomic_bool {
            use super::*;
            __test_atomic_bool_load_store!(AtomicBool);
        }
    };
}
#[allow(unused_macros)] // for riscv
macro_rules! test_atomic_ptr_load_store {
    () => {
        mod test_atomic_ptr {
            use super::*;
            __test_atomic_ptr_load_store!(AtomicPtr<u8>);
        }
    };
}

#[allow(unused_macros)] // for interrupt module
macro_rules! test_atomic_int_single_thread {
    ($int_type:ident) => {
        paste::paste! {
            mod [<test_atomic_ $int_type>] {
                use super::*;
                __test_atomic_int_load_store!([<Atomic $int_type:camel>], $int_type, single_thread);
                __test_atomic_int!([<Atomic $int_type:camel>], $int_type, single_thread);
            }
        }
    };
}
#[allow(unused_macros)] // for interrupt module
macro_rules! test_atomic_bool_single_thread {
    () => {
        mod test_atomic_bool {
            use super::*;
            __test_atomic_bool_load_store!(AtomicBool, single_thread);
            __test_atomic_bool!(AtomicBool, single_thread);
        }
    };
}
#[allow(unused_macros)] // for interrupt module
macro_rules! test_atomic_ptr_single_thread {
    () => {
        mod test_atomic_ptr {
            use super::*;
            __test_atomic_ptr_load_store!(AtomicPtr<u8>, single_thread);
            __test_atomic_ptr!(AtomicPtr<u8>, single_thread);
        }
    };
}

macro_rules! test_atomic_int {
    ($int_type:ident) => {
        paste::paste! {
            mod [<test_atomic_ $int_type>] {
                use super::*;
                __test_atomic_int_load_store!([<Atomic $int_type:camel>], $int_type);
                __test_atomic_int!([<Atomic $int_type:camel>], $int_type);
            }
        }
    };
}

macro_rules! test_atomic_int_pub {
    ($int_type:ident) => {
        paste::paste! {
            mod [<test_atomic_ $int_type>] {
                use super::*;
                __test_atomic_int_load_store!([<Atomic $int_type:camel>], $int_type);
                __test_atomic_int!([<Atomic $int_type:camel>], $int_type);
                __test_atomic_int_pub!([<Atomic $int_type:camel>], $int_type);
            }
        }
    };
}
#[cfg(feature = "float")]
macro_rules! test_atomic_float_pub {
    ($float_type:ident) => {
        paste::paste! {
            mod [<test_atomic_ $float_type>] {
                use super::*;
                __test_atomic_float_load_store!([<Atomic $float_type:camel>], $float_type);
                __test_atomic_float!([<Atomic $float_type:camel>], $float_type);
                __test_atomic_float_pub!([<Atomic $float_type:camel>], $float_type);
            }
        }
    };
}
macro_rules! test_atomic_bool_pub {
    () => {
        mod test_atomic_bool {
            use super::*;
            __test_atomic_bool_load_store!(AtomicBool);
            __test_atomic_bool!(AtomicBool);
            __test_atomic_bool_pub!(AtomicBool);
        }
    };
}
macro_rules! test_atomic_ptr_pub {
    () => {
        mod test_atomic_bool_ptr {
            use super::*;
            __test_atomic_ptr_load_store!(AtomicPtr<u8>);
            __test_atomic_ptr!(AtomicPtr<u8>);
            __test_atomic_ptr_pub!(AtomicPtr<u8>);
        }
    };
}

#[track_caller]
pub(crate) fn assert_panic<T: std::fmt::Debug>(f: impl FnOnce() -> T) -> std::string::String {
    let backtrace = std::env::var_os("RUST_BACKTRACE");
    let hook = std::panic::take_hook();
    std::env::set_var("RUST_BACKTRACE", "0"); // Suppress backtrace
    std::panic::set_hook(std::boxed::Box::new(|_| {})); // Suppress panic msg
    let res = std::panic::catch_unwind(std::panic::AssertUnwindSafe(f));
    std::panic::set_hook(hook);
    match backtrace {
        Some(v) => std::env::set_var("RUST_BACKTRACE", v),
        None => std::env::remove_var("RUST_BACKTRACE"),
    }
    let msg = res.unwrap_err();
    msg.downcast_ref::<std::string::String>()
        .cloned()
        .unwrap_or_else(|| msg.downcast_ref::<&'static str>().copied().unwrap().into())
}
pub(crate) fn load_orderings() -> [Ordering; 3] {
    [Ordering::Relaxed, Ordering::Acquire, Ordering::SeqCst]
}
pub(crate) fn rand_load_ordering() -> Ordering {
    load_orderings()[fastrand::usize(0..3)]
}
pub(crate) fn test_load_ordering<T: std::fmt::Debug>(f: impl Fn(Ordering) -> T) {
    for &order in &load_orderings() {
        f(order);
    }

    if option_env!("CARGO_PROFILE_RELEASE_LTO").map_or(false, |v| v == "fat")
        && option_env!("MSAN_OPTIONS").is_some()
    {
        // MSAN false positive: https://gist.github.com/taiki-e/dd6269a8ffec46284fdc764a4849f884
        return;
    }

    // Miri's panic handling is slow
    if !cfg!(miri) {
        assert_eq!(
            assert_panic(|| f(Ordering::Release)),
            "there is no such thing as a release load"
        );
        assert_eq!(
            assert_panic(|| f(Ordering::AcqRel)),
            "there is no such thing as an acquire/release load"
        );
    }
}
pub(crate) fn store_orderings() -> [Ordering; 3] {
    [Ordering::Relaxed, Ordering::Release, Ordering::SeqCst]
}
pub(crate) fn rand_store_ordering() -> Ordering {
    store_orderings()[fastrand::usize(0..3)]
}
pub(crate) fn test_store_ordering<T: std::fmt::Debug>(f: impl Fn(Ordering) -> T) {
    for &order in &store_orderings() {
        f(order);
    }

    if option_env!("CARGO_PROFILE_RELEASE_LTO").map_or(false, |v| v == "fat")
        && option_env!("MSAN_OPTIONS").is_some()
    {
        // MSAN false positive: https://gist.github.com/taiki-e/dd6269a8ffec46284fdc764a4849f884
        return;
    }

    // Miri's panic handling is slow
    if !cfg!(miri) {
        assert_eq!(
            assert_panic(|| f(Ordering::Acquire)),
            "there is no such thing as an acquire store"
        );
        assert_eq!(
            assert_panic(|| f(Ordering::AcqRel)),
            "there is no such thing as an acquire/release store"
        );
    }
}
pub(crate) fn compare_exchange_orderings() -> [(Ordering, Ordering); 9] {
    // https://github.com/rust-lang/rust/blob/1.59.0/library/core/tests/atomic.rs#L199
    [
        (Ordering::Relaxed, Ordering::Relaxed),
        (Ordering::Acquire, Ordering::Relaxed),
        (Ordering::Release, Ordering::Relaxed),
        (Ordering::AcqRel, Ordering::Relaxed),
        (Ordering::SeqCst, Ordering::Relaxed),
        (Ordering::Acquire, Ordering::Acquire),
        (Ordering::AcqRel, Ordering::Acquire),
        (Ordering::SeqCst, Ordering::Acquire),
        (Ordering::SeqCst, Ordering::SeqCst),
    ]
}
pub(crate) fn rand_compare_exchange_ordering() -> (Ordering, Ordering) {
    compare_exchange_orderings()[fastrand::usize(0..9)]
}
pub(crate) fn test_compare_exchange_ordering<T: std::fmt::Debug>(
    f: impl Fn(Ordering, Ordering) -> T,
) {
    for &(success, failure) in &compare_exchange_orderings() {
        f(success, failure);
    }

    if option_env!("CARGO_PROFILE_RELEASE_LTO").map_or(false, |v| v == "fat")
        && option_env!("MSAN_OPTIONS").is_some()
    {
        // MSAN false positive: https://gist.github.com/taiki-e/dd6269a8ffec46284fdc764a4849f884
        return;
    }

    // Miri's panic handling is slow
    if !cfg!(miri) {
        for &order in &swap_orderings() {
            let msg = assert_panic(|| f(order, Ordering::AcqRel));
            assert!(
                msg == "there is no such thing as an acquire/release failure ordering"
                    || msg == "there is no such thing as an acquire/release load",
                "{}",
                msg
            );
            let msg = assert_panic(|| f(order, Ordering::Release));
            assert!(
                msg == "there is no such thing as a release failure ordering"
                    || msg == "there is no such thing as a release load",
                "{}",
                msg
            );
        }
        for &(success, failure) in &[
            (Ordering::Relaxed, Ordering::SeqCst),
            (Ordering::Relaxed, Ordering::Acquire),
            (Ordering::Acquire, Ordering::SeqCst),
            (Ordering::Release, Ordering::SeqCst),
            (Ordering::AcqRel, Ordering::SeqCst),
        ] {
            assert_eq!(
                assert_panic(|| f(success, failure)),
                "a failure ordering can't be stronger than a success ordering"
            );
        }
    }
}
pub(crate) fn swap_orderings() -> [Ordering; 5] {
    [Ordering::Relaxed, Ordering::Release, Ordering::Acquire, Ordering::AcqRel, Ordering::SeqCst]
}
pub(crate) fn rand_swap_ordering() -> Ordering {
    swap_orderings()[fastrand::usize(0..5)]
}
pub(crate) fn test_swap_ordering<T: std::fmt::Debug>(f: impl Fn(Ordering) -> T) {
    for &order in &swap_orderings() {
        f(order);
    }
}

#[derive(Debug, Clone, Copy, Default)]
#[repr(C, align(16))]
pub(crate) struct Align16<T>(pub(crate) T);

impl<T> ops::Deref for Align16<T> {
    type Target = T;

    #[inline]
    fn deref(&self) -> &T {
        &self.0
    }
}

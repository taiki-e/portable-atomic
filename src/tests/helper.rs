#![allow(unused_macros)]

use core::sync::atomic::Ordering;

macro_rules! __test_atomic_common {
    ($atomic_type:ty, $value_type:ty) => {
        #[test]
        fn assert_auto_traits() {
            fn _assert<T: Send + Sync + Unpin + std::panic::UnwindSafe>() {}
            _assert::<$atomic_type>();
        }
        #[test]
        fn alignment() {
            // https://github.com/rust-lang/rust/blob/1.68.0/library/core/tests/atomic.rs#L250
            assert_eq!(core::mem::align_of::<$atomic_type>(), core::mem::size_of::<$atomic_type>());
            assert_eq!(core::mem::size_of::<$atomic_type>(), core::mem::size_of::<$value_type>());
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
macro_rules! __test_atomic_pub_common {
    ($atomic_type:ty, $value_type:ty) => {
        #[test]
        fn assert_ref_unwind_safe() {
            #[cfg(not(all(portable_atomic_no_core_unwind_safe, not(feature = "std"))))]
            static_assertions::assert_impl_all!($atomic_type: std::panic::RefUnwindSafe);
            #[cfg(all(portable_atomic_no_core_unwind_safe, not(feature = "std")))]
            static_assertions::assert_not_impl_all!($atomic_type: std::panic::RefUnwindSafe);
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
            assert_eq!(a.as_ptr() as *const (), &a as *const _ as *const ());
            assert_eq!(a.into_inner(), 5);
        }
        #[test]
        fn static_load_only() {
            static VAR: $atomic_type = <$atomic_type>::new(10);
            for &order in &test_helper::LOAD_ORDERINGS {
                assert_eq!(VAR.load(order), 10);
            }
        }
        #[test]
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(10);
            test_load_ordering(|order| VAR.load(order));
            test_store_ordering(|order| VAR.store(10, order));
            for (&load_order, &store_order) in
                test_helper::LOAD_ORDERINGS.iter().zip(&test_helper::STORE_ORDERINGS)
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
        use std::{collections::HashSet, vec, vec::Vec};
        #[test]
        fn stress_load_store() {
            let iterations = if cfg!(miri) {
                50
            } else if cfg!(valgrind) && cfg!(debug_assertions) {
                5_000
            } else {
                25_000
            };
            let threads = if cfg!(debug_assertions) { 2 } else { fastrand::usize(2..=8) };
            let data1 = (0..iterations).map(|_| fastrand::$int_type(..)).collect::<Vec<_>>();
            let set = data1.iter().copied().collect::<HashSet<_>>();
            let a = <$atomic_type>::new(data1[fastrand::usize(0..iterations)]);
            std::eprintln!("threads={}", threads);
            let now = &std::time::Instant::now();
            thread::scope(|s| {
                for _ in 0..threads {
                    s.spawn(|_| {
                        let now = *now;
                        for i in 0..iterations {
                            a.store(data1[i], rand_store_ordering());
                        }
                        std::eprintln!("store end={:?}", now.elapsed());
                    });
                    s.spawn(|_| {
                        let now = *now;
                        let mut v = vec![0; iterations];
                        for i in 0..iterations {
                            v[i] = a.load(rand_load_ordering());
                        }
                        std::eprintln!("load end={:?}", now.elapsed());
                        for v in v {
                            assert!(set.contains(&v), "v={}", v);
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
            assert_eq!(a.as_ptr() as *const (), &a as *const _ as *const ());
            assert_eq!(a.into_inner(), 5.0);
        }
        #[test]
        fn static_load_only() {
            static VAR: $atomic_type = <$atomic_type>::new(10.0);
            for &order in &test_helper::LOAD_ORDERINGS {
                assert_eq!(VAR.load(order), 10.0);
            }
        }
        #[test]
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(10.0);
            test_load_ordering(|order| VAR.load(order));
            test_store_ordering(|order| VAR.store(10.0, order));
            for (&load_order, &store_order) in
                test_helper::LOAD_ORDERINGS.iter().zip(&test_helper::STORE_ORDERINGS)
            {
                assert_eq!(VAR.load(load_order), 10.0);
                VAR.store(5.0, store_order);
                assert_eq!(VAR.load(load_order), 5.0);
                VAR.store(10.0, store_order);
                let a = <$atomic_type>::new(1.0);
                assert_eq!(a.load(load_order), 1.0);
                a.store(2.0, store_order);
                assert_eq!(a.load(load_order), 2.0);
            }
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
            assert_eq!(a.as_ptr() as *const (), &a as *const _ as *const ());
            assert_eq!(a.into_inner(), true);
        }
        #[test]
        fn static_load_only() {
            static VAR: $atomic_type = <$atomic_type>::new(false);
            for &order in &test_helper::LOAD_ORDERINGS {
                assert_eq!(VAR.load(order), false);
            }
        }
        #[test]
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(false);
            test_load_ordering(|order| VAR.load(order));
            test_store_ordering(|order| VAR.store(false, order));
            for (&load_order, &store_order) in
                test_helper::LOAD_ORDERINGS.iter().zip(&test_helper::STORE_ORDERINGS)
            {
                assert_eq!(VAR.load(load_order), false);
                VAR.store(true, store_order);
                assert_eq!(VAR.load(load_order), true);
                VAR.store(false, store_order);
                let a = <$atomic_type>::new(true);
                assert_eq!(a.load(load_order), true);
                a.store(false, store_order);
                assert_eq!(a.load(load_order), false);
            }
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
            assert_eq!(a.as_ptr() as *const (), &a as *const _ as *const ());
            assert!(!a.into_inner().is_null());
        }
        #[test]
        fn static_load_only() {
            static VAR: $atomic_type = <$atomic_type>::new(ptr::null_mut());
            for &order in &test_helper::LOAD_ORDERINGS {
                assert_eq!(VAR.load(order), ptr::null_mut());
            }
        }
        #[test]
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(ptr::null_mut());
            test_load_ordering(|order| VAR.load(order));
            test_store_ordering(|order| VAR.store(ptr::null_mut(), order));
            let mut v = 1_u8;
            let p = &mut v as *mut u8;
            for (&load_order, &store_order) in
                test_helper::LOAD_ORDERINGS.iter().zip(&test_helper::STORE_ORDERINGS)
            {
                assert_eq!(VAR.load(load_order), ptr::null_mut());
                VAR.store(p, store_order);
                assert_eq!(VAR.load(load_order), p);
                VAR.store(ptr::null_mut(), store_order);
                let a = <$atomic_type>::new(p);
                assert_eq!(a.load(load_order), p);
                a.store(ptr::null_mut(), store_order);
                assert_eq!(a.load(load_order), ptr::null_mut());
            }
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
            for &order in &test_helper::SWAP_ORDERINGS {
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
            for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(5);
                assert_eq!(a.compare_exchange(5, 10, success, failure), Ok(5));
                assert_eq!(a.load(Ordering::Relaxed), 10);
                assert_eq!(a.compare_exchange(6, 12, success, failure), Err(10));
                assert_eq!(a.load(Ordering::Relaxed), 10);
            }
        }
        #[test]
        fn compare_exchange_weak() {
            let a = <$atomic_type>::new(4);
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange_weak(4, 4, success, failure)
            });
            for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(4);
                assert_eq!(a.compare_exchange_weak(6, 8, success, failure), Err(4));
                let mut old = a.load(Ordering::Relaxed);
                loop {
                    let new = old * 2;
                    match a.compare_exchange_weak(old, new, success, failure) {
                        Ok(_) => break,
                        Err(x) => old = x,
                    }
                }
                assert_eq!(a.load(Ordering::Relaxed), 8);
            }
        }
        #[test]
        fn fetch_add() {
            let a = <$atomic_type>::new(0);
            test_swap_ordering(|order| a.fetch_add(0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0);
                assert_eq!(a.fetch_add(10, order), 0);
                assert_eq!(a.load(Ordering::Relaxed), 10);
                let a = <$atomic_type>::new($int_type::MAX);
                assert_eq!(a.fetch_add(1, order), $int_type::MAX);
                assert_eq!(a.load(Ordering::Relaxed), $int_type::MAX.wrapping_add(1));
            }
        }
        #[test]
        fn add() {
            let a = <$atomic_type>::new(0);
            test_swap_ordering(|order| a.add(0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0);
                a.add(10, order);
                assert_eq!(a.load(Ordering::Relaxed), 10);
                let a = <$atomic_type>::new($int_type::MAX);
                a.add(1, order);
                assert_eq!(a.load(Ordering::Relaxed), $int_type::MAX.wrapping_add(1));
            }
        }
        #[test]
        fn fetch_sub() {
            let a = <$atomic_type>::new(20);
            test_swap_ordering(|order| a.fetch_sub(0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(20);
                assert_eq!(a.fetch_sub(10, order), 20);
                assert_eq!(a.load(Ordering::Relaxed), 10);
                let a = <$atomic_type>::new($int_type::MIN);
                assert_eq!(a.fetch_sub(1, order), $int_type::MIN);
                assert_eq!(a.load(Ordering::Relaxed), $int_type::MIN.wrapping_sub(1));
            }
        }
        #[test]
        fn sub() {
            let a = <$atomic_type>::new(20);
            test_swap_ordering(|order| a.sub(0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(20);
                a.sub(10, order);
                assert_eq!(a.load(Ordering::Relaxed), 10);
                let a = <$atomic_type>::new($int_type::MIN);
                a.sub(1, order);
                assert_eq!(a.load(Ordering::Relaxed), $int_type::MIN.wrapping_sub(1));
            }
        }
        #[test]
        fn fetch_and() {
            let a = <$atomic_type>::new(0b101101);
            test_swap_ordering(|order| a.fetch_and(0b101101, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b101101);
                assert_eq!(a.fetch_and(0b110011, order), 0b101101);
                assert_eq!(a.load(Ordering::Relaxed), 0b100001);
            }
        }
        #[test]
        fn and() {
            let a = <$atomic_type>::new(0b101101);
            test_swap_ordering(|order| a.and(0b101101, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b101101);
                a.and(0b110011, order);
                assert_eq!(a.load(Ordering::Relaxed), 0b100001);
            }
        }
        #[test]
        fn fetch_nand() {
            let a = <$atomic_type>::new(0x13);
            test_swap_ordering(|order| a.fetch_nand(0x31, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0x13);
                assert_eq!(a.fetch_nand(0x31, order), 0x13);
                assert_eq!(a.load(Ordering::Relaxed), !(0x13 & 0x31));
            }
        }
        #[test]
        fn fetch_or() {
            let a = <$atomic_type>::new(0b101101);
            test_swap_ordering(|order| a.fetch_or(0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b101101);
                assert_eq!(a.fetch_or(0b110011, order), 0b101101);
                assert_eq!(a.load(Ordering::Relaxed), 0b111111);
            }
        }
        #[test]
        fn or() {
            let a = <$atomic_type>::new(0b101101);
            test_swap_ordering(|order| a.or(0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b101101);
                a.or(0b110011, order);
                assert_eq!(a.load(Ordering::Relaxed), 0b111111);
            }
        }
        #[test]
        fn fetch_xor() {
            let a = <$atomic_type>::new(0b101101);
            test_swap_ordering(|order| a.fetch_xor(0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b101101);
                assert_eq!(a.fetch_xor(0b110011, order), 0b101101);
                assert_eq!(a.load(Ordering::Relaxed), 0b011110);
            }
        }
        #[test]
        fn xor() {
            let a = <$atomic_type>::new(0b101101);
            test_swap_ordering(|order| a.xor(0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b101101);
                a.xor(0b110011, order);
                assert_eq!(a.load(Ordering::Relaxed), 0b011110);
            }
        }
        #[test]
        fn fetch_max() {
            let a = <$atomic_type>::new(23);
            test_swap_ordering(|order| a.fetch_max(23, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(23);
                assert_eq!(a.fetch_max(22, order), 23);
                assert_eq!(a.load(Ordering::Relaxed), 23);
                assert_eq!(a.fetch_max(24, order), 23);
                assert_eq!(a.load(Ordering::Relaxed), 24);
                let a = <$atomic_type>::new(0);
                assert_eq!(a.fetch_max(1, order), 0);
                assert_eq!(a.load(Ordering::Relaxed), 1);
                assert_eq!(a.fetch_max(0, order), 1);
                assert_eq!(a.load(Ordering::Relaxed), 1);
            }
        }
        #[test]
        fn fetch_min() {
            let a = <$atomic_type>::new(23);
            test_swap_ordering(|order| a.fetch_min(23, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(23);
                assert_eq!(a.fetch_min(24, order), 23);
                assert_eq!(a.load(Ordering::Relaxed), 23);
                assert_eq!(a.fetch_min(22, order), 23);
                assert_eq!(a.load(Ordering::Relaxed), 22);
                let a = <$atomic_type>::new(1);
                assert_eq!(a.fetch_min(0, order), 1);
                assert_eq!(a.load(Ordering::Relaxed), 0);
                assert_eq!(a.fetch_min(1, order), 0);
                assert_eq!(a.load(Ordering::Relaxed), 0);
            }
        }
        #[test]
        fn fetch_not() {
            let a = <$atomic_type>::new(1);
            test_swap_ordering(|order| a.fetch_not(order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(1);
                assert_eq!(a.fetch_not(order), 1);
                assert_eq!(a.load(Ordering::Relaxed), !1);
            }
        }
        #[test]
        fn not() {
            let a = <$atomic_type>::new(1);
            test_swap_ordering(|order| a.not(order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(1);
                a.not(order);
                assert_eq!(a.load(Ordering::Relaxed), !1);
            }
        }
        #[test]
        fn fetch_neg() {
            let a = <$atomic_type>::new(5);
            test_swap_ordering(|order| a.fetch_neg(order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(5);
                assert_eq!(a.fetch_neg(order), 5);
                assert_eq!(a.load(Ordering::Relaxed), (5 as $int_type).wrapping_neg());
                assert_eq!(a.fetch_neg(order), (5 as $int_type).wrapping_neg());
                assert_eq!(a.load(Ordering::Relaxed), 5);
                let a = <$atomic_type>::new(<$int_type>::MIN);
                assert_eq!(a.fetch_neg(order), <$int_type>::MIN);
                assert_eq!(a.load(Ordering::Relaxed), <$int_type>::MIN.wrapping_neg());
                assert_eq!(a.fetch_neg(order), <$int_type>::MIN.wrapping_neg());
                assert_eq!(a.load(Ordering::Relaxed), <$int_type>::MIN);
            }
        }
        #[test]
        fn neg() {
            let a = <$atomic_type>::new(5);
            test_swap_ordering(|order| a.neg(order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(5);
                a.neg(order);
                assert_eq!(a.load(Ordering::Relaxed), (5 as $int_type).wrapping_neg());
                a.neg(order);
                assert_eq!(a.load(Ordering::Relaxed), 5);
                let a = <$atomic_type>::new(<$int_type>::MIN);
                a.neg(order);
                assert_eq!(a.load(Ordering::Relaxed), <$int_type>::MIN.wrapping_neg());
                a.neg(order);
                assert_eq!(a.load(Ordering::Relaxed), <$int_type>::MIN);
            }
        }
        #[test]
        fn bit_set() {
            let a = <$atomic_type>::new(0b0001);
            test_swap_ordering(|order| assert!(a.bit_set(0, order)));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b0000);
                assert!(!a.bit_set(0, order));
                assert_eq!(a.load(Ordering::Relaxed), 0b0001);
                assert!(a.bit_set(0, order));
                assert_eq!(a.load(Ordering::Relaxed), 0b0001);
            }
        }
        #[test]
        fn bit_clear() {
            let a = <$atomic_type>::new(0b0000);
            test_swap_ordering(|order| assert!(!a.bit_clear(0, order)));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b0001);
                assert!(a.bit_clear(0, order));
                assert_eq!(a.load(Ordering::Relaxed), 0b0000);
                assert!(!a.bit_clear(0, order));
                assert_eq!(a.load(Ordering::Relaxed), 0b0000);
            }
        }
        #[test]
        fn bit_toggle() {
            let a = <$atomic_type>::new(0b0000);
            test_swap_ordering(|order| a.bit_toggle(0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b0000);
                assert!(!a.bit_toggle(0, order));
                assert_eq!(a.load(Ordering::Relaxed), 0b0001);
                assert!(a.bit_toggle(0, order));
                assert_eq!(a.load(Ordering::Relaxed), 0b0000);
            }
        }
        ::quickcheck::quickcheck! {
            fn quickcheck_swap(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.swap(y, order), x);
                    assert_eq!(a.swap(x, order), y);
                }
                true
            }
            fn quickcheck_compare_exchange(x: $int_type, y: $int_type) -> bool {
                #[cfg(all(
                    target_arch = "arm",
                    not(any(target_feature = "v6", portable_atomic_target_feature = "v6")),
                ))]
                {
                    // HACK: the following operations are currently broken (at least on qemu):
                    // - armv5te's `Atomic{I,U}{8,16}::compare_exchange`
                    // See also https://github.com/taiki-e/portable-atomic/issues/2
                    if core::mem::size_of::<$int_type>() <= 2 {
                        return true;
                    }
                }
                let z = loop {
                    let z = fastrand::$int_type(..);
                    if z != y {
                        break z;
                    }
                };
                for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.compare_exchange(x, y, success, failure).unwrap(), x);
                    assert_eq!(a.load(Ordering::Relaxed), y);
                    assert_eq!(a.compare_exchange(z, x, success, failure).unwrap_err(), y);
                    assert_eq!(a.load(Ordering::Relaxed), y);
                }
                true
            }
            fn quickcheck_fetch_add(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_add(y, order), x);
                    assert_eq!(a.load(Ordering::Relaxed), x.wrapping_add(y));
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_add(x, order), y);
                    assert_eq!(a.load(Ordering::Relaxed), y.wrapping_add(x));
                }
                true
            }
            fn quickcheck_add(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    a.add(y, order);
                    assert_eq!(a.load(Ordering::Relaxed), x.wrapping_add(y));
                    let a = <$atomic_type>::new(y);
                    a.add(x, order);
                    assert_eq!(a.load(Ordering::Relaxed), y.wrapping_add(x));
                }
                true
            }
            fn quickcheck_fetch_sub(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_sub(y, order), x);
                    assert_eq!(a.load(Ordering::Relaxed), x.wrapping_sub(y));
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_sub(x, order), y);
                    assert_eq!(a.load(Ordering::Relaxed), y.wrapping_sub(x));
                }
                true
            }
            fn quickcheck_sub(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    a.sub(y, order);
                    assert_eq!(a.load(Ordering::Relaxed), x.wrapping_sub(y));
                    let a = <$atomic_type>::new(y);
                    a.sub(x, order);
                    assert_eq!(a.load(Ordering::Relaxed), y.wrapping_sub(x));
                }
                true
            }
            fn quickcheck_fetch_and(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_and(y, order), x);
                    assert_eq!(a.load(Ordering::Relaxed), x & y);
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_and(x, order), y);
                    assert_eq!(a.load(Ordering::Relaxed), y & x);
                }
                true
            }
            fn quickcheck_and(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    a.and(y, order);
                    assert_eq!(a.load(Ordering::Relaxed), x & y);
                    let a = <$atomic_type>::new(y);
                    a.and(x, order);
                    assert_eq!(a.load(Ordering::Relaxed), y & x);
                }
                true
            }
            fn quickcheck_fetch_nand(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_nand(y, order), x);
                    assert_eq!(a.load(Ordering::Relaxed), !(x & y));
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_nand(x, order), y);
                    assert_eq!(a.load(Ordering::Relaxed), !(y & x));
                }
                true
            }
            fn quickcheck_fetch_or(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_or(y, order), x);
                    assert_eq!(a.load(Ordering::Relaxed), x | y);
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_or(x, order), y);
                    assert_eq!(a.load(Ordering::Relaxed), y | x);
                }
                true
            }
            fn quickcheck_or(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    a.or(y, order);
                    assert_eq!(a.load(Ordering::Relaxed), x | y);
                    let a = <$atomic_type>::new(y);
                    a.or(x, order);
                    assert_eq!(a.load(Ordering::Relaxed), y | x);
                }
                true
            }
            fn quickcheck_fetch_xor(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_xor(y, order), x);
                    assert_eq!(a.load(Ordering::Relaxed), x ^ y);
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_xor(x, order), y);
                    assert_eq!(a.load(Ordering::Relaxed), y ^ x);
                }
                true
            }
            fn quickcheck_xor(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    a.xor(y, order);
                    assert_eq!(a.load(Ordering::Relaxed), x ^ y);
                    let a = <$atomic_type>::new(y);
                    a.xor(x, order);
                    assert_eq!(a.load(Ordering::Relaxed), y ^ x);
                }
                true
            }
            fn quickcheck_fetch_max(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_max(y, order), x);
                    assert_eq!(a.load(Ordering::Relaxed), core::cmp::max(x, y));
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_max(x, order), y);
                    assert_eq!(a.load(Ordering::Relaxed), core::cmp::max(y, x));
                }
                true
            }
            fn quickcheck_fetch_min(x: $int_type, y: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_min(y, order), x);
                    assert_eq!(a.load(Ordering::Relaxed), core::cmp::min(x, y));
                    let a = <$atomic_type>::new(y);
                    assert_eq!(a.fetch_min(x, order), y);
                    assert_eq!(a.load(Ordering::Relaxed), core::cmp::min(y, x));
                }
                true
            }
            fn quickcheck_fetch_not(x: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_not(order), x);
                    assert_eq!(a.load(Ordering::Relaxed), !x);
                    assert_eq!(a.fetch_not(order), !x);
                    assert_eq!(a.load(Ordering::Relaxed), x);
                }
                true
            }
            fn quickcheck_not(x: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    a.not(order);
                    assert_eq!(a.load(Ordering::Relaxed), !x);
                    a.not(order);
                    assert_eq!(a.load(Ordering::Relaxed), x);
                }
                true
            }
            fn quickcheck_fetch_neg(x: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.fetch_neg(order), x);
                    assert_eq!(a.load(Ordering::Relaxed), x.wrapping_neg());
                    assert_eq!(a.fetch_neg(order), x.wrapping_neg());
                    assert_eq!(a.load(Ordering::Relaxed), x);
                }
                true
            }
            fn quickcheck_neg(x: $int_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    a.neg(order);
                    assert_eq!(a.load(Ordering::Relaxed), x.wrapping_neg());
                    a.neg(order);
                    assert_eq!(a.load(Ordering::Relaxed), x);
                }
                true
            }
            fn quickcheck_bit_set(x: $int_type, bit: u32) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    let b = a.bit_set(bit, order);
                    let mask = (1 as $int_type).wrapping_shl(bit);
                    assert_eq!(a.load(Ordering::Relaxed), x | mask);
                    assert_eq!(b, x & mask != 0);
                }
                true
            }
            fn quickcheck_bit_clear(x: $int_type, bit: u32) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    let b = a.bit_clear(bit, order);
                    let mask = (1 as $int_type).wrapping_shl(bit);
                    assert_eq!(a.load(Ordering::Relaxed), x & !mask);
                    assert_eq!(b, x & mask != 0);
                }
                true
            }
            fn quickcheck_bit_toggle(x: $int_type, bit: u32) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    let b = a.bit_toggle(bit, order);
                    let mask = (1 as $int_type).wrapping_shl(bit);
                    assert_eq!(a.load(Ordering::Relaxed), x ^ mask);
                    assert_eq!(b, x & mask != 0);
                }
                true
            }
        }
    };
    ($atomic_type:ty, $int_type:ident) => {
        __test_atomic_int!($atomic_type, $int_type, single_thread);

        #[test]
        fn stress_swap() {
            let iterations = if cfg!(miri) {
                50
            } else if cfg!(valgrind) && cfg!(debug_assertions) {
                5_000
            } else {
                25_000
            };
            let threads = if cfg!(debug_assertions) { 2 } else { fastrand::usize(2..=8) };
            let data1 = &(0..threads)
                .map(|_| (0..iterations).map(|_| fastrand::$int_type(..)).collect::<Vec<_>>())
                .collect::<Vec<_>>();
            let data2 = &(0..threads)
                .map(|_| (0..iterations).map(|_| fastrand::$int_type(..)).collect::<Vec<_>>())
                .collect::<Vec<_>>();
            let set = &data1
                .iter()
                .flat_map(|v| v.iter().copied())
                .chain(data2.iter().flat_map(|v| v.iter().copied()))
                .collect::<HashSet<_>>();
            let a = &<$atomic_type>::new(data2[0][fastrand::usize(0..iterations)]);
            std::eprintln!("threads={}", threads);
            let now = &std::time::Instant::now();
            thread::scope(|s| {
                for thread in 0..threads {
                    if thread % 2 == 0 {
                        s.spawn(move |_| {
                            let now = *now;
                            for i in 0..iterations {
                                a.store(data1[thread][i], rand_store_ordering());
                            }
                            std::eprintln!("store end={:?}", now.elapsed());
                        });
                    } else {
                        s.spawn(|_| {
                            let now = *now;
                            let mut v = vec![0; iterations];
                            for i in 0..iterations {
                                v[i] = a.load(rand_load_ordering());
                            }
                            std::eprintln!("load end={:?}", now.elapsed());
                            for v in v {
                                assert!(set.contains(&v), "v={}", v);
                            }
                        });
                    }
                    s.spawn(move |_| {
                        let now = *now;
                        let mut v = vec![0; iterations];
                        for i in 0..iterations {
                            v[i] = a.swap(data2[thread][i], rand_swap_ordering());
                        }
                        std::eprintln!("swap end={:?}", now.elapsed());
                        for v in v {
                            assert!(set.contains(&v), "v={}", v);
                        }
                    });
                }
            })
            .unwrap();
        }
        #[test]
        fn stress_compare_exchange() {
            let iterations = if cfg!(miri) {
                50
            } else if cfg!(valgrind) && cfg!(debug_assertions) {
                5_000
            } else {
                25_000
            };
            let threads = if cfg!(debug_assertions) { 2 } else { fastrand::usize(2..=8) };
            let data1 = &(0..threads)
                .map(|_| (0..iterations).map(|_| fastrand::$int_type(..)).collect::<Vec<_>>())
                .collect::<Vec<_>>();
            let data2 = &(0..threads)
                .map(|_| (0..iterations).map(|_| fastrand::$int_type(..)).collect::<Vec<_>>())
                .collect::<Vec<_>>();
            let set = &data1
                .iter()
                .flat_map(|v| v.iter().copied())
                .chain(data2.iter().flat_map(|v| v.iter().copied()))
                .collect::<HashSet<_>>();
            let a = &<$atomic_type>::new(data2[0][fastrand::usize(0..iterations)]);
            std::eprintln!("threads={}", threads);
            let now = &std::time::Instant::now();
            thread::scope(|s| {
                for thread in 0..threads {
                    s.spawn(move |_| {
                        let now = *now;
                        for i in 0..iterations {
                            a.store(data1[thread][i], rand_store_ordering());
                        }
                        std::eprintln!("store end={:?}", now.elapsed());
                    });
                    s.spawn(|_| {
                        let now = *now;
                        let mut v = vec![data2[0][0]; iterations];
                        for i in 0..iterations {
                            v[i] = a.load(rand_load_ordering());
                        }
                        std::eprintln!("load end={:?}", now.elapsed());
                        for v in v {
                            assert!(set.contains(&v), "v={}", v);
                        }
                    });
                    s.spawn(move |_| {
                        let now = *now;
                        let mut v = vec![data2[0][0]; iterations];
                        for i in 0..iterations {
                            let old = if i % 2 == 0 {
                                fastrand::$int_type(..)
                            } else {
                                a.load(Ordering::Relaxed)
                            };
                            let new = data2[thread][i];
                            let o = rand_compare_exchange_ordering();
                            match a.compare_exchange(old, new, o.0, o.1) {
                                Ok(r) => assert_eq!(old, r),
                                Err(r) => v[i] = r,
                            }
                        }
                        std::eprintln!("compare_exchange end={:?}", now.elapsed());
                        for v in v {
                            assert!(set.contains(&v), "v={}", v);
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
            for &order in &test_helper::SWAP_ORDERINGS {
                assert_eq!(a.swap(10.0, order), 5.0);
                assert_eq!(a.swap(5.0, order), 10.0);
            }
        }
        #[test]
        fn compare_exchange() {
            let a = <$atomic_type>::new(5.0);
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange(5.0, 5.0, success, failure)
            });
            for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(5.0);
                assert_eq!(a.compare_exchange(5.0, 10.0, success, failure), Ok(5.0));
                assert_eq!(a.load(Ordering::Relaxed), 10.0);
                assert_eq!(a.compare_exchange(6.0, 12.0, success, failure), Err(10.0));
                assert_eq!(a.load(Ordering::Relaxed), 10.0);
            }
        }
        #[test]
        fn compare_exchange_weak() {
            let a = <$atomic_type>::new(4.0);
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange_weak(4.0, 4.0, success, failure)
            });
            for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(4.0);
                assert_eq!(a.compare_exchange_weak(6.0, 8.0, success, failure), Err(4.0));
                let mut old = a.load(Ordering::Relaxed);
                loop {
                    let new = old * 2.0;
                    match a.compare_exchange_weak(old, new, success, failure) {
                        Ok(_) => break,
                        Err(x) => old = x,
                    }
                }
                assert_eq!(a.load(Ordering::Relaxed), 8.0);
            }
        }
        #[test]
        fn fetch_add() {
            let a = <$atomic_type>::new(0.0);
            test_swap_ordering(|order| a.fetch_add(0.0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0.0);
                assert_eq!(a.fetch_add(10.0, order), 0.0);
                assert_eq!(a.load(Ordering::Relaxed), 10.0);
                let a = <$atomic_type>::new($float_type::MAX);
                assert_eq!(a.fetch_add(1.0, order), $float_type::MAX);
                assert_eq!(a.load(Ordering::Relaxed), $float_type::MAX + 1.0);
            }
        }
        #[test]
        fn fetch_sub() {
            let a = <$atomic_type>::new(20.0);
            test_swap_ordering(|order| a.fetch_sub(0.0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(20.0);
                assert_eq!(a.fetch_sub(10.0, order), 20.0);
                assert_eq!(a.load(Ordering::Relaxed), 10.0);
                let a = <$atomic_type>::new($float_type::MIN);
                assert_eq!(a.fetch_sub(1.0, order), $float_type::MIN);
                assert_eq!(a.load(Ordering::Relaxed), $float_type::MIN - 1.0);
            }
        }
        #[test]
        fn fetch_max() {
            let a = <$atomic_type>::new(23.0);
            test_swap_ordering(|order| a.fetch_max(23.0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(23.0);
                assert_eq!(a.fetch_max(22.0, order), 23.0);
                assert_eq!(a.load(Ordering::Relaxed), 23.0);
                assert_eq!(a.fetch_max(24.0, order), 23.0);
                assert_eq!(a.load(Ordering::Relaxed), 24.0);
            }
        }
        #[test]
        fn fetch_min() {
            let a = <$atomic_type>::new(23.0);
            test_swap_ordering(|order| a.fetch_min(23.0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(23.0);
                assert_eq!(a.fetch_min(24.0, order), 23.0);
                assert_eq!(a.load(Ordering::Relaxed), 23.0);
                assert_eq!(a.fetch_min(22.0, order), 23.0);
                assert_eq!(a.load(Ordering::Relaxed), 22.0);
            }
        }
        #[test]
        fn fetch_neg() {
            let a = <$atomic_type>::new(5.0);
            test_swap_ordering(|order| a.fetch_neg(order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(5.0);
                assert_eq!(a.fetch_neg(order), 5.0);
                assert_eq!(a.load(Ordering::Relaxed), -5.0);
                assert_eq!(a.fetch_neg(order), -5.0);
                assert_eq!(a.load(Ordering::Relaxed), 5.0);
            }
        }
        #[test]
        fn fetch_abs() {
            let a = <$atomic_type>::new(23.0);
            test_swap_ordering(|order| a.fetch_abs(order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(-23.0);
                assert_eq!(a.fetch_abs(order), -23.0);
                assert_eq!(a.load(Ordering::Relaxed), 23.0);
                assert_eq!(a.fetch_abs(order), 23.0);
                assert_eq!(a.load(Ordering::Relaxed), 23.0);
            }
        }
        ::quickcheck::quickcheck! {
            fn quickcheck_swap(x: $float_type, y: $float_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_float_op_eq!(a.swap(y, order), x);
                    assert_float_op_eq!(a.swap(x, order), y);
                }
                true
            }
            fn quickcheck_compare_exchange(x: $float_type, y: $float_type) -> bool {
                let z = loop {
                    let z = fastrand::$float_type();
                    if z != y {
                        break z;
                    }
                };
                for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_float_op_eq!(a.compare_exchange(x, y, success, failure).unwrap(), x);
                    assert_float_op_eq!(a.load(Ordering::Relaxed), y);
                    assert_float_op_eq!(
                        a.compare_exchange(z, x, success, failure).unwrap_err(),
                        y,
                    );
                    assert_float_op_eq!(a.load(Ordering::Relaxed), y);
                }
                true
            }
            fn quickcheck_fetch_add(x: $float_type, y: $float_type) -> bool {
                if cfg!(all(not(debug_assertions), target_arch = "x86", not(target_feature = "sse2"))) {
                    // https://github.com/rust-lang/rust/issues/72327
                    // https://github.com/rust-lang/rust/issues/73288
                    return true;
                }
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_float_op_eq!(a.fetch_add(y, order), x);
                    assert_float_op_eq!(a.load(Ordering::Relaxed), x + y);
                    let a = <$atomic_type>::new(y);
                    assert_float_op_eq!(a.fetch_add(x, order), y);
                    assert_float_op_eq!(a.load(Ordering::Relaxed), y + x);
                }
                true
            }
            fn quickcheck_fetch_sub(x: $float_type, y: $float_type) -> bool {
                if cfg!(all(not(debug_assertions), target_arch = "x86", not(target_feature = "sse2"))) {
                    // https://github.com/rust-lang/rust/issues/72327
                    // https://github.com/rust-lang/rust/issues/73288
                    return true;
                }
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_float_op_eq!(a.fetch_sub(y, order), x);
                    assert_float_op_eq!(a.load(Ordering::Relaxed), x - y);
                    let a = <$atomic_type>::new(y);
                    assert_float_op_eq!(a.fetch_sub(x, order), y);
                    assert_float_op_eq!(a.load(Ordering::Relaxed), y - x);
                }
                true
            }
            fn quickcheck_fetch_max(x: $float_type, y: $float_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_float_op_eq!(a.fetch_max(y, order), x);
                    assert_float_op_eq!(a.load(Ordering::Relaxed), x.max(y));
                    let a = <$atomic_type>::new(y);
                    assert_float_op_eq!(a.fetch_max(x, order), y);
                    assert_float_op_eq!(a.load(Ordering::Relaxed), y.max(x));
                }
                true
            }
            fn quickcheck_fetch_min(x: $float_type, y: $float_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_float_op_eq!(a.fetch_min(y, order), x);
                    assert_float_op_eq!(a.load(Ordering::Relaxed), x.min(y));
                    let a = <$atomic_type>::new(y);
                    assert_float_op_eq!(a.fetch_min(x, order), y);
                    assert_float_op_eq!(a.load(Ordering::Relaxed), y.min(x));
                }
                true
            }
            fn quickcheck_fetch_neg(x: $float_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_float_op_eq!(a.fetch_neg(order), x);
                    assert_float_op_eq!(a.load(Ordering::Relaxed), -x);
                    assert_float_op_eq!(a.fetch_neg(order), -x);
                    assert_float_op_eq!(a.load(Ordering::Relaxed), x);
                }
                true
            }
            fn quickcheck_fetch_abs(x: $float_type) -> bool {
                for &order in &test_helper::SWAP_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_float_op_eq!(a.fetch_abs(order), x);
                    assert_float_op_eq!(a.fetch_abs(order), x.abs());
                    assert_float_op_eq!(a.load(Ordering::Relaxed), x.abs());
                }
                true
            }
        }
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
            for &order in &test_helper::SWAP_ORDERINGS {
                assert_eq!(a.swap(true, order), true);
                assert_eq!(a.swap(false, order), true);
                assert_eq!(a.swap(false, order), false);
                assert_eq!(a.swap(true, order), false);
            }
        }
        #[test]
        fn compare_exchange() {
            let a = <$atomic_type>::new(true);
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange(true, true, success, failure)
            });
            for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(true);
                assert_eq!(a.compare_exchange(true, false, success, failure), Ok(true));
                assert_eq!(a.load(Ordering::Relaxed), false);
                assert_eq!(a.compare_exchange(true, true, success, failure), Err(false));
                assert_eq!(a.load(Ordering::Relaxed), false);
            }
        }
        #[test]
        fn compare_exchange_weak() {
            let a = <$atomic_type>::new(false);
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange_weak(false, false, success, failure)
            });
            for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(false);
                assert_eq!(a.compare_exchange_weak(true, true, success, failure), Err(false));
                let mut old = a.load(Ordering::Relaxed);
                let new = true;
                loop {
                    match a.compare_exchange_weak(old, new, success, failure) {
                        Ok(_) => break,
                        Err(x) => old = x,
                    }
                }
                assert_eq!(a.load(Ordering::Relaxed), true);
            }
        }
        #[test]
        fn fetch_and() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| assert_eq!(a.fetch_and(true, order), true));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(true);
                assert_eq!(a.fetch_and(false, order), true);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(true);
                assert_eq!(a.fetch_and(true, order), true);
                assert_eq!(a.load(Ordering::Relaxed), true);
                let a = <$atomic_type>::new(false);
                assert_eq!(a.fetch_and(false, order), false);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                assert_eq!(a.fetch_and(true, order), false);
                assert_eq!(a.load(Ordering::Relaxed), false);
            }
        }
        #[test]
        fn and() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| a.and(true, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(true);
                a.and(false, order);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(true);
                a.and(true, order);
                assert_eq!(a.load(Ordering::Relaxed), true);
                let a = <$atomic_type>::new(false);
                a.and(false, order);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                a.and(true, order);
                assert_eq!(a.load(Ordering::Relaxed), false);
            }
        }
        #[test]
        fn fetch_nand() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| assert_eq!(a.fetch_nand(false, order), true));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(true);
                assert_eq!(a.fetch_nand(false, order), true);
                assert_eq!(a.load(Ordering::Relaxed), true);
                let a = <$atomic_type>::new(true);
                assert_eq!(a.fetch_nand(true, order), true);
                assert_eq!(a.load(Ordering::Relaxed) as usize, 0);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                assert_eq!(a.fetch_nand(false, order), false);
                assert_eq!(a.load(Ordering::Relaxed), true);
                let a = <$atomic_type>::new(false);
                assert_eq!(a.fetch_nand(true, order), false);
                assert_eq!(a.load(Ordering::Relaxed), true);
            }
        }
        #[test]
        fn fetch_or() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| assert_eq!(a.fetch_or(false, order), true));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(true);
                assert_eq!(a.fetch_or(false, order), true);
                assert_eq!(a.load(Ordering::Relaxed), true);
                let a = <$atomic_type>::new(true);
                assert_eq!(a.fetch_or(true, order), true);
                assert_eq!(a.load(Ordering::Relaxed), true);
                let a = <$atomic_type>::new(false);
                assert_eq!(a.fetch_or(false, order), false);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                assert_eq!(a.fetch_or(true, order), false);
                assert_eq!(a.load(Ordering::Relaxed), true);
            }
        }
        #[test]
        fn or() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| a.or(false, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(true);
                a.or(false, order);
                assert_eq!(a.load(Ordering::Relaxed), true);
                let a = <$atomic_type>::new(true);
                a.or(true, order);
                assert_eq!(a.load(Ordering::Relaxed), true);
                let a = <$atomic_type>::new(false);
                a.or(false, order);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                a.or(true, order);
                assert_eq!(a.load(Ordering::Relaxed), true);
            }
        }
        #[test]
        fn fetch_xor() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| assert_eq!(a.fetch_xor(false, order), true));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(true);
                assert_eq!(a.fetch_xor(false, order), true);
                assert_eq!(a.load(Ordering::Relaxed), true);
                let a = <$atomic_type>::new(true);
                assert_eq!(a.fetch_xor(true, order), true);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                assert_eq!(a.fetch_xor(false, order), false);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                assert_eq!(a.fetch_xor(true, order), false);
                assert_eq!(a.load(Ordering::Relaxed), true);
            }
        }
        #[test]
        fn xor() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| a.xor(false, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(true);
                a.xor(false, order);
                assert_eq!(a.load(Ordering::Relaxed), true);
                let a = <$atomic_type>::new(true);
                a.xor(true, order);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                a.xor(false, order);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                a.xor(true, order);
                assert_eq!(a.load(Ordering::Relaxed), true);
            }
        }
        ::quickcheck::quickcheck! {
            fn quickcheck_compare_exchange(x: bool, y: bool) -> bool {
                let z = !y;
                for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                    let a = <$atomic_type>::new(x);
                    assert_eq!(a.compare_exchange(x, y, success, failure).unwrap(), x);
                    assert_eq!(a.load(Ordering::Relaxed), y);
                    assert_eq!(a.compare_exchange(z, x, success, failure).unwrap_err(), y);
                    assert_eq!(a.load(Ordering::Relaxed), y);
                }
                true
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
            for &order in &test_helper::SWAP_ORDERINGS {
                assert_eq!(a.swap(x, order), ptr::null_mut());
                assert_eq!(a.swap(ptr::null_mut(), order), x as _);
            }
        }
        #[test]
        fn compare_exchange() {
            let a = <$atomic_type>::new(ptr::null_mut());
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange(ptr::null_mut(), ptr::null_mut(), success, failure)
            });
            for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(ptr::null_mut());
                let x = &mut 1;
                assert_eq!(
                    a.compare_exchange(ptr::null_mut(), x, success, failure),
                    Ok(ptr::null_mut()),
                );
                assert_eq!(a.load(Ordering::Relaxed), x as _);
                assert_eq!(
                    a.compare_exchange(ptr::null_mut(), ptr::null_mut(), success, failure),
                    Err(x as _),
                );
                assert_eq!(a.load(Ordering::Relaxed), x as _);
            }
        }
        #[test]
        fn compare_exchange_weak() {
            let a = <$atomic_type>::new(ptr::null_mut());
            test_compare_exchange_ordering(|success, failure| {
                a.compare_exchange_weak(ptr::null_mut(), ptr::null_mut(), success, failure)
            });
            for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(ptr::null_mut());
                let x = &mut 1;
                assert_eq!(a.compare_exchange_weak(x, x, success, failure), Err(ptr::null_mut()));
                let mut old = a.load(Ordering::Relaxed);
                loop {
                    match a.compare_exchange_weak(old, x, success, failure) {
                        Ok(_) => break,
                        Err(x) => old = x,
                    }
                }
                assert_eq!(a.load(Ordering::Relaxed), x as _);
            }
        }
    };
    ($atomic_type:ty) => {
        __test_atomic_ptr!($atomic_type, single_thread);
        // TODO: multi thread
    };
}

macro_rules! __test_atomic_int_load_store_pub {
    ($atomic_type:ty, $int_type:ident) => {
        __test_atomic_pub_common!($atomic_type, $int_type);
        #[test]
        fn impls() {
            let a = <$atomic_type>::default();
            let b = <$atomic_type>::from(0);
            assert_eq!(a.load(Ordering::SeqCst), b.load(Ordering::SeqCst));
            assert_eq!(std::format!("{:?}", a), std::format!("{:?}", a.load(Ordering::SeqCst)));
        }
    };
}
macro_rules! __test_atomic_int_pub {
    ($atomic_type:ty, $int_type:ident) => {
        #[test]
        fn fetch_update() {
            let a = <$atomic_type>::new(7);
            test_compare_exchange_ordering(|set, fetch| a.fetch_update(set, fetch, |x| Some(x)));
            for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(7);
                assert_eq!(a.fetch_update(success, failure, |_| None), Err(7));
                assert_eq!(a.fetch_update(success, failure, |x| Some(x + 1)), Ok(7));
                assert_eq!(a.fetch_update(success, failure, |x| Some(x + 1)), Ok(8));
                assert_eq!(a.load(Ordering::SeqCst), 9);
            }
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
            for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(7.0);
                assert_eq!(a.fetch_update(success, failure, |_| None), Err(7.0));
                assert_eq!(a.fetch_update(success, failure, |x| Some(x + 1.0)), Ok(7.0));
                assert_eq!(a.fetch_update(success, failure, |x| Some(x + 1.0)), Ok(8.0));
                assert_eq!(a.load(Ordering::SeqCst), 9.0);
            }
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
        fn fetch_not() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| a.fetch_not(order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(true);
                assert_eq!(a.fetch_not(order), true);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                assert_eq!(a.fetch_not(order), false);
                assert_eq!(a.load(Ordering::Relaxed), true);
            }
        }
        #[test]
        fn not() {
            let a = <$atomic_type>::new(true);
            test_swap_ordering(|order| a.fetch_not(order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(true);
                a.not(order);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                a.not(order);
                assert_eq!(a.load(Ordering::Relaxed), true);
            }
        }
        #[test]
        fn fetch_update() {
            let a = <$atomic_type>::new(false);
            test_compare_exchange_ordering(|set, fetch| a.fetch_update(set, fetch, |x| Some(x)));
            for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(false);
                assert_eq!(a.fetch_update(success, failure, |_| None), Err(false));
                assert_eq!(a.fetch_update(success, failure, |x| Some(!x)), Ok(false));
                assert_eq!(a.fetch_update(success, failure, |x| Some(!x)), Ok(true));
                assert_eq!(a.load(Ordering::SeqCst), false);
            }
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
        use sptr::Strict;
        #[test]
        fn fetch_update() {
            let a = <$atomic_type>::new(ptr::null_mut());
            test_compare_exchange_ordering(|set, fetch| a.fetch_update(set, fetch, |x| Some(x)));
            for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(ptr::null_mut());
                assert_eq!(a.fetch_update(success, failure, |_| None), Err(ptr::null_mut()));
                assert_eq!(
                    a.fetch_update(success, failure, |_| Some(&a as *const _ as *mut _)),
                    Ok(ptr::null_mut())
                );
                assert_eq!(a.load(Ordering::SeqCst), &a as *const _ as *mut _);
            }
        }
        #[test]
        fn impls() {
            let a = <$atomic_type>::default();
            let b = <$atomic_type>::from(ptr::null_mut());
            assert_eq!(a.load(Ordering::SeqCst), b.load(Ordering::SeqCst));
            assert_eq!(std::format!("{:?}", a), std::format!("{:?}", a.load(Ordering::SeqCst)));
            assert_eq!(std::format!("{:p}", a), std::format!("{:p}", a.load(Ordering::SeqCst)));
        }
        // https://github.com/rust-lang/rust/blob/1.68.0/library/core/tests/atomic.rs#L130-L213
        #[test]
        fn ptr_add_null() {
            let atom = AtomicPtr::<i64>::new(core::ptr::null_mut());
            assert_eq!(atom.fetch_ptr_add(1, Ordering::SeqCst).addr(), 0);
            assert_eq!(atom.load(Ordering::SeqCst).addr(), 8);

            assert_eq!(atom.fetch_byte_add(1, Ordering::SeqCst).addr(), 8);
            assert_eq!(atom.load(Ordering::SeqCst).addr(), 9);

            assert_eq!(atom.fetch_ptr_sub(1, Ordering::SeqCst).addr(), 9);
            assert_eq!(atom.load(Ordering::SeqCst).addr(), 1);

            assert_eq!(atom.fetch_byte_sub(1, Ordering::SeqCst).addr(), 1);
            assert_eq!(atom.load(Ordering::SeqCst).addr(), 0);
        }
        #[test]
        fn ptr_add_data() {
            let num = 0i64;
            let n = &num as *const i64 as *mut _;
            let atom = AtomicPtr::<i64>::new(n);
            assert_eq!(atom.fetch_ptr_add(1, Ordering::SeqCst), n);
            assert_eq!(atom.load(Ordering::SeqCst), n.wrapping_add(1));

            assert_eq!(atom.fetch_ptr_sub(1, Ordering::SeqCst), n.wrapping_add(1));
            assert_eq!(atom.load(Ordering::SeqCst), n);
            let bytes_from_n = |b| n.cast::<u8>().wrapping_add(b).cast::<i64>();

            assert_eq!(atom.fetch_byte_add(1, Ordering::SeqCst), n);
            assert_eq!(atom.load(Ordering::SeqCst), bytes_from_n(1));

            assert_eq!(atom.fetch_byte_add(5, Ordering::SeqCst), bytes_from_n(1));
            assert_eq!(atom.load(Ordering::SeqCst), bytes_from_n(6));

            assert_eq!(atom.fetch_byte_sub(1, Ordering::SeqCst), bytes_from_n(6));
            assert_eq!(atom.load(Ordering::SeqCst), bytes_from_n(5));

            assert_eq!(atom.fetch_byte_sub(5, Ordering::SeqCst), bytes_from_n(5));
            assert_eq!(atom.load(Ordering::SeqCst), n);
        }
        #[test]
        fn ptr_bitops() {
            let atom = AtomicPtr::<i64>::new(core::ptr::null_mut());
            assert_eq!(atom.fetch_or(0b0111, Ordering::SeqCst).addr(), 0);
            assert_eq!(atom.load(Ordering::SeqCst).addr(), 0b0111);

            assert_eq!(atom.fetch_and(0b1101, Ordering::SeqCst).addr(), 0b0111);
            assert_eq!(atom.load(Ordering::SeqCst).addr(), 0b0101);

            assert_eq!(atom.fetch_xor(0b1111, Ordering::SeqCst).addr(), 0b0101);
            assert_eq!(atom.load(Ordering::SeqCst).addr(), 0b1010);
        }
        #[test]
        fn ptr_bitops_tagging() {
            const MASK_TAG: usize = 0b1111;
            const MASK_PTR: usize = !MASK_TAG;

            #[repr(align(16))]
            struct Tagme(u128);

            let tagme = Tagme(1000);
            let ptr = &tagme as *const Tagme as *mut Tagme;
            let atom: AtomicPtr<Tagme> = AtomicPtr::new(ptr);

            assert_eq!(ptr.addr() & MASK_TAG, 0);

            assert_eq!(atom.fetch_or(0b0111, Ordering::SeqCst), ptr);
            assert_eq!(atom.load(Ordering::SeqCst), ptr.map_addr(|a| a | 0b111));

            assert_eq!(
                atom.fetch_and(MASK_PTR | 0b0010, Ordering::SeqCst),
                ptr.map_addr(|a| a | 0b111)
            );
            assert_eq!(atom.load(Ordering::SeqCst), ptr.map_addr(|a| a | 0b0010));

            assert_eq!(atom.fetch_xor(0b1011, Ordering::SeqCst), ptr.map_addr(|a| a | 0b0010));
            assert_eq!(atom.load(Ordering::SeqCst), ptr.map_addr(|a| a | 0b1001));

            assert_eq!(atom.fetch_and(MASK_PTR, Ordering::SeqCst), ptr.map_addr(|a| a | 0b1001));
            assert_eq!(atom.load(Ordering::SeqCst), ptr);
        }
        #[test]
        fn bit_set() {
            let a = <$atomic_type>::new(ptr::null_mut::<u64>().cast::<u8>().map_addr(|a| a | 1));
            test_swap_ordering(|order| assert!(a.bit_set(0, order)));
            for &order in &test_helper::SWAP_ORDERINGS {
                let pointer = &mut 1u64 as *mut u64 as *mut u8;
                let atom = <$atomic_type>::new(pointer);
                // Tag the bottom bit of the pointer.
                assert!(!atom.bit_set(0, order));
                // Extract and untag.
                let tagged = atom.load(Ordering::Relaxed);
                assert_eq!(tagged.addr() & 1, 1);
                assert_eq!(tagged.map_addr(|p| p & !1), pointer);
            }
        }
        #[test]
        fn bit_clear() {
            let a = <$atomic_type>::new(ptr::null_mut::<u64>().cast::<u8>());
            test_swap_ordering(|order| assert!(!a.bit_clear(0, order)));
            for &order in &test_helper::SWAP_ORDERINGS {
                let pointer = &mut 1u64 as *mut u64 as *mut u8;
                // A tagged pointer
                let atom = <$atomic_type>::new(pointer.map_addr(|a| a | 1));
                assert!(atom.bit_set(0, order));
                // Untag
                assert!(atom.bit_clear(0, order));
            }
        }
        #[test]
        fn bit_toggle() {
            let a = <$atomic_type>::new(ptr::null_mut::<u64>().cast::<u8>());
            test_swap_ordering(|order| a.bit_toggle(0, order));
            for &order in &test_helper::SWAP_ORDERINGS {
                let pointer = &mut 1u64 as *mut u64 as *mut u8;
                let atom = <$atomic_type>::new(pointer);
                // Toggle a tag bit on the pointer.
                atom.bit_toggle(0, order);
                assert_eq!(atom.load(Ordering::Relaxed).addr() & 1, 1);
            }
        }
    };
}

macro_rules! test_atomic_int_load_store {
    ($int_type:ident) => {
        paste::paste! {
            #[allow(
                clippy::alloc_instead_of_core,
                clippy::std_instead_of_alloc,
                clippy::std_instead_of_core,
                clippy::undocumented_unsafe_blocks
            )]
            mod [<test_atomic_ $int_type>] {
                use super::*;
                __test_atomic_int_load_store!([<Atomic $int_type:camel>], $int_type);
            }
        }
    };
}
macro_rules! test_atomic_bool_load_store {
    () => {
        #[allow(
            clippy::alloc_instead_of_core,
            clippy::std_instead_of_alloc,
            clippy::std_instead_of_core,
            clippy::undocumented_unsafe_blocks
        )]
        mod test_atomic_bool {
            use super::*;
            __test_atomic_bool_load_store!(AtomicBool);
        }
    };
}
macro_rules! test_atomic_ptr_load_store {
    () => {
        #[allow(
            clippy::alloc_instead_of_core,
            clippy::std_instead_of_alloc,
            clippy::std_instead_of_core,
            clippy::undocumented_unsafe_blocks
        )]
        mod test_atomic_ptr {
            use super::*;
            __test_atomic_ptr_load_store!(AtomicPtr<u8>);
        }
    };
}

macro_rules! test_atomic_int_single_thread {
    ($int_type:ident) => {
        paste::paste! {
            #[allow(
                clippy::alloc_instead_of_core,
                clippy::std_instead_of_alloc,
                clippy::std_instead_of_core,
                clippy::undocumented_unsafe_blocks
            )]
            mod [<test_atomic_ $int_type>] {
                use super::*;
                __test_atomic_int_load_store!([<Atomic $int_type:camel>], $int_type, single_thread);
                __test_atomic_int!([<Atomic $int_type:camel>], $int_type, single_thread);
            }
        }
    };
}
macro_rules! test_atomic_bool_single_thread {
    () => {
        #[allow(
            clippy::alloc_instead_of_core,
            clippy::std_instead_of_alloc,
            clippy::std_instead_of_core,
            clippy::undocumented_unsafe_blocks
        )]
        mod test_atomic_bool {
            use super::*;
            __test_atomic_bool_load_store!(AtomicBool, single_thread);
            __test_atomic_bool!(AtomicBool, single_thread);
        }
    };
}
macro_rules! test_atomic_ptr_single_thread {
    () => {
        #[allow(
            clippy::alloc_instead_of_core,
            clippy::std_instead_of_alloc,
            clippy::std_instead_of_core,
            clippy::undocumented_unsafe_blocks
        )]
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
            #[allow(
                clippy::alloc_instead_of_core,
                clippy::std_instead_of_alloc,
                clippy::std_instead_of_core,
                clippy::undocumented_unsafe_blocks
            )]
            mod [<test_atomic_ $int_type>] {
                use super::*;
                __test_atomic_int_load_store!([<Atomic $int_type:camel>], $int_type);
                __test_atomic_int!([<Atomic $int_type:camel>], $int_type);
            }
        }
    };
}
macro_rules! test_atomic_bool {
    () => {
        #[allow(
            clippy::alloc_instead_of_core,
            clippy::std_instead_of_alloc,
            clippy::std_instead_of_core,
            clippy::undocumented_unsafe_blocks
        )]
        mod test_atomic_bool {
            use super::*;
            __test_atomic_bool_load_store!(AtomicBool);
            __test_atomic_bool!(AtomicBool);
        }
    };
}
macro_rules! test_atomic_ptr {
    () => {
        #[allow(
            clippy::alloc_instead_of_core,
            clippy::std_instead_of_alloc,
            clippy::std_instead_of_core,
            clippy::undocumented_unsafe_blocks
        )]
        #[allow(unstable_name_collisions)]
        mod test_atomic_ptr {
            use super::*;
            __test_atomic_ptr_load_store!(AtomicPtr<u8>);
            __test_atomic_ptr!(AtomicPtr<u8>);
        }
    };
}

macro_rules! test_atomic_int_pub {
    ($int_type:ident) => {
        paste::paste! {
            #[allow(
                clippy::alloc_instead_of_core,
                clippy::std_instead_of_alloc,
                clippy::std_instead_of_core,
                clippy::undocumented_unsafe_blocks
            )]
            mod [<test_atomic_ $int_type>] {
                use super::*;
                __test_atomic_int_load_store!([<Atomic $int_type:camel>], $int_type);
                __test_atomic_int!([<Atomic $int_type:camel>], $int_type);
                __test_atomic_int_load_store_pub!([<Atomic $int_type:camel>], $int_type);
                __test_atomic_int_pub!([<Atomic $int_type:camel>], $int_type);
            }
        }
    };
}
macro_rules! test_atomic_int_load_store_pub {
    ($int_type:ident) => {
        paste::paste! {
            #[allow(
                clippy::alloc_instead_of_core,
                clippy::std_instead_of_alloc,
                clippy::std_instead_of_core,
                clippy::undocumented_unsafe_blocks
            )]
            mod [<test_atomic_ $int_type>] {
                use super::*;
                __test_atomic_int_load_store!([<Atomic $int_type:camel>], $int_type);
                __test_atomic_int_load_store_pub!([<Atomic $int_type:camel>], $int_type);
            }
        }
    };
}
#[cfg(feature = "float")]
macro_rules! test_atomic_float_pub {
    ($float_type:ident) => {
        paste::paste! {
            #[allow(
                clippy::alloc_instead_of_core,
                clippy::std_instead_of_alloc,
                clippy::std_instead_of_core,
                clippy::undocumented_unsafe_blocks
            )]
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
        #[allow(
            clippy::alloc_instead_of_core,
            clippy::std_instead_of_alloc,
            clippy::std_instead_of_core,
            clippy::undocumented_unsafe_blocks
        )]
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
        #[allow(
            clippy::alloc_instead_of_core,
            clippy::std_instead_of_alloc,
            clippy::std_instead_of_core,
            clippy::undocumented_unsafe_blocks
        )]
        #[allow(unstable_name_collisions)]
        mod test_atomic_ptr {
            use super::*;
            __test_atomic_ptr_load_store!(AtomicPtr<u8>);
            __test_atomic_ptr!(AtomicPtr<u8>);
            __test_atomic_ptr_pub!(AtomicPtr<u8>);
        }
    };
}

macro_rules! test_atomic128_op {
    () => {
        #[allow(
            clippy::alloc_instead_of_core,
            clippy::std_instead_of_alloc,
            clippy::std_instead_of_core,
            clippy::undocumented_unsafe_blocks
        )]
        mod test_atomic128_op {
            use super::*;
            __test_atomic128_op!();
        }
    };
}
macro_rules! __test_atomic128_op {
    () => {
        ::quickcheck::quickcheck! {
            #[cfg(not(target_arch = "aarch64"))]
            fn quickcheck_atomic_swap_op(x: u128, y: u128) -> bool {
                unsafe {
                    let a = AtomicU128::new(x);
                    assert_eq!(atomic_swap_op(a.as_ptr(), y), x);
                    assert_eq!(a.load(Ordering::Relaxed), y);
                    let a = AtomicU128::new(y);
                    assert_eq!(atomic_swap_op(a.as_ptr(), x), y);
                    assert_eq!(a.load(Ordering::Relaxed), x);
                }
                true
            }
            fn quickcheck_atomic_add_op(x: u128, y: u128) -> bool {
                unsafe {
                    let a = AtomicU128::new(x);
                    assert_eq!(atomic_add_op(a.as_ptr(), y), x);
                    assert_eq!(a.load(Ordering::Relaxed), x.wrapping_add(y));
                    let a = AtomicU128::new(y);
                    assert_eq!(atomic_add_op(a.as_ptr(), x), y);
                    assert_eq!(a.load(Ordering::Relaxed), y.wrapping_add(x));
                }
                true
            }
            fn quickcheck_atomic_sub_op(x: u128, y: u128) -> bool {
                unsafe {
                    let a = AtomicU128::new(x);
                    assert_eq!(atomic_sub_op(a.as_ptr(), y), x);
                    assert_eq!(a.load(Ordering::Relaxed), x.wrapping_sub(y));
                    let a = AtomicU128::new(y);
                    assert_eq!(atomic_sub_op(a.as_ptr(), x), y);
                    assert_eq!(a.load(Ordering::Relaxed), y.wrapping_sub(x));
                }
                true
            }
            fn quickcheck_atomic_and_op(x: u128, y: u128) -> bool {
                unsafe {
                    let a = AtomicU128::new(x);
                    assert_eq!(atomic_and_op(a.as_ptr(), y), x);
                    assert_eq!(a.load(Ordering::Relaxed), x & y);
                    let a = AtomicU128::new(y);
                    assert_eq!(atomic_and_op(a.as_ptr(), x), y);
                    assert_eq!(a.load(Ordering::Relaxed), y & x);
                }
                true
            }
            fn quickcheck_atomic_nand_op(x: u128, y: u128) -> bool {
                unsafe {
                    let a = AtomicU128::new(x);
                    assert_eq!(atomic_nand_op(a.as_ptr(), y), x);
                    assert_eq!(a.load(Ordering::Relaxed), !(x & y));
                    let a = AtomicU128::new(y);
                    assert_eq!(atomic_nand_op(a.as_ptr(), x), y);
                    assert_eq!(a.load(Ordering::Relaxed), !(y & x));
                }
                true
            }
            fn quickcheck_atomic_or_op(x: u128, y: u128) -> bool {
                unsafe {
                    let a = AtomicU128::new(x);
                    assert_eq!(atomic_or_op(a.as_ptr(), y), x);
                    assert_eq!(a.load(Ordering::Relaxed), x | y);
                    let a = AtomicU128::new(y);
                    assert_eq!(atomic_or_op(a.as_ptr(), x), y);
                    assert_eq!(a.load(Ordering::Relaxed), y | x);
                }
                true
            }
            fn quickcheck_atomic_xor_op(x: u128, y: u128) -> bool {
                unsafe {
                    let a = AtomicU128::new(x);
                    assert_eq!(atomic_xor_op(a.as_ptr(), y), x);
                    assert_eq!(a.load(Ordering::Relaxed), x ^ y);
                    let a = AtomicU128::new(y);
                    assert_eq!(atomic_xor_op(a.as_ptr(), x), y);
                    assert_eq!(a.load(Ordering::Relaxed), y ^ x);
                }
                true
            }
            fn quickcheck_atomic_max_op(x: i128, y: i128) -> bool {
                unsafe {
                    let a = AtomicI128::new(x);
                    assert_eq!(atomic_max_op(a.as_ptr(), y), x);
                    assert_eq!(a.load(Ordering::Relaxed), core::cmp::max(x, y));
                    let a = AtomicI128::new(y);
                    assert_eq!(atomic_max_op(a.as_ptr(), x), y);
                    assert_eq!(a.load(Ordering::Relaxed), core::cmp::max(y, x));
                }
                true
            }
            fn quickcheck_atomic_umax_op(x: u128, y: u128) -> bool {
                unsafe {
                    let a = AtomicU128::new(x);
                    assert_eq!(atomic_umax_op(a.as_ptr(), y), x);
                    assert_eq!(a.load(Ordering::Relaxed), core::cmp::max(x, y));
                    let a = AtomicU128::new(y);
                    assert_eq!(atomic_umax_op(a.as_ptr(), x), y);
                    assert_eq!(a.load(Ordering::Relaxed), core::cmp::max(y, x));
                }
                true
            }
            fn quickcheck_atomic_min_op(x: i128, y: i128) -> bool {
                unsafe {
                    let a = AtomicI128::new(x);
                    assert_eq!(atomic_min_op(a.as_ptr(), y), x);
                    assert_eq!(a.load(Ordering::Relaxed), core::cmp::min(x, y));
                    let a = AtomicI128::new(y);
                    assert_eq!(atomic_min_op(a.as_ptr(), x), y);
                    assert_eq!(a.load(Ordering::Relaxed), core::cmp::min(y, x));
                }
                true
            }
            fn quickcheck_atomic_umin_op(x: u128, y: u128) -> bool {
                unsafe {
                    let a = AtomicU128::new(x);
                    assert_eq!(atomic_umin_op(a.as_ptr(), y), x);
                    assert_eq!(a.load(Ordering::Relaxed), core::cmp::min(x, y));
                    let a = AtomicU128::new(y);
                    assert_eq!(atomic_umin_op(a.as_ptr(), x), y);
                    assert_eq!(a.load(Ordering::Relaxed), core::cmp::min(y, x));
                }
                true
            }
            #[cfg(not(target_arch = "powerpc64"))]
            fn quickcheck_atomic_not_op(x: u128) -> bool {
                unsafe {
                    let a = AtomicU128::new(x);
                    assert_eq!(atomic_not_op(a.as_ptr()), x);
                    assert_eq!(a.load(Ordering::Relaxed), !x);
                }
                true
            }
            #[cfg(not(target_arch = "powerpc64"))] // TODO
            fn quickcheck_atomic_neg_op(x: u128) -> bool {
                unsafe {
                    let a = AtomicU128::new(x);
                    assert_eq!(atomic_neg_op(a.as_ptr()), x);
                    assert_eq!(a.load(Ordering::Relaxed), x.wrapping_neg());
                }
                true
            }
        }
    };
}

// Asserts that `a` and `b` have performed equivalent operations.
#[cfg(feature = "float")]
macro_rules! assert_float_op_eq {
    ($a:expr, $b:expr $(,)?) => {{
        // See also:
        // - https://github.com/rust-lang/unsafe-code-guidelines/issues/237.
        // - https://github.com/rust-lang/portable-simd/issues/39.
        let a = $a;
        let b = $b;
        if a.is_nan() && b.is_nan() // don't check sign of NaN: https://github.com/rust-lang/rust/issues/55131
            || a.is_infinite()
                && b.is_infinite()
                && a.is_sign_positive() == b.is_sign_positive()
                && a.is_sign_negative() == b.is_sign_negative()
        {
            // ok
        } else {
            assert_eq!(a, b);
        }
    }};
}

pub(crate) trait FloatExt: Copy {
    fn epsilon(&self) -> Self;
}
impl FloatExt for f32 {
    fn epsilon(&self) -> Self {
        Self::EPSILON
    }
}
impl FloatExt for f64 {
    fn epsilon(&self) -> Self {
        Self::EPSILON
    }
}

#[cfg_attr(not(portable_atomic_no_track_caller), track_caller)]
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
pub(crate) fn rand_load_ordering() -> Ordering {
    test_helper::LOAD_ORDERINGS[fastrand::usize(0..test_helper::LOAD_ORDERINGS.len())]
}
pub(crate) fn test_load_ordering<T: std::fmt::Debug>(f: impl Fn(Ordering) -> T) {
    for &order in &test_helper::LOAD_ORDERINGS {
        f(order);
    }

    if !skip_should_panic_test() {
        assert_eq!(
            assert_panic(|| f(Ordering::Release)),
            "there is no such thing as a release load"
        );
        assert_eq!(
            assert_panic(|| f(Ordering::AcqRel)),
            "there is no such thing as an acquire-release load"
        );
    }
}
pub(crate) fn rand_store_ordering() -> Ordering {
    test_helper::STORE_ORDERINGS[fastrand::usize(0..test_helper::STORE_ORDERINGS.len())]
}
pub(crate) fn test_store_ordering<T: std::fmt::Debug>(f: impl Fn(Ordering) -> T) {
    for &order in &test_helper::STORE_ORDERINGS {
        f(order);
    }

    if !skip_should_panic_test() {
        assert_eq!(
            assert_panic(|| f(Ordering::Acquire)),
            "there is no such thing as an acquire store"
        );
        assert_eq!(
            assert_panic(|| f(Ordering::AcqRel)),
            "there is no such thing as an acquire-release store"
        );
    }
}
pub(crate) fn rand_compare_exchange_ordering() -> (Ordering, Ordering) {
    test_helper::COMPARE_EXCHANGE_ORDERINGS
        [fastrand::usize(0..test_helper::COMPARE_EXCHANGE_ORDERINGS.len())]
}
pub(crate) fn test_compare_exchange_ordering<T: std::fmt::Debug>(
    f: impl Fn(Ordering, Ordering) -> T,
) {
    for &(success, failure) in &test_helper::COMPARE_EXCHANGE_ORDERINGS {
        f(success, failure);
    }

    if !skip_should_panic_test() {
        for &order in &test_helper::SWAP_ORDERINGS {
            let msg = assert_panic(|| f(order, Ordering::AcqRel));
            assert!(
                msg == "there is no such thing as an acquire-release failure ordering"
                    || msg == "there is no such thing as an acquire-release load",
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
    }
}
pub(crate) fn rand_swap_ordering() -> Ordering {
    test_helper::SWAP_ORDERINGS[fastrand::usize(0..test_helper::SWAP_ORDERINGS.len())]
}
pub(crate) fn test_swap_ordering<T: std::fmt::Debug>(f: impl Fn(Ordering) -> T) {
    for &order in &test_helper::SWAP_ORDERINGS {
        f(order);
    }
}
fn skip_should_panic_test() -> bool {
    // Miri's panic handling is slow
    // MSAN false positive: https://gist.github.com/taiki-e/dd6269a8ffec46284fdc764a4849f884
    is_panic_abort()
        || cfg!(miri)
        || option_env!("CARGO_PROFILE_RELEASE_LTO").map_or(false, |v| v == "fat")
            && option_env!("MSAN_OPTIONS").is_some()
}
// For -C panic=abort -Z panic_abort_tests: https://github.com/rust-lang/rust/issues/67650
#[rustversion::since(1.60)] // cfg!(panic) requires Rust 1.60
fn is_panic_abort() -> bool {
    cfg!(panic = "abort")
}
#[rustversion::before(1.60)] // cfg!(panic) requires Rust 1.60
fn is_panic_abort() -> bool {
    false
}

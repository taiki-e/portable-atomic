// SPDX-License-Identifier: Apache-2.0 OR MIT

#![allow(dead_code)]

macro_rules! __run_test {
    ($test_name:ident) => {{
        $test_name();
    }};
}

macro_rules! __test_atomic_int {
    ($atomic_type:ty, $int_type:ident) => {
        __run_test!(misc);
        fn misc() {
            static _VAL: $atomic_type = <$atomic_type>::new(5);
            const IS_ALWAYS_LOCK_FREE: bool = <$atomic_type>::is_always_lock_free();
            assert_eq!(IS_ALWAYS_LOCK_FREE, <$atomic_type>::is_always_lock_free());
            let _is_always_lock_free: bool = <$atomic_type>::is_lock_free();

            let mut val = <$atomic_type>::new(5);
            *val.get_mut() = 10;
            assert_eq!(val.load(Ordering::Relaxed), 10);
            assert_eq!(val.into_inner(), 10);
            let val = <$atomic_type>::default();
            assert_eq!(val.into_inner(), 0);
            let val = <$atomic_type>::from(1);
            assert_eq!(val.into_inner(), 1);
        }
        __run_test!(static_load_only);
        fn static_load_only() {
            static VAR: $atomic_type = <$atomic_type>::new(10);
            for &order in &helper::LOAD_ORDERINGS {
                assert_eq!(VAR.load(order), 10);
            }
        }
        __run_test!(load_store);
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(10);
            for (&load_order, &store_order) in
                helper::LOAD_ORDERINGS.iter().zip(&helper::STORE_ORDERINGS)
            {
                assert_eq!(VAR.load(load_order), 10);
                VAR.store(5, store_order);
                assert_eq!(VAR.load(load_order), 5);
                VAR.store(10, store_order);
                let a = <$atomic_type>::new(1);
                assert_eq!(a.load(load_order), 1);
                a.store($int_type::MIN, store_order);
                assert_eq!(a.load(load_order), $int_type::MIN);
                a.store($int_type::MAX, store_order);
                assert_eq!(a.load(load_order), $int_type::MAX);
            }
        }
        __run_test!(swap);
        fn swap() {
            let a = <$atomic_type>::new(5);
            for &order in &helper::SWAP_ORDERINGS {
                assert_eq!(a.swap(10, order), 5);
                assert_eq!(a.swap($int_type::MIN, order), 10);
                assert_eq!(a.swap($int_type::MAX, order), $int_type::MIN);
                assert_eq!(a.swap(5, order), $int_type::MAX);
            }
        }
        __run_test!(compare_exchange);
        fn compare_exchange() {
            for &(success, failure) in &helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(5);
                assert_eq!(a.compare_exchange(5, 10, success, failure), Ok(5));
                assert_eq!(a.load(Ordering::Relaxed), 10);
                assert_eq!(a.compare_exchange(6, 12, success, failure), Err(10));
                assert_eq!(a.load(Ordering::Relaxed), 10);
            }
        }
        __run_test!(compare_exchange_weak);
        fn compare_exchange_weak() {
            for &(success, failure) in &helper::COMPARE_EXCHANGE_ORDERINGS {
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
        __run_test!(fetch_add);
        fn fetch_add() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0);
                assert_eq!(a.fetch_add(10, order), 0);
                assert_eq!(a.load(Ordering::Relaxed), 10);
                let a = <$atomic_type>::new($int_type::MAX);
                assert_eq!(a.fetch_add(1, order), $int_type::MAX);
                assert_eq!(a.load(Ordering::Relaxed), $int_type::MAX.wrapping_add(1));
            }
        }
        __run_test!(add);
        fn add() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0);
                a.add(10, order);
                assert_eq!(a.load(Ordering::Relaxed), 10);
                let a = <$atomic_type>::new($int_type::MAX);
                a.add(1, order);
                assert_eq!(a.load(Ordering::Relaxed), $int_type::MAX.wrapping_add(1));
            }
        }
        __run_test!(fetch_sub);
        fn fetch_sub() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(20);
                assert_eq!(a.fetch_sub(10, order), 20);
                assert_eq!(a.load(Ordering::Relaxed), 10);
                let a = <$atomic_type>::new($int_type::MIN);
                assert_eq!(a.fetch_sub(1, order), $int_type::MIN);
                assert_eq!(a.load(Ordering::Relaxed), $int_type::MIN.wrapping_sub(1));
            }
        }
        __run_test!(sub);
        fn sub() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(20);
                a.sub(10, order);
                assert_eq!(a.load(Ordering::Relaxed), 10);
                let a = <$atomic_type>::new($int_type::MIN);
                a.sub(1, order);
                assert_eq!(a.load(Ordering::Relaxed), $int_type::MIN.wrapping_sub(1));
            }
        }
        __run_test!(fetch_and);
        fn fetch_and() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b101101);
                assert_eq!(a.fetch_and(0b110011, order), 0b101101);
                assert_eq!(a.load(Ordering::Relaxed), 0b100001);
            }
        }
        __run_test!(and);
        fn and() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b101101);
                a.and(0b110011, order);
                assert_eq!(a.load(Ordering::Relaxed), 0b100001);
            }
        }
        __run_test!(fetch_nand);
        fn fetch_nand() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0x13);
                assert_eq!(a.fetch_nand(0x31, order), 0x13);
                assert_eq!(a.load(Ordering::Relaxed), !(0x13 & 0x31));
            }
        }
        __run_test!(fetch_or);
        fn fetch_or() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b101101);
                assert_eq!(a.fetch_or(0b110011, order), 0b101101);
                assert_eq!(a.load(Ordering::Relaxed), 0b111111);
            }
        }
        __run_test!(or);
        fn or() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b101101);
                a.or(0b110011, order);
                assert_eq!(a.load(Ordering::Relaxed), 0b111111);
            }
        }
        __run_test!(fetch_xor);
        fn fetch_xor() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b101101);
                assert_eq!(a.fetch_xor(0b110011, order), 0b101101);
                assert_eq!(a.load(Ordering::Relaxed), 0b011110);
            }
        }
        __run_test!(xor);
        fn xor() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b101101);
                a.xor(0b110011, order);
                assert_eq!(a.load(Ordering::Relaxed), 0b011110);
            }
        }
        __run_test!(fetch_max);
        fn fetch_max() {
            for &order in &helper::SWAP_ORDERINGS {
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
        __run_test!(fetch_min);
        fn fetch_min() {
            for &order in &helper::SWAP_ORDERINGS {
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
        __run_test!(fetch_not);
        fn fetch_not() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(1);
                assert_eq!(a.fetch_not(order), 1);
                assert_eq!(a.load(Ordering::Relaxed), !1);
            }
        }
        __run_test!(not);
        fn not() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(1);
                a.not(order);
                assert_eq!(a.load(Ordering::Relaxed), !1);
            }
        }
        __run_test!(fetch_neg);
        fn fetch_neg() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(5);
                assert_eq!(a.fetch_neg(order), 5);
                assert_eq!(a.load(Ordering::Relaxed), <$int_type>::wrapping_neg(5));
                assert_eq!(a.fetch_neg(order), <$int_type>::wrapping_neg(5));
                assert_eq!(a.load(Ordering::Relaxed), 5);
            }
        }
        __run_test!(neg);
        fn neg() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(5);
                a.neg(order);
                assert_eq!(a.load(Ordering::Relaxed), <$int_type>::wrapping_neg(5));
                a.neg(order);
                assert_eq!(a.load(Ordering::Relaxed), 5);
            }
        }
        __run_test!(bit_set);
        fn bit_set() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b0000);
                assert!(!a.bit_set(0, order));
                assert_eq!(a.load(Ordering::Relaxed), 0b0001);
                assert!(a.bit_set(0, order));
                assert_eq!(a.load(Ordering::Relaxed), 0b0001);
            }
        }
        __run_test!(bit_clear);
        fn bit_clear() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b0001);
                assert!(a.bit_clear(0, order));
                assert_eq!(a.load(Ordering::Relaxed), 0b0000);
                assert!(!a.bit_clear(0, order));
                assert_eq!(a.load(Ordering::Relaxed), 0b0000);
            }
        }
        __run_test!(bit_toggle);
        fn bit_toggle() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0b0000);
                assert!(!a.bit_toggle(0, order));
                assert_eq!(a.load(Ordering::Relaxed), 0b0001);
                assert!(a.bit_toggle(0, order));
                assert_eq!(a.load(Ordering::Relaxed), 0b0000);
            }
        }
        __run_test!(fetch_update);
        fn fetch_update() {
            for &(success, failure) in &helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(7);
                assert_eq!(a.fetch_update(success, failure, |_| None), Err(7));
                assert_eq!(a.fetch_update(success, failure, |x| Some(x + 1)), Ok(7));
                assert_eq!(a.fetch_update(success, failure, |x| Some(x + 1)), Ok(8));
                assert_eq!(a.load(Ordering::Relaxed), 9);
            }
        }
    };
}
macro_rules! __test_atomic_float {
    ($atomic_type:ty, $float_type:ident) => {
        __run_test!(misc);
        fn misc() {
            static _VAL: $atomic_type = <$atomic_type>::new(5.);
            const IS_ALWAYS_LOCK_FREE: bool = <$atomic_type>::is_always_lock_free();
            assert_eq!(IS_ALWAYS_LOCK_FREE, <$atomic_type>::is_always_lock_free());
            let _is_always_lock_free: bool = <$atomic_type>::is_lock_free();

            let mut val = <$atomic_type>::new(5.);
            *val.get_mut() = 10.;
            assert_eq!(val.load(Ordering::Relaxed), 10.);
            assert_eq!(val.into_inner(), 10.);
            let val = <$atomic_type>::default();
            assert_eq!(val.into_inner(), 0.);
            let val = <$atomic_type>::from(1.);
            assert_eq!(val.into_inner(), 1.);
        }
        __run_test!(static_load_only);
        fn static_load_only() {
            static VAR: $atomic_type = <$atomic_type>::new(10.);
            for &order in &helper::LOAD_ORDERINGS {
                assert_eq!(VAR.load(order), 10.);
            }
        }
        __run_test!(load_store);
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(10.);
            for (&load_order, &store_order) in
                helper::LOAD_ORDERINGS.iter().zip(&helper::STORE_ORDERINGS)
            {
                assert_eq!(VAR.load(load_order), 10.);
                VAR.store(5., store_order);
                assert_eq!(VAR.load(load_order), 5.);
                VAR.store(10., store_order);
                let a = <$atomic_type>::new(1.);
                assert_eq!(a.load(load_order), 1.);
                a.store(2., store_order);
                assert_eq!(a.load(load_order), 2.);
            }
        }
        __run_test!(swap);
        fn swap() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(5.);
                assert_eq!(a.swap(10., order), 5.);
                assert_eq!(a.swap(5., order), 10.);
            }
        }
        __run_test!(compare_exchange);
        fn compare_exchange() {
            for &(success, failure) in &helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(5.);
                assert_eq!(a.compare_exchange(5., 10., success, failure), Ok(5.));
                assert_eq!(a.load(Ordering::Relaxed), 10.);
                assert_eq!(a.compare_exchange(6., 12., success, failure), Err(10.));
                assert_eq!(a.load(Ordering::Relaxed), 10.);
            }
        }
        __run_test!(compare_exchange_weak);
        fn compare_exchange_weak() {
            for &(success, failure) in &helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(4.);
                assert_eq!(a.compare_exchange_weak(6., 8., success, failure), Err(4.));
                let mut old = a.load(Ordering::Relaxed);
                loop {
                    let new = old * 2.;
                    match a.compare_exchange_weak(old, new, success, failure) {
                        Ok(_) => break,
                        Err(x) => old = x,
                    }
                }
                assert_eq!(a.load(Ordering::Relaxed), 8.);
            }
        }
        __run_test!(fetch_add);
        fn fetch_add() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(0.);
                assert_eq!(a.fetch_add(10., order), 0.);
                assert_eq!(a.load(Ordering::Relaxed), 10.);
                let a = <$atomic_type>::new($float_type::MAX);
                assert_eq!(a.fetch_add(1., order), $float_type::MAX);
                assert_eq!(a.load(Ordering::Relaxed), $float_type::MAX + 1.);
            }
        }
        __run_test!(fetch_sub);
        fn fetch_sub() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(20.);
                assert_eq!(a.fetch_sub(10., order), 20.);
                assert_eq!(a.load(Ordering::Relaxed), 10.);
                let a = <$atomic_type>::new($float_type::MIN);
                assert_eq!(a.fetch_sub(1., order), $float_type::MIN);
                assert_eq!(a.load(Ordering::Relaxed), $float_type::MIN - 1.);
            }
        }
        __run_test!(fetch_max);
        fn fetch_max() {
            if core::mem::size_of::<$float_type>() == 16
                && cfg!(any(
                    target_arch = "arm",
                    target_arch = "mips",
                    target_arch = "mips32r6",
                    target_arch = "mips64",
                    target_arch = "mips64r6",
                    target_vendor = "apple",
                    windows,
                ))
            {
                // TODO(f128):
                return;
            }
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(23.);
                assert_eq!(a.fetch_max(22., order), 23.);
                assert_eq!(a.load(Ordering::Relaxed), 23.);
                assert_eq!(a.fetch_max(24., order), 23.);
                assert_eq!(a.load(Ordering::Relaxed), 24.);
                let a = <$atomic_type>::new(0.);
                assert_eq!(a.fetch_max(1., order), 0.);
                assert_eq!(a.load(Ordering::Relaxed), 1.);
                assert_eq!(a.fetch_max(0., order), 1.);
                assert_eq!(a.load(Ordering::Relaxed), 1.);
            }
        }
        __run_test!(fetch_min);
        fn fetch_min() {
            if core::mem::size_of::<$float_type>() == 16
                && cfg!(any(
                    target_arch = "arm",
                    target_arch = "mips",
                    target_arch = "mips32r6",
                    target_arch = "mips64",
                    target_arch = "mips64r6",
                    target_vendor = "apple",
                    windows,
                ))
            {
                // TODO(f128):
                return;
            }
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(23.);
                assert_eq!(a.fetch_min(24., order), 23.);
                assert_eq!(a.load(Ordering::Relaxed), 23.);
                assert_eq!(a.fetch_min(22., order), 23.);
                assert_eq!(a.load(Ordering::Relaxed), 22.);
                let a = <$atomic_type>::new(1.);
                assert_eq!(a.fetch_min(0., order), 1.);
                assert_eq!(a.load(Ordering::Relaxed), 0.);
                assert_eq!(a.fetch_min(1., order), 0.);
                assert_eq!(a.load(Ordering::Relaxed), 0.);
            }
        }
        __run_test!(fetch_neg);
        fn fetch_neg() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(5.);
                assert_eq!(a.fetch_neg(order), 5.);
                assert_eq!(a.load(Ordering::Relaxed), -5.);
                assert_eq!(a.fetch_neg(order), -5.);
                assert_eq!(a.load(Ordering::Relaxed), 5.);
            }
        }
        __run_test!(fetch_abs);
        fn fetch_abs() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(-23.);
                assert_eq!(a.fetch_abs(order), -23.);
                assert_eq!(a.load(Ordering::Relaxed), 23.);
                assert_eq!(a.fetch_abs(order), 23.);
                assert_eq!(a.load(Ordering::Relaxed), 23.);
            }
        }
        __run_test!(fetch_update);
        fn fetch_update() {
            for &(success, failure) in &helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(7.);
                assert_eq!(a.fetch_update(success, failure, |_| None), Err(7.));
                assert_eq!(a.fetch_update(success, failure, |x| Some(x + 1.)), Ok(7.));
                assert_eq!(a.fetch_update(success, failure, |x| Some(x + 1.)), Ok(8.));
                assert_eq!(a.load(Ordering::Relaxed), 9.);
            }
        }
    };
}
macro_rules! __test_atomic_bool {
    ($atomic_type:ty) => {
        __run_test!(misc);
        fn misc() {
            static _VAL: $atomic_type = <$atomic_type>::new(true);
            const IS_ALWAYS_LOCK_FREE: bool = <$atomic_type>::is_always_lock_free();
            assert_eq!(IS_ALWAYS_LOCK_FREE, <$atomic_type>::is_always_lock_free());
            let _is_always_lock_free: bool = <$atomic_type>::is_lock_free();

            let mut val = <$atomic_type>::new(false);
            *val.get_mut() = true;
            assert_eq!(val.load(Ordering::Relaxed), true);
            assert_eq!(val.into_inner(), true);
            let val = <$atomic_type>::default();
            assert_eq!(val.into_inner(), false);
            let val = <$atomic_type>::from(true);
            assert_eq!(val.into_inner(), true);
        }
        __run_test!(static_load_only);
        fn static_load_only() {
            static VAR: $atomic_type = <$atomic_type>::new(false);
            for &order in &helper::LOAD_ORDERINGS {
                assert_eq!(VAR.load(order), false);
            }
        }
        __run_test!(load_store);
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(false);
            for (&load_order, &store_order) in
                helper::LOAD_ORDERINGS.iter().zip(&helper::STORE_ORDERINGS)
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
        __run_test!(swap);
        fn swap() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(true);
                assert_eq!(a.swap(true, order), true);
                assert_eq!(a.swap(false, order), true);
                assert_eq!(a.swap(false, order), false);
                assert_eq!(a.swap(true, order), false);
            }
        }
        __run_test!(compare_exchange);
        fn compare_exchange() {
            for &(success, failure) in &helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(true);
                assert_eq!(a.compare_exchange(true, false, success, failure), Ok(true));
                assert_eq!(a.load(Ordering::Relaxed), false);
                assert_eq!(a.compare_exchange(true, true, success, failure), Err(false));
                assert_eq!(a.load(Ordering::Relaxed), false);
            }
        }
        __run_test!(compare_exchange_weak);
        fn compare_exchange_weak() {
            for &(success, failure) in &helper::COMPARE_EXCHANGE_ORDERINGS {
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
        __run_test!(fetch_and);
        fn fetch_and() {
            for &order in &helper::SWAP_ORDERINGS {
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
        __run_test!(and);
        fn and() {
            for &order in &helper::SWAP_ORDERINGS {
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
        __run_test!(fetch_nand);
        fn fetch_nand() {
            for &order in &helper::SWAP_ORDERINGS {
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
        __run_test!(fetch_or);
        fn fetch_or() {
            for &order in &helper::SWAP_ORDERINGS {
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
        __run_test!(or);
        fn or() {
            for &order in &helper::SWAP_ORDERINGS {
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
        __run_test!(fetch_xor);
        fn fetch_xor() {
            for &order in &helper::SWAP_ORDERINGS {
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
        __run_test!(xor);
        fn xor() {
            for &order in &helper::SWAP_ORDERINGS {
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
        __run_test!(fetch_not);
        fn fetch_not() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(true);
                assert_eq!(a.fetch_not(order), true);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                assert_eq!(a.fetch_not(order), false);
                assert_eq!(a.load(Ordering::Relaxed), true);
            }
        }
        __run_test!(not);
        fn not() {
            for &order in &helper::SWAP_ORDERINGS {
                let a = <$atomic_type>::new(true);
                a.not(order);
                assert_eq!(a.load(Ordering::Relaxed), false);
                let a = <$atomic_type>::new(false);
                a.not(order);
                assert_eq!(a.load(Ordering::Relaxed), true);
            }
        }
        __run_test!(fetch_update);
        fn fetch_update() {
            for &(success, failure) in &helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(false);
                assert_eq!(a.fetch_update(success, failure, |_| None), Err(false));
                assert_eq!(a.fetch_update(success, failure, |x| Some(!x)), Ok(false));
                assert_eq!(a.fetch_update(success, failure, |x| Some(!x)), Ok(true));
                assert_eq!(a.load(Ordering::Relaxed), false);
            }
        }
    };
}
macro_rules! __test_atomic_ptr {
    ($atomic_type:ty) => {
        __run_test!(misc);
        fn misc() {
            static _VAL: $atomic_type = <$atomic_type>::new(core::ptr::null_mut());
            const IS_ALWAYS_LOCK_FREE: bool = <$atomic_type>::is_always_lock_free();
            assert_eq!(IS_ALWAYS_LOCK_FREE, <$atomic_type>::is_always_lock_free());
            let _is_always_lock_free: bool = <$atomic_type>::is_lock_free();

            let mut v = 1;
            let mut val = <$atomic_type>::new(core::ptr::null_mut());
            *val.get_mut() = &mut v;
            assert!(!val.load(Ordering::Relaxed).is_null());
            assert!(!val.into_inner().is_null());
            let val = <$atomic_type>::default();
            assert!(val.into_inner().is_null());
            let val = <$atomic_type>::from(&mut v as *mut _);
            assert!(!val.into_inner().is_null());
        }
        __run_test!(static_load_only);
        fn static_load_only() {
            static VAR: $atomic_type = <$atomic_type>::new(core::ptr::null_mut());
            for &order in &helper::LOAD_ORDERINGS {
                assert_eq!(VAR.load(order), core::ptr::null_mut());
            }
        }
        __run_test!(load_store);
        fn load_store() {
            static VAR: $atomic_type = <$atomic_type>::new(core::ptr::null_mut());
            let mut v = 1_u8;
            let p = &mut v as *mut u8;
            for (&load_order, &store_order) in
                helper::LOAD_ORDERINGS.iter().zip(&helper::STORE_ORDERINGS)
            {
                assert_eq!(VAR.load(load_order), core::ptr::null_mut());
                VAR.store(p, store_order);
                assert_eq!(VAR.load(load_order), p);
                VAR.store(core::ptr::null_mut(), store_order);
                let a = <$atomic_type>::new(p);
                assert_eq!(a.load(load_order), p);
                a.store(core::ptr::null_mut(), store_order);
                assert_eq!(a.load(load_order), core::ptr::null_mut());
            }
        }
        __run_test!(swap);
        fn swap() {
            let a = <$atomic_type>::new(core::ptr::null_mut());
            let x = &mut 1;
            for &order in &helper::SWAP_ORDERINGS {
                assert_eq!(a.swap(x, order), core::ptr::null_mut());
                assert_eq!(a.swap(core::ptr::null_mut(), order), x as *mut _);
            }
        }
        __run_test!(compare_exchange);
        fn compare_exchange() {
            for &(success, failure) in &helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(core::ptr::null_mut());
                let x = &mut 1;
                assert_eq!(
                    a.compare_exchange(core::ptr::null_mut(), x, success, failure),
                    Ok(core::ptr::null_mut()),
                );
                assert_eq!(a.load(Ordering::Relaxed), x as *mut _);
                assert_eq!(
                    a.compare_exchange(
                        core::ptr::null_mut(),
                        core::ptr::null_mut(),
                        success,
                        failure
                    ),
                    Err(x as *mut _),
                );
                assert_eq!(a.load(Ordering::Relaxed), x as *mut _);
            }
        }
        __run_test!(compare_exchange_weak);
        fn compare_exchange_weak() {
            for &(success, failure) in &helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(core::ptr::null_mut());
                let x = &mut 1;
                assert_eq!(
                    a.compare_exchange_weak(x, x, success, failure),
                    Err(core::ptr::null_mut())
                );
                let mut old = a.load(Ordering::Relaxed);
                loop {
                    match a.compare_exchange_weak(old, x, success, failure) {
                        Ok(_) => break,
                        Err(x) => old = x,
                    }
                }
                assert_eq!(a.load(Ordering::Relaxed), x as *mut _);
            }
        }
        __run_test!(fetch_update);
        fn fetch_update() {
            for &(success, failure) in &helper::COMPARE_EXCHANGE_ORDERINGS {
                let a = <$atomic_type>::new(core::ptr::null_mut());
                assert_eq!(a.fetch_update(success, failure, |_| None), Err(core::ptr::null_mut()));
                assert_eq!(
                    a.fetch_update(success, failure, |_| Some(&a as *const _ as *mut _)),
                    Ok(core::ptr::null_mut())
                );
                assert_eq!(a.load(Ordering::Relaxed), &a as *const _ as *mut _);
            }
        }
    };
}

use core::sync::atomic::Ordering;

pub(crate) const LOAD_ORDERINGS: [Ordering; 3] =
    [Ordering::Relaxed, Ordering::Acquire, Ordering::SeqCst];
pub(crate) const STORE_ORDERINGS: [Ordering; 3] =
    [Ordering::Relaxed, Ordering::Release, Ordering::SeqCst];
pub(crate) const SWAP_ORDERINGS: [Ordering; 5] =
    [Ordering::Relaxed, Ordering::Release, Ordering::Acquire, Ordering::AcqRel, Ordering::SeqCst];
pub(crate) const COMPARE_EXCHANGE_ORDERINGS: [(Ordering, Ordering); 15] = [
    (Ordering::Relaxed, Ordering::Relaxed),
    (Ordering::Relaxed, Ordering::Acquire),
    (Ordering::Relaxed, Ordering::SeqCst),
    (Ordering::Acquire, Ordering::Relaxed),
    (Ordering::Acquire, Ordering::Acquire),
    (Ordering::Acquire, Ordering::SeqCst),
    (Ordering::Release, Ordering::Relaxed),
    (Ordering::Release, Ordering::Acquire),
    (Ordering::Release, Ordering::SeqCst),
    (Ordering::AcqRel, Ordering::Relaxed),
    (Ordering::AcqRel, Ordering::Acquire),
    (Ordering::AcqRel, Ordering::SeqCst),
    (Ordering::SeqCst, Ordering::Relaxed),
    (Ordering::SeqCst, Ordering::Acquire),
    (Ordering::SeqCst, Ordering::SeqCst),
];
pub(crate) const FENCE_ORDERINGS: [Ordering; 4] =
    [Ordering::Release, Ordering::Acquire, Ordering::AcqRel, Ordering::SeqCst];

// SPDX-License-Identifier: Apache-2.0 OR MIT

#![cfg(any(feature = "std", feature = "alloc"))]
#![allow(clippy::undocumented_unsafe_blocks)]

use std::{borrow::Cow, panic};

use portable_atomic_util::{Arc, Weak};

#[derive(Debug, PartialEq)]
#[repr(align(128))]
struct Aligned(u32);

// https://github.com/taiki-e/portable-atomic/issues/37
#[test]
fn over_aligned() {
    let value = Arc::new(Aligned(128));
    let ptr = Arc::into_raw(value);
    // SAFETY: `ptr` should always be a valid `Aligned`.
    assert_eq!(unsafe { (*ptr).0 }, 128);
    // SAFETY: `ptr` is a valid reference to an `Arc<Aligned>`.
    let value = unsafe { Arc::from_raw(ptr) };
    assert_eq!(value.0, 128);
}

#[test]
fn default() {
    let v = Arc::<[Aligned]>::default();
    assert_eq!(v[..], []);
    let v = Arc::<[()]>::default();
    assert_eq!(v[..], []);
    let v = Arc::<str>::default();
    assert_eq!(&v[..], "");
}

#[test]
fn cow_from() {
    let o = Cow::Owned("abc".to_owned());
    let b = Cow::Borrowed("def");
    let o: Arc<str> = Arc::from(o);
    let b: Arc<str> = Arc::from(b);
    assert_eq!(&*o, "abc");
    assert_eq!(&*b, "def");
}

#[test]
fn make_mut_unsized() {
    let mut v: Arc<[i32]> = Arc::from([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    Arc::make_mut(&mut v)[0] += 10;
    assert_eq!(&*v, [11, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    let v1 = Arc::clone(&v);
    let v2 = Arc::make_mut(&mut v);
    v2[1] += 10;
    assert_eq!(&*v1, [11, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    assert_eq!(&*v2, [11, 12, 3, 4, 5, 6, 7, 8, 9, 10]);
    assert_eq!(&*v, [11, 12, 3, 4, 5, 6, 7, 8, 9, 10]);
    drop(v1);
    let w = Arc::downgrade(&v);
    Arc::make_mut(&mut v)[2] += 10;
    assert_eq!(&*v, [11, 12, 13, 4, 5, 6, 7, 8, 9, 10]);
    assert!(w.upgrade().is_none());
}

#[test]
fn make_mut_clone_panic() {
    struct C(#[allow(dead_code)] Box<u8>);
    impl Clone for C {
        fn clone(&self) -> Self {
            panic!()
        }
    }
    let mut v: Arc<[C]> = Arc::from([C(Box::new(1)), C(Box::new(2))]);
    let _v = Arc::make_mut(&mut v);
    let v1 = Arc::clone(&v);
    if !is_panic_abort() {
        panic::catch_unwind(panic::AssertUnwindSafe(|| {
            let _v = Arc::make_mut(&mut v);
        }))
        .unwrap_err();
    }
    drop(v1);
}

#[test]
fn weak_dangling() {
    let w = Weak::<Aligned>::new();
    let p = Weak::into_raw(w);
    let w = unsafe { Weak::from_raw(p) };
    let w2 = Weak::clone(&w);
    assert!(w.upgrade().is_none());
    assert!(w2.upgrade().is_none());
}

// For -C panic=abort -Z panic_abort_tests: https://github.com/rust-lang/rust/issues/67650
fn is_panic_abort() -> bool {
    build_context::PANIC.contains("abort")
}

// https://github.com/rust-lang/rust/blob/1.84.0/library/alloc/src/sync/tests.rs
#[allow(clippy::many_single_char_names)]
mod alloc_tests {
    use std::{
        convert::TryInto as _,
        sync::{Mutex, mpsc::channel},
        thread,
    };

    use portable_atomic::{
        AtomicBool, AtomicUsize,
        Ordering::{Acquire, SeqCst},
    };
    use portable_atomic_util::{Arc, Weak};

    struct Canary(*mut AtomicUsize);

    impl Drop for Canary {
        fn drop(&mut self) {
            unsafe {
                match *self {
                    Canary(c) => {
                        (*c).fetch_add(1, SeqCst);
                    }
                }
            }
        }
    }

    #[test]
    #[cfg_attr(target_os = "emscripten", ignore = "thread::spawn doesn't work on emscripten")]
    fn manually_share_arc() {
        let v = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        let arc_v = Arc::new(v);

        let (tx, rx) = channel();

        let _t = thread::spawn(move || {
            let arc_v: Arc<Vec<i32>> = rx.recv().unwrap();
            assert_eq!((*arc_v)[3], 4);
        });

        tx.send(arc_v.clone()).unwrap();

        assert_eq!((*arc_v)[2], 3);
        assert_eq!((*arc_v)[4], 5);
    }

    #[test]
    fn test_arc_get_mut() {
        let mut x = Arc::new(3);
        *Arc::get_mut(&mut x).unwrap() = 4;
        assert_eq!(*x, 4);
        let y = x.clone();
        assert!(Arc::get_mut(&mut x).is_none());
        drop(y);
        assert!(Arc::get_mut(&mut x).is_some());
        let _w = Arc::downgrade(&x);
        assert!(Arc::get_mut(&mut x).is_none());
    }

    #[test]
    fn weak_counts() {
        assert_eq!(Weak::weak_count(&Weak::<u64>::new()), 0);
        assert_eq!(Weak::strong_count(&Weak::<u64>::new()), 0);

        let a = Arc::new(0);
        let w = Arc::downgrade(&a);
        assert_eq!(Weak::strong_count(&w), 1);
        assert_eq!(Weak::weak_count(&w), 1);
        let w2 = w.clone();
        assert_eq!(Weak::strong_count(&w), 1);
        assert_eq!(Weak::weak_count(&w), 2);
        assert_eq!(Weak::strong_count(&w2), 1);
        assert_eq!(Weak::weak_count(&w2), 2);
        drop(w);
        assert_eq!(Weak::strong_count(&w2), 1);
        assert_eq!(Weak::weak_count(&w2), 1);
        let a2 = a.clone();
        assert_eq!(Weak::strong_count(&w2), 2);
        assert_eq!(Weak::weak_count(&w2), 1);
        drop(a2);
        drop(a);
        assert_eq!(Weak::strong_count(&w2), 0);
        assert_eq!(Weak::weak_count(&w2), 0);
        drop(w2);
    }

    #[test]
    fn try_unwrap() {
        let x = Arc::new(3);
        assert_eq!(Arc::try_unwrap(x), Ok(3));
        let x = Arc::new(4);
        let _y = x.clone();
        assert_eq!(Arc::try_unwrap(x), Err(Arc::new(4)));
        let x = Arc::new(5);
        let _w = Arc::downgrade(&x);
        assert_eq!(Arc::try_unwrap(x), Ok(5));
    }

    #[test]
    fn into_inner() {
        for _ in 0..100
        // ^ Increase chances of hitting potential race conditions
        {
            let x = Arc::new(3);
            let y = Arc::clone(&x);
            let r_thread = std::thread::spawn(|| Arc::into_inner(x));
            let s_thread = std::thread::spawn(|| Arc::into_inner(y));
            let r = r_thread.join().expect("r_thread panicked");
            let s = s_thread.join().expect("s_thread panicked");
            assert!(
                matches!((r, s), (None, Some(3)) | (Some(3), None)),
                "assertion failed: unexpected result `{:?}`\
            \n  expected `(None, Some(3))` or `(Some(3), None)`",
                (r, s),
            );
        }

        let x = Arc::new(3);
        assert_eq!(Arc::into_inner(x), Some(3));

        let x = Arc::new(4);
        let y = Arc::clone(&x);
        assert_eq!(Arc::into_inner(x), None);
        assert_eq!(Arc::into_inner(y), Some(4));

        let x = Arc::new(5);
        let _w = Arc::downgrade(&x);
        assert_eq!(Arc::into_inner(x), Some(5));
    }

    #[test]
    fn into_from_raw() {
        let x = Arc::new(Box::new("hello"));
        let y = x.clone();

        let x_ptr = Arc::into_raw(x);
        drop(y);
        unsafe {
            assert_eq!(**x_ptr, "hello");

            let x = Arc::from_raw(x_ptr);
            assert_eq!(**x, "hello");

            assert_eq!(Arc::try_unwrap(x).map(|x| *x), Ok("hello"));
        }
    }

    #[test]
    fn test_into_from_raw_unsized() {
        use std::fmt::Display;

        let arc: Arc<str> = Arc::from("foo");

        let ptr = Arc::into_raw(arc.clone());
        let arc2 = unsafe { Arc::from_raw(ptr) };

        assert_eq!(unsafe { &*ptr }, "foo");
        assert_eq!(arc, arc2);

        #[cfg(portable_atomic_unstable_coerce_unsized)]
        let arc: Arc<dyn Display> = Arc::new(123);
        // TODO: This is a workaround in case CoerceUnsized is not available - remove this once it is no longer needed
        #[cfg(not(portable_atomic_unstable_coerce_unsized))]
        let arc: Arc<dyn Display> = Arc::from(Box::new(123) as Box<dyn Display>);

        let ptr = Arc::into_raw(arc.clone());
        let arc2 = unsafe { Arc::from_raw(ptr) };

        assert_eq!(unsafe { &*ptr }.to_string(), "123");
        assert_eq!(arc2.to_string(), "123");
    }

    #[test]
    fn into_from_weak_raw() {
        let x = Arc::new(Box::new("hello"));
        let y = Arc::downgrade(&x);

        let y_ptr = Weak::into_raw(y);
        unsafe {
            assert_eq!(**y_ptr, "hello");

            let y = Weak::from_raw(y_ptr);
            let y_up = Weak::upgrade(&y).unwrap();
            assert_eq!(**y_up, "hello");
            drop(y_up);

            assert_eq!(Arc::try_unwrap(x).map(|x| *x), Ok("hello"));
        }
    }

    // TODO: See Weak::from_raw
    // #[test]
    // fn test_into_from_weak_raw_unsized() {
    //     use std::fmt::Display;

    //     let arc: Arc<str> = Arc::from("foo");
    //     let weak: Weak<str> = Arc::downgrade(&arc);

    //     let ptr = Weak::into_raw(weak.clone());
    //     let weak2 = unsafe { Weak::from_raw(ptr) };

    //     assert_eq!(unsafe { &*ptr }, "foo");
    //     assert!(weak.ptr_eq(&weak2));

    //     // TODO: CoerceUnsized is needed to cast to Arc<dyn ..>
    //     // (may be possible to support this with portable_atomic_unstable_coerce_unsized cfg option)
    //     // let arc: Arc<dyn Display> = Arc::new(123);
    //     let arc: Arc<dyn Display> = Arc::from(Box::new(123) as Box<dyn Display>);
    //     let weak: Weak<dyn Display> = Arc::downgrade(&arc);

    //     let ptr = Weak::into_raw(weak.clone());
    //     let weak2 = unsafe { Weak::from_raw(ptr) };

    //     assert_eq!(unsafe { &*ptr }.to_string(), "123");
    //     assert!(weak.ptr_eq(&weak2));
    // }

    #[test]
    fn test_cow_arc_clone_make_mut() {
        let mut cow0 = Arc::new(75);
        let mut cow1 = cow0.clone();
        let mut cow2 = cow1.clone();

        assert!(75 == *Arc::make_mut(&mut cow0));
        assert!(75 == *Arc::make_mut(&mut cow1));
        assert!(75 == *Arc::make_mut(&mut cow2));

        *Arc::make_mut(&mut cow0) += 1;
        *Arc::make_mut(&mut cow1) += 2;
        *Arc::make_mut(&mut cow2) += 3;

        assert!(76 == *cow0);
        assert!(77 == *cow1);
        assert!(78 == *cow2);

        // none should point to the same backing memory
        assert!(*cow0 != *cow1);
        assert!(*cow0 != *cow2);
        assert!(*cow1 != *cow2);
    }

    #[test]
    fn test_cow_arc_clone_unique2() {
        let mut cow0 = Arc::new(75);
        let cow1 = cow0.clone();
        let cow2 = cow1.clone();

        assert!(75 == *cow0);
        assert!(75 == *cow1);
        assert!(75 == *cow2);

        *Arc::make_mut(&mut cow0) += 1;
        assert!(76 == *cow0);
        assert!(75 == *cow1);
        assert!(75 == *cow2);

        // cow1 and cow2 should share the same contents
        // cow0 should have a unique reference
        assert!(*cow0 != *cow1);
        assert!(*cow0 != *cow2);
        assert!(*cow1 == *cow2);
    }

    #[test]
    fn test_cow_arc_clone_weak() {
        let mut cow0 = Arc::new(75);
        let cow1_weak = Arc::downgrade(&cow0);

        assert!(75 == *cow0);
        assert!(75 == *cow1_weak.upgrade().unwrap());

        *Arc::make_mut(&mut cow0) += 1;

        assert!(76 == *cow0);
        assert!(cow1_weak.upgrade().is_none());
    }

    #[test]
    fn test_live() {
        let x = Arc::new(5);
        let y = Arc::downgrade(&x);
        assert!(y.upgrade().is_some());
    }

    #[test]
    fn test_dead() {
        let x = Arc::new(5);
        let y = Arc::downgrade(&x);
        drop(x);
        assert!(y.upgrade().is_none());
    }

    #[test]
    fn weak_self_cyclic() {
        struct Cycle {
            x: Mutex<Option<Weak<Cycle>>>,
        }

        let a = Arc::new(Cycle { x: Mutex::new(None) });
        let b = Arc::downgrade(&a.clone());
        *a.x.lock().unwrap() = Some(b);

        // hopefully we don't double-free (or leak)...
    }

    #[test]
    fn drop_arc() {
        let mut canary = AtomicUsize::new(0);
        let x = Arc::new(Canary(&mut canary as *mut AtomicUsize));
        drop(x);
        assert!(canary.load(Acquire) == 1);
    }

    #[test]
    fn drop_arc_weak() {
        let mut canary = AtomicUsize::new(0);
        let arc = Arc::new(Canary(&mut canary as *mut AtomicUsize));
        let arc_weak = Arc::downgrade(&arc);
        assert!(canary.load(Acquire) == 0);
        drop(arc);
        assert!(canary.load(Acquire) == 1);
        drop(arc_weak);
    }

    #[test]
    fn test_strong_count() {
        let a = Arc::new(0);
        assert!(Arc::strong_count(&a) == 1);
        let w = Arc::downgrade(&a);
        assert!(Arc::strong_count(&a) == 1);
        let b = w.upgrade().expect("");
        assert!(Arc::strong_count(&b) == 2);
        assert!(Arc::strong_count(&a) == 2);
        drop(w);
        drop(a);
        assert!(Arc::strong_count(&b) == 1);
        let c = b.clone();
        assert!(Arc::strong_count(&b) == 2);
        assert!(Arc::strong_count(&c) == 2);
    }

    #[test]
    fn test_weak_count() {
        let a = Arc::new(0);
        assert!(Arc::strong_count(&a) == 1);
        assert!(Arc::weak_count(&a) == 0);
        let w = Arc::downgrade(&a);
        assert!(Arc::strong_count(&a) == 1);
        assert!(Arc::weak_count(&a) == 1);
        let x = w.clone();
        assert!(Arc::weak_count(&a) == 2);
        drop(w);
        drop(x);
        assert!(Arc::strong_count(&a) == 1);
        assert!(Arc::weak_count(&a) == 0);
        let c = a.clone();
        assert!(Arc::strong_count(&a) == 2);
        assert!(Arc::weak_count(&a) == 0);
        let d = Arc::downgrade(&c);
        assert!(Arc::weak_count(&c) == 1);
        assert!(Arc::strong_count(&c) == 2);

        drop(a);
        drop(c);
        drop(d);
    }

    #[test]
    fn show_arc() {
        let a = Arc::new(5);
        assert_eq!(format!("{:?}", a), "5");
    }

    // Make sure deriving works with Arc<T>
    #[derive(Eq, Ord, PartialEq, PartialOrd, Clone, Debug, Default)]
    struct _Foo {
        inner: Arc<i32>,
    }

    #[test]
    fn test_unsized() {
        #[cfg(portable_atomic_unstable_coerce_unsized)]
        let x: Arc<[i32]> = Arc::new([1, 2, 3]);
        // TODO: This is a workaround in case CoerceUnsized is not available - remove this once it is no longer needed
        #[cfg(not(portable_atomic_unstable_coerce_unsized))]
        let x: Arc<[i32]> = Arc::from(Box::new([1, 2, 3]) as Box<[i32]>);
        assert_eq!(format!("{:?}", x), "[1, 2, 3]");
        let y = Arc::downgrade(&x.clone());
        drop(x);
        assert!(y.upgrade().is_none());
    }

    #[test]
    fn test_maybe_thin_unsized() {
        // If/when custom thin DSTs exist, this test should be updated to use one
        use std::ffi::{CStr, CString};

        let x: Arc<CStr> = Arc::from(CString::new("swordfish").unwrap().into_boxed_c_str());
        assert_eq!(format!("{:?}", x), "\"swordfish\"");
        let y: Weak<CStr> = Arc::downgrade(&x);
        drop(x);

        // At this point, the weak points to a dropped DST
        assert!(y.upgrade().is_none());
        // But we still need to be able to get the alloc layout to drop.
        // CStr has no drop glue, but custom DSTs might, and need to work.
        drop(y);
    }

    #[test]
    fn test_from_owned() {
        let foo = 123;
        let foo_arc = Arc::from(foo);
        assert!(123 == *foo_arc);
    }

    #[test]
    fn test_new_weak() {
        let foo: Weak<usize> = Weak::new();
        assert!(foo.upgrade().is_none());
    }

    #[test]
    fn test_ptr_eq() {
        let five = Arc::new(5);
        let same_five = five.clone();
        let other_five = Arc::new(5);

        assert!(Arc::ptr_eq(&five, &same_five));
        assert!(!Arc::ptr_eq(&five, &other_five));
    }

    #[test]
    #[cfg_attr(target_os = "emscripten", ignore = "thread::spawn doesn't work on emscripten")]
    fn test_weak_count_locked() {
        let mut a = Arc::new(AtomicBool::new(false));
        let a2 = a.clone();
        let t = thread::spawn(move || {
            // Miri is too slow
            let count = if cfg!(miri) { 1_000 } else { 1_000_000 };
            for _i in 0..count {
                Arc::get_mut(&mut a);
            }
            a.store(true, SeqCst);
        });

        while !a2.load(SeqCst) {
            let n = Arc::weak_count(&a2);
            assert!(n < 2, "bad weak count: {}", n);
            #[cfg(miri)] // Miri's scheduler does not guarantee liveness, and thus needs this hint.
            std::hint::spin_loop();
        }
        t.join().unwrap();
    }

    #[test]
    fn test_from_str() {
        let r: Arc<str> = Arc::from("foo");

        assert_eq!(&r[..], "foo");
    }

    #[test]
    fn test_copy_from_slice() {
        let s: &[u32] = &[1, 2, 3];
        let r: Arc<[u32]> = Arc::from(s);

        assert_eq!(&r[..], [1, 2, 3]);
    }

    #[test]
    fn test_clone_from_slice() {
        #[derive(Clone, Debug, Eq, PartialEq)]
        struct X(u32);

        let s: &[X] = &[X(1), X(2), X(3)];
        let r: Arc<[X]> = Arc::from(s);

        assert_eq!(&r[..], s);
    }

    #[test]
    #[should_panic = "test_clone_from_slice_panic"]
    fn test_clone_from_slice_panic() {
        struct Fail(u32, String);

        impl Clone for Fail {
            fn clone(&self) -> Fail {
                if self.0 == 2 {
                    panic!("test_clone_from_slice_panic");
                }
                Fail(self.0, self.1.clone())
            }
        }

        let s: &[Fail] =
            &[Fail(0, "foo".to_owned()), Fail(1, "bar".to_owned()), Fail(2, "baz".to_owned())];

        // Should panic, but not cause memory corruption
        let _r: Arc<[Fail]> = Arc::from(s);
    }

    #[test]
    fn test_from_box() {
        let b: Box<u32> = Box::new(123);
        let r: Arc<u32> = Arc::from(b);

        assert_eq!(*r, 123);
    }

    #[test]
    fn test_from_box_str() {
        let s = String::from("foo").into_boxed_str();
        let r: Arc<str> = Arc::from(s);

        assert_eq!(&r[..], "foo");
    }

    #[test]
    fn test_from_box_slice() {
        let s = vec![1, 2, 3].into_boxed_slice();
        let r: Arc<[u32]> = Arc::from(s);

        assert_eq!(&r[..], [1, 2, 3]);
    }

    #[test]
    fn test_from_box_trait() {
        use std::fmt::Display;

        let b: Box<dyn Display> = Box::new(123);
        let r: Arc<dyn Display> = Arc::from(b);

        assert_eq!(r.to_string(), "123");
    }

    #[test]
    fn test_from_box_trait_zero_sized() {
        use std::fmt::Debug;

        let b: Box<dyn Debug> = Box::new(());
        let r: Arc<dyn Debug> = Arc::from(b);

        assert_eq!(format!("{:?}", r), "()");
    }

    #[test]
    fn test_from_vec() {
        let v = vec![1, 2, 3];
        let r: Arc<[u32]> = Arc::from(v);

        assert_eq!(&r[..], [1, 2, 3]);
    }

    #[test]
    fn test_downcast() {
        use std::any::Any;

        #[cfg(portable_atomic_unstable_coerce_unsized)]
        let r1: Arc<dyn Any + Send + Sync> = Arc::new(i32::MAX);
        // TODO: This is a workaround in case CoerceUnsized is not available - remove this once it is no longer needed
        #[cfg(not(portable_atomic_unstable_coerce_unsized))]
        let r1: Arc<dyn Any + Send + Sync> =
            Arc::from(Box::new(i32::MAX) as Box<dyn Any + Send + Sync>);

        #[cfg(portable_atomic_unstable_coerce_unsized)]
        let r2: Arc<dyn Any + Send + Sync> = Arc::new("abc");
        // TODO: This is a workaround in case CoerceUnsized is not available - remove this once it is no longer needed
        #[cfg(not(portable_atomic_unstable_coerce_unsized))]
        let r2: Arc<dyn Any + Send + Sync> =
            Arc::from(Box::new("abc") as Box<dyn Any + Send + Sync>);

        assert!(r1.clone().downcast::<u32>().is_err());

        let r1i32 = r1.downcast::<i32>();
        assert!(r1i32.is_ok());
        assert_eq!(r1i32.unwrap(), Arc::new(i32::MAX));

        assert!(r2.clone().downcast::<i32>().is_err());

        let r2str = r2.downcast::<&'static str>();
        assert!(r2str.is_ok());
        assert_eq!(r2str.unwrap(), Arc::new("abc"));
    }

    #[test]
    fn test_array_from_slice() {
        let v = vec![1, 2, 3];
        let r: Arc<[u32]> = Arc::from(v);

        let a: Result<Arc<[u32; 3]>, _> = r.clone().try_into();
        assert!(a.is_ok());

        let a: Result<Arc<[u32; 2]>, _> = r.clone().try_into();
        assert!(a.is_err());
    }

    #[test]
    fn test_arc_cyclic_with_zero_refs() {
        struct ZeroRefs {
            inner: Weak<ZeroRefs>,
        }
        let zero_refs = Arc::new_cyclic(|inner| {
            assert_eq!(inner.strong_count(), 0);
            assert!(inner.upgrade().is_none());
            ZeroRefs { inner: Weak::new() }
        });

        assert_eq!(Arc::strong_count(&zero_refs), 1);
        assert_eq!(Arc::weak_count(&zero_refs), 0);
        assert_eq!(zero_refs.inner.strong_count(), 0);
        assert_eq!(zero_refs.inner.weak_count(), 0);
    }

    #[test]
    fn test_arc_new_cyclic_one_ref() {
        struct OneRef {
            inner: Weak<OneRef>,
        }
        let one_ref = Arc::new_cyclic(|inner| {
            assert_eq!(inner.strong_count(), 0);
            assert!(inner.upgrade().is_none());
            OneRef { inner: inner.clone() }
        });

        assert_eq!(Arc::strong_count(&one_ref), 1);
        assert_eq!(Arc::weak_count(&one_ref), 1);

        let one_ref2 = Weak::upgrade(&one_ref.inner).unwrap();
        assert!(Arc::ptr_eq(&one_ref, &one_ref2));

        assert_eq!(Arc::strong_count(&one_ref), 2);
        assert_eq!(Arc::weak_count(&one_ref), 1);
    }

    #[test]
    fn test_arc_cyclic_two_refs() {
        struct TwoRefs {
            inner1: Weak<TwoRefs>,
            inner2: Weak<TwoRefs>,
        }
        let two_refs = Arc::new_cyclic(|inner| {
            assert_eq!(inner.strong_count(), 0);
            assert!(inner.upgrade().is_none());

            let inner1 = inner.clone();
            let inner2 = inner1.clone();

            TwoRefs { inner1, inner2 }
        });

        assert_eq!(Arc::strong_count(&two_refs), 1);
        assert_eq!(Arc::weak_count(&two_refs), 2);

        let two_refs1 = Weak::upgrade(&two_refs.inner1).unwrap();
        assert!(Arc::ptr_eq(&two_refs, &two_refs1));

        let two_refs2 = Weak::upgrade(&two_refs.inner2).unwrap();
        assert!(Arc::ptr_eq(&two_refs, &two_refs2));

        assert_eq!(Arc::strong_count(&two_refs), 3);
        assert_eq!(Arc::weak_count(&two_refs), 2);
    }

    /// Test for Arc::drop bug (https://github.com/rust-lang/rust/issues/55005)
    #[test]
    #[cfg(miri)] // relies on Stacked Borrows in Miri
    fn arc_drop_dereferenceable_race() {
        // The bug seems to take up to 700 iterations to reproduce with most seeds (tested 0-9).
        for _ in 0..750 {
            let arc_1 = Arc::new(());
            let arc_2 = arc_1.clone();
            let thread = thread::spawn(|| drop(arc_2));
            // Spin a bit; makes the race more likely to appear
            let mut i = 0;
            while i < 256 {
                i += 1;
            }
            drop(arc_1);
            thread.join().unwrap();
        }
    }
}

#![allow(dead_code, unused_imports)]

use crate::generic::*;
use core::sync::atomic::Ordering;

#[cfg(not(portable_atomic_no_const_fn_trait_bound))]
#[test]
fn const_new() {
    static U8X16: Atomic<[u8; 16]> = Atomic::const_new([0; 16]);
    let _v = Atomic::const_new(core::ptr::null::<()>());
    let _v = Atomic::const_new(core::ptr::null_mut::<()>());
    let _v = Atomic::const_new(&[0_u8]);
    U8X16.store([1; 16], Ordering::Relaxed);
    assert_eq!(U8X16.load(Ordering::Relaxed), [1; 16]);
}

#[test]
fn dw_ptr() {
    let x = &[0_u8, 1_u8][..];
    let a = Atomic::new(x);
    let y = a.swap(x, Ordering::Relaxed);
    assert_eq!(x, y);
}

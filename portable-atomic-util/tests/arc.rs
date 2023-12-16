// SPDX-License-Identifier: Apache-2.0 OR MIT

#![cfg(any(feature = "std", feature = "alloc"))]

use portable_atomic_util::Arc;

#[test]
fn over_aligned() {
    #[repr(align(128))]
    struct Aligned(u32);

    let value = Arc::new(Aligned(128));
    let ptr = Arc::into_raw(value);
    // SAFETY: `ptr` should always be a valid `Aligned`.
    assert_eq!(unsafe { (&*ptr).0 }, 128);
    // SAFETY: `ptr` is a valid reference to an `Arc<Aligned>`.
    let value = unsafe { Arc::from_raw(ptr) };
    assert_eq!(value.0, 128);
}

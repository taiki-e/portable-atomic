use portable_atomic::Atomicable;
#[repr(C)]
union A {
    f0: u8,
    f1: u8,
}
#[automatically_derived]
#[allow(unused_qualifications)]
impl ::core::clone::Clone for A {
    #[inline]
    fn clone(&self) -> A {
        {
            let _: ::core::clone::AssertParamIsCopy<Self>;
            *self
        }
    }
}
#[automatically_derived]
#[allow(unused_qualifications)]
impl ::core::marker::Copy for A {}
#[allow(
    non_upper_case_globals,
    clippy::match_single_binding,
    clippy::never_loop,
    clippy::single_match
)]
const _: () = {
    extern crate portable_atomic as _portable_atomic;
    impl _portable_atomic::Atomicable for A {
        type Value = <u8 as _portable_atomic::Atomicable>::Value;
        #[inline]
        fn to_val(self) -> Self::Value {
            _portable_atomic::__private::is_transmutable::<u8>();
            _portable_atomic::__private::is_transmutable::<u8>();
            let [] = [(); _portable_atomic::__private::size_of::<u8>()
                - _portable_atomic::__private::size_of::<u8>()];
            unsafe { _portable_atomic::__private::transmute(self) }
        }
        fn from_val(_: Self::Value) -> Self {
            {
                ::std::rt::begin_panic(
                    "there is no way to call Atomicable::from_val for `A` safely",
                )
            };
        }
        #[inline]
        unsafe fn from_val_unchecked(val: Self::Value) -> Self {
            _portable_atomic::__private::is_transmutable::<u8>();
            _portable_atomic::__private::is_transmutable::<u8>();
            let [] = [(); _portable_atomic::__private::size_of::<u8>()
                - _portable_atomic::__private::size_of::<u8>()];
            unsafe { _portable_atomic::__private::transmute(val) }
        }
    }
};
fn main() {}

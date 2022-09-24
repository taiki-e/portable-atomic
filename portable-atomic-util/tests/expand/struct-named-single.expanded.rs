use portable_atomic::Atomicable;
struct A {
    f0: u8,
}
#[automatically_derived]
#[allow(unused_qualifications)]
impl ::core::clone::Clone for A {
    #[inline]
    fn clone(&self) -> A {
        {
            let _: ::core::clone::AssertParamIsClone<u8>;
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
            <u8 as _portable_atomic::Atomicable>::to_val(self.f0)
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
            Self {
                f0: <u8 as _portable_atomic::Atomicable>::from_val_unchecked(val),
            }
        }
    }
};
fn main() {}

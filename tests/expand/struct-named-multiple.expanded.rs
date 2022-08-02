use portable_atomic::Atomicable;
#[atomic(u16)]
struct A {
    f0: u8,
    f1: u8,
}
#[automatically_derived]
#[allow(unused_qualifications)]
impl ::core::clone::Clone for A {
    #[inline]
    fn clone(&self) -> A {
        {
            let _: ::core::clone::AssertParamIsClone<u8>;
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
        type Value = u16;
        #[inline]
        fn to_val(self) -> Self::Value {
            let _ = [(); _portable_atomic::__private::size_of::<u16>()
                - (_portable_atomic::__private::size_of::<
                    <u8 as _portable_atomic::Atomicable>::Value,
                >() + _portable_atomic::__private::size_of::<
                    <u8 as _portable_atomic::Atomicable>::Value,
                >())];
            let mut __result: u16 = 0;
            let mut __result_ptr: *mut u8 = &mut __result as *mut u16 as *mut u8;
            let mut __offset: usize = 0;
            unsafe {
                __result_ptr
                    .cast::<<u8 as _portable_atomic::Atomicable>::Value>()
                    .write_unaligned(_portable_atomic::Atomicable::to_val(self.f0));
                __offset += _portable_atomic::__private::size_of::<
                    <u8 as _portable_atomic::Atomicable>::Value,
                >();
                __result_ptr
                    .add(__offset)
                    .cast::<<u8 as _portable_atomic::Atomicable>::Value>()
                    .write_unaligned(_portable_atomic::Atomicable::to_val(self.f1));
                __offset += _portable_atomic::__private::size_of::<
                    <u8 as _portable_atomic::Atomicable>::Value,
                >();
            }
            __result
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
            let _ = [(); _portable_atomic::__private::size_of::<u16>()
                - (_portable_atomic::__private::size_of::<
                    <u8 as _portable_atomic::Atomicable>::Value,
                >() + _portable_atomic::__private::size_of::<
                    <u8 as _portable_atomic::Atomicable>::Value,
                >())];
            let mut __val_ptr: *const u8 = &val as *const u16 as *const u8;
            let mut __offset = 0;
            let __field0 = __val_ptr
                .cast::<<u8 as _portable_atomic::Atomicable>::Value>()
                .read_unaligned();
            let __field0 = <u8 as _portable_atomic::Atomicable>::from_val_unchecked(__field0);
            __offset += _portable_atomic::__private::size_of::<
                <u8 as _portable_atomic::Atomicable>::Value,
            >();
            let __field1 = __val_ptr
                .add(__offset)
                .cast::<<u8 as _portable_atomic::Atomicable>::Value>()
                .read_unaligned();
            let __field1 = <u8 as _portable_atomic::Atomicable>::from_val_unchecked(__field1);
            __offset += _portable_atomic::__private::size_of::<
                <u8 as _portable_atomic::Atomicable>::Value,
            >();
            Self {
                f0: __field0,
                f1: __field1,
            }
        }
    }
};
fn main() {}

use super::{
    AllowRelaxed, AtomicArithmetic, AtomicArithmeticPriv, AtomicBitOps, AtomicBitOpsPriv,
    AtomicMinMax, AtomicMinMaxPriv, Atomicable, AtomicablePrimitive, AtomicablePrimitivePriv,
    Transmutable,
};
use core::{
    char, mem,
    ptr::{self, NonNull},
    slice,
    sync::atomic::Ordering,
};

// -----------------------------------------------------------------------------
// integer / float / boolean / character

macro_rules! primitive {
    ($(#[$attrs:meta])* $atomic_type:ident, $value_type:ident) => {
        $(#[$attrs])*
        impl AtomicablePrimitive for $value_type {}
        $(#[$attrs])*
        impl AtomicablePrimitivePriv for $value_type {
            type Atomic = portable_atomic::$atomic_type;
            const IS_ALWAYS_LOCK_FREE: bool = portable_atomic::$atomic_type::is_always_lock_free();
            #[inline]
            fn default() -> Self {
                <$value_type as Default>::default()
            }
            #[inline]
            fn new(v: Self) -> Self::Atomic {
                portable_atomic::$atomic_type::new(v)
            }
            #[inline]
            fn is_lock_free() -> bool {
                portable_atomic::$atomic_type::is_lock_free()
            }
            #[inline]
            fn get_mut(a: &mut Self::Atomic) -> &mut Self {
                a.get_mut()
            }
            #[inline]
            fn into_inner(a: Self::Atomic) -> Self {
                a.into_inner()
            }
            #[inline]
            fn load(a: &Self::Atomic, order: Ordering) -> Self {
                a.load(order)
            }
            #[inline]
            fn store(a: &Self::Atomic, val: Self, order: Ordering) {
                a.store(val, order);
            }
            #[inline]
            fn swap(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.swap(val, order)
            }
            #[inline]
            fn compare_exchange(
                a: &Self::Atomic,
                current: Self,
                new: Self,
                success: Ordering,
                failure: Ordering,
            ) -> Result<Self, Self> {
                a.compare_exchange(current, new, success, failure)
            }
            #[inline]
            fn compare_exchange_weak(
                a: &Self::Atomic,
                current: Self,
                new: Self,
                success: Ordering,
                failure: Ordering,
            ) -> Result<Self, Self> {
                a.compare_exchange_weak(current, new, success, failure)
            }
        }
        $(#[$attrs])*
        impl Atomicable for $value_type {
            type Value = $value_type;
            #[inline]
            fn to_val(self) -> Self::Value {
                self
            }
            #[inline]
            fn from_val(val: Self::Value) -> Self {
                val
            }
            #[inline]
            unsafe fn allow_relaxed() -> AllowRelaxed {
                unsafe { AllowRelaxed::new(true) }
            }
        }
        $(#[$attrs])*
        unsafe impl Transmutable for $value_type {}
    };
}
macro_rules! int {
    ($atomic_type:ident, $non_zero_type:ident, $value_type:ident) => {
        primitive!($atomic_type, $value_type);
        impl AtomicBitOpsPriv for $value_type {
            #[inline]
            fn fetch_and(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.fetch_and(val, order)
            }
            #[inline]
            fn fetch_nand(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.fetch_nand(val, order)
            }
            #[inline]
            fn fetch_or(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.fetch_or(val, order)
            }
            #[inline]
            fn fetch_xor(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.fetch_xor(val, order)
            }
        }
        unsafe impl AtomicBitOps for $value_type {}
        impl AtomicArithmeticPriv for $value_type {
            #[inline]
            fn fetch_add(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.fetch_add(val, order)
            }
            #[inline]
            fn fetch_sub(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.fetch_sub(val, order)
            }
        }
        unsafe impl AtomicArithmetic for $value_type {}
        impl AtomicMinMaxPriv for $value_type {
            #[inline]
            fn fetch_max(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.fetch_max(val, order)
            }
            #[inline]
            fn fetch_min(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.fetch_min(val, order)
            }
        }
        impl AtomicMinMax for $value_type {}
        impl Atomicable for core::num::$non_zero_type {
            type Value = $value_type;
            #[inline]
            fn to_val(self) -> Self::Value {
                self.get()
            }
            #[inline]
            fn from_val(val: Self::Value) -> Self {
                Self::new(val).unwrap()
            }
            #[inline]
            unsafe fn from_val_unchecked(val: Self::Value) -> Self {
                debug_assert_ne!(val, 0);
                // SAFETY: we don't provide method to make val zero.
                unsafe { Self::new_unchecked(val) }
            }
            #[inline]
            unsafe fn allow_relaxed() -> AllowRelaxed {
                unsafe { AllowRelaxed::new(true) }
            }
        }
        // SAFETY: https://github.com/rust-lang/rust/pull/94786
        unsafe impl Transmutable for core::num::$non_zero_type {}
        impl Atomicable for Option<core::num::$non_zero_type> {
            type Value = $value_type;
            #[inline]
            fn to_val(self) -> Self::Value {
                self.map(core::num::$non_zero_type::get).unwrap_or(0)
            }
            #[inline]
            fn from_val(val: Self::Value) -> Self {
                core::num::$non_zero_type::new(val)
            }
            #[inline]
            unsafe fn allow_relaxed() -> AllowRelaxed {
                unsafe { AllowRelaxed::new(true) }
            }
        }
        // SAFETY: https://doc.rust-lang.org/nightly/core/option/index.html#representation
        // SAFETY: https://github.com/rust-lang/rust/pull/51396#issuecomment-395066132
        unsafe impl Transmutable for Option<core::num::$non_zero_type> {}
    };
}
macro_rules! fixed_int {
    ($atomic_type:ident, $non_zero_type:ident, $value_type:ident, $max_array_len:tt) => {
        int!($atomic_type, $non_zero_type, $value_type);
        array_transmutable!([$value_type; $max_array_len]);
        // SAFETY: https://github.com/rust-lang/rust/pull/94786
        array_transmutable!([core::num::$non_zero_type; $max_array_len]);
        // SAFETY: https://doc.rust-lang.org/nightly/core/option/index.html#representation
        // SAFETY: https://github.com/rust-lang/rust/pull/51396#issuecomment-395066132
        array_transmutable!([Option<core::num::$non_zero_type>; $max_array_len]);
    };
}
macro_rules! float {
    ($atomic_type:ident, $float_type:ident, $int_type:ident) => {
        #[cfg(feature = "float")]
        primitive!($atomic_type, $float_type);
        #[cfg(not(feature = "float"))]
        impl Atomicable for $float_type {
            type Value = $int_type;
            #[inline]
            fn to_val(self) -> Self::Value {
                self.to_bits()
            }
            #[inline]
            fn from_val(val: Self::Value) -> Self {
                $float_type::from_bits(val)
            }
            #[inline]
            unsafe fn allow_relaxed() -> AllowRelaxed {
                unsafe { AllowRelaxed::new(true) }
            }
        }
        #[cfg(not(feature = "float"))]
        unsafe impl Transmutable for $float_type {}
        #[cfg(feature = "float")]
        impl AtomicArithmeticPriv for $float_type {
            #[inline]
            fn fetch_add(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.fetch_add(val, order)
            }
            #[inline]
            fn fetch_sub(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.fetch_sub(val, order)
            }
        }
        #[cfg(feature = "float")]
        #[cfg_attr(docsrs, doc(cfg(feature = "float")))]
        unsafe impl AtomicArithmetic for $float_type {}
        #[cfg(feature = "float")]
        impl AtomicMinMaxPriv for $float_type {
            #[inline]
            fn fetch_max(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.fetch_max(val, order)
            }
            #[inline]
            fn fetch_min(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
                a.fetch_min(val, order)
            }
        }
        #[cfg(feature = "float")]
        #[cfg_attr(docsrs, doc(cfg(feature = "float")))]
        impl AtomicMinMax for $float_type {}
    };
}
macro_rules! array_transmutable {
    ([$value_type:ty; 16]) => {
        array_transmutable!([$value_type; 2], u16);
        array_transmutable!([$value_type; 4], u32);
        array_transmutable!([$value_type; 8], u64);
        array_transmutable!([$value_type; 16], u128);
    };
    ([$value_type:ty; 8]) => {
        array_transmutable!([$value_type; 2], u32);
        array_transmutable!([$value_type; 4], u64);
        array_transmutable!([$value_type; 8], u128);
    };
    ([$value_type:ty; 4]) => {
        array_transmutable!([$value_type; 2], u64);
        array_transmutable!([$value_type; 4], u128);
    };
    ([$value_type:ty; 2]) => {
        array_transmutable!([$value_type; 2], u128);
    };
    ([$value_type:ty; $n:expr], $repr_type:ty) => {
        impl Atomicable for [$value_type; $n] {
            type Value = $repr_type;
            #[inline]
            fn to_val(self) -> Self::Value {
                unsafe { mem::transmute(self) }
            }
            #[inline]
            fn from_val(val: Self::Value) -> Self {
                #[allow(clippy::transmute_num_to_bytes)]
                unsafe {
                    mem::transmute(val)
                }
            }
            #[inline]
            unsafe fn allow_relaxed() -> AllowRelaxed {
                unsafe { AllowRelaxed::new(true) }
            }
        }
        unsafe impl Transmutable for [$value_type; $n] {}
    };
}

primitive!(AtomicBool, bool);
array_transmutable!([bool; 16]);
impl AtomicBitOpsPriv for bool {
    #[inline]
    fn fetch_and(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
        a.fetch_and(val, order)
    }
    #[inline]
    fn fetch_nand(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
        a.fetch_nand(val, order)
    }
    #[inline]
    fn fetch_or(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
        a.fetch_or(val, order)
    }
    #[inline]
    fn fetch_xor(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
        a.fetch_xor(val, order)
    }
}
unsafe impl AtomicBitOps for bool {}

fixed_int!(AtomicI8, NonZeroI8, i8, 16);
fixed_int!(AtomicU8, NonZeroU8, u8, 16);
fixed_int!(AtomicI16, NonZeroI16, i16, 8);
fixed_int!(AtomicU16, NonZeroU16, u16, 8);
fixed_int!(AtomicI32, NonZeroI32, i32, 4);
fixed_int!(AtomicU32, NonZeroU32, u32, 4);
fixed_int!(AtomicI64, NonZeroI64, i64, 2);
fixed_int!(AtomicU64, NonZeroU64, u64, 2);
int!(AtomicI128, NonZeroI128, i128);
int!(AtomicU128, NonZeroU128, u128);

int!(AtomicIsize, NonZeroIsize, isize);
array_transmutable!([isize; 2], DW);
array_transmutable!([core::num::NonZeroIsize; 2], DW);
array_transmutable!([Option<core::num::NonZeroIsize>; 2], DW);
int!(AtomicUsize, NonZeroUsize, usize);
array_transmutable!([usize; 2], DW);
array_transmutable!([core::num::NonZeroUsize; 2], DW);
array_transmutable!([Option<core::num::NonZeroUsize>; 2], DW);

float!(AtomicF32, f32, u32);
array_transmutable!([f32; 4]);
float!(AtomicF64, f64, u64);
array_transmutable!([f64; 2]);

impl Atomicable for char {
    type Value = u32;
    #[inline]
    fn to_val(self) -> Self::Value {
        self as u32
    }
    #[inline]
    fn from_val(val: Self::Value) -> Self {
        char::from_u32(val).unwrap()
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        // SAFETY: we don't provide method to make val invalid.
        unsafe { char::from_u32_unchecked(val) }
    }
    #[inline]
    unsafe fn allow_relaxed() -> AllowRelaxed {
        unsafe { AllowRelaxed::new(true) }
    }
}
unsafe impl Transmutable for char {}

// TODO: Wrapping
// TODO: ManuallyDrop

// -----------------------------------------------------------------------------
// pointer

impl<T> AtomicablePrimitive for *mut T {}
impl<T> AtomicablePrimitivePriv for *mut T {
    type Atomic = portable_atomic::AtomicPtr<T>;
    const IS_ALWAYS_LOCK_FREE: bool = portable_atomic::AtomicPtr::<T>::is_always_lock_free();
    #[inline]
    fn default() -> Self {
        ptr::null_mut()
    }
    #[inline]
    fn new(v: Self) -> Self::Atomic {
        portable_atomic::AtomicPtr::<T>::new(v)
    }
    #[inline]
    fn is_lock_free() -> bool {
        portable_atomic::AtomicPtr::<T>::is_lock_free()
    }
    #[inline]
    fn get_mut(a: &mut Self::Atomic) -> &mut Self {
        a.get_mut()
    }
    #[inline]
    fn into_inner(a: Self::Atomic) -> Self {
        a.into_inner()
    }
    #[inline]
    fn load(a: &Self::Atomic, order: Ordering) -> Self {
        a.load(order)
    }
    #[inline]
    fn store(a: &Self::Atomic, val: Self, order: Ordering) {
        a.store(val, order);
    }
    #[inline]
    fn swap(a: &Self::Atomic, val: Self, order: Ordering) -> Self {
        a.swap(val, order)
    }
    #[inline]
    fn compare_exchange(
        a: &Self::Atomic,
        current: Self,
        new: Self,
        success: Ordering,
        failure: Ordering,
    ) -> Result<Self, Self> {
        a.compare_exchange(current, new, success, failure)
    }
    #[inline]
    fn compare_exchange_weak(
        a: &Self::Atomic,
        current: Self,
        new: Self,
        success: Ordering,
        failure: Ordering,
    ) -> Result<Self, Self> {
        a.compare_exchange_weak(current, new, success, failure)
    }
}

impl<T> Atomicable for *mut T {
    type Value = *mut T;
    #[inline]
    fn to_val(self) -> Self::Value {
        self
    }
    #[inline]
    fn from_val(val: Self::Value) -> Self {
        val
    }
    #[inline]
    unsafe fn allow_relaxed() -> AllowRelaxed {
        unsafe { AllowRelaxed::new(true) }
    }
}
unsafe impl<T> Transmutable for *mut T {}
impl<T> Atomicable for *const T {
    type Value = *mut T;
    #[inline]
    fn to_val(self) -> Self::Value {
        self as *mut T
    }
    #[inline]
    fn from_val(val: Self::Value) -> Self {
        val as *const T
    }
    #[inline]
    unsafe fn allow_relaxed() -> AllowRelaxed {
        unsafe { AllowRelaxed::new(true) }
    }
}
unsafe impl<T> Transmutable for *const T {}

impl<T> Atomicable for NonNull<T> {
    type Value = *mut T;
    #[inline]
    fn to_val(self) -> Self::Value {
        self.as_ptr()
    }
    #[inline]
    fn from_val(val: Self::Value) -> Self {
        Self::new(val).unwrap()
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        debug_assert!(!val.is_null());
        // SAFETY: we don't provide method to make val zero.
        unsafe { Self::new_unchecked(val) }
    }
    #[inline]
    unsafe fn allow_relaxed() -> AllowRelaxed {
        unsafe { AllowRelaxed::new(true) }
    }
}
unsafe impl<T> Transmutable for NonNull<T> {}
impl<T> Atomicable for Option<NonNull<T>> {
    type Value = *mut T;
    #[inline]
    fn to_val(self) -> Self::Value {
        match self {
            Some(v) => v.to_val(),
            None => ptr::null_mut(),
        }
    }
    #[inline]
    fn from_val(val: Self::Value) -> Self {
        NonNull::new(val)
    }
    #[inline]
    unsafe fn allow_relaxed() -> AllowRelaxed {
        unsafe { AllowRelaxed::new(true) }
    }
}
// SAFETY: https://doc.rust-lang.org/nightly/core/option/index.html#representation
unsafe impl<T> Transmutable for Option<NonNull<T>> {}

// Note: Since the reference must be valid, Relaxed ordering is not allowed.
impl<T> Atomicable for &T {
    type Value = *mut T;
    #[inline]
    fn to_val(self) -> Self::Value {
        self as *const T as *mut T
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <&T as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        debug_assert!(!val.is_null());
        // SAFETY: we don't provide method to make val invalid.
        unsafe { &*val }
    }
}
unsafe impl<T> Transmutable for &T {}
// Note: Since the reference must be valid, Relaxed ordering is not allowed.
impl<T> Atomicable for Option<&T> {
    type Value = *mut T;
    #[inline]
    fn to_val(self) -> Self::Value {
        match self {
            Some(v) => v.to_val(),
            None => ptr::null_mut(),
        }
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <Option<&T> as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        if val.is_null() {
            None
        } else {
            // SAFETY: we don't provide method to make val invalid.
            Some(unsafe { <&T>::from_val_unchecked(val) })
        }
    }
}
// SAFETY: https://doc.rust-lang.org/nightly/core/option/index.html#representation
unsafe impl<T> Transmutable for Option<&T> {}

// -----------------------------------------------------------------------------
// fat pointer

#[cfg(target_pointer_width = "16")]
type DW = u32;
#[cfg(target_pointer_width = "32")]
type DW = u64;
#[cfg(target_pointer_width = "64")]
type DW = u128;

#[derive(Clone, Copy)]
#[repr(C)]
struct SliceRepr {
    // *const ()
    ptr: usize,
    len: usize,
}

impl SliceRepr {
    fn to_val(self) -> DW {
        unsafe { mem::transmute(self) }
    }
    fn from_val(val: DW) -> Self {
        unsafe { mem::transmute(val) }
    }
}

// TODO: once https://github.com/rust-lang/rust/issues/71146 stable, we can provide:
// impl<T> Atomicable for *mut [T]
// impl<T> Atomicable for *const [T]
// impl<T> Atomicable for NonNull<[T]>
// impl<T> Atomicable for Option<NonNull<[T]>>

// Note: Since the reference must be valid, Relaxed ordering is not allowed.
impl<T> Atomicable for &[T] {
    type Value = DW;
    #[inline]
    fn to_val(self) -> Self::Value {
        SliceRepr { ptr: self.as_ptr() as *const () as usize, len: self.len() }.to_val()
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <&[T] as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        debug_assert_ne!(val, 0);
        let repr = SliceRepr::from_val(val);
        // SAFETY: we don't provide method to make val invalid.
        unsafe { slice::from_raw_parts(repr.ptr as *const T, repr.len) }
    }
}
// Note: Since the reference must be valid, Relaxed ordering is not allowed.
impl<T> Atomicable for Option<&[T]> {
    type Value = DW;
    #[inline]
    fn to_val(self) -> Self::Value {
        match self {
            Some(v) => v.to_val(),
            None => 0,
        }
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <Option<&[T]> as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        if val == 0 {
            None
        } else {
            // SAFETY: we don't provide method to make val invalid.
            Some(unsafe { <&[T]>::from_val_unchecked(val) })
        }
    }
}

// TODO: once https://github.com/rust-lang/rust/issues/71146 stable, we can provide:
// impl Atomicable for *mut str
// impl Atomicable for *const str
// impl Atomicable for NonNull<str>
// impl Atomicable for Option<NonNull<str>>

// Note: Since the reference must be valid, Relaxed ordering is not allowed.
impl Atomicable for &str {
    type Value = DW;
    #[inline]
    fn to_val(self) -> Self::Value {
        self.as_bytes().to_val()
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <&str as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        // SAFETY: we don't provide method to make val invalid.
        unsafe { core::str::from_utf8_unchecked(<&[u8]>::from_val_unchecked(val)) }
    }
}
// Note: Since the reference must be valid, Relaxed ordering is not allowed.
impl Atomicable for Option<&str> {
    type Value = DW;
    #[inline]
    fn to_val(self) -> Self::Value {
        match self {
            Some(v) => v.to_val(),
            None => 0,
        }
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <Option<&str> as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        if val == 0 {
            None
        } else {
            // SAFETY: we don't provide method to make val invalid.
            Some(unsafe { <&str>::from_val_unchecked(val) })
        }
    }
}

// -----------------------------------------------------------------------------
// {core,std}::time

// Duration is not repr(C) and contains padding bytes, so it cannot be directly
// converted to an integer. However, it can be converted to/from a pair of
// integers without loss, so it can be represented as u128.
#[derive(Clone, Copy)]
#[repr(C)]
struct DurationRepr {
    secs: u64,
    nanos: u32,
    // Note: Without this, the last 4 bytes will be uninitialized.
    padding: u32,
}

impl DurationRepr {
    const NULL: Self = Self { secs: 0, nanos: 0, padding: !0 };
    #[inline]
    fn to_int(self) -> u128 {
        unsafe { mem::transmute(self) }
    }
    #[inline]
    fn from_int(val: u128) -> Self {
        unsafe { mem::transmute(val) }
    }
}

impl Atomicable for core::time::Duration {
    type Value = u128;
    #[inline]
    fn to_val(self) -> Self::Value {
        DurationRepr { secs: self.as_secs(), nanos: self.subsec_nanos(), padding: 0 }.to_int()
    }
    #[inline]
    fn from_val(val: Self::Value) -> Self {
        let repr = DurationRepr::from_int(val);
        core::time::Duration::new(repr.secs, repr.nanos)
    }
    #[inline]
    unsafe fn allow_relaxed() -> AllowRelaxed {
        unsafe { AllowRelaxed::new(true) }
    }
}
// We can use padding bytes to represent `None`.
impl Atomicable for Option<core::time::Duration> {
    type Value = u128;
    #[inline]
    fn to_val(self) -> Self::Value {
        match self {
            Some(val) => val.to_val(),
            None => DurationRepr::NULL.to_int(),
        }
    }
    #[inline]
    fn from_val(val: Self::Value) -> Self {
        let repr = DurationRepr::from_int(val);
        if repr.padding == 0 {
            let secs = core::time::Duration::from_secs(repr.secs);
            let nanos = core::time::Duration::from_nanos(repr.nanos.into());
            secs.checked_add(nanos)
        } else {
            None
        }
    }
    #[inline]
    unsafe fn allow_relaxed() -> AllowRelaxed {
        unsafe { AllowRelaxed::new(true) }
    }
}

// The internal representation of `SystemTime` is platform-dependent, so it
// cannot be directly converted to an integer. However we can convert it to
// duration since unix epoch, and recover it on conversion to `SystemTime`.
// This is inspired by the way `serde` implements `Serialize`/`Deserialize` for `SystemTime`.
#[cfg(feature = "std")]
#[cfg_attr(docsrs, doc(cfg(feature = "std")))]
impl Atomicable for std::time::SystemTime {
    type Value = u128;
    #[inline]
    fn to_val(self) -> Self::Value {
        self.duration_since(std::time::SystemTime::UNIX_EPOCH)
            .expect("SystemTime must be later than UNIX_EPOCH")
            .to_val()
    }
    #[inline]
    fn from_val(val: Self::Value) -> Self {
        let duration_since_epoch = core::time::Duration::from_val(val);
        std::time::SystemTime::UNIX_EPOCH.checked_add(duration_since_epoch).unwrap()
    }
    #[inline]
    unsafe fn allow_relaxed() -> AllowRelaxed {
        unsafe { AllowRelaxed::new(true) }
    }
}
#[cfg(feature = "std")]
#[cfg_attr(docsrs, doc(cfg(feature = "std")))]
impl Atomicable for Option<std::time::SystemTime> {
    type Value = u128;
    #[inline]
    fn to_val(self) -> Self::Value {
        match self {
            Some(val) => val
                .duration_since(std::time::SystemTime::UNIX_EPOCH)
                .expect("SystemTime must be later than UNIX_EPOCH")
                .to_val(),
            None => DurationRepr::NULL.to_int(),
        }
    }
    #[inline]
    fn from_val(val: Self::Value) -> Self {
        match Option::<core::time::Duration>::from_val(val) {
            Some(duration_since_epoch) => {
                std::time::SystemTime::UNIX_EPOCH.checked_add(duration_since_epoch)
            }
            None => None,
        }
    }
    #[inline]
    unsafe fn allow_relaxed() -> AllowRelaxed {
        unsafe { AllowRelaxed::new(true) }
    }
}

// -----------------------------------------------------------------------------
// std::net

// Ipv4Addr and Ipv6Addr are not repr(C), so they cannot be directly transmuted
// to an integer. However, it can be converted to/from integers without loss.

#[cfg(feature = "std")]
#[cfg_attr(docsrs, doc(cfg(feature = "std")))]
impl Atomicable for std::net::Ipv4Addr {
    type Value = u32;
    #[inline]
    fn to_val(self) -> Self::Value {
        u32::from_ne_bytes(self.octets())
    }
    #[inline]
    fn from_val(val: Self::Value) -> Self {
        Self::from(val)
    }
    #[inline]
    unsafe fn allow_relaxed() -> AllowRelaxed {
        unsafe { AllowRelaxed::new(true) }
    }
}

#[cfg(feature = "std")]
#[cfg_attr(docsrs, doc(cfg(feature = "std")))]
impl Atomicable for std::net::Ipv6Addr {
    type Value = u128;
    #[inline]
    fn to_val(self) -> Self::Value {
        u128::from_ne_bytes(self.octets())
    }
    #[inline]
    fn from_val(val: Self::Value) -> Self {
        Self::from(val)
    }
    #[inline]
    unsafe fn allow_relaxed() -> AllowRelaxed {
        unsafe { AllowRelaxed::new(true) }
    }
}

// -----------------------------------------------------------------------------
// !Copy types

// Note: Since the Box must point to a valid value, Relaxed ordering is not allowed.
#[cfg(any(all(feature = "alloc", not(portable_atomic_no_alloc)), feature = "std"))]
#[cfg_attr(docsrs, doc(cfg(any(feature = "alloc", feature = "std"))))]
impl<T> Atomicable for alloc::boxed::Box<T> {
    type Value = *mut T;
    #[inline]
    fn to_val(self) -> Self::Value {
        alloc::boxed::Box::into_raw(self)
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <Box<T> as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        // SAFETY: we don't provide method to make val invalid.
        unsafe { alloc::boxed::Box::from_raw(val) }
    }
}
// Note: Since the Box must point to a valid value, Relaxed ordering is not allowed.
#[cfg(any(all(feature = "alloc", not(portable_atomic_no_alloc)), feature = "std"))]
#[cfg_attr(docsrs, doc(cfg(any(feature = "alloc", feature = "std"))))]
impl<T> Atomicable for Option<alloc::boxed::Box<T>> {
    type Value = *mut T;
    #[inline]
    fn to_val(self) -> Self::Value {
        match self {
            Some(val) => val.to_val(),
            None => ptr::null_mut(),
        }
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <Option<Box<T>> as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        if val.is_null() {
            None
        } else {
            // SAFETY: we don't provide method to make val invalid.
            Some(unsafe { alloc::boxed::Box::from_raw(val) })
        }
    }
}

// Note: Since the Box must point to a valid value, Relaxed ordering is not allowed.
#[cfg(any(all(feature = "alloc", not(portable_atomic_no_alloc)), feature = "std"))]
#[cfg_attr(docsrs, doc(cfg(any(feature = "alloc", feature = "std"))))]
impl<T> Atomicable for alloc::boxed::Box<[T]> {
    type Value = DW;
    #[inline]
    fn to_val(self) -> Self::Value {
        let len = self.len();
        SliceRepr { ptr: alloc::boxed::Box::into_raw(self) as *const () as usize, len }.to_val()
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <Box<[T]> as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        debug_assert_ne!(val, 0);
        let repr = SliceRepr::from_val(val);
        // SAFETY: we don't provide method to make val invalid.
        unsafe {
            let ptr = slice::from_raw_parts_mut(repr.ptr as *mut T, repr.len) as *mut [T];
            alloc::boxed::Box::from_raw(ptr)
        }
    }
}
// Note: Since the Box must point to a valid value, Relaxed ordering is not allowed.
#[cfg(any(all(feature = "alloc", not(portable_atomic_no_alloc)), feature = "std"))]
#[cfg_attr(docsrs, doc(cfg(any(feature = "alloc", feature = "std"))))]
impl<T> Atomicable for Option<alloc::boxed::Box<[T]>> {
    type Value = DW;
    #[inline]
    fn to_val(self) -> Self::Value {
        match self {
            Some(val) => val.to_val(),
            None => 0,
        }
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <Option<Box<[T]>> as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        if val == 0 {
            None
        } else {
            // SAFETY: we don't provide method to make val invalid.
            Some(unsafe { <alloc::boxed::Box<[T]>>::from_val_unchecked(val) })
        }
    }
}

// Note: Since the Arc must point to a valid value, Relaxed ordering is not allowed.
#[cfg(any(all(feature = "alloc", not(portable_atomic_no_alloc)), feature = "std"))]
#[cfg_attr(docsrs, doc(cfg(any(feature = "alloc", feature = "std"))))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
impl<T> Atomicable for alloc::sync::Arc<T> {
    type Value = *mut T;
    #[inline]
    fn to_val(self) -> Self::Value {
        alloc::sync::Arc::into_raw(self) as *mut T
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <Arc<T> as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        // SAFETY: we don't provide method to make val invalid.
        unsafe { alloc::sync::Arc::from_raw(val) }
    }
}
// Note: Since the Arc must point to a valid value, Relaxed ordering is not allowed.
#[cfg(any(all(feature = "alloc", not(portable_atomic_no_alloc)), feature = "std"))]
#[cfg_attr(docsrs, doc(cfg(any(feature = "alloc", feature = "std"))))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
impl<T> Atomicable for Option<alloc::sync::Arc<T>> {
    type Value = *mut T;
    #[inline]
    fn to_val(self) -> Self::Value {
        match self {
            Some(val) => val.to_val(),
            None => ptr::null_mut(),
        }
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <Option<Arc<T>> as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        if val.is_null() {
            None
        } else {
            // SAFETY: we don't provide method to make val invalid.
            Some(unsafe { alloc::sync::Arc::from_raw(val) })
        }
    }
}

// Note: Since the Arc must point to a valid value, Relaxed ordering is not allowed.
#[cfg(any(all(feature = "alloc", not(portable_atomic_no_alloc)), feature = "std"))]
#[cfg_attr(docsrs, doc(cfg(any(feature = "alloc", feature = "std"))))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
impl<T> Atomicable for alloc::sync::Arc<[T]> {
    type Value = DW;
    #[inline]
    fn to_val(self) -> Self::Value {
        let len = self.len();
        SliceRepr { ptr: alloc::sync::Arc::into_raw(self) as *const () as usize, len }.to_val()
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <Arc<[T]> as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        debug_assert_ne!(val, 0);
        let repr = SliceRepr::from_val(val);
        // SAFETY: we don't provide method to make val invalid.
        unsafe {
            let ptr = slice::from_raw_parts_mut(repr.ptr as *mut T, repr.len) as *mut [T];
            alloc::sync::Arc::from_raw(ptr)
        }
    }
}
// Note: Since the Arc must point to a valid value, Relaxed ordering is not allowed.
#[cfg(any(all(feature = "alloc", not(portable_atomic_no_alloc)), feature = "std"))]
#[cfg_attr(docsrs, doc(cfg(any(feature = "alloc", feature = "std"))))]
#[cfg_attr(portable_atomic_no_cfg_target_has_atomic, cfg(not(portable_atomic_no_atomic_cas)))]
#[cfg_attr(not(portable_atomic_no_cfg_target_has_atomic), cfg(target_has_atomic = "ptr"))]
impl<T> Atomicable for Option<alloc::sync::Arc<[T]>> {
    type Value = DW;
    #[inline]
    fn to_val(self) -> Self::Value {
        match self {
            Some(val) => val.to_val(),
            None => 0,
        }
    }
    #[inline]
    fn from_val(_val: Self::Value) -> Self {
        panic!("there is no way to call <Option<Arc<[T]>> as Atomicable>::from_val safely")
    }
    #[inline]
    unsafe fn from_val_unchecked(val: Self::Value) -> Self {
        if val == 0 {
            None
        } else {
            // SAFETY: we don't provide method to make val invalid.
            Some(unsafe { <alloc::sync::Arc<[T]>>::from_val_unchecked(val) })
        }
    }
}

// -----------------------------------------------------------------------------
// function pointer

macro_rules! fn_ptr_impls_safety_abi {
    ($FnTy:ty, $($Arg:ident),*) => {
        impl<Ret, $($Arg),*> Atomicable for $FnTy {
            type Value = *mut ();
            #[inline]
            fn to_val(self) -> Self::Value {
                self as *mut ()
            }
            #[inline]
            fn from_val(_val: Self::Value) -> Self {
                panic!("there is no way to call <fn() as Atomicable>::from_val safely")
            }
            #[inline]
            unsafe fn from_val_unchecked(val: Self::Value) -> Self {
                debug_assert!(!val.is_null());
                // SAFETY: we don't provide method to make val invalid.
                unsafe { mem::transmute(val) }
            }
            #[inline]
            unsafe fn allow_relaxed() -> AllowRelaxed {
                unsafe { AllowRelaxed::new(true) }
            }
        }
        unsafe impl<Ret, $($Arg),*> Transmutable for $FnTy {}
        impl<Ret, $($Arg),*> Atomicable for Option<$FnTy> {
            type Value = *mut ();
            #[inline]
            fn to_val(self) -> Self::Value {
                match self {
                    Some(v) => v.to_val(),
                    None => ptr::null_mut(),
                }
            }
            #[inline]
            fn from_val(_val: Self::Value) -> Self {
                panic!("there is no way to call <Option<&T> as Atomicable>::from_val safely")
            }
            #[inline]
            unsafe fn from_val_unchecked(val: Self::Value) -> Self {
                if val.is_null() {
                    None
                } else {
                    // SAFETY: we don't provide method to make val invalid.
                    Some(unsafe { <_>::from_val_unchecked(val) })
                }
            }
            #[inline]
            unsafe fn allow_relaxed() -> AllowRelaxed {
                unsafe { AllowRelaxed::new(true) }
            }
        }
        // SAFETY: https://doc.rust-lang.org/nightly/core/option/index.html#representation
        unsafe impl<Ret, $($Arg),*> Transmutable for Option<$FnTy> {}
    }
}

macro_rules! fn_ptr_impls_args {
    ($($Arg:ident),+) => {
        fn_ptr_impls_safety_abi! { extern "Rust" fn($($Arg),+) -> Ret, $($Arg),+ }
        fn_ptr_impls_safety_abi! { extern "C" fn($($Arg),+) -> Ret, $($Arg),+ }
        fn_ptr_impls_safety_abi! { extern "C" fn($($Arg),+ , ...) -> Ret, $($Arg),+ }
        fn_ptr_impls_safety_abi! { unsafe extern "Rust" fn($($Arg),+) -> Ret, $($Arg),+ }
        fn_ptr_impls_safety_abi! { unsafe extern "C" fn($($Arg),+) -> Ret, $($Arg),+ }
        fn_ptr_impls_safety_abi! { unsafe extern "C" fn($($Arg),+ , ...) -> Ret, $($Arg),+ }
    };
    () => {
        // No variadic functions with 0 parameters
        fn_ptr_impls_safety_abi! { extern "Rust" fn() -> Ret, }
        fn_ptr_impls_safety_abi! { extern "C" fn() -> Ret, }
        fn_ptr_impls_safety_abi! { unsafe extern "Rust" fn() -> Ret, }
        fn_ptr_impls_safety_abi! { unsafe extern "C" fn() -> Ret, }
    };
}

fn_ptr_impls_args! {}
fn_ptr_impls_args! { A }
fn_ptr_impls_args! { A, B }
fn_ptr_impls_args! { A, B, C }
fn_ptr_impls_args! { A, B, C, D }
fn_ptr_impls_args! { A, B, C, D, E }
fn_ptr_impls_args! { A, B, C, D, E, F }
fn_ptr_impls_args! { A, B, C, D, E, F, G }
fn_ptr_impls_args! { A, B, C, D, E, F, G, H }
fn_ptr_impls_args! { A, B, C, D, E, F, G, H, I }
fn_ptr_impls_args! { A, B, C, D, E, F, G, H, I, J }
fn_ptr_impls_args! { A, B, C, D, E, F, G, H, I, J, K }
fn_ptr_impls_args! { A, B, C, D, E, F, G, H, I, J, K, L }

#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]
#![allow(dead_code, unused_extern_crates)]
#![allow(clippy::only_used_in_recursion)]
#![feature(asm_experimental_arch, core_intrinsics, stdsimd)]

use std::{
    hint::black_box,
    sync::{atomic::Ordering, Barrier},
    thread,
};

use criterion::{criterion_group, criterion_main, Criterion};

#[macro_use]
#[allow(dead_code, unused_macros)]
#[path = "../../src/utils.rs"]
mod utils;
#[allow(dead_code, unused_macros)]
#[macro_use]
#[path = "../../src/tests"]
mod tests {
    #[macro_use]
    pub(crate) mod helper;
}

#[cfg(target_arch = "aarch64")]
#[allow(dead_code, unused_imports)]
#[path = "../../src/imp/atomic128/aarch64.rs"]
mod arch;
#[cfg(target_arch = "powerpc64")]
#[allow(dead_code, unused_imports)]
#[path = "../../src/imp/atomic128/powerpc64.rs"]
mod arch;
#[cfg(target_arch = "x86_64")]
#[allow(dead_code, unused_imports)]
#[path = "../../src/imp/atomic128/x86_64.rs"]
mod arch;
#[cfg(target_arch = "s390x")]
#[allow(dead_code, unused_imports)]
#[path = "../../src/imp/atomic128/s390x.rs"]
mod arch;
#[cfg(all(target_arch = "arm", any(target_os = "linux", target_os = "android")))]
#[allow(dead_code, unused_imports)]
#[path = "../../src/imp/arm_linux.rs"]
mod arch;
#[cfg(any(target_arch = "x86_64", all(target_arch = "aarch64", target_endian = "little")))]
#[allow(dead_code, unused_imports)]
#[path = "../../src/imp/atomic128/intrinsics.rs"]
mod intrinsics;
#[allow(dead_code, unused_imports)]
#[path = "../../src/imp/fallback/mod.rs"]
mod seqlock_fallback;
#[allow(unused_imports)]
use seqlock_fallback as fallback;
#[allow(dead_code, unused_imports)]
#[path = "imp/spinlock_fallback.rs"]
mod spinlock_fallback;

const THREADS: usize = 4;
const N: u32 = 10000;

trait AtomicInt<T: Copy>: Sized + Send + Sync {
    fn new(v: T) -> Self;
    fn load(&self) -> T;
    fn store(&self, val: T);
    fn swap(&self, val: T) -> T;
    fn compare_exchange(&self, old: T, new: T) -> T;
    fn compare_exchange_weak_(&self, old: T, new: T, s: Ordering, f: Ordering) -> Result<T, T>;
    fn fetch_add(&self, val: T) -> T;
    #[inline]
    fn fetch_update<F>(&self, s_o: Ordering, f_o: Ordering, mut f: F) -> Result<T, T>
    where
        F: FnMut(T) -> Option<T>,
    {
        let mut prev = self.load();
        while let Some(next) = f(prev) {
            match self.compare_exchange_weak_(prev, next, s_o, f_o) {
                x @ Ok(_) => return x,
                Err(next_prev) => prev = next_prev,
            }
        }
        Err(prev)
    }
}
macro_rules! impl_atomic {
    ($atomic_type:path, $int_type:ident) => {
        impl AtomicInt<$int_type> for $atomic_type {
            #[inline]
            fn new(v: $int_type) -> Self {
                Self::new(v)
            }
            #[inline]
            fn load(&self) -> $int_type {
                self.load(Ordering::Acquire)
            }
            #[inline]
            fn store(&self, val: $int_type) {
                self.store(val, Ordering::Release);
            }
            #[inline]
            fn swap(&self, val: $int_type) -> $int_type {
                self.swap(val, Ordering::AcqRel)
            }
            #[inline]
            fn compare_exchange(&self, old: $int_type, new: $int_type) -> $int_type {
                self.compare_exchange(old, new, Ordering::AcqRel, Ordering::Acquire)
                    .unwrap_or_else(|x| x)
            }
            #[inline]
            fn compare_exchange_weak_(
                &self,
                old: $int_type,
                new: $int_type,
                s: Ordering,
                f: Ordering,
            ) -> Result<$int_type, $int_type> {
                self.compare_exchange_weak(old, new, s, f)
            }
            #[inline]
            fn fetch_add(&self, val: $int_type) -> $int_type {
                self.fetch_add(val, Ordering::AcqRel)
            }
        }
    };
}
macro_rules! impl_atomic_no_order {
    ($atomic_type:path, $int_type:ident) => {
        impl AtomicInt<$int_type> for $atomic_type {
            #[inline]
            fn new(v: $int_type) -> Self {
                Self::new(v)
            }
            #[inline]
            fn load(&self) -> $int_type {
                self.load()
            }
            #[inline]
            fn store(&self, val: $int_type) {
                self.store(val);
            }
            #[inline]
            fn swap(&self, val: $int_type) -> $int_type {
                self.swap(val)
            }
            #[inline]
            fn compare_exchange(&self, old: $int_type, new: $int_type) -> $int_type {
                self.compare_exchange(old, new).unwrap_or_else(|x| x)
            }
            #[inline]
            fn compare_exchange_weak_(
                &self,
                old: $int_type,
                new: $int_type,
                _: Ordering,
                _: Ordering,
            ) -> Result<$int_type, $int_type> {
                self.compare_exchange(old, new)
            }
            #[inline]
            fn fetch_add(&self, val: $int_type) -> $int_type {
                self.fetch_add(val)
            }
        }
    };
}

fn bench_concurrent_load<A: AtomicInt<T>, T: Copy + From<u32>>() -> A {
    let a = black_box(A::new(T::from(1)));
    let barrier = Barrier::new(THREADS);
    thread::scope(|s| {
        for _ in 0..THREADS {
            s.spawn(|| {
                barrier.wait();
                for _ in 0..N {
                    let _ = black_box(a.load());
                }
            });
        }
    });
    a
}
fn bench_concurrent_load_store<A: AtomicInt<T>, T: Copy + From<u32>>() -> A {
    let a = black_box(A::new(T::from(1)));
    let barrier = Barrier::new(THREADS * 2);
    thread::scope(|s| {
        for i in 0..THREADS {
            s.spawn(|| {
                barrier.wait();
                for _ in 0..N {
                    let _ = black_box(a.load());
                }
            });
            if i % 2 == 0 {
                s.spawn(|| {
                    barrier.wait();
                    for i in 0..N {
                        a.store(T::from(i));
                    }
                });
            } else {
                s.spawn(|| {
                    barrier.wait();
                    for i in (0..N).rev() {
                        a.store(T::from(i));
                    }
                });
            }
        }
    });
    a
}
fn bench_concurrent_store<A: AtomicInt<T>, T: Copy + From<u32>>() -> A {
    let a = black_box(A::new(T::from(1)));
    let barrier = Barrier::new(THREADS * 2);
    thread::scope(|s| {
        for _ in 0..THREADS {
            s.spawn(|| {
                barrier.wait();
                for i in 0..N {
                    a.store(T::from(i));
                }
            });
            s.spawn(|| {
                barrier.wait();
                for i in (0..N).rev() {
                    a.store(T::from(i));
                }
            });
        }
    });
    a
}
fn bench_concurrent_swap<A: AtomicInt<T>, T: Copy + From<u32>>() -> A {
    let a = black_box(A::new(T::from(1)));
    let barrier = Barrier::new(THREADS * 2);
    thread::scope(|s| {
        for _ in 0..THREADS {
            s.spawn(|| {
                barrier.wait();
                for i in 0..N {
                    let _ = black_box(a.swap(T::from(i)));
                }
            });
            s.spawn(|| {
                barrier.wait();
                for i in (0..N).rev() {
                    let _ = black_box(a.swap(T::from(i)));
                }
            });
        }
    });
    a
}
fn bench_concurrent_store_swap<A: AtomicInt<T>, T: Copy + From<u32>>() -> A {
    let a = black_box(A::new(T::from(1)));
    let barrier = Barrier::new(THREADS * 2);
    thread::scope(|s| {
        for i in 0..THREADS {
            if i % 2 == 0 {
                s.spawn(|| {
                    barrier.wait();
                    for i in 0..N {
                        a.store(T::from(i));
                    }
                });
            } else {
                s.spawn(|| {
                    barrier.wait();
                    for i in (0..N).rev() {
                        a.store(T::from(i));
                    }
                });
            }
            if i % 2 == 0 {
                s.spawn(|| {
                    barrier.wait();
                    for i in (0..N).rev() {
                        a.swap(T::from(i));
                    }
                });
            } else {
                s.spawn(|| {
                    barrier.wait();
                    for i in 0..N {
                        a.swap(T::from(i));
                    }
                });
            }
        }
    });
    a
}
fn bench_concurrent_fetch_add<A: AtomicInt<T>, T: Copy + From<u32>>() -> A {
    let a = black_box(A::new(T::from(1)));
    let barrier = Barrier::new(THREADS * 2);
    thread::scope(|s| {
        for _ in 0..THREADS {
            s.spawn(|| {
                barrier.wait();
                for i in 0..N {
                    let _ = black_box(a.fetch_add(T::from(i)));
                }
            });
            s.spawn(|| {
                barrier.wait();
                for i in (0..N).rev() {
                    let _ = black_box(a.fetch_add(T::from(i)));
                }
            });
        }
    });
    a
}
fn bench_concurrent_fetch_update<
    A: AtomicInt<T>,
    T: Copy + From<u32> + core::ops::Add<Output = T>,
>() -> A {
    let a = black_box(A::new(T::from(1)));
    let barrier = Barrier::new(THREADS * 2);
    thread::scope(|s| {
        for _ in 0..THREADS {
            s.spawn(|| {
                barrier.wait();
                for i in 0..N {
                    let (s, f) = match i % 4 {
                        0 => (Ordering::AcqRel, Ordering::Acquire),
                        1 => (Ordering::Acquire, Ordering::Acquire),
                        2 => (Ordering::Release, Ordering::Relaxed),
                        _ => (Ordering::Relaxed, Ordering::Relaxed),
                    };
                    let _ = black_box(a.fetch_update(s, f, |v| Some(v + T::from(i))));
                }
            });
            s.spawn(|| {
                barrier.wait();
                for i in (0..N).rev() {
                    let (s, f) = match i % 4 {
                        0 => (Ordering::AcqRel, Ordering::Acquire),
                        1 => (Ordering::Acquire, Ordering::Acquire),
                        2 => (Ordering::Release, Ordering::Relaxed),
                        _ => (Ordering::Relaxed, Ordering::Relaxed),
                    };
                    let _ = black_box(a.fetch_update(s, f, |v| Some(v + T::from(i))));
                }
            });
        }
    });
    a
}

macro_rules! benches {
    ($name:ident, $atomic_type:path, $int_type:ident) => {
        pub fn $name(c: &mut Criterion) {
            type A = $atomic_type;
            let mut g = c.benchmark_group(stringify!($name));
            // g.bench_function(concat!(stringify!($int_type), "_load"), |b| {
            //     let a = A::new(black_box(1));
            //     b.iter(|| AtomicInt::<$int_type>::load(&a));
            // });
            // g.bench_function(concat!(stringify!($int_type), "_store"), |b| {
            //     let a = A::new(black_box(1));
            //     b.iter(|| AtomicInt::<$int_type>::store(&a, black_box(2)));
            //     black_box(a);
            // });
            // g.bench_function(concat!(stringify!($int_type), "_swap"), |b| {
            //     let a = A::new(black_box(1));
            //     b.iter(|| AtomicInt::<$int_type>::swap(&a, black_box(2)));
            //     black_box(a);
            // });
            g.bench_function(concat!(stringify!($int_type), "_compare_exchange_success"), |b| {
                let a = A::new(black_box(1));
                b.iter(|| AtomicInt::<$int_type>::compare_exchange(&a, black_box(1), black_box(2)));
                black_box(a);
            });
            g.bench_function(concat!(stringify!($int_type), "_compare_exchange_fail"), |b| {
                let a = A::new(black_box(1));
                b.iter(|| AtomicInt::<$int_type>::compare_exchange(&a, black_box(2), black_box(3)));
                black_box(a);
            });
            // g.bench_function(concat!(stringify!($int_type), "_fetch_add"), |b| {
            //     let a = A::new(black_box(1));
            //     b.iter(|| AtomicInt::<$int_type>::fetch_add(&a, black_box(2)));
            //     black_box(a);
            // });
            // g.bench_function(concat!(stringify!($int_type), "_concurrent_load"), |b| {
            //     b.iter(bench_concurrent_load::<A, $int_type>);
            // });
            // g.bench_function(concat!(stringify!($int_type), "_concurrent_load_store"), |b| {
            //     b.iter(bench_concurrent_load_store::<A, $int_type>);
            // });
            // g.bench_function(concat!(stringify!($int_type), "_concurrent_store"), |b| {
            //     b.iter(bench_concurrent_store::<A, $int_type>);
            // });
            // g.bench_function(concat!(stringify!($int_type), "_concurrent_swap"), |b| {
            //     b.iter(bench_concurrent_swap::<A, $int_type>);
            // });
            // g.bench_function(concat!(stringify!($int_type), "_concurrent_store_swap"), |b| {
            //     b.iter(bench_concurrent_store_swap::<A, $int_type>);
            // });
            // g.bench_function(concat!(stringify!($int_type), "_concurrent_fetch_add"), |b| {
            //     b.iter(bench_concurrent_fetch_add::<A, $int_type>);
            // });
            g.bench_function(concat!(stringify!($int_type), "_concurrent_fetch_update"), |b| {
                b.iter(bench_concurrent_fetch_update::<A, $int_type>);
            });
        }
    };
}
#[cfg(any(
    target_arch = "x86_64",
    target_arch = "aarch64",
    target_arch = "powerpc64",
    target_arch = "s390x",
))]
mod bench {
    use super::*;

    #[cfg(any(target_arch = "x86_64", all(target_arch = "aarch64", target_endian = "little")))]
    impl_atomic!(intrinsics::AtomicU128, u128);
    impl_atomic!(arch::AtomicU128, u128);
    impl_atomic!(seqlock_fallback::AtomicU128, u128);
    impl_atomic!(spinlock_fallback::AtomicU128, u128);
    impl_atomic!(atomic::Atomic<u128>, u128);
    impl_atomic_no_order!(crossbeam_utils::atomic::AtomicCell<u128>, u128);

    #[cfg(any(target_arch = "x86_64", all(target_arch = "aarch64", target_endian = "little")))]
    benches!(bench_portable_atomic_intrinsics, intrinsics::AtomicU128, u128);
    benches!(bench_portable_atomic_arch, arch::AtomicU128, u128);
    benches!(bench_portable_atomic_seqlock_fallback, seqlock_fallback::AtomicU128, u128);
    benches!(bench_portable_atomic_spinlock_fallback, spinlock_fallback::AtomicU128, u128);
    benches!(bench_atomic_cell, crossbeam_utils::atomic::AtomicCell<u128>, u128);
    benches!(bench_atomic_rs, atomic::Atomic<u128>, u128);

    criterion_group!(
        benches,
        bench_portable_atomic_arch,
        bench_portable_atomic_intrinsics,
        // bench_portable_atomic_seqlock_fallback,
        // bench_portable_atomic_spinlock_fallback,
        // bench_atomic_cell,
        // bench_atomic_rs
    );
}
#[cfg(all(target_arch = "arm", any(target_os = "linux", target_os = "android")))]
mod bench {
    use super::*;

    #[cfg(all(target_arch = "arm", any(target_os = "linux", target_os = "android")))]
    impl_atomic!(arch::AtomicU64, u64);
    impl_atomic!(seqlock_fallback::AtomicU64, u64);
    impl_atomic!(spinlock_fallback::AtomicU64, u64);
    impl_atomic!(atomic::Atomic<u64>, u64);
    impl_atomic_no_order!(crossbeam_utils::atomic::AtomicCell<u64>, u64);

    #[cfg(all(target_arch = "arm", any(target_os = "linux", target_os = "android")))]
    benches!(bench_portable_atomic_arch, arch::AtomicU64, u64);
    benches!(bench_portable_atomic_seqlock_fallback, seqlock_fallback::AtomicU64, u64);
    benches!(bench_portable_atomic_spinlock_fallback, spinlock_fallback::AtomicU64, u64);
    benches!(bench_atomic_cell, crossbeam_utils::atomic::AtomicCell<u64>, u64);
    benches!(bench_atomic_rs, atomic::Atomic<u64>, u64);

    criterion_group!(
        benches,
        bench_portable_atomic_arch,
        bench_portable_atomic_seqlock_fallback,
        bench_portable_atomic_spinlock_fallback,
        bench_atomic_cell,
        bench_atomic_rs
    );
}

criterion_main!(bench::benches);

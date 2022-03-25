#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]
#![allow(dead_code, unused_extern_crates)]
#![allow(clippy::only_used_in_recursion)]
#![feature(cmpxchg16b_target_feature, stdsimd, core_intrinsics)]

use std::{
    hint,
    sync::{atomic::Ordering, Barrier},
};

use criterion::{black_box, criterion_group, criterion_main, Criterion};
use crossbeam_utils::thread;

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
#[path = "../../src/imp/aarch64.rs"]
mod aarch64;
#[cfg(target_arch = "x86_64")]
#[allow(dead_code, unused_imports)]
#[path = "../../src/imp/cmpxchg16b.rs"]
mod cmpxchg16b_stdsimd;
#[cfg(any(target_arch = "x86_64", target_arch = "aarch64", /* target_arch = "s390x" */))]
#[allow(dead_code, unused_imports)]
#[path = "imp/intrinsics.rs"]
mod intrinsics;
#[cfg(target_arch = "s390x")]
#[allow(dead_code, unused_imports)]
#[path = "../../src/imp/s390x.rs"]
mod s390x;
#[allow(dead_code, unused_imports)]
#[path = "../../src/imp/fallback/mod.rs"]
mod seqlock_fallback;
#[allow(unused_imports)]
use seqlock_fallback as fallback;
#[allow(dead_code, unused_imports)]
#[path = "imp/spinlock_fallback.rs"]
mod spinlock_fallback;

const THREADS: usize = 2;
const N: u32 = 5000;

trait AtomicInt<T: Copy>: Sized + Send + Sync {
    fn new(v: T) -> Self;
    fn load(&self) -> T;
    fn store(&self, val: T);
    fn swap(&self, val: T) -> T;
}
macro_rules! impl_atomic_u128 {
    ($atomic_u128:path) => {
        impl AtomicInt<u128> for $atomic_u128 {
            fn new(v: u128) -> Self {
                Self::new(v)
            }
            fn load(&self) -> u128 {
                self.load(Ordering::Acquire)
            }
            fn store(&self, val: u128) {
                self.store(val, Ordering::Release);
            }
            fn swap(&self, val: u128) -> u128 {
                self.swap(val, Ordering::AcqRel)
            }
        }
    };
}
impl_atomic_u128!(intrinsics::AtomicU128);
#[cfg(target_arch = "x86_64")]
impl_atomic_u128!(cmpxchg16b_stdsimd::AtomicU128);
#[cfg(target_arch = "aarch64")]
impl_atomic_u128!(aarch64::AtomicU128);
#[cfg(target_arch = "s390x")]
impl_atomic_u128!(s390x::AtomicU128);
impl_atomic_u128!(seqlock_fallback::AtomicU128);
impl_atomic_u128!(spinlock_fallback::AtomicU128);
impl_atomic_u128!(atomic::Atomic<u128>);
impl AtomicInt<u128> for crossbeam_utils::atomic::AtomicCell<u128> {
    fn new(v: u128) -> Self {
        Self::new(v)
    }
    fn load(&self) -> u128 {
        self.load()
    }
    fn store(&self, val: u128) {
        self.store(val);
    }
    fn swap(&self, val: u128) -> u128 {
        self.swap(val)
    }
}

fn bench_concurrent_load<A: AtomicInt<T>, T: Copy + From<u32>>() -> A {
    let a = black_box(A::new(T::from(1)));
    let barrier = Barrier::new(THREADS);
    thread::scope(|s| {
        for _ in 0..THREADS {
            s.spawn(|_| {
                barrier.wait();
                for _ in 0..N {
                    let _ = black_box(a.load());
                }
            });
        }
    })
    .unwrap();
    a
}
fn bench_concurrent_load_store<A: AtomicInt<T>, T: Copy + From<u32>>() -> A {
    let a = black_box(A::new(T::from(1)));
    let barrier = Barrier::new(THREADS * 2);
    thread::scope(|s| {
        for i in 0..THREADS {
            s.spawn(|_| {
                barrier.wait();
                for _ in 0..N {
                    let _ = black_box(a.load());
                }
            });
            if i % 2 == 0 {
                s.spawn(|_| {
                    barrier.wait();
                    for i in 0..N {
                        a.store(T::from(i));
                    }
                });
            } else {
                s.spawn(|_| {
                    barrier.wait();
                    for i in (0..N).rev() {
                        a.store(T::from(i));
                    }
                });
            }
        }
    })
    .unwrap();
    a
}
fn bench_concurrent_swap<A: AtomicInt<T>, T: Copy + From<u32>>() -> A {
    let a = black_box(A::new(T::from(1)));
    let barrier = Barrier::new(THREADS * 2);
    thread::scope(|s| {
        for _ in 0..THREADS {
            s.spawn(|_| {
                barrier.wait();
                for i in 0..N {
                    let _ = black_box(a.swap(T::from(i)));
                }
            });
            s.spawn(|_| {
                barrier.wait();
                for i in (0..N).rev() {
                    let _ = black_box(a.swap(T::from(i)));
                }
            });
        }
    })
    .unwrap();
    a
}

macro_rules! benches {
    ($name:ident, $atomic_u128:path) => {
        fn $name(c: &mut Criterion) {
            type A = $atomic_u128;
            let mut g = c.benchmark_group(stringify!($name));
            g.bench_function("u128_load", |b| {
                let a = A::new(black_box(1));
                b.iter(|| AtomicInt::<u128>::load(&a));
            });
            g.bench_function("u128_store", |b| {
                let a = A::new(black_box(1));
                b.iter(|| AtomicInt::<u128>::store(&a, black_box(2)));
                black_box(a);
            });
            g.bench_function("u128_concurrent_load", |b| {
                b.iter(bench_concurrent_load::<A, u128>);
            });
            g.bench_function("u128_concurrent_load_store", |b| {
                b.iter(bench_concurrent_load_store::<A, u128>);
            });
            g.bench_function("u128_concurrent_swap", |b| {
                b.iter(bench_concurrent_swap::<A, u128>);
            });
        }
    };
}
benches!(bench_portable_atomic_intrinsics, intrinsics::AtomicU128);
#[cfg(target_arch = "x86_64")]
benches!(bench_portable_atomic_cmpxchg16b_stdsimd, cmpxchg16b_stdsimd::AtomicU128);
#[cfg(target_arch = "aarch64")]
benches!(bench_portable_atomic_aarch64, aarch64::AtomicU128);
#[cfg(target_arch = "s390x")]
benches!(bench_portable_atomic_s390x, s390x::AtomicU128);
benches!(bench_portable_atomic_seqlock_fallback, seqlock_fallback::AtomicU128);
benches!(bench_portable_atomic_spinlock_fallback, spinlock_fallback::AtomicU128);
benches!(bench_atomic_cell, crossbeam_utils::atomic::AtomicCell<u128>);
benches!(bench_atomic_rs, atomic::Atomic<u128>);

#[cfg(target_arch = "aarch64")]
use bench_portable_atomic_aarch64 as arch;
#[cfg(target_arch = "x86_64")]
use bench_portable_atomic_cmpxchg16b_stdsimd as arch;
#[cfg(target_arch = "s390x")]
use bench_portable_atomic_s390x as arch;

criterion_group!(
    benches,
    bench_portable_atomic_seqlock_fallback,
    bench_atomic_cell,
    arch,
    bench_portable_atomic_intrinsics,
    bench_portable_atomic_spinlock_fallback,
    bench_atomic_rs
);
criterion_main!(benches);

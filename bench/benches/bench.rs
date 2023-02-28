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

const THREADS: usize = 2;
const N: u32 = 5000;

trait AtomicInt<T: Copy>: Sized + Send + Sync {
    fn new(v: T) -> Self;
    fn load(&self) -> T;
    fn store(&self, val: T);
    fn swap(&self, val: T) -> T;
    fn compare_exchange(&self, old: u128, new: u128) -> u128;
    fn fetch_add(&self, val: T) -> T;
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
            fn compare_exchange(&self, old: u128, new: u128) -> u128 {
                self.compare_exchange(old, new, Ordering::AcqRel, Ordering::Acquire)
                    .unwrap_or_else(|x| x)
            }
            fn fetch_add(&self, val: u128) -> u128 {
                self.fetch_add(val, Ordering::AcqRel)
            }
        }
    };
}
#[cfg(any(target_arch = "x86_64", all(target_arch = "aarch64", target_endian = "little")))]
impl_atomic_u128!(intrinsics::AtomicU128);
impl_atomic_u128!(arch::AtomicU128);
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
    fn compare_exchange(&self, old: u128, new: u128) -> u128 {
        self.compare_exchange(old, new).unwrap_or_else(|x| x)
    }
    fn fetch_add(&self, val: u128) -> u128 {
        self.fetch_add(val)
    }
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
            g.bench_function("u128_swap", |b| {
                let a = A::new(black_box(1));
                b.iter(|| AtomicInt::<u128>::swap(&a, black_box(2)));
                black_box(a);
            });
            g.bench_function("u128_compare_exchange_success", |b| {
                let a = A::new(black_box(1));
                b.iter(|| AtomicInt::<u128>::compare_exchange(&a, black_box(1), black_box(2)));
                black_box(a);
            });
            g.bench_function("u128_compare_exchange_fail", |b| {
                let a = A::new(black_box(1));
                b.iter(|| AtomicInt::<u128>::compare_exchange(&a, black_box(2), black_box(3)));
                black_box(a);
            });
            g.bench_function("u128_fetch_add", |b| {
                let a = A::new(black_box(1));
                b.iter(|| AtomicInt::<u128>::fetch_add(&a, black_box(2)));
                black_box(a);
            });
            g.bench_function("u128_concurrent_load", |b| {
                b.iter(bench_concurrent_load::<A, u128>);
            });
            g.bench_function("u128_concurrent_load_store", |b| {
                b.iter(bench_concurrent_load_store::<A, u128>);
            });
            g.bench_function("u128_concurrent_store", |b| {
                b.iter(bench_concurrent_store::<A, u128>);
            });
            g.bench_function("u128_concurrent_swap", |b| {
                b.iter(bench_concurrent_swap::<A, u128>);
            });
            g.bench_function("u128_concurrent_store_swap", |b| {
                b.iter(bench_concurrent_store_swap::<A, u128>);
            });
            g.bench_function("u128_concurrent_fetch_add", |b| {
                b.iter(bench_concurrent_fetch_add::<A, u128>);
            });
        }
    };
}
#[cfg(any(target_arch = "x86_64", all(target_arch = "aarch64", target_endian = "little")))]
benches!(bench_portable_atomic_intrinsics, intrinsics::AtomicU128);
benches!(bench_portable_atomic_arch, arch::AtomicU128);
benches!(bench_portable_atomic_seqlock_fallback, seqlock_fallback::AtomicU128);
benches!(bench_portable_atomic_spinlock_fallback, spinlock_fallback::AtomicU128);
benches!(bench_atomic_cell, crossbeam_utils::atomic::AtomicCell<u128>);
benches!(bench_atomic_rs, atomic::Atomic<u128>);

criterion_group!(
    benches,
    bench_portable_atomic_arch,
    bench_portable_atomic_intrinsics,
    bench_portable_atomic_seqlock_fallback,
    bench_portable_atomic_spinlock_fallback,
    bench_atomic_cell,
    bench_atomic_rs
);
criterion_main!(benches);

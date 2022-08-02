use portable_atomic::Atomicable;

#[derive(Clone, Copy, Atomicable)]
#[atomic(u8)]
struct A {
    f0: u8,
    f1: u8,
}

fn main() {}

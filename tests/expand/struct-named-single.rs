use portable_atomic::Atomicable;

#[derive(Clone, Copy, Atomicable)]
struct A {
    f0: u8,
}

fn main() {}

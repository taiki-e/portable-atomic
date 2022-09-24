use portable_atomic::Atomicable;

#[derive(Clone, Copy, Atomicable)]
union A {
    f0: u8,
}

fn main() {}

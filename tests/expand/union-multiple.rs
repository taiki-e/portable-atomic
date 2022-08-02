use portable_atomic::Atomicable;

#[derive(Clone, Copy, Atomicable)]
#[repr(C)]
union A {
    f0: u8,
    f1: u8,
}

fn main() {}

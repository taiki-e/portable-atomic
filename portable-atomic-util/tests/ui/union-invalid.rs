pub mod multi_fields_no_repr_c {
    use portable_atomic::Atomicable;

    #[derive(Clone, Copy, Atomicable)]
    union A {
        f0: u8,
        f1: u8,
    }
}

fn main() {}

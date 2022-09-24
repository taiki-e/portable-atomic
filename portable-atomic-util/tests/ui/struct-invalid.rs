pub mod struct_no_field {
    use portable_atomic::Atomicable;

    #[derive(Clone, Copy, Atomicable)]
    struct A {}
}

pub mod struct_no_repr {
    use portable_atomic::Atomicable;

    #[derive(Clone, Copy, Atomicable)]
    struct A {
        f0: u8,
        f1: u8,
    }
}

fn main() {}

pub mod enum_no_variant {
    use portable_atomic::Atomicable;

    #[derive(Clone, Copy, Atomicable)]
    enum A {}
}

fn main() {}

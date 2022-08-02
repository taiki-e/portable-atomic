#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]

#[cfg(feature = "derive")]
mod derive {
    use portable_atomic::*;

    #[derive(Debug, Clone, Copy, PartialEq, Eq, Atomicable)]
    struct Transparent1 {
        f: u64,
    }
    #[derive(Debug, Clone, Copy, PartialEq, Eq, Atomicable)]
    struct Transparent2(u64);
    #[derive(Debug, Clone, Copy, PartialEq, Eq, Atomicable)]
    #[atomic(u64)]
    struct Transparent3(Transparent1);
    #[derive(Debug, Clone, Copy, PartialEq, Eq, Atomicable)]
    #[atomic(u64)]
    struct Transparent4 {
        f: Transparent3,
    }

    #[derive(Debug, Clone, Copy, PartialEq, Eq, Atomicable)]
    #[atomic(u64)]
    struct Composite1 {
        f1: [u16; 2],
        f2: u16,
    }
    #[derive(Debug, Clone, Copy, PartialEq, Eq, Atomicable)]
    #[atomic(u128)]
    struct Composite2(Composite1, u16);

    #[test]
    fn test() {
        let a = Atomic::new(Transparent1 { f: 0 });
        let _b = Atomic::new(Transparent2(0));
        let c = Atomic::new(Transparent3(a.load(Ordering::Acquire)));
        let _d = Atomic::new(Transparent4 { f: c.load(Ordering::Acquire) });
        let e = Atomic::new(Composite1 { f1: [1, 3], f2: 2 });
        assert_eq!(e.load(Ordering::Acquire), Composite1 { f1: [1, 3], f2: 2 });
    }
}

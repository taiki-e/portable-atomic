// This is rustc error.

use portable_atomic::Atomicable;

#[derive(Clone, Copy, Atomicable)]
union A {}

fn main() {}

// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
Atomic float implementations
*/

#![allow(clippy::float_arithmetic)]

mod int;

cfg_has_atomic_32! {
    pub(crate) use self::int::AtomicF32;
}
cfg_has_atomic_64! {
    pub(crate) use self::int::AtomicF64;
}

#![cfg_attr(all(test, target_os = "none"), no_main)]
#![cfg_attr(all(test, target_os = "none"), no_std)]
#![cfg_attr(all(test, target_os = "none"), feature(custom_test_frameworks, panic_info_message))]
#![cfg_attr(all(test, target_os = "none"), test_runner(tests::qemu::test_runner))]
#![cfg_attr(all(test, target_os = "none"), reexport_test_harness_main = "test_main")]
#![warn(rust_2018_idioms, single_use_lifetimes)]
#![cfg_attr(not(portable_atomic_no_unsafe_op_in_unsafe_fn), warn(unsafe_op_in_unsafe_fn))] // unsafe_op_in_unsafe_fn requires Rust 1.52
#![cfg_attr(portable_atomic_no_unsafe_op_in_unsafe_fn, allow(unused_unsafe))]

#[macro_use]
#[path = "../src/tests"]
mod tests {
    #[macro_use]
    pub mod helper;

    #[cfg(target_os = "none")]
    #[cfg_attr(any(target_arch = "riscv32", target_arch = "riscv64"), path = "qemu/riscv.rs")]
    #[macro_use]
    pub mod qemu;
}

use portable_atomic::*;

test_atomic_bool_pub!();
test_atomic_ptr_pub!();

test_atomic_int_pub!(isize);
test_atomic_int_pub!(usize);
test_atomic_int_pub!(i8);
test_atomic_int_pub!(u8);
test_atomic_int_pub!(i16);
test_atomic_int_pub!(u16);
test_atomic_int_pub!(i32);
test_atomic_int_pub!(u32);
test_atomic_int_pub!(i64);
test_atomic_int_pub!(u64);

#[cfg(all(test, target_os = "none"))]
#[no_mangle]
pub unsafe extern "C" fn _start(_hartid: usize, fdt_address: usize) -> ! {
    use tests::qemu::semihosting::*;
    unsafe { init(fdt_address) }
    test_main();
    exit(EXIT_SUCCESS)
}

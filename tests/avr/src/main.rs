// SPDX-License-Identifier: Apache-2.0 OR MIT

#![no_main]
#![no_std]
#![warn(unsafe_op_in_unsafe_fn)]
#![allow(clippy::undocumented_unsafe_blocks, clippy::wildcard_imports)]

#[macro_use]
#[path = "../../api-test/src/helper.rs"]
mod helper;

use arduino_hal::avr_device;
use portable_atomic::*;

#[avr_device::entry]
fn main() -> ! {
    let dp = arduino_hal::Peripherals::take().unwrap();
    let pins = arduino_hal::pins!(dp);
    let mut serial = arduino_hal::default_serial!(dp, pins, 57600);

    macro_rules! print_str {
        ($($tt:tt)*) => {{
            sim::write_str(&mut serial, $($tt)*);
        }};
    }

    macro_rules! test_atomic_int {
        ($int_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $int_type>]() {
                    __test_atomic_int!([<Atomic $int_type:camel>], $int_type);
                }
                print_str!(concat!("test test_atomic_", stringify!($int_type), " ... "));
                [<test_atomic_ $int_type>]();
                print_str!("ok\n");
            }
        };
    }
    macro_rules! test_atomic_float {
        ($float_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $float_type>]() {
                    __test_atomic_float!([<Atomic $float_type:camel>], $float_type);
                }
                print_str!(concat!("test test_atomic_", stringify!($float_type), " ... "));
                [<test_atomic_ $float_type>]();
                print_str!("ok\n");
            }
        };
    }
    macro_rules! test_atomic_bool {
        () => {
            fn test_atomic_bool() {
                __test_atomic_bool!(AtomicBool);
            }
            print_str!("test test_atomic_bool ... ");
            test_atomic_bool();
            print_str!("ok\n");
        };
    }
    macro_rules! test_atomic_ptr {
        () => {
            fn test_atomic_ptr() {
                __test_atomic_ptr!(AtomicPtr<u8>);
            }
            print_str!("test test_atomic_ptr ... ");
            test_atomic_ptr();
            print_str!("ok\n");
        };
    }

    for &order in &helper::FENCE_ORDERINGS {
        fence(order);
        compiler_fence(order);
    }
    hint::spin_loop();
    test_atomic_bool!();
    test_atomic_ptr!();
    test_atomic_int!(isize);
    test_atomic_int!(usize);
    test_atomic_int!(i8);
    test_atomic_int!(u8);
    test_atomic_int!(i16);
    test_atomic_int!(u16);
    test_atomic_int!(i32);
    test_atomic_int!(u32);
    test_atomic_int!(i64);
    test_atomic_int!(u64);
    test_atomic_int!(i128);
    test_atomic_int!(u128);
    // TODO
    if cfg!(all(not(debug_assertions), not(qemu))) {
        test_atomic_float!(f32);
        // TODO: undefined reference to `__{ne,ge}df2' in LLVM 17 (nightly-2023-08-09)
        // test_atomic_float!(f64);
    }

    print_str!("Tests finished successfully\n");

    sim::exit(0)
}

#[inline(never)]
#[panic_handler]
fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
    avr_device::interrupt::disable();

    let dp = unsafe { arduino_hal::Peripherals::steal() };
    let pins = arduino_hal::pins!(dp);
    let mut serial = sim::Usart(arduino_hal::default_serial!(dp, pins, 57600));

    #[cfg(debug_assertions)]
    {
        let _ = info;
        sim::write_str(&mut serial.0, "panicked\n");
    }
    #[cfg(not(debug_assertions))]
    {
        macro_rules! println {
            ($($tt:tt)*) => {{
                use core::fmt::Write as _;
                let _ = writeln!(serial, $($tt)*);
            }};
        }
        println!("{info}");
    }
    sim::exit(1)
}

mod sim {
    use core::fmt;

    use arduino_hal::avr_device;

    pub fn exit(_code: u32) -> ! {
        // Note that there is no way to exit simavr with a non-zero exit code.
        // https://github.com/buserror/simavr/issues/362
        avr_device::interrupt::disable();
        avr_device::asm::sleep();
        #[allow(clippy::empty_loop)] // this test crate is #![no_std]
        loop {}
    }

    pub fn write_str<USART, RX, TX>(usart: &mut arduino_hal::usart::Usart<USART, RX, TX>, s: &str)
    where
        USART: arduino_hal::usart::UsartOps<arduino_hal::hal::Atmega, RX, TX>,
    {
        for b in s.bytes() {
            usart.write_byte(b);
        }
    }
    #[repr(transparent)]
    pub struct Usart<USART, RX, TX>(pub arduino_hal::usart::Usart<USART, RX, TX>)
    where
        USART: arduino_hal::usart::UsartOps<arduino_hal::hal::Atmega, RX, TX>;
    impl<USART, RX, TX> fmt::Write for Usart<USART, RX, TX>
    where
        USART: arduino_hal::usart::UsartOps<arduino_hal::hal::Atmega, RX, TX>,
    {
        fn write_str(&mut self, s: &str) -> fmt::Result {
            write_str(&mut self.0, s);
            Ok(())
        }
    }
}

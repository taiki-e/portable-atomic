#![no_main]
#![no_std]
#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]
#![feature(lang_items)]
#![feature(macro_metavar_expr)]
#![feature(panic_info_message)]
#![allow(clippy::empty_loop)] // this test crate is #![no_std]

#[macro_use]
#[path = "../../api-test/src/helper.rs"]
mod helper;

use core::sync::atomic::Ordering;

use portable_atomic::*;

#[avr_device::entry]
fn main() -> ! {
    let dp = arduino_hal::Peripherals::take().unwrap();
    let pins = arduino_hal::pins!(dp);
    let mut serial = arduino_hal::default_serial!(dp, pins, 57600);

    macro_rules! test_atomic_int {
        ($int_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $int_type>](serial: &mut impl ufmt::uWrite) {
                    macro_rules! print {
                        ($$($tt:tt)*) => {{
                            let _ = ufmt::uwrite!(serial, $$($tt)*);
                        }};
                    }
                    macro_rules! println {
                        ($$($tt:tt)*) => {{
                            let _ = ufmt::uwriteln!(serial, $$($tt)*);
                        }};
                    }
                    print!("test test_atomic_{} ... ", stringify!($int_type));
                    __test_atomic_int!([<Atomic $int_type:camel>], $int_type);
                    println!("ok");
                }
                [<test_atomic_ $int_type>](&mut serial);
            }
        };
    }
    macro_rules! test_atomic_float {
        ($float_type:ident) => {
            paste::paste! {
                fn [<test_atomic_ $float_type>](serial: &mut impl ufmt::uWrite) {
                    macro_rules! print {
                        ($$($tt:tt)*) => {{
                            let _ = ufmt::uwrite!(serial, $$($tt)*);
                        }};
                    }
                    macro_rules! println {
                        ($$($tt:tt)*) => {{
                            let _ = ufmt::uwriteln!(serial, $$($tt)*);
                        }};
                    }
                    print!("test test_atomic_{} ... ", stringify!($float_type));
                    __test_atomic_float!([<Atomic $float_type:camel>], $float_type);
                    println!("ok");
                }
                [<test_atomic_ $float_type>](&mut serial);
            }
        };
    }
    macro_rules! test_atomic_bool {
        () => {
            fn test_atomic_bool(serial: &mut impl ufmt::uWrite) {
                macro_rules! print {
                    ($$($tt:tt)*) => {{
                        let _ = ufmt::uwrite!(serial, $$($tt)*);
                    }};
                }
                macro_rules! println {
                    ($$($tt:tt)*) => {{
                        let _ = ufmt::uwriteln!(serial, $$($tt)*);
                    }};
                }
                print!("test test_atomic_bool ... ");
                __test_atomic_bool!(AtomicBool);
                println!("ok");
            }
            test_atomic_bool(&mut serial);
        };
    }
    macro_rules! test_atomic_ptr {
        () => {
            fn test_atomic_ptr(serial: &mut impl ufmt::uWrite) {
                macro_rules! print {
                    ($$($tt:tt)*) => {{
                        let _ = ufmt::uwrite!(serial, $$($tt)*);
                    }};
                }
                macro_rules! println {
                    ($$($tt:tt)*) => {{
                        let _ = ufmt::uwriteln!(serial, $$($tt)*);
                    }};
                }
                print!("test test_atomic_ptr ... ");
                __test_atomic_ptr!(AtomicPtr<u8>);
                println!("ok");
            }
            test_atomic_ptr(&mut serial);
        };
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
        test_atomic_float!(f64);
    }

    semihosting::exit(semihosting::EXIT_SUCCESS)
}

#[inline(never)]
#[panic_handler]
fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
    avr_device::interrupt::disable();

    let dp = unsafe { arduino_hal::Peripherals::steal() };
    let pins = arduino_hal::pins!(dp);
    let mut serial = semihosting::Usart(arduino_hal::default_serial!(dp, pins, 57600));

    macro_rules! print {
        ($($tt:tt)*) => {{
            use core::fmt::Write as _;
            let _ = write!(serial, $($tt)*);
        }};
    }
    macro_rules! println {
        ($($tt:tt)*) => {{
            use core::fmt::Write as _;
            let _ = writeln!(serial, $($tt)*);
        }};
    }

    if let Some(m) = info.message() {
        print!("panicked at '{m:?}'");
    } else {
        print!("panic occurred (no message)");
    }
    if let Some(l) = info.location() {
        println!(", {l}");
    } else {
        println!(" (no location info)");
    }

    semihosting::exit(semihosting::EXIT_FAILURE)
}
#[lang = "eh_personality"]
#[no_mangle]
pub extern "C" fn rust_eh_personality() {}

mod semihosting {
    use core::fmt;

    pub const EXIT_SUCCESS: u32 = 0;
    pub const EXIT_FAILURE: u32 = 1;
    pub fn exit(code: u32) -> ! {
        // It seems there is no way to exit simavr with a non-zero exit code.
        // https://github.com/buserror/simavr/issues/362
        if code == EXIT_SUCCESS {
            avr_device::interrupt::disable();
            avr_device::asm::sleep();
        }
        loop {}
    }

    pub struct Usart<USART, RX, TX>(pub arduino_hal::usart::Usart<USART, RX, TX>)
    where
        USART: arduino_hal::usart::UsartOps<arduino_hal::hal::Atmega, RX, TX>;
    impl<USART, RX, TX> fmt::Write for Usart<USART, RX, TX>
    where
        USART: arduino_hal::usart::UsartOps<arduino_hal::hal::Atmega, RX, TX>,
    {
        fn write_str(&mut self, s: &str) -> fmt::Result {
            for b in s.bytes() {
                self.0.write_byte(b);
            }
            Ok(())
        }
    }
}

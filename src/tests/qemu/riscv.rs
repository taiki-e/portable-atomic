macro_rules! print {
    ($($tt:tt)*) => {
        if let Some(mut uart) = $crate::tests::qemu::semihosting::Uart::new() {
            use core::fmt::Write;
            let _ = write!(uart, $($tt)*);
        }
    };
}
macro_rules! println {
    ($($tt:tt)*) => {
        if let Some(mut uart) = $crate::tests::qemu::semihosting::Uart::new() {
            use core::fmt::Write;
            let _ = writeln!(uart, $($tt)*);
        }
    };
}

pub(crate) fn test_runner(tests: &[&dyn Fn()]) {
    println!("Running {} tests", tests.len());
    for (i, test) in tests.iter().enumerate() {
        print!("test {}/{} ...", i + 1, tests.len());
        test();
        println!(" ok");
    }
    semihosting::exit(semihosting::EXIT_SUCCESS)
}

#[inline(never)]
#[panic_handler]
fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
    if let Some(s) = info.message() {
        if let Some(l) = info.location() {
            println!("panicked at '{:?}', {}", s, l);
        } else {
            println!("panicked at '{:?}' (no location info)", s);
        }
    } else {
        println!("panic occurred (no message)");
    }

    semihosting::exit(semihosting::EXIT_FAILURE)
}

pub(crate) mod semihosting {
    // Inspired by https://github.com/SimonSapin/riscv-qemu-demo

    use core::{
        fmt,
        ptr::{self, NonNull},
        sync::atomic::Ordering,
    };

    use crate::AtomicPtr;

    #[inline(always)]
    pub(crate) unsafe fn init(fdt_address: usize) {
        unsafe {
            core::arch::asm!("la sp, _stack");
            let fdt = &fdt::Fdt::from_ptr(fdt_address as _).unwrap();
            UART_HANDLE.store(find_compatible(fdt, "ns16550a").cast(), Ordering::Release);
            EXIT_HANDLE.store(find_compatible(fdt, "sifive,test0").cast(), Ordering::Release);
        }
    }

    pub(crate) fn find_compatible(fdt: &fdt::Fdt<'_>, with: &str) -> *mut () {
        let device = fdt.find_compatible(&[with]).unwrap();
        let register = device.reg().unwrap().next().unwrap();
        register.starting_address as _
    }

    pub(crate) static EXIT_HANDLE: AtomicPtr<u32> = AtomicPtr::new(ptr::null_mut());
    pub(crate) const EXIT_SUCCESS: u32 = 0;
    pub(crate) const EXIT_FAILURE: u32 = 1;
    pub(crate) fn exit(exit_code: u32) -> ! {
        if let Some(ptr) = NonNull::new(EXIT_HANDLE.load(Ordering::Acquire)) {
            unsafe { ptr.as_ptr().write_volatile(exit_code << 16 | 0x3333) }
        }
        loop {}
    }

    pub(crate) static UART_HANDLE: AtomicPtr<u8> = AtomicPtr::new(ptr::null_mut());
    pub(crate) struct Uart(NonNull<u8>);
    impl Uart {
        pub(crate) fn new() -> Option<Self> {
            let ptr = UART_HANDLE.load(Ordering::Acquire);
            NonNull::new(ptr).map(Self)
        }
    }
    impl fmt::Write for Uart {
        fn write_str(&mut self, s: &str) -> fmt::Result {
            for b in s.bytes() {
                unsafe { self.0.as_ptr().write_volatile(b) }
            }
            Ok(())
        }
    }
}

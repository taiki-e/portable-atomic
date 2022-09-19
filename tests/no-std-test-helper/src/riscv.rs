// Inspired by https://github.com/SimonSapin/riscv-qemu-demo

use core::{
    fmt,
    ptr::{self, NonNull},
    sync::atomic::Ordering,
};

use portable_atomic::AtomicPtr;

#[macro_export]
macro_rules! test_harness_main {
    ($test_main:ident $(,)?) => {
        #[cfg(test)]
        #[no_mangle]
        pub unsafe extern "C" fn _start(_hartid: usize, fdt_address: usize) -> ! {
            unsafe {
                $crate::__private::arch::init(fdt_address);
                $crate::__private::arch::alloc_init();
            }
            $test_main();
            $crate::exit(0)
        }
    };
}

#[inline(always)]
pub unsafe fn init(fdt_address: usize) {
    unsafe {
        core::arch::asm!("la sp, _stack");
        let fdt = &fdt::Fdt::from_ptr(fdt_address as _).unwrap();
        UART_HANDLE.store(find_compatible(fdt, "ns16550a").cast(), Ordering::Release);
        EXIT_HANDLE.store(find_compatible(fdt, "sifive,test0").cast(), Ordering::Release);
    }
}

#[inline(always)]
pub unsafe fn alloc_init() {
    #[cfg(feature = "alloc")]
    crate::alloc::init();
}

fn find_compatible(fdt: &fdt::Fdt<'_>, with: &str) -> *mut () {
    let device = fdt.find_compatible(&[with]).unwrap();
    let register = device.reg().unwrap().next().unwrap();
    register.starting_address as _
}

static EXIT_HANDLE: AtomicPtr<u32> = AtomicPtr::new(ptr::null_mut());
pub(crate) fn exit(exit_code: u32) -> ! {
    if let Some(ptr) = NonNull::new(EXIT_HANDLE.load(Ordering::Acquire)) {
        unsafe { ptr.as_ptr().write_volatile(exit_code << 16 | 0x3333) }
    }
    loop {}
}

pub use Uart as Stdout;
pub use Uart as Stderr;

static UART_HANDLE: AtomicPtr<u8> = AtomicPtr::new(ptr::null_mut());
pub struct Uart(NonNull<u8>);
impl Uart {
    pub fn new() -> Option<Self> {
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

pub(crate) mod interrupt {
    pub(crate) type State = riscv::register::sstatus::Sstatus;
    #[inline(always)]
    pub(crate) fn disable() -> State {
        let status = riscv::register::sstatus::read();
        unsafe { riscv::register::sstatus::clear_sie() }
        status
    }
    #[inline(always)]
    pub(crate) unsafe fn restore(status: State) {
        if status.sie() {
            unsafe { riscv::register::sstatus::set_sie() }
        }
    }
}

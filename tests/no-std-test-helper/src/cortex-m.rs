use cortex_m_semihosting as semihosting;

pub use cortex_m_rt;

#[macro_export]
macro_rules! test_harness_main {
    ($test_main:ident $(,)?) => {
        #[cfg(test)]
        #[$crate::__private::arch::cortex_m_rt::entry]
        fn main() -> ! {
            unsafe {
                $crate::__private::arch::alloc_init();
            }
            $test_main();
            $crate::exit(0)
        }
    };
}

#[inline(always)]
pub unsafe fn alloc_init() {
    #[cfg(feature = "alloc")]
    crate::alloc::init();
}

pub(crate) fn exit(exit_code: u32) -> ! {
    if exit_code == 0 {
        semihosting::debug::exit(semihosting::debug::EXIT_SUCCESS);
    } else {
        semihosting::debug::exit(semihosting::debug::EXIT_FAILURE);
    }
    loop {}
}

pub struct Stdout;
impl Stdout {
    pub fn new() -> Option<semihosting::hio::HostStream> {
        semihosting::hio::hstdout().ok()
    }
}

pub struct Stderr;
impl Stderr {
    pub fn new() -> Option<semihosting::hio::HostStream> {
        semihosting::hio::hstderr().ok()
    }
}

pub(crate) mod interrupt {
    pub(crate) type State = cortex_m::register::primask::Primask;
    #[inline]
    pub(crate) fn disable() -> State {
        let primask = cortex_m::register::primask::read();
        cortex_m::interrupt::disable();
        primask
    }
    #[inline]
    pub(crate) unsafe fn restore(primask: State) {
        if primask.is_active() {
            unsafe { cortex_m::interrupt::enable() }
        }
    }
}

use crate::arch;

#[macro_export]
macro_rules! print {
    ($($tt:tt)*) => {
        if let Some(mut stdout) = $crate::__private::arch::Stdout::new() {
            use $crate::__private::core::fmt::Write;
            let _ = $crate::__private::core::write!(stdout, $($tt)*);
        }
    };
}
#[macro_export]
macro_rules! println {
    ($($tt:tt)*) => {
        if let Some(mut stderr) = $crate::__private::arch::Stdout::new() {
            use $crate::__private::core::fmt::Write;
            let _ = $crate::__private::core::writeln!(stderr, $($tt)*);
        }
    };
}

#[macro_export]
macro_rules! eprint {
    ($($tt:tt)*) => {
        if let Some(mut stdout) = $crate::__private::arch::Stderr::new() {
            use $crate::__private::core::fmt::Write;
            let _ = $crate::__private::core::write!(stdout, $($tt)*);
        }
    };
}
#[macro_export]
macro_rules! eprintln {
    ($($tt:tt)*) => {
        if let Some(mut stderr) = $crate::__private::arch::Stderr::new() {
            use $crate::__private::core::fmt::Write;
            let _ = $crate::__private::core::writeln!(stderr, $($tt)*);
        }
    };
}

pub fn exit(code: u32) -> ! {
    arch::exit(code)
}

pub fn test_runner(tests: &[&dyn Fn()]) {
    println!("Running {} tests", tests.len());
    for test in tests {
        test();
        println!(" ok");
    }
    exit(0)
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

    exit(1)
}

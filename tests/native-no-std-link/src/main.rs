#![no_main]
#![no_std]
#![warn(rust_2018_idioms, single_use_lifetimes, unsafe_op_in_unsafe_fn)]
#![feature(lang_items, link_cfg)]

#[cfg(any(
    all(
        target_os = "linux",
        any(
            target_env = "gnu",
            all(any(target_env = "musl", target_env = "ohos"), not(target_feature = "crt-static")),
        ),
    ),
    target_os = "android",
    target_os = "freebsd",
))]
#[path = "../../../src/imp/atomic128/detect/aarch64_auxv.rs"]
mod detect;
#[cfg(target_os = "openbsd")]
#[path = "../../../src/imp/atomic128/detect/aarch64_aa64reg.rs"]
mod detect;
#[cfg(target_os = "macos")]
#[path = "../../../src/imp/atomic128/detect/aarch64_macos.rs"]
mod detect;
#[cfg(target_os = "fuchsia")]
#[path = "../../../src/imp/atomic128/detect/aarch64_fuchsia.rs"]
mod detect;
#[cfg(target_os = "windows")]
#[path = "../../../src/imp/atomic128/detect/aarch64_windows.rs"]
mod detect;

// #[cfg(unix)]
// extern "C" {
//     fn dlsym(
//         handle: *mut core::ffi::c_void,
//         symbol: *const core::ffi::c_char,
//     ) -> *mut core::ffi::c_void;
// }

#[no_mangle]
fn main(_argc: isize, _argv: *const *const u8) -> isize {
    // #[cfg(unix)]
    // let g = unsafe { dlsym(0 as *mut _, "getauxval\0".as_ptr().cast()) };
    core::hint::black_box(detect::detect());
    0
}

#[lang = "eh_personality"]
#[no_mangle]
pub extern "C" fn rust_eh_personality() {}

// https://github.com/rust-lang/libc/blob/0.2.139/src/unix/mod.rs#L320-L414
// https://github.com/rust-lang/libc/blob/0.2.139/src/fuchsia/mod.rs#L3342-L3344
// https://github.com/rust-lang/libc/blob/0.2.139/src/wasi.rs#L437-L449
cfg_if::cfg_if! {
    if #[cfg(all(target_os = "linux", any(target_env = "gnu", target_env = "uclibc")))] {
        // #[link(name = "util", kind = "static", modifiers = "-bundle",
        //     cfg(target_feature = "crt-static"))]
        // #[link(name = "rt", kind = "static", modifiers = "-bundle",
        //     cfg(target_feature = "crt-static"))]
        // #[link(name = "pthread", kind = "static", modifiers = "-bundle",
        //     cfg(target_feature = "crt-static"))]
        // #[link(name = "m", kind = "static", modifiers = "-bundle",
        //     cfg(target_feature = "crt-static"))]
        // #[link(name = "dl", kind = "static", modifiers = "-bundle",
        //     cfg(target_feature = "crt-static"))]
        #[link(name = "c", kind = "static", modifiers = "-bundle",
            cfg(target_feature = "crt-static"))]
        #[link(name = "gcc_eh", kind = "static", modifiers = "-bundle",
            cfg(target_feature = "crt-static"))]
        #[link(name = "gcc", kind = "static", modifiers = "-bundle",
            cfg(target_feature = "crt-static"))]
        #[link(name = "c", kind = "static", modifiers = "-bundle",
            cfg(target_feature = "crt-static"))]
        // #[link(name = "util", cfg(not(target_feature = "crt-static")))]
        // #[link(name = "rt", cfg(not(target_feature = "crt-static")))]
        // #[link(name = "pthread", cfg(not(target_feature = "crt-static")))]
        // #[link(name = "m", cfg(not(target_feature = "crt-static")))]
        // #[link(name = "dl", cfg(not(target_feature = "crt-static")))]
        // #[link(name = "c", cfg(not(target_feature = "crt-static")))]
        extern "C" {}
    } else if #[cfg(target_env = "musl")] {
        // #[link(name = "c", kind = "static", modifiers = "-bundle", cfg(target_feature = "crt-static"))]
        // #[link(name = "c", cfg(not(target_feature = "crt-static")))]
        extern "C" {}
    } else if #[cfg(target_os = "emscripten")] {
        // #[link(name = "c")]
        extern "C" {}
    } else if #[cfg(all(target_os = "android"))] {
        // #[link(name = "c", kind = "static", modifiers = "-bundle", cfg(target_feature = "crt-static"))]
        // #[link(name = "m", kind = "static", modifiers = "-bundle", cfg(target_feature = "crt-static"))]
        // #[link(name = "m", cfg(not(target_feature = "crt-static")))]
        // #[link(name = "c", cfg(not(target_feature = "crt-static")))]
        extern "C" {}
    } else if #[cfg(any(target_os = "macos",
                        target_os = "ios",
                        target_os = "tvos",
                        target_os = "watchos",
                        target_os = "android",
                        target_os = "openbsd",
                        target_os = "nto",
                    ))] {
        // #[link(name = "c")]
        // #[link(name = "m")]
        extern "C" {}
    } else if #[cfg(target_os = "haiku")] {
        // #[link(name = "root")]
        // #[link(name = "network")]
        extern "C" {}
    } else if #[cfg(target_env = "newlib")] {
        // #[link(name = "c")]
        // #[link(name = "m")]
        extern "C" {}
    } else if #[cfg(target_os = "hermit")] {
        // no_default_libraries is set to false for HermitCore, so only a link
        // to "pthread" needs to be added.
        // #[link(name = "pthread")]
        extern "C" {}
    } else if #[cfg(target_env = "illumos")] {
        // #[link(name = "c")]
        // #[link(name = "m")]
        extern "C" {}
    } else if #[cfg(target_os = "redox")] {
        // #[link(name = "c", kind = "static", modifiers = "-bundle",
        //                 cfg(target_feature = "crt-static"))]
        // #[link(name = "c", cfg(not(target_feature = "crt-static")))]
        extern "C" {}
    } else {
        // #[link(name = "c")]
        // #[link(name = "m")]
        // #[link(name = "rt")]
        // #[link(name = "pthread")]
        extern "C" {}
    }
}

#[inline(never)]
#[panic_handler]
fn panic(_info: &core::panic::PanicInfo<'_>) -> ! {
    loop {}
}

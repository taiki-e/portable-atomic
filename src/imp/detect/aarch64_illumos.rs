// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
Run-time CPU feature detection on AArch64 illumos by using getisax.

As of Rust 1.97, is_aarch64_feature_detected doesn't support run-time detection on illumos.
https://github.com/rust-lang/rust/blob/1.97.0/library/std_detect/src/detect/mod.rs
*/

include!("common.rs");

// libc requires Rust 1.63
mod ffi {
    pub(crate) use crate::utils::ffi::c_uint;

    sys_const!({
        // Defined in sys/auxv_aarch64.h.
        // https://github.com/richlowe/illumos-gate/blob/arm64-gate/usr/src/uts/common/sys/auxv_aarch64.h
        pub(crate) const AV_AARCH64_LSE: u32 = 1 << 15;
        #[cfg(test)]
        pub(crate) const AV_AARCH64_LRCPC: u32 = 1 << 28;
        #[cfg(test)]
        pub(crate) const AV_AARCH64_2_ILRCPC: u32 = 1 << 1;
        pub(crate) const AV_AARCH64_2_LSE2: u32 = 1 << 2;
    });

    sys_fn!({
        extern "C" {
            // Defined in sys/auxv.h.
            // https://illumos.org/man/2/getisax
            // https://github.com/richlowe/illumos-gate/blob/arm64-gate/usr/src/uts/common/sys/auxv.h
            pub(crate) fn getisax(array: *mut u32, n: c_uint) -> c_uint;
        }
    });
}

#[cold]
#[must_use]
fn _detect(mut info: CpuInfo) -> CpuInfo {
    const OUT_LEN: ffi::c_uint = 2;
    let mut out = [0_u32; OUT_LEN as usize];
    // SAFETY: the pointer is valid because we got it from a reference.
    unsafe {
        ffi::getisax(out.as_mut_ptr(), OUT_LEN);
    }
    macro_rules! check {
        ($x:ident, $flag:ident, $bit:ident) => {
            if $x & ffi::$bit != 0 {
                info.set(CpuInfoFlag::$flag);
            }
        };
    }
    let v1 = out[0];
    check!(v1, lse, AV_AARCH64_LSE);
    #[cfg(test)]
    check!(v1, rcpc, AV_AARCH64_LRCPC);
    let v2 = out[1];
    #[cfg(test)]
    check!(v2, rcpc2, AV_AARCH64_2_ILRCPC);
    check!(v2, lse2, AV_AARCH64_2_LSE2);
    info
}

#[allow(
    clippy::alloc_instead_of_core,
    clippy::std_instead_of_alloc,
    clippy::std_instead_of_core,
    clippy::undocumented_unsafe_blocks,
    clippy::wildcard_imports
)]
#[cfg(test)]
mod tests {
    use std::mem;

    use test_helper::sys;

    use super::*;

    #[test]
    fn test_alternative() {
        use crate::utils::ffi::*;

        // This is almost equivalent to what getisax does.
        //
        // getisax also reads /proc/self/auxv, but unlike getisax, this doesn't use mutex/heap.
        // https://github.com/illumos/illumos-gate/blob/201ceaf7f1701846dee31985748eea1186540f7b/usr/src/lib/libc/port/gen/getauxv.c
        //
        // This is currently used only for testing.
        fn getisax_proc_self_auxv(out: &mut [u32]) -> bool {
            if out.is_empty() {
                return false;
            }
            #[allow(clippy::cast_possible_wrap)]
            let fd =
                unsafe { sys::open(c!("/proc/self/auxv").as_ptr(), sys::O_RDONLY as c_int, 0) };
            if fd == -1 {
                return false;
            }
            let mask = (1 << out.len()) - 1;
            let mut state = mask;
            // SAFETY: auxv_t can be safely zeroed.
            let mut buf: [sys::auxv_t; 8] = unsafe { mem::zeroed() };
            let buf_len = mem::size_of_val(&buf);
            'outer: loop {
                let mut read = 0;
                loop {
                    match unsafe {
                        sys::read(
                            fd,
                            buf.as_mut_ptr().cast::<u8>().add(read).cast::<c_void>(),
                            buf_len - read,
                        )
                    } {
                        0 => break,
                        n if n < 0 => {
                            #[allow(clippy::cast_possible_wrap, clippy::cast_sign_loss)]
                            // SAFETY: errno is thread-local
                            if unsafe { *sys::___errno() as u32 == sys::EINTR } {
                                continue;
                            }
                            state = mask;
                            break 'outer;
                        }
                        #[allow(clippy::cast_sign_loss)]
                        n => {
                            read += n as usize;
                            if read == buf_len {
                                break;
                            }
                        }
                    }
                }
                if read == 0 {
                    break;
                }
                let len = read / mem::size_of::<sys::auxv_t>();
                for aux in &buf[..len] {
                    #[allow(clippy::cast_possible_truncation, clippy::cast_sign_loss)]
                    match aux.a_type as u32 {
                        sys::AT_SUN_HWCAP if state & 0b0001 != 0 => {
                            // SAFETY: aux.a_un is #[repr(C)] union and all fields have
                            // the same size and can be safely transmuted to integers.
                            out[0] = unsafe { aux.a_un.a_val as u32 };
                            state &= !0b0001;
                        }
                        sys::AT_SUN_HWCAP2 if state & 0b0010 != 0 => {
                            // SAFETY: aux.a_un is #[repr(C)] union and all fields have
                            // the same size and can be safely transmuted to integers.
                            out[1] = unsafe { aux.a_un.a_val as u32 };
                            state &= !0b0010;
                        }
                        sys::AT_SUN_HWCAP3 if state & 0b0100 != 0 => {
                            // SAFETY: aux.a_un is #[repr(C)] union and all fields have
                            // the same size and can be safely transmuted to integers.
                            out[2] = unsafe { aux.a_un.a_val as u32 };
                            state &= !0b0100;
                        }
                        sys::AT_NULL => break 'outer,
                        _ => continue,
                    }
                    if state == 0 {
                        break 'outer;
                    }
                }
            }
            unsafe {
                sys::close(fd);
            }
            state != mask
        }

        let mut out1 = [0; 3];
        // SAFETY: the pointer is valid because we got it from a reference.
        unsafe {
            ffi::getisax(out1.as_mut_ptr(), 3);
        }
        let mut out2 = [0; 3];
        assert!(getisax_proc_self_auxv(&mut out2));
        assert_eq!(out1, out2);
    }
}

// SPDX-License-Identifier: Apache-2.0 OR MIT

// Adapted from https://github.com/rust-lang/stdarch.

#![cfg_attr(portable_atomic_sanitize_thread, allow(dead_code))]

// Miri doesn't support inline assembly used in __cpuid: https://github.com/rust-lang/miri/issues/932
// SGX doesn't support CPUID: https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/core_arch/src/x86/cpuid.rs#L102-L105
#[cfg(any(target_env = "sgx", miri))]
compile_error!("internal error: this module is not supported on this environment");

include!("common.rs");

#[cfg(not(portable_atomic_no_asm))]
use core::arch::asm;
use core::arch::x86_64::CpuidResult;

// Workaround for https://github.com/rust-lang/rust/issues/101346
// It is not clear if our use cases are affected, but we implement this just in case.
//
// Refs:
// - https://www.felixcloutier.com/x86/cpuid
// - https://en.wikipedia.org/wiki/CPUID
// - https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/core_arch/src/x86/cpuid.rs
unsafe fn __cpuid(leaf: u32) -> CpuidResult {
    let eax;
    let mut ebx;
    let ecx;
    let edx;
    // SAFETY: the caller must guarantee that CPU supports `cpuid`.
    unsafe {
        asm!(
            "mov {ebx_tmp:r}, rbx", // save rbx which is reserved by LLVM
            "cpuid",
            "xchg {ebx_tmp:r}, rbx", // restore rbx
            ebx_tmp = out(reg) ebx,
            inout("eax") leaf => eax,
            inout("ecx") 0 => ecx,
            out("edx") edx,
            options(nostack, preserves_flags),
        );
    }
    CpuidResult { eax, ebx, ecx, edx }
}

// https://en.wikipedia.org/wiki/CPUID
const _VENDOR_ID_INTEL: [u8; 12] = *b"GenuineIntel";
const _VENDOR_ID_AMD: [u8; 12] = *b"AuthenticAMD";

unsafe fn _vendor_id() -> [u8; 12] {
    // https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/std_detect/src/detect/os/x86.rs#L40-L59
    // SAFETY: the caller must guarantee that CPU supports `cpuid`.
    let CpuidResult { ebx, ecx, edx, .. } = unsafe { __cpuid(0) };
    let vendor_id: [[u8; 4]; 3] = [ebx.to_ne_bytes(), edx.to_ne_bytes(), ecx.to_ne_bytes()];
    // SAFETY: transmute is safe because `[u8; 12]` and `[[u8; 4]; 3]` has the same layout.
    unsafe { core::mem::transmute(vendor_id) }
}

#[cold]
fn _detect(info: &mut CpuInfo) {
    // SAFETY: Calling `__cpuid`` is safe because the CPU has `cpuid` support.
    let proc_info_ecx = unsafe { __cpuid(0x0000_0001_u32).ecx };

    // https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/std_detect/src/detect/os/x86.rs#L111
    if test(proc_info_ecx, 13) {
        info.set(CpuInfo::HAS_CMPXCHG16B);
    }

    // We only use VMOVDQA when SSE is enabled. See atomic_load_vmovdqa() in atomic128/x86_64.rs for more.
    #[cfg(target_feature = "sse")]
    {
        use core::arch::x86_64::_xgetbv;

        // SAFETY: Calling `vendor_id`` is safe because the CPU has `cpuid` support.
        let vendor_id = unsafe { _vendor_id() };

        // VMOVDQA is atomic on Intel and AMD CPUs with AVX.
        // See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104688 for details.
        if vendor_id == _VENDOR_ID_INTEL || vendor_id == _VENDOR_ID_AMD {
            // https://github.com/rust-lang/stdarch/blob/a0c30f3e3c75adcd6ee7efc94014ebcead61c507/crates/std_detect/src/detect/os/x86.rs#L131-L224
            let cpu_xsave = test(proc_info_ecx, 26);
            if cpu_xsave {
                let cpu_osxsave = test(proc_info_ecx, 27);
                if cpu_osxsave {
                    // SAFETY: Calling `_xgetbv`` is safe because the CPU has `xsave` support
                    // and OS has set `osxsave`.
                    let xcr0 = unsafe { _xgetbv(0) };
                    let os_avx_support = xcr0 & 6 == 6;
                    if os_avx_support && test(proc_info_ecx, 28) {
                        info.set(CpuInfo::HAS_VMOVDQA_ATOMIC);
                    }
                }
            }
        }
    }
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
    use std::io::{self, Write};

    use super::*;

    #[test]
    #[cfg_attr(portable_atomic_test_outline_atomics_detect_false, ignore)]
    fn test_cpuid() {
        assert_eq!(std::is_x86_feature_detected!("cmpxchg16b"), detect().has_cmpxchg16b());
        let vendor_id = unsafe { _vendor_id() };
        {
            let stdout = io::stderr();
            let mut stdout = stdout.lock();
            let _ = writeln!(stdout, "\n  vendor_id: {}", std::str::from_utf8(&vendor_id).unwrap());
        }
        if vendor_id == _VENDOR_ID_INTEL || vendor_id == _VENDOR_ID_AMD {
            assert_eq!(std::is_x86_feature_detected!("avx"), detect().has_vmovdqa_atomic());
        } else {
            assert!(!detect().has_vmovdqa_atomic());
        }
    }
}

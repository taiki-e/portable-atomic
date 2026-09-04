// SPDX-License-Identifier: Apache-2.0 OR MIT

/*
Run-time CPU feature detection on AArch64 QNX by reading the system page.

QNX records CPU capabilities in one cpuinfo entry per CPU. QNX SDP 7.1 and
QNX OS 8.0 use different syspage_entry layouts, but both expose the system
page through _syspage_ptr.

Refs:
- https://www.qnx.com/developers/docs/7.1/com.qnx.doc.neutrino.building/topic/syspage/cpuinfo.html
- https://www.qnx.com/developers/docs/8.0/com.qnx.doc.neutrino.building/topic/syspage/cpuinfo.html
- https://github.com/rust-lang/libc/blob/1a8e71f33b1d6ea1e072210e7fc994417bbb2e34/src/unix/nto/mod.rs
- https://github.com/rust-lang/libc/blob/1a8e71f33b1d6ea1e072210e7fc994417bbb2e34/src/unix/nto/neutrino.rs
*/

include!("common.rs");

#[allow(dead_code)]
mod ffi {
    #[derive(Clone, Copy)]
    #[repr(C)]
    pub(crate) struct SyspageEntryInfo {
        pub(crate) entry_off: u16,
        pub(crate) entry_size: u16,
    }

    #[derive(Clone, Copy)]
    #[repr(C)]
    pub(crate) struct SyspageArrayInfo {
        pub(crate) entry_off: u16,
        pub(crate) entry_size: u16,
        pub(crate) element_size: u16,
    }

    // QNX SDP 7.1 <sys/syspage.h>. Only the prefix through new_cpuinfo is
    // needed here.
    #[cfg(all(target_os = "nto", any(target_env = "nto71", target_env = "nto71_iosock"),))]
    #[repr(C, align(8))]
    pub(crate) struct SyspageEntry {
        pub(crate) size: u16,
        pub(crate) total_size: u16,
        pub(crate) type_: u16,
        pub(crate) num_cpu: u16,
        pub(crate) system_private: SyspageEntryInfo,
        pub(crate) old_asinfo: SyspageEntryInfo,
        pub(crate) meminfo: SyspageEntryInfo,
        pub(crate) hwinfo: SyspageEntryInfo,
        pub(crate) old_cpuinfo: SyspageEntryInfo,
        pub(crate) old_cacheattr: SyspageEntryInfo,
        pub(crate) qtime: SyspageEntryInfo,
        pub(crate) callout: SyspageEntryInfo,
        pub(crate) callin: SyspageEntryInfo,
        pub(crate) typed_strings: SyspageEntryInfo,
        pub(crate) strings: SyspageEntryInfo,
        pub(crate) old_intrinfo: SyspageEntryInfo,
        pub(crate) smp: SyspageEntryInfo,
        pub(crate) pminfo: SyspageEntryInfo,
        pub(crate) old_mdriver: SyspageEntryInfo,
        pub(crate) spare0: [u32; 1],
        pub(crate) reserved: [u64; 20],
        pub(crate) new_asinfo: SyspageArrayInfo,
        pub(crate) new_cpuinfo: SyspageArrayInfo,
    }

    // QNX OS 8.0 <sys/syspage.h>. Only the prefix through cpuinfo is needed
    // here.
    #[cfg(any(target_os = "qnx", all(target_os = "nto", target_env = "nto80")))]
    #[repr(C, align(8))]
    pub(crate) struct SyspageEntry {
        pub(crate) size: u16,
        pub(crate) total_size: u16,
        pub(crate) type_: u16,
        pub(crate) num_cpu: u16,
        pub(crate) system_private: SyspageEntryInfo,
        pub(crate) version: [u16; 2],
        pub(crate) hwinfo: SyspageEntryInfo,
        pub(crate) qtime: SyspageEntryInfo,
        pub(crate) callout: SyspageEntryInfo,
        pub(crate) typed_strings: SyspageEntryInfo,
        pub(crate) strings: SyspageEntryInfo,
        pub(crate) smp: SyspageEntryInfo,
        pub(crate) reserved: [u64; 20],
        pub(crate) asinfo: SyspageArrayInfo,
        pub(crate) cpuinfo: SyspageArrayInfo,
    }

    // Defined in <aarch64/syspage.h> since QNX SDP 7.1. This is not wrapped in
    // sys_const! because test-helper does not currently expose QNX syspage
    // constants for its header-value assertion.
    pub(crate) const AARCH64_CPU_FLAG_LSE: u32 = 0x8000;

    extern "C" {
        // Defined in <sys/syspage.h> and exported by libc.
        pub(crate) static mut _syspage_ptr: *mut SyspageEntry;
    }
}

#[cfg(all(target_os = "nto", any(target_env = "nto71", target_env = "nto71_iosock")))]
unsafe fn cpuinfo_array(syspage: *const ffi::SyspageEntry) -> ffi::SyspageArrayInfo {
    // SAFETY: the caller guarantees that syspage points to the QNX system page.
    unsafe { (*syspage).new_cpuinfo }
}

#[cfg(any(target_os = "qnx", all(target_os = "nto", target_env = "nto80")))]
unsafe fn cpuinfo_array(syspage: *const ffi::SyspageEntry) -> ffi::SyspageArrayInfo {
    // SAFETY: the caller guarantees that syspage points to the QNX system page.
    unsafe { (*syspage).cpuinfo }
}

fn qnx_lse() -> bool {
    const FLAGS_OFFSET: usize = 2 * core::mem::size_of::<u32>();
    const FLAGS_END: usize = FLAGS_OFFSET + core::mem::size_of::<u32>();

    // SAFETY: _syspage_ptr is initialized by QNX's process startup code.
    let syspage = unsafe { ffi::_syspage_ptr };
    if syspage.is_null() {
        return false;
    }

    // SAFETY: syspage points to the QNX system page for the lifetime of the
    // process. cpuinfo_array uses the layout selected for this QNX version.
    let (total_size, num_cpu, cpuinfo) = unsafe {
        (
            usize::from((*syspage).total_size),
            usize::from((*syspage).num_cpu),
            cpuinfo_array(syspage),
        )
    };
    let entry_off = usize::from(cpuinfo.entry_off);
    let entry_size = usize::from(cpuinfo.entry_size);
    let element_size = usize::from(cpuinfo.element_size);
    if num_cpu == 0 || element_size < FLAGS_END {
        return false;
    }
    let required_size = match element_size.checked_mul(num_cpu) {
        Some(size) => size,
        None => return false,
    };
    let section_end = match entry_off.checked_add(entry_size) {
        Some(end) => end,
        None => return false,
    };
    if required_size > entry_size || section_end > total_size {
        return false;
    }

    // SAFETY: the section bounds were checked against the system page above.
    let cpuinfo = unsafe { (syspage as *const u8).add(entry_off) };
    for i in 0..num_cpu {
        // cpuinfo_entry starts with cpu, speed, and flags, all unsigned (u32).
        // Use the element size supplied by the system page rather than assuming
        // the size of the rest of cpuinfo_entry.
        // SAFETY: element_size is large enough to contain flags, and the
        // complete array was checked against both entry_size and total_size.
        let flags = unsafe {
            let offset = i * element_size + FLAGS_OFFSET;
            ((cpuinfo.add(offset)) as *const u32).read_unaligned()
        };
        if flags & ffi::AARCH64_CPU_FLAG_LSE == 0 {
            return false;
        }
    }
    true
}

#[cold]
#[must_use]
fn _detect(mut info: CpuInfo) -> CpuInfo {
    if qnx_lse() {
        info.set(CpuInfoFlag::lse);
    }
    info
}

// Used by the dedicated QNX QEMU test binary. Keeping this as a test-only C
// symbol avoids exposing detector internals in the Rust API.
#[cfg(qemu)]
#[no_mangle]
#[allow(unreachable_pub)]
pub extern "C" fn portable_atomic_test_qnx_lse() -> u8 {
    if detect().lse() { 1 } else { 0 }
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
    use super::*;

    #[test]
    #[cfg_attr(portable_atomic_test_detect_false, ignore = "detection disabled")]
    fn test_qnx() {
        let syspage = unsafe { ffi::_syspage_ptr };
        assert!(!syspage.is_null());
        let cpuinfo = unsafe { cpuinfo_array(syspage) };
        let num_cpu = unsafe { (*syspage).num_cpu };
        test_helper::eprintln_nocapture!(
            "QNX syspage cpuinfo: num_cpu={num_cpu}, entry_off={}, entry_size={}, element_size={}, all_lse={}",
            cpuinfo.entry_off,
            cpuinfo.entry_size,
            cpuinfo.element_size,
            qnx_lse(),
        );
        assert_ne!(num_cpu, 0);
        assert!(usize::from(cpuinfo.element_size) >= 3 * core::mem::size_of::<u32>());
        assert_eq!(qnx_lse(), detect().lse());
    }
}

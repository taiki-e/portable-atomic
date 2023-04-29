// Run-time feature detection on powerpc64 Linux/FreeBSD by parsing ELF auxiliary vectors.
//
// See auxv.rs for details.

include!("common.rs");

#[path = "auxv.rs"]
mod auxv;
use auxv::arch;

#[cold]
fn _detect(info: &mut CpuInfo) {
    let hwcap2 = auxv::getauxval(auxv::AT_HWCAP2);

    // power8
    if hwcap2 & arch::PPC_FEATURE2_ARCH_2_07 != 0 {
        info.set(CpuInfo::HAS_QUADWORD_ATOMICS);
    }
}

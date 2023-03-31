// Helper for outline-atomics.
//
// On architectures where DW atomics are not supported on older CPUs, we use
// fallback implementation when DW atomic instructions are not supported and
// outline-atomics is enabled.
//
// This module provides helpers to implement them.

use core::sync::atomic::Ordering;

#[cfg(target_arch = "x86_64")]
#[allow(clippy::upper_case_acronyms)]
pub(crate) type UDW = u128;
#[cfg(target_arch = "x86_64")]
pub(crate) type AtomicUDW = super::super::fallback::AtomicU128;
// #[cfg(target_arch = "x86_64")]
// pub(crate) type AtomicIDW = super::super::fallback::AtomicI128;

#[cfg(target_arch = "arm")]
#[allow(clippy::upper_case_acronyms)]
pub(crate) type UDW = u64;
#[cfg(target_arch = "arm")]
pub(crate) type AtomicUDW = super::super::fallback::AtomicU64;
#[cfg(target_arch = "arm")]
pub(crate) type AtomicIDW = super::super::fallback::AtomicI64;

#[cfg(not(target_arch = "x86_64"))]
#[cold]
pub(crate) unsafe fn atomic_load(src: *mut UDW, order: Ordering) -> UDW {
    #[allow(clippy::cast_ptr_alignment)]
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        (*(src as *const AtomicUDW)).load(order)
    }
}
#[cfg(not(target_arch = "x86_64"))]
fn_alias! {
    #[cold]
    pub(crate) unsafe fn(src: *mut UDW) -> UDW;
    // fallback's atomic load has at least acquire semantics.
    #[cfg(not(target_arch = "arm"))]
    atomic_load_non_seqcst = atomic_load(Ordering::Acquire);
    atomic_load_seqcst = atomic_load(Ordering::SeqCst);
}

#[cfg(not(target_arch = "x86_64"))]
#[cold]
pub(crate) unsafe fn atomic_store(dst: *mut UDW, val: UDW, order: Ordering) {
    #[allow(clippy::cast_ptr_alignment)]
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        (*(dst as *const AtomicUDW)).store(val, order);
    }
}
#[cfg(not(target_arch = "x86_64"))]
fn_alias! {
    #[cold]
    pub(crate) unsafe fn(dst: *mut UDW, val: UDW);
    // fallback's atomic store has at least release semantics.
    #[cfg(not(target_arch = "arm"))]
    atomic_store_non_seqcst = atomic_store(Ordering::Release);
    atomic_store_seqcst = atomic_store(Ordering::SeqCst);
}

#[cold]
pub(crate) unsafe fn atomic_compare_exchange(
    dst: *mut UDW,
    old: UDW,
    new: UDW,
    success: Ordering,
    failure: Ordering,
) -> (UDW, bool) {
    #[allow(clippy::cast_ptr_alignment)]
    // SAFETY: the caller must uphold the safety contract.
    unsafe {
        match (*(dst as *const AtomicUDW)).compare_exchange(old, new, success, failure) {
            Ok(v) => (v, true),
            Err(v) => (v, false),
        }
    }
}
#[cfg(not(target_arch = "x86_64"))]
fn_alias! {
    #[cold]
    pub(crate) unsafe fn(dst: *mut UDW, old: UDW, new: UDW) -> (UDW, bool);
    // fallback's atomic RMW has at least AcqRel semantics.
    #[cfg(not(target_arch = "arm"))]
    atomic_compare_exchange_non_seqcst
        = atomic_compare_exchange(Ordering::AcqRel, Ordering::Acquire);
    atomic_compare_exchange_seqcst
        = atomic_compare_exchange(Ordering::SeqCst, Ordering::SeqCst);
}

macro_rules! atomic_rmw_3 {
    (
        $name:ident($atomic_type:ident::$method_name:ident),
        $non_seqcst_alias:ident, $seqcst_alias:ident
    ) => {
        #[cfg(not(target_arch = "x86_64"))]
        #[cold]
        pub(crate) unsafe fn $name(dst: *mut UDW, val: UDW, order: Ordering) -> UDW {
            #[allow(clippy::cast_ptr_alignment)]
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                (*(dst as *const $atomic_type)).$method_name(val as _, order) as UDW
            }
        }
        #[cfg(not(target_arch = "x86_64"))]
        fn_alias! {
            #[cold]
            pub(crate) unsafe fn(dst: *mut UDW, val: UDW) -> UDW;
            // fallback's atomic RMW has at least AcqRel semantics.
            #[cfg(not(target_arch = "arm"))]
            $non_seqcst_alias = $name(Ordering::AcqRel);
            $seqcst_alias = $name(Ordering::SeqCst);
        }
    };
}
macro_rules! atomic_rmw_2 {
    (
        $name:ident($atomic_type:ident::$method_name:ident),
        $non_seqcst_alias:ident, $seqcst_alias:ident
    ) => {
        #[cfg(not(target_arch = "x86_64"))]
        #[cold]
        pub(crate) unsafe fn $name(dst: *mut UDW, order: Ordering) -> UDW {
            #[allow(clippy::cast_ptr_alignment)]
            // SAFETY: the caller must uphold the safety contract.
            unsafe {
                (*(dst as *const $atomic_type)).$method_name(order) as UDW
            }
        }
        #[cfg(not(target_arch = "x86_64"))]
        fn_alias! {
            #[cold]
            pub(crate) unsafe fn(dst: *mut UDW) -> UDW;
            // fallback's atomic RMW has at least AcqRel semantics.
            #[cfg(not(target_arch = "arm"))]
            $non_seqcst_alias = $name(Ordering::AcqRel);
            $seqcst_alias = $name(Ordering::SeqCst);
        }
    };
}

atomic_rmw_3!(atomic_swap(AtomicUDW::swap), atomic_swap_non_seqcst, atomic_swap_seqcst);
atomic_rmw_3!(atomic_add(AtomicUDW::fetch_add), atomic_add_non_seqcst, atomic_add_seqcst);
atomic_rmw_3!(atomic_sub(AtomicUDW::fetch_sub), atomic_sub_non_seqcst, atomic_sub_seqcst);
atomic_rmw_3!(atomic_and(AtomicUDW::fetch_and), atomic_and_non_seqcst, atomic_and_seqcst);
atomic_rmw_3!(atomic_nand(AtomicUDW::fetch_nand), atomic_nand_non_seqcst, atomic_nand_seqcst);
atomic_rmw_3!(atomic_or(AtomicUDW::fetch_or), atomic_or_non_seqcst, atomic_or_seqcst);
atomic_rmw_3!(atomic_xor(AtomicUDW::fetch_xor), atomic_xor_non_seqcst, atomic_xor_seqcst);
atomic_rmw_3!(atomic_max(AtomicIDW::fetch_max), atomic_max_non_seqcst, atomic_max_seqcst);
atomic_rmw_3!(atomic_umax(AtomicUDW::fetch_max), atomic_umax_non_seqcst, atomic_umax_seqcst);
atomic_rmw_3!(atomic_min(AtomicIDW::fetch_min), atomic_min_non_seqcst, atomic_min_seqcst);
atomic_rmw_3!(atomic_umin(AtomicUDW::fetch_min), atomic_umin_non_seqcst, atomic_umin_seqcst);

atomic_rmw_2!(atomic_not(AtomicUDW::fetch_not), atomic_not_non_seqcst, atomic_not_seqcst);
atomic_rmw_2!(atomic_neg(AtomicUDW::fetch_neg), atomic_neg_non_seqcst, atomic_neg_seqcst);

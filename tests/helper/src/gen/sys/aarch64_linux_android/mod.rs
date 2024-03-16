// SPDX-License-Identifier: Apache-2.0 OR MIT
// This file is @generated by portable-atomic-internal-codegen
// (gen function at tools/codegen/src/ffi.rs).
// It is not intended for manual editing.

#![cfg_attr(rustfmt, rustfmt::skip)]
mod linux_headers_linux_auxvec;
pub use linux_headers_linux_auxvec::AT_HWCAP;
pub use linux_headers_linux_auxvec::AT_HWCAP2;
pub use linux_headers_linux_auxvec::AT_HWCAP3;
pub use linux_headers_linux_auxvec::AT_HWCAP4;
mod linux_headers_linux_prctl;
pub use linux_headers_linux_prctl::PR_GET_AUXV;
mod linux_headers_asm_unistd;
pub use linux_headers_asm_unistd::__NR_prctl;
mod linux_headers_asm_hwcap;
pub use linux_headers_asm_hwcap::HWCAP_FP;
pub use linux_headers_asm_hwcap::HWCAP_ASIMD;
pub use linux_headers_asm_hwcap::HWCAP_EVTSTRM;
pub use linux_headers_asm_hwcap::HWCAP_AES;
pub use linux_headers_asm_hwcap::HWCAP_PMULL;
pub use linux_headers_asm_hwcap::HWCAP_SHA1;
pub use linux_headers_asm_hwcap::HWCAP_SHA2;
pub use linux_headers_asm_hwcap::HWCAP_CRC32;
pub use linux_headers_asm_hwcap::HWCAP_ATOMICS;
pub use linux_headers_asm_hwcap::HWCAP_FPHP;
pub use linux_headers_asm_hwcap::HWCAP_ASIMDHP;
pub use linux_headers_asm_hwcap::HWCAP_CPUID;
pub use linux_headers_asm_hwcap::HWCAP_ASIMDRDM;
pub use linux_headers_asm_hwcap::HWCAP_JSCVT;
pub use linux_headers_asm_hwcap::HWCAP_FCMA;
pub use linux_headers_asm_hwcap::HWCAP_LRCPC;
pub use linux_headers_asm_hwcap::HWCAP_DCPOP;
pub use linux_headers_asm_hwcap::HWCAP_SHA3;
pub use linux_headers_asm_hwcap::HWCAP_SM3;
pub use linux_headers_asm_hwcap::HWCAP_SM4;
pub use linux_headers_asm_hwcap::HWCAP_ASIMDDP;
pub use linux_headers_asm_hwcap::HWCAP_SHA512;
pub use linux_headers_asm_hwcap::HWCAP_SVE;
pub use linux_headers_asm_hwcap::HWCAP_ASIMDFHM;
pub use linux_headers_asm_hwcap::HWCAP_DIT;
pub use linux_headers_asm_hwcap::HWCAP_USCAT;
pub use linux_headers_asm_hwcap::HWCAP_ILRCPC;
pub use linux_headers_asm_hwcap::HWCAP_FLAGM;
pub use linux_headers_asm_hwcap::HWCAP_SSBS;
pub use linux_headers_asm_hwcap::HWCAP_SB;
pub use linux_headers_asm_hwcap::HWCAP_PACA;
pub use linux_headers_asm_hwcap::HWCAP_PACG;
pub use linux_headers_asm_hwcap::HWCAP2_DCPODP;
pub use linux_headers_asm_hwcap::HWCAP2_SVE2;
pub use linux_headers_asm_hwcap::HWCAP2_SVEAES;
pub use linux_headers_asm_hwcap::HWCAP2_SVEPMULL;
pub use linux_headers_asm_hwcap::HWCAP2_SVEBITPERM;
pub use linux_headers_asm_hwcap::HWCAP2_SVESHA3;
pub use linux_headers_asm_hwcap::HWCAP2_SVESM4;
pub use linux_headers_asm_hwcap::HWCAP2_FLAGM2;
pub use linux_headers_asm_hwcap::HWCAP2_FRINT;
pub use linux_headers_asm_hwcap::HWCAP2_SVEI8MM;
pub use linux_headers_asm_hwcap::HWCAP2_SVEF32MM;
pub use linux_headers_asm_hwcap::HWCAP2_SVEF64MM;
pub use linux_headers_asm_hwcap::HWCAP2_SVEBF16;
pub use linux_headers_asm_hwcap::HWCAP2_I8MM;
pub use linux_headers_asm_hwcap::HWCAP2_BF16;
pub use linux_headers_asm_hwcap::HWCAP2_DGH;
pub use linux_headers_asm_hwcap::HWCAP2_RNG;
pub use linux_headers_asm_hwcap::HWCAP2_BTI;
pub use linux_headers_asm_hwcap::HWCAP2_MTE;
pub use linux_headers_asm_hwcap::HWCAP2_ECV;
pub use linux_headers_asm_hwcap::HWCAP2_AFP;
pub use linux_headers_asm_hwcap::HWCAP2_RPRES;
pub use linux_headers_asm_hwcap::HWCAP2_MTE3;
pub use linux_headers_asm_hwcap::HWCAP2_SME;
pub use linux_headers_asm_hwcap::HWCAP2_SME_I16I64;
pub use linux_headers_asm_hwcap::HWCAP2_SME_F64F64;
pub use linux_headers_asm_hwcap::HWCAP2_SME_I8I32;
pub use linux_headers_asm_hwcap::HWCAP2_SME_F16F32;
pub use linux_headers_asm_hwcap::HWCAP2_SME_B16F32;
pub use linux_headers_asm_hwcap::HWCAP2_SME_F32F32;
pub use linux_headers_asm_hwcap::HWCAP2_SME_FA64;
pub use linux_headers_asm_hwcap::HWCAP2_WFXT;
pub use linux_headers_asm_hwcap::HWCAP2_EBF16;
pub use linux_headers_asm_hwcap::HWCAP2_SVE_EBF16;
pub use linux_headers_asm_hwcap::HWCAP2_CSSC;
pub use linux_headers_asm_hwcap::HWCAP2_RPRFM;
pub use linux_headers_asm_hwcap::HWCAP2_SVE2P1;
pub use linux_headers_asm_hwcap::HWCAP2_SME2;
pub use linux_headers_asm_hwcap::HWCAP2_SME2P1;
pub use linux_headers_asm_hwcap::HWCAP2_SME_I16I32;
pub use linux_headers_asm_hwcap::HWCAP2_SME_BI32I32;
pub use linux_headers_asm_hwcap::HWCAP2_SME_B16B16;
pub use linux_headers_asm_hwcap::HWCAP2_SME_F16F16;
pub use linux_headers_asm_hwcap::HWCAP2_MOPS;
pub use linux_headers_asm_hwcap::HWCAP2_HBC;
pub use linux_headers_asm_hwcap::HWCAP2_SVE_B16B16;
pub use linux_headers_asm_hwcap::HWCAP2_LRCPC3;
pub use linux_headers_asm_hwcap::HWCAP2_LSE128;
pub use linux_headers_asm_hwcap::HWCAP2_FPMR;
pub use linux_headers_asm_hwcap::HWCAP2_LUT;
pub use linux_headers_asm_hwcap::HWCAP2_FAMINMAX;
pub use linux_headers_asm_hwcap::HWCAP2_F8CVT;
pub use linux_headers_asm_hwcap::HWCAP2_F8FMA;
pub use linux_headers_asm_hwcap::HWCAP2_F8DP4;
pub use linux_headers_asm_hwcap::HWCAP2_F8DP2;
pub use linux_headers_asm_hwcap::HWCAP2_F8E4M3;
pub use linux_headers_asm_hwcap::HWCAP2_F8E5M2;
pub use linux_headers_asm_hwcap::HWCAP2_SME_LUTV2;
pub use linux_headers_asm_hwcap::HWCAP2_SME_F8F16;
pub use linux_headers_asm_hwcap::HWCAP2_SME_F8F32;
pub use linux_headers_asm_hwcap::HWCAP2_SME_SF8FMA;
pub use linux_headers_asm_hwcap::HWCAP2_SME_SF8DP4;
pub use linux_headers_asm_hwcap::HWCAP2_SME_SF8DP2;
mod sys_auxv;
pub use sys_auxv::getauxval;
mod sys_system_properties;
pub use sys_system_properties::PROP_VALUE_MAX;
pub use sys_system_properties::__system_property_get;
mod elf;
pub use elf::Elf32_auxv_t;
pub use elf::Elf64_auxv_t;
pub type c_char = u8;

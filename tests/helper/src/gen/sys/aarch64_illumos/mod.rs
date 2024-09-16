// SPDX-License-Identifier: Apache-2.0 OR MIT
// This file is @generated by portable-atomic-internal-codegen
// (gen function at tools/codegen/src/ffi.rs).
// It is not intended for manual editing.

#![cfg_attr(rustfmt, rustfmt::skip)]
mod sys_auxv;
pub use sys_auxv::getisax;
mod sys_auxv_aarch64;
pub use sys_auxv_aarch64::AV_AARCH64_FP;
pub use sys_auxv_aarch64::AV_AARCH64_ADVSIMD;
pub use sys_auxv_aarch64::AV_AARCH64_SVE;
pub use sys_auxv_aarch64::AV_AARCH64_CRC32;
pub use sys_auxv_aarch64::AV_AARCH64_SB;
pub use sys_auxv_aarch64::AV_AARCH64_SSBS;
pub use sys_auxv_aarch64::AV_AARCH64_DGH;
pub use sys_auxv_aarch64::AV_AARCH64_AES;
pub use sys_auxv_aarch64::AV_AARCH64_PMULL;
pub use sys_auxv_aarch64::AV_AARCH64_SHA1;
pub use sys_auxv_aarch64::AV_AARCH64_SHA256;
pub use sys_auxv_aarch64::AV_AARCH64_SHA512;
pub use sys_auxv_aarch64::AV_AARCH64_SHA3;
pub use sys_auxv_aarch64::AV_AARCH64_SM3;
pub use sys_auxv_aarch64::AV_AARCH64_SM4;
pub use sys_auxv_aarch64::AV_AARCH64_LSE;
pub use sys_auxv_aarch64::AV_AARCH64_RDM;
pub use sys_auxv_aarch64::AV_AARCH64_FP16;
pub use sys_auxv_aarch64::AV_AARCH64_DOTPROD;
pub use sys_auxv_aarch64::AV_AARCH64_FHM;
pub use sys_auxv_aarch64::AV_AARCH64_DCPOP;
pub use sys_auxv_aarch64::AV_AARCH64_F32MM;
pub use sys_auxv_aarch64::AV_AARCH64_F64MM;
pub use sys_auxv_aarch64::AV_AARCH64_DCPODP;
pub use sys_auxv_aarch64::AV_AARCH64_BF16;
pub use sys_auxv_aarch64::AV_AARCH64_I8MM;
pub use sys_auxv_aarch64::AV_AARCH64_FCMA;
pub use sys_auxv_aarch64::AV_AARCH64_JSCVT;
pub use sys_auxv_aarch64::AV_AARCH64_LRCPC;
pub use sys_auxv_aarch64::AV_AARCH64_PACA;
pub use sys_auxv_aarch64::AV_AARCH64_PACG;
pub use sys_auxv_aarch64::AV_AARCH64_DIT;
pub use sys_auxv_aarch64::AV_AARCH64_2_FLAGM;
pub use sys_auxv_aarch64::AV_AARCH64_2_ILRCPC;
pub use sys_auxv_aarch64::AV_AARCH64_2_LSE2;
pub use sys_auxv_aarch64::AV_AARCH64_2_FLAGM2;
pub use sys_auxv_aarch64::AV_AARCH64_2_FRINTTS;
pub use sys_auxv_aarch64::AV_AARCH64_2_BTI;
pub use sys_auxv_aarch64::AV_AARCH64_2_RNG;
pub use sys_auxv_aarch64::AV_AARCH64_2_MTE;
pub use sys_auxv_aarch64::AV_AARCH64_2_MTE3;
pub use sys_auxv_aarch64::AV_AARCH64_2_ECV;
pub use sys_auxv_aarch64::AV_AARCH64_2_AFP;
pub use sys_auxv_aarch64::AV_AARCH64_2_RPRES;
pub use sys_auxv_aarch64::AV_AARCH64_2_LD64B;
pub use sys_auxv_aarch64::AV_AARCH64_2_ST64BV;
pub use sys_auxv_aarch64::AV_AARCH64_2_ST64BV0;
pub use sys_auxv_aarch64::AV_AARCH64_2_WFXT;
pub use sys_auxv_aarch64::AV_AARCH64_2_MOPS;
pub use sys_auxv_aarch64::AV_AARCH64_2_HBC;
pub use sys_auxv_aarch64::AV_AARCH64_2_CMOW;
pub use sys_auxv_aarch64::AV_AARCH64_2_SVE2;
pub use sys_auxv_aarch64::AV_AARCH64_2_SVE2_AES;
pub use sys_auxv_aarch64::AV_AARCH64_2_SVE2_BITPERM;
pub use sys_auxv_aarch64::AV_AARCH64_2_SVE2_PMULL128;
pub use sys_auxv_aarch64::AV_AARCH64_2_SVE2_SHA3;
pub use sys_auxv_aarch64::AV_AARCH64_2_SVE2_SM4;
pub use sys_auxv_aarch64::AV_AARCH64_2_TME;
pub use sys_auxv_aarch64::AV_AARCH64_2_SME;
pub use sys_auxv_aarch64::AV_AARCH64_2_SME_FA64;
pub use sys_auxv_aarch64::AV_AARCH64_2_EBF16;
pub use sys_auxv_aarch64::AV_AARCH64_2_SME_F64F64;
pub use sys_auxv_aarch64::AV_AARCH64_2_SME_I16I64;
pub type c_char = u8;
#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'
trap -- 's=$?; printf >&2 "%s\n" "${0##*/}:${LINENO}: \`${BASH_COMMAND}\` exit with ${s}"; exit ${s}' ERR
cd -- "$(dirname -- "$0")"/..

# Generates test matrix for CI.
#
# USAGE:
#    ./tools/matrix.sh
#
# This script is intended to be called by gen.sh, but can be called separately.

# FYI: To get the current matrix on normal workflow:
#   pipx run yq '.jobs.test.strategy.matrix' .github/workflows/ci.yml

bail() {
  printf >&2 'error: %s\n' "$*"
  exit 1
}

targets=(
  # x86_64
  x86_64-unknown-linux-gnu
  x86_64-apple-darwin
  x86_64-pc-windows-msvc
  x86_64-pc-windows-gnu

  # x86
  i586-unknown-linux-gnu
  i686-unknown-linux-gnu
  i686-pc-windows-msvc
  i686-pc-windows-gnu

  # aarch64
  aarch64-unknown-linux-gnu    # Linux (glibc) little
  aarch64-apple-darwin         # macOS
  aarch64-apple-ios-macabi     # Mac Catalyst
  aarch64-pc-windows-msvc      # Windows (MSVC)
  aarch64-pc-windows-gnullvm   # Windows (LLVM MinGW)
  aarch64-unknown-linux-musl   # Linux (musl)
  aarch64-linux-android        # Android
  aarch64_be-unknown-linux-gnu # Linux (glibc) big

  # arm64ec
  arm64ec-pc-windows-msvc

  # arm
  armv5te-unknown-linux-gnueabi       # Armv5TE Linux A32
  arm-unknown-linux-gnueabi           # Armv6 Linux A32
  armv7-unknown-linux-gnueabi         # Armv7 Linux A32 sf
  armv7-unknown-linux-gnueabihf       # Armv7 Linux Linux A32 hf
  thumbv7neon-unknown-linux-gnueabihf # Armv7 Linux T32 hf
  armeb-unknown-linux-gnueabi         # Armv8 Linux big A32 sf
  arm-linux-androideabi               # Armv5TE Android A32

  # csky
  # csky-unknown-linux-gnuabiv2   # TODO(csky)
  # csky-unknown-linux-gnuabiv2hf # TODO(csky)

  # hexagon
  # hexagon-unknown-linux-musl # TODO(hexagon)

  # loongarch
  loongarch64-unknown-linux-gnu

  # m68k
  # m68k-unknown-linux-gnu # TODO(m68k)

  # mips
  mips-unknown-linux-gnu
  mipsel-unknown-linux-gnu
  mips64-unknown-linux-gnuabi64
  mips64el-unknown-linux-gnuabi64
  mipsisa32r6-unknown-linux-gnu
  mipsisa32r6el-unknown-linux-gnu
  mipsisa64r6-unknown-linux-gnuabi64
  mipsisa64r6el-unknown-linux-gnuabi64

  # powerpc
  powerpc-unknown-linux-gnu
  powerpc64-unknown-linux-gnu
  powerpc64le-unknown-linux-gnu

  # riscv
  riscv32gc-unknown-linux-gnu
  riscv64gc-unknown-linux-gnu

  # s390x
  s390x-unknown-linux-gnu

  # sparc
  # sparc-unknown-linux-gnu # TODO(sparc)
  sparc64-unknown-linux-gnu
)

# LLVM version table:
# - LLVM 3.9: stable 1.14 - 1.18, ?                         - ?
# - LLVM 4  : stable 1.19 - 1.24, ?                         - ?
# - LLVM 6  : stable 1.25 - 1.28, ?                         - ?
# - LLVM 7  : stable 1.29,        ?                         - ?
# - LLVM 8  : stable 1.30 - 1.37, ?                         - ?
# - LLVM 9  : stable 1.38 - 1.44, ?                         - ?
# - LLVM 10 : stable 1.45 - 1.46, ?                         - nightly-2020-08-23 (1.47)
# - LLVM 11 : stable 1.47 - 1.51, nightly-2020-08-24 (1.47) - nightly-2021-03-04 (1.52)
# - LLVM 12 : stable 1.52 - 1.55, nightly-2021-03-05 (1.52) - nightly-2021-08-21 (1.56)
# - LLVM 13 : stable 1.56 - 1.59, nightly-2021-08-22 (1.56) - nightly-2022-02-17 (1.60)
# - LLVM 14 : stable 1.60 - 1.64, nightly-2022-02-18 (1.60) - nightly-2022-08-12 (1.65)
# - LLVM 15 : stable 1.65 - 1.69, nightly-2022-08-13 (1.65) - nightly-2023-03-25 (1.70)
# - LLVM 16 : stable 1.70 - 1.72, nightly-2023-03-26 (1.70) - nightly-2023-08-08 (1.73)
# - LLVM 17 : stable 1.73 - 1.77, nightly-2023-08-09 (1.73) - nightly-2024-02-13 (1.78)
# - LLVM 18 : stable 1.78 - 1.81, nightly-2024-02-14 (1.78) - nightly-2024-07-31 (1.82)
# - LLVM 19 : stable 1.82 - 1.86, nightly-2024-08-01 (1.82) - nightly-2025-02-17 (1.87)
# - LLVM 20 : stable 1.87 - 1.90, nightly-2025-02-18 (1.87) - nightly-2025-08-06 (1.91)
# - LLVM 21 : stable 1.91 - 1.94, nightly-2025-08-07 (1.91) - nightly-2026-01-28 (1.95), since https://github.com/rust-lang/rust/pull/143684
# - LLVM 22 : stable 1.95 -     , nightly-2026-01-29 (1.95)                            , since https://github.com/rust-lang/rust/pull/150722
# (see also https://github.com/rust-lang/rust/commits/HEAD/src/llvm-project)
# Minimum external LLVM version table:
# - LLVM 3.9: stable 1.23 - 1.28, since https://github.com/rust-lang/rust/pull/45326
# - LLVM 5  : stable 1.29 - 1.32, since https://github.com/rust-lang/rust/pull/51899
# - LLVM 6  : stable 1.33 - 1.40, since https://github.com/rust-lang/rust/pull/56642
# - LLVM 7  : stable 1.41 - 1.43, since https://github.com/rust-lang/rust/pull/66973
# - LLVM 8  : stable 1.44 - 1.49, since https://github.com/rust-lang/rust/pull/71147
# - LLVM 9  : stable 1.50 - 1.52, since https://github.com/rust-lang/rust/pull/78848
# - LLVM 10 : stable 1.53 - 1.57, since https://github.com/rust-lang/rust/pull/83387
# - LLVM 12 : stable 1.58 - 1.64, since https://github.com/rust-lang/rust/pull/90175
# - LLVM 13 : stable 1.65 - 1.68, since https://github.com/rust-lang/rust/pull/100460
# - LLVM 14 : stable 1.69 - 1.72, since https://github.com/rust-lang/rust/pull/107573
# - LLVM 15 : stable 1.73 - 1.75, since https://github.com/rust-lang/rust/pull/114148
# - LLVM 16 : stable 1.76 - 1.78, since https://github.com/rust-lang/rust/pull/117947
# - LLVM 17 : stable 1.79 - 1.82, since https://github.com/rust-lang/rust/pull/122649
# - LLVM 18 : stable 1.83 - 1.87, since https://github.com/rust-lang/rust/pull/130487
# - LLVM 19 : stable 1.88 - 1.91, since https://github.com/rust-lang/rust/pull/139275
# - LLVM 20 : stable 1.92       , since https://github.com/rust-lang/rust/pull/145071
toolchains=(
  1.56 # LLVM 13
  1.64 # LLVM 14
  1.69 # LLVM 15
  1.72 # LLVM 16
  1.77 # LLVM 17
  1.81 # LLVM 18
  1.86 # LLVM 19
  1.90 # LLVM 20
  # 1.94 # LLVM 21
  stable
  beta
  nightly
)
min_stable_toolchain() {
  if [[ -n "${require_nightly}" ]]; then
    toolchain=''
    return
  fi
  case "${target}" in
    arm64ec* | s390x*) toolchain=1.84 ;; # LLVM 19
    *) toolchain=1.59 ;;                 # LLVM 13
  esac
}
min_nightly_toolchain() {
  case "${target}" in
    aarch64_be*) toolchain=nightly-2024-07-31 ;; # Rust 1.82, LLVM 18
    arm64ec*) toolchain=nightly-2024-04-19 ;;    # Rust 1.79, LLVM 18 (https://github.com/rust-lang/rust/pull/123144)
    powerpc64*) toolchain=nightly-2022-02-13 ;;  # Rust 1.60, LLVM 13 (oldest version we can use asm_experimental_arch on this target)
    s390x*) toolchain=nightly-2023-05-09 ;;      # Rust 1.71, LLVM 16 (oldest version we can use asm_experimental_arch on this target)
    riscv32*) toolchain=nightly-2022-08-12 ;;    # Rust 1.65, LLVM 14
    *) toolchain=nightly-2021-08-21 ;;           # Rust 1.56, LLVM 12
  esac
}
convert_toolchain_for_unstable_asm() {
  case "${toolchain}" in
    1.5[6-9])
      case "${target}" in
        *) toolchain=nightly-2022-08-12 ;; # Rust 1.65, LLVM 14
      esac
      ;;
    1.6[0-4])
      case "${target}" in
        *) toolchain=nightly-2022-08-12 ;; # Rust 1.65, LLVM 14
      esac
      ;;
    1.6[5-9])
      case "${target}" in
        *) toolchain=nightly-2023-03-25 ;; # Rust 1.70, LLVM 15
      esac
      ;;
    1.7[0-2])
      case "${target}" in
        *) toolchain=nightly-2023-08-08 ;; # Rust 1.73, LLVM 16
      esac
      ;;
    1.7[3-7])
      case "${target}" in
        *) toolchain=nightly-2024-02-13 ;; # Rust 1.78, LLVM 17
      esac
      ;;
    1.7[8-9] | 1.8[0-1])
      case "${target}" in
        *) toolchain=nightly-2024-07-31 ;; # Rust 1.82, LLVM 18
      esac
      ;;
    1.8[2-6])
      case "${target}" in
        aarch64_be*) toolchain=nightly-2024-11-07 ;; # Rust 1.84, LLVM 19 (broken on nightly-2025-02-17 due to https://github.com/rust-lang/stdarch/issues/1484)
        *) toolchain=nightly-2025-02-17 ;;           # Rust 1.87, LLVM 19
      esac
      ;;
    1.8[7-9] | 1.90)
      toolchain=nightly-2025-08-06 # Rust 1.91, LLVM 20
      ;;
    1.*) bail "unhandled ${toolchain}" ;;
    stable | beta) toolchain='' ;; # ignore
  esac
}

matrix='{"include": []}'
add_matrix() {
  case "${target}" in
    arm64ec* | s390x*)
      case "${toolchain}" in
        1.5[6-9] | 1.6[0-9] | 1.7[0-9] | 1.8[0-3]) convert_toolchain_for_unstable_asm ;;
      esac
      ;;
    *) [[ -z "${require_nightly}" ]] || convert_toolchain_for_unstable_asm ;;
  esac
  if [[ -z "${toolchain}" ]]; then
    return
  fi
  case "${target}" in
    *-windows-gnullvm) ;;
    x86_64-pc-windows-msvc) ;;
    x86_64*-windows* | i?86*-windows*) toolchain="${toolchain}-${target}" ;;
  esac
  local target_out="\"rust\": \"${toolchain}\""
  target_out+=",\"target\": \"${target}\""
  [[ -z "${os}" ]] || target_out+=",\"os\": \"${os}\""
  [[ -z "${flags}" ]] || target_out+=",\"flags\": \"${flags# }\""
  matrix=$(jq -c ".include |= .+ [{${target_out}}]" <<<"${matrix}")
}
for target in "${targets[@]}"; do
  # Check target with unstable asm or tier 3 target.
  require_nightly=''
  case "${target}" in
    aarch64_be* | armeb* | riscv32* | csky* | hexagon* | m68k* | mips* | powerpc* | sparc*)
      require_nightly=1
      ;;
  esac

  # Determine the default runs-on.
  base_os=''
  case "${target}" in
    aarch64-unknown-linux-gnu | armv7*-linux-gnueabihf | thumbv7*-linux-gnueabihf) base_os=ubuntu-24.04-arm ;;
    armeb-unknown-linux-gnueabi) base_os=ubuntu-22.04 ;;
    x86_64*-apple-* | i?86*-apple-*) base_os=macos-15-intel ;;
    aarch64*-apple-* | arm*-apple-*) base_os=macos-latest ;;
    x86_64*-windows* | i?86*-windows*) base_os=windows-latest ;;
    aarch64*-windows* | arm*-windows*) base_os=windows-11-arm ;;
  esac
  os="${base_os}"

  base_flags=''

  test_only_on_nightly=''
  case "${target}" in
    # We have no architecture-specific code for these.
    loongarch* | mips* | powerpc-* | sparc* | arm-unknown-linux-gnueabi | armv7-unknown-linux-gnueabi | armv7-unknown-linux-gnueabihf | armeb-unknown-linux-gnueabi | thumbv7neon-unknown-linux-gnueabihf | arm-linux-androideabi) test_only_on_nightly=1 ;;
    # We have architecture-specific code for these, but OS-specific code are
    # also tested by other targets or have no OS-specific code.
    x86_64-apple-darwin | x86_64-pc-windows-gnu | i586-unknown-linux-gnu | i686-pc-windows-msvc | i686-pc-windows-gnu | aarch64-apple-ios-macabi | aarch64-pc-windows-msvc | aarch64-pc-windows-gnullvm) test_only_on_nightly=1 ;;
  esac
  test_only_on_stable_and_nightly=''
  case "${target}" in
    *-android* | *-linux-musl* | x86_64-pc-windows-msvc) test_only_on_stable_and_nightly=1 ;;
  esac

  if [[ -z "${test_only_on_nightly}" ]] && [[ -z "${test_only_on_stable_and_nightly}" ]]; then
    # Test with min stable toolchain.
    flags="${base_flags}"
    min_stable_toolchain
    add_matrix
    # Test with min nightly toolchain.
    flags="${base_flags}"
    min_nightly_toolchain
    add_matrix
  fi
  # Test other toolchains.
  for toolchain in "${toolchains[@]}"; do
    # To test other Rust/LLVM versions, comment out the following and test_only_on_nightly above:
    case "${toolchain}" in
      1.56 | beta)
        case "${target}" in
          # 64-bit tier 1 only
          # https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1-with-host-tools
          x86_64-unknown-linux-gnu | aarch64-unknown-linux-gnu | aarch64-apple-darwin | x86_64-pc-windows-msvc)
            if [[ -n "${test_only_on_nightly}" ]] || [[ -n "${test_only_on_stable_and_nightly}" ]]; then
              continue
            fi
            ;;
          # x86_64-unknown-linux-gnu | aarch64-unknown-linux-gnu | aarch64-apple-darwin | x86_64-pc-windows-msvc | aarch64-pc-windows-msvc) ;;
          *) continue ;;
        esac
        ;;
      1.*) continue ;;
      nightly) ;;
      stable) [[ -z "${test_only_on_nightly}" ]] || continue ;;
      *)
        if [[ -n "${test_only_on_nightly}" ]] || [[ -n "${test_only_on_stable_and_nightly}" ]]; then
          continue
        fi
        ;;
    esac
    flags="${base_flags}"
    case "${target}" in
      arm64ec* | s390x*)
        case "${toolchain}" in
          1.8[4-6]) toolchain='' ;; # Handled in min stable toolchain
        esac
        ;;
      aarch64_be*)
        case "${toolchain}" in
          1.5[6-9] | 1.6[0-9] | 1.7[0-7]) toolchain='' ;;
        esac
        ;;
      arm-linux-androideabi)
        case "${toolchain}" in
          1.8[3-9] | 1.9[0-4]) toolchain='' ;; # backtrace bug: panicked at /home/runner/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/../../backtrace/src/symbolize/gimli/libs_dl_iterate_phdr.rs:48:30:
          # TODO(arm-android): backtrace bug: panicked at /home/runner/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/../../backtrace/src/symbolize/gimli/libs_dl_iterate_phdr.rs:48:30:
          stable | beta) toolchain='' ;;
          nightly) toolchain=nightly-2024-08-30 ;;
        esac
        ;;
    esac
    add_matrix
  done
  # Test with QEMU.
  case "${target}" in
    aarch64-unknown-linux-gnu | armv7*-linux-gnueabihf | thumbv7*-linux-gnueabihf)
      toolchain=nightly
      os=''
      flags="${base_flags}"
      add_matrix
      os="${base_os}"
      ;;
  esac
  # Test with Rosetta on AArch64.
  case "${target}" in
    x86_64-apple-darwin)
      toolchain=nightly
      os='macos-latest'
      flags="${base_flags}"
      add_matrix
      os="${base_os}"
      ;;
  esac
  # Test with dynamic linking.
  case "${target}" in
    aarch64-unknown-linux-musl)
      flags="${base_flags} -C target-feature=-crt-static"
      toolchain=stable
      add_matrix
      toolchain=nightly
      add_matrix
      ;;
  esac
  # Test with -C panic=abort.
  case "${target}" in
    x86_64-unknown-linux-gnu)
      toolchain=nightly
      flags="${base_flags} -C panic=abort -Z panic_abort_tests"
      add_matrix
      ;;
  esac
  # Test with cranelift backend.
  case "${target}" in
    # https://github.com/rust-lang/rust/blob/1.93.0/src/bootstrap/src/utils/helpers.rs#L228
    # TODO(cranelift): s390x-unknown-linux-gnu: cranelift doesn't support asm for s390x yet
    x86_64-unknown-linux-gnu | aarch64-unknown-linux-gnu | riscv64gc-unknown-linux-gnu | x86_64-apple-darwin | aarch64-apple-darwin | x86_64-pc-windows-msvc)
      toolchain=nightly
      flags="${base_flags} -Z codegen-backend=cranelift"
      add_matrix
      ;;
  esac
  # Test with gcc backend.
  case "${target}" in
    # TODO(gcc): m68k-unknown-linux-gnu
    x86_64-unknown-linux-gnu)
      toolchain=nightly
      flags="${base_flags} -Z codegen-backend=gcc"
      add_matrix
      ;;
  esac
done

jq <<<"${matrix}" >|.github/workflows/test-matrix.json

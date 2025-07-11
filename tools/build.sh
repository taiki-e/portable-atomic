#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'
trap -- 's=$?; printf >&2 "%s\n" "${0##*/}:${LINENO}: \`${BASH_COMMAND}\` exit with ${s}"; exit ${s}' ERR
trap -- 'printf >&2 "%s\n" "${0##*/}: trapped SIGINT"; exit 1' SIGINT
cd -- "$(dirname -- "$0")"/..

# USAGE:
#    ./tools/build.sh [+toolchain] [target]...
#    TESTS=1 ./tools/build.sh [+toolchain] [target]...
#    TARGET_GROUP=tier1/tier2 ./tools/build.sh [+toolchain]
#    TARGET_GROUP=tier3 ./tools/build.sh [+toolchain]

# This is the list of targets to be built by the matrix in CI's "build" job that doesn't set target-group.
#
# Note that many of the targets listed here are those for which we have these target-specific codes
# in our codebase, which does NOT imply that targets not listed here are not supported.
# Almost all targets are checked at least once by the matrix in CI's "build" job that sets target-group.
# Some targets are also checked by calls to this script in CI's "test" or "no-std" job.
default_targets=(
  # no atomic load/store (16-bit)
  # TODO: https://github.com/rust-lang/rust/issues/143072
  # msp430-none-elf
  # msp430-unknown-none-elf # same as msp430-none-elf, but for checking custom target
  # no atomic load/store (32-bit)
  mipsel-sony-psx
  # no atomic load/store (64-bit)
  riscv64i-unknown-none-elf # custom target

  # no atomic CAS (16-bit)
  avr-none
  # no atomic CAS (32-bit)
  thumbv4t-none-eabi
  thumbv6m-none-eabi
  riscv32i-unknown-none-elf
  # no atomic CAS (64-bit)
  bpfel-unknown-none

  # no-std 32-bit with 32-bit atomic
  thumbv7m-none-eabi
  # no-std 64-bit with 64-bit atomic
  x86_64-unknown-none
  # no-std 64-bit with 128-bit atomic
  aarch64-unknown-none

  # x86_64
  # rustc -Z unstable-options --print all-target-specs-json | jq -r '. | to_entries[] | if .value.arch == "x86_64" then .key else empty end'
  x86_64-unknown-linux-gnu
  # with CMPXCHG16B
  x86_64-apple-darwin
  # X32 ABI
  x86_64-unknown-linux-gnux32
  # no CPUID
  x86_64-fortanix-unknown-sgx

  # x86
  # rustc -Z unstable-options --print all-target-specs-json | jq -r '. | to_entries[] | if .value.arch == "x86" then .key else empty end'
  # no SSE
  i586-unknown-linux-gnu
  # with SSE2
  i686-unknown-linux-gnu

  # aarch64
  # rustc -Z unstable-options --print all-target-specs-json | jq -r '. | to_entries[] | if .value.arch == "aarch64" then .key else empty end'
  # rustc -Z unstable-options --print all-target-specs-json | jq -r '. | to_entries[].value | if .arch == "aarch64" then .os else empty end' | LC_ALL=C sort -u
  aarch64-linux-android
  aarch64-pc-windows-msvc
  aarch64-unknown-freebsd
  aarch64-unknown-fuchsia
  aarch64-unknown-linux-gnu
  aarch64-unknown-linux-musl
  aarch64-unknown-linux-uclibc # custom target
  aarch64-unknown-netbsd
  aarch64-unknown-openbsd
  aarch64-unknown-illumos
  # FEAT_LSE & FEAT_LSE2
  aarch64-apple-darwin
  # big endian
  aarch64_be-unknown-linux-gnu
  aarch64_be-unknown-netbsd
  # ILP32 ABI
  aarch64-unknown-linux-gnu_ilp32
  arm64_32-apple-watchos
  # ILP32 ABI big endian
  aarch64_be-unknown-linux-gnu_ilp32

  # arm64ec
  # rustc -Z unstable-options --print all-target-specs-json | jq -r '. | to_entries[] | if .value.arch == "arm64ec" then .key else empty end'
  arm64ec-pc-windows-msvc

  # arm pre-v6 linux-like
  armv4t-unknown-linux-gnueabi
  armv5te-unknown-linux-gnueabi
  arm-linux-androideabi

  # riscv
  # rustc -Z unstable-options --print all-target-specs-json | jq -r '. | to_entries[] | if .value.arch == "riscv32" or .value.arch == "riscv64" then .key else empty end'
  # rustc -Z unstable-options --print all-target-specs-json | jq -r '. | to_entries[].value | if .arch == "riscv32" or .arch == "riscv64" then .os else empty end' | LC_ALL=C sort -u
  # riscv32 with atomic
  riscv32gc-unknown-linux-gnu
  riscv32imac-unknown-none-elf
  riscv32imc-esp-espidf
  # riscv64 with atomic
  riscv64gc-unknown-linux-gnu
  riscv64gc-unknown-linux-musl
  riscv64-linux-android

  # powerpc64
  # rustc -Z unstable-options --print all-target-specs-json | jq -r '. | to_entries[] | if .value.arch == "powerpc64" then .key else empty end'
  # rustc -Z unstable-options --print all-target-specs-json | jq -r '. | to_entries[].value | if .arch == "powerpc64" then .os else empty end' | LC_ALL=C sort -u
  powerpc64-unknown-linux-gnu
  powerpc64le-unknown-linux-gnu
  powerpc64-unknown-linux-musl
  powerpc64le-unknown-linux-musl
  powerpc64-unknown-freebsd
  powerpc64le-unknown-freebsd
  powerpc64-unknown-openbsd
  powerpc64-ibm-aix

  # s390x
  # rustc -Z unstable-options --print all-target-specs-json | jq -r '. | to_entries[] | if .value.arch == "s390x" then .key else empty end'
  s390x-unknown-linux-gnu
)
# NB: sync with:
# - docs.rs metadata in Cargo.toml
# - env.TEST_FEATURES in .github/workflows/ci.yml.
# - test_features list in tools/test.sh.
test_features="float,std,serde,critical-section"
exclude_features="unsafe-assume-single-core,s-mode,force-amo,disable-fiq"

x() {
  (
    set -x
    "$@"
  )
}
x_cargo() {
  if [[ -n "${RUSTFLAGS:-}" ]]; then
    printf '%s\n' "+ RUSTFLAGS='${RUSTFLAGS}' \\"
  fi
  x cargo ${pre_args[@]+"${pre_args[@]}"} "$@"
  printf '\n'
}
retry() {
  for i in {1..10}; do
    if "$@"; then
      return 0
    else
      sleep "${i}"
    fi
  done
  "$@"
}
bail() {
  printf >&2 'error: %s\n' "$*"
  exit 1
}
is_no_std() {
  case "$1" in
    *-linux-none*) ;;
    # https://github.com/rust-lang/rust/blob/1.84.0/library/std/build.rs#L65
    # ESP-IDF and AIX supports std, but they are often broken.
    # aarch64-unknown-linux-uclibc is a custom target and libc/std currently doesn't support it.
    *-none* | *-psp* | *-psx* | *-cuda* | avr* | *-espidf | *-aix | aarch64-unknown-linux-uclibc) return 0 ;;
  esac
  return 1
}

pre_args=()
is_custom_toolchain=''
if [[ "${1:-}" == "+"* ]]; then
  if [[ "$1" == "+esp" ]]; then
    is_custom_toolchain=1
  fi
  pre_args+=("$1")
  shift
fi
if [[ -z "${is_custom_toolchain}" ]]; then
  # shellcheck disable=SC2207
  rustup_targets=($(rustup ${pre_args[@]+"${pre_args[@]}"} target list | cut -d' ' -f1))
fi
# shellcheck disable=SC2207
all_targets=($(rustc ${pre_args[@]+"${pre_args[@]}"} --print target-list))
if [[ -n "${TARGET_GROUP:-}" ]] && [[ -n "${TESTS:-}" ]]; then
  bail "when TARGET_GROUP is set, you cannot use TESTS"
fi
if [[ $# -gt 0 ]]; then
  targets=("$@")
elif [[ -n "${TARGET_GROUP:-}" ]]; then
  case "${TARGET_GROUP}" in
    tier1/tier2) targets=("${rustup_targets[@]}") ;;
    tier3)
      targets=()
      for target in "${all_targets[@]}"; do
        for t in "${rustup_targets[@]}"; do
          if [[ "${target}" == "${t}" ]]; then
            target=''
            break
          fi
        done
        if [[ -n "${target}" ]]; then
          targets+=("${target}")
        fi
      done
      ;;
    *) bail "unrecognized target group '${TARGET_GROUP}'" ;;
  esac
else
  targets=("${default_targets[@]}")
fi

rustup_target_list=''
if [[ -z "${is_custom_toolchain}" ]]; then
  rustup_target_list=$(rustup ${pre_args[@]+"${pre_args[@]}"} target list | cut -d' ' -f1)
fi
rustc_target_list=$(rustc ${pre_args[@]+"${pre_args[@]}"} --print target-list)
rustc_version=$(rustc ${pre_args[@]+"${pre_args[@]}"} -vV | grep -E '^release:' | cut -d' ' -f2)
rustc_minor_version="${rustc_version#*.}"
rustc_minor_version="${rustc_minor_version%%.*}"
llvm_version=$(rustc ${pre_args[@]+"${pre_args[@]}"} -vV | { grep -E '^LLVM version:' || true; } | cut -d' ' -f3)
llvm_version="${llvm_version%%.*}"
commit_date=$(rustc ${pre_args[@]+"${pre_args[@]}"} -vV | grep -E '^commit-date:' | cut -d' ' -f2)
host=$(rustc ${pre_args[@]+"${pre_args[@]}"} -vV | grep -E '^host:' | cut -d' ' -f2)
target_dir=$(pwd)/target
# Do not use check here because it misses some errors such as invalid inline asm operands and LLVM codegen errors.
subcmd=build
if [[ -n "${TARGET_GROUP:-}" ]]; then
  base_args=(hack --no-private "${subcmd}")
else
  if [[ -n "${TESTS:-}" ]]; then
    # TESTS=1 builds binaries, so cargo build requires toolchain and libraries.
    subcmd=check
  fi
  base_args=(hack "${subcmd}")
fi
nightly=''
base_rustflags="${RUSTFLAGS:-}"
strict_provenance_lints=''
if [[ "${rustc_version}" =~ nightly|dev ]]; then
  nightly=1
  if [[ -z "${is_custom_toolchain}" ]]; then
    retry rustup ${pre_args[@]+"${pre_args[@]}"} component add rust-src &>/dev/null
  fi
  # We only run clippy on the recent nightly to avoid old clippy bugs.
  if [[ "${rustc_minor_version}" -ge 86 ]] && [[ -z "${RUSTC:-}" ]] && [[ -n "${TESTS:-}" ]] && [[ -z "${TARGET_GROUP:-}" ]]; then
    subcmd=clippy
    retry rustup ${pre_args[@]+"${pre_args[@]}"} component add clippy &>/dev/null
    base_args=(hack "${subcmd}")
    base_rustflags+=' -Z crate-attr=feature(unqualified_local_imports) -W unqualified_local_imports'
    strict_provenance_lints=' -Z crate-attr=feature(strict_provenance_lints) -W fuzzy_provenance_casts'
  fi
fi
if { sed --help 2>&1 || true; } | grep -Eq -e '-i extension'; then
  in_place=(-i '')
else
  in_place=(-i)
fi
export CARGO_TARGET_DIR="${target_dir}"
export PORTABLE_ATOMIC_DENY_WARNINGS=1

has_asm=''
# asm! requires 1.59
# concat! in asm! requires 1.46.0-nightly (nightly-2020-06-21).
if [[ "${rustc_minor_version}" -ge 59 ]] || { [[ "${rustc_minor_version}" -ge 46 ]] && [[ -n "${nightly}" ]]; }; then
  has_asm=1
fi

build() {
  local target="$1"
  shift
  local args=("${base_args[@]}")
  local target_rustflags="${base_rustflags}"
  if ! grep -Eq "^${target}$" <<<"${rustc_target_list}" || [[ -f "target-specs/${target}.json" ]]; then
    if [[ "${target}" == "avr-none" ]]; then
      target=avr-unknown-gnu-atmega2560 # custom target
    fi
    if [[ ! -f "target-specs/${target}.json" ]]; then
      printf '%s\n' "target '${target}' not available on ${rustc_version} (skipped all checks)"
      return 0
    fi
    if [[ "${rustc_minor_version}" -lt 47 ]]; then
      printf '%s\n' "custom target ('${target}') is not work well with old rustc (${rustc_version}) (skipped all checks)"
      return 0
    fi
    local target_flags=(--target "$(pwd)/target-specs/${target}.json")
  elif [[ "${target}" != "${host}" ]]; then
    local target_flags=(--target "${target}")
  else
    local no_target_flags='1'
  fi
  args+=(${target_flags[@]+"${target_flags[@]}"})
  local cfgs
  if grep -Eq "^${target}$" <<<"${rustup_target_list}"; then
    cfgs=$(RUSTC_BOOTSTRAP=1 rustc ${pre_args[@]+"${pre_args[@]}"} --print cfg ${target_flags[@]+"${target_flags[@]}"})
    retry rustup ${pre_args[@]+"${pre_args[@]}"} target add "${target}" &>/dev/null
    # core/alloc/std sets feature(strict_provenance_lints), so we cannot use
    # -Z crate-attr=feature(strict_provenance_lints) when -Z build-std is needed.
    target_rustflags+="${strict_provenance_lints}"
  elif [[ -n "${nightly}" ]]; then
    # -Z build-std requires 1.39.0-nightly: https://github.com/rust-lang/cargo/pull/7216
    if [[ "${rustc_minor_version}" -lt 39 ]]; then
      printf '%s\n' "-Z build-std not available on ${rustc_version} (skipped all checks for '${target}')"
      return 0
    fi
    cfgs=$(RUSTC_BOOTSTRAP=1 rustc ${pre_args[@]+"${pre_args[@]}"} --print cfg ${target_flags[@]+"${target_flags[@]}"})
    if [[ -n "${TARGET_GROUP:-}" ]]; then
      case "${target}" in
        # builtin xtensa targets are completely broken with builtin LLVM: https://github.com/rust-lang/rust/pull/125141#discussion_r1637484228
        xtensa*) return 0 ;;
        # rustc-LLVM ERROR: Cannot select: 0x7f9dc3256d20: ..., src/num/mod.rs:713:25
        amdgcn*) return 0 ;;
        # error: symbol 'fma' is already defined
        hexagon-unknown-linux-musl) return 0 ;;
        # TODO(m68k): LLVM bug: https://github.com/rust-lang/rust/issues/89498
        m68k*) return 0 ;;
      esac
      args+=(-Z build-std="core")
    elif is_no_std "${target}"; then
      args+=(-Z build-std="core,alloc")
    elif [[ "${rustc_minor_version}" -lt 59 ]]; then
      # On most targets, building std with the version before backtrace-sys was removed is painful.
      # https://github.com/rust-lang/rust/commit/c058a8b8dc5dea0ed9b33e14da9e317e2749fcd7
      # On musl, building std with pre-1.59 nightly requires musl toolchain.
      args+=(-Z build-std="core,alloc")
      args+=(--exclude-features "std")
    elif grep -Eq '^panic="abort"' <<<"${cfgs}"; then
      args+=(-Z build-std="panic_abort,std")
    else
      args+=(-Z build-std)
    fi
  else
    printf '%s\n' "target '${target}' requires nightly compiler (skipped all checks)"
    return 0
  fi
  has_atomic_cas=1
  # target_has_atomic changed in 1.40.0-nightly: https://github.com/rust-lang/rust/pull/65214
  if [[ "${rustc_minor_version}" -ge 40 ]]; then
    if ! grep -Eq '^target_has_atomic=' <<<"${cfgs}"; then
      has_atomic_cas=''
    fi
  else
    if ! grep -Eq '^target_has_atomic="cas"' <<<"${cfgs}"; then
      has_atomic_cas=''
    fi
  fi
  case "${target}" in
    riscv*)
      if [[ -z "${has_atomic_cas}" ]] && [[ -z "${has_asm}" ]]; then
        # RISC-V without A-extension requires asm to implement atomics.
        printf '%s\n' "target '${target}' requires asm to implement atomics (skipped all checks)"
        return 0
      fi
      ;;
    avr*)
      if [[ "${llvm_version}" -eq 16 ]]; then
        # https://github.com/rust-lang/compiler-builtins/issues/523
        target_rustflags+=" -C linker-plugin-lto -C codegen-units=1"
      elif [[ "${llvm_version}" -ge 17 ]]; then
        # https://github.com/rust-lang/rust/issues/88252
        target_rustflags+=" -C opt-level=s"
      fi
      if [[ "${target}" == "avr-none" ]]; then
        # "error: target requires explicitly specifying a cpu with `-C target-cpu`"
        target_rustflags+=" -C target-cpu=atmega2560"
      fi
      ;;
    amdgcn*)
      # "error: target requires explicitly specifying a cpu with `-C target-cpu`"
      target_rustflags+=" -C target-cpu=gfx600"
      ;;
    mips-*-linux-* | mipsel-*-linux-*)
      if ! grep -Eq "^${target}$" <<<"${rustup_target_list}"; then
        # TODO: LLVM bug: Undefined temporary symbol error when building std.
        target_rustflags+=" -C opt-level=1"
      fi
      ;;
  esac
  if [[ "${base_rustflags}" == *"unqualified_local_imports"* ]]; then
    [[ "${target_rustflags}" == *"portable_atomic_unstable_f16"* ]] || target_rustflags+=" --cfg portable_atomic_unstable_f16 --cfg quickcheck_unstable_f16 --cfg rand_unstable_f16"
    [[ "${target_rustflags}" == *"portable_atomic_unstable_f128"* ]] || target_rustflags+=" --cfg portable_atomic_unstable_f128 --cfg quickcheck_unstable_f128 --cfg rand_unstable_f128"
  fi

  if [[ -n "${TESTS:-}" ]]; then
    # We use std in main tests, so we cannot build them on no-std targets.
    # Some no-std targets have target-specific test crates, so build public
    # crates' library part and (if they exist) target-specific test crates.
    if is_no_std "${target}"; then
      local build_util_with_critical_section=''
      if [[ -z "${has_atomic_cas}" ]]; then
        case "${target}" in
          thumbv[4-5]t* | armv[4-5]t* | thumbv6m* | riscv??[ie]-*-none* | riscv??[ie]m-*-none* | riscv??[ie]mc-*-none* | xtensa-esp32s2-*)
            target_rustflags+=" --cfg portable_atomic_unsafe_assume_single_core"
            ;;
          bpf* | mips*) build_util_with_critical_section=1 ;;
        esac
      fi
      # TODO: handle SIGILL and ERR
      sed -E "${in_place[@]}" 's/^# (.* #build:static_assert_ffi)/\1/g' Cargo.toml
      RUSTFLAGS="${target_rustflags} --cfg portable_atomic_test_no_std_static_assert_ffi" \
        x_cargo "${args[@]}" --no-dev-deps --features float --manifest-path Cargo.toml "$@"
      case "${target}" in
        # portable_atomic_outline_atomics only affects AArch64 non-glibc-Linux/illumos, powerpc64, and RISC-V Linux.
        # powerpc64le- (little-endian) is skipped because it is pwr8 by default
        # RISC-V Linux is skipped because outline-atomics is enabled by default.
        aarch64*-linux-gnu*) ;;
        aarch64*-linux-* | aarch64*-illumos* | powerpc64-*)
          CARGO_TARGET_DIR="${target_dir}/outline-atomics" \
            RUSTFLAGS="${target_rustflags} --cfg portable_atomic_test_no_std_static_assert_ffi --cfg portable_atomic_outline_atomics" \
            x_cargo "${args[@]}" --no-dev-deps --features float --manifest-path Cargo.toml "$@"
          ;;
      esac
      sed -E "${in_place[@]}" 's/^(.* #build:static_assert_ffi)/# \1/g' Cargo.toml
      if [[ -z "${build_util_with_critical_section}" ]]; then
        RUSTFLAGS="${target_rustflags}" \
          x_cargo "${args[@]}" --features alloc --manifest-path portable-atomic-util/Cargo.toml "$@"
      else
        RUSTFLAGS="${target_rustflags}" \
          x_cargo "${args[@]}" --features alloc,portable-atomic/critical-section --manifest-path portable-atomic-util/Cargo.toml "$@"
      fi
      # Most target-specific test crates are nightly-only.
      if [[ -n "${nightly}" ]]; then
        local test_dir=''
        # NB: sync with tools/no-std.sh
        case "${target}" in
          armv4t* | thumbv4t*)
            case "${commit_date}" in
              # https://github.com/rust-lang/rust/issues/137512
              2025-02-2[34]) ;;
              *) test_dir=tests/gba ;;
            esac
            ;;
          arm* | thumb* | riscv*) test_dir=tests/no-std-qemu ;;
          avr*) test_dir=tests/avr ;;
          msp430*) test_dir=tests/msp430 ;;
          xtensa*) test_dir=tests/xtensa ;;
        esac
        if [[ -n "${test_dir}" ]]; then
          RUSTFLAGS="${target_rustflags}" \
            x_cargo "${args[@]}" --all-features --manifest-path "${test_dir}"/Cargo.toml "$@"
        fi
      fi
      return 0
    fi
    args+=(
      --tests
      --features "${test_features}"
      --ignore-unknown-features
      --workspace --exclude bench
    )
  elif [[ -n "${TARGET_GROUP:-}" ]]; then
    RUSTFLAGS="${target_rustflags}" \
      x_cargo "${args[@]}" --manifest-path Cargo.toml "$@"
    return 0
  else
    # paste! on statements requires 1.45
    if [[ "${rustc_minor_version}" -ge 45 ]]; then
      if [[ -n "${has_atomic_cas}" ]]; then
        RUSTFLAGS="${target_rustflags}" \
          x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
      else
        # target without CAS requires asm to implement CAS.
        if [[ -n "${has_asm}" ]]; then
          # critical-section requires 1.54
          if [[ "${rustc_minor_version}" -ge 54 ]]; then
            RUSTFLAGS="${target_rustflags}" \
              x_cargo "${args[@]}" --feature-powerset --features portable-atomic/critical-section --manifest-path tests/api-test/Cargo.toml "$@"
          fi
          case "${target}" in
            avr* | msp430*) # always single-core
              RUSTFLAGS="${target_rustflags}" \
                x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
              ;;
            bpf* | mips*) ;;
            *)
              CARGO_TARGET_DIR="${target_dir}/api-test-assume-single-core" \
                RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core" \
                x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
              case "${target}" in
                thumbv[4-5]t* | armv[4-5]t*)
                  CARGO_TARGET_DIR="${target_dir}/api-test-assume-single-core-disable-fiq" \
                    RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_disable_fiq" \
                    x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                  ;;
                riscv*)
                  CARGO_TARGET_DIR="${target_dir}/api-test-assume-single-core-s-mode" \
                    RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_s_mode" \
                    x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                  # .option arch requires 1.72
                  if [[ "${rustc_minor_version}" -ge 72 ]]; then
                    CARGO_TARGET_DIR="${target_dir}/api-test-assume-single-core-force-amo" \
                      RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_force_amo" \
                      x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                    CARGO_TARGET_DIR="${target_dir}/api-test-assume-single-core-zaamo" \
                      RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core -C target-feature=+zaamo" \
                      x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                  fi
                  ;;
              esac
              ;;
          esac
        else
          printf '%s\n' "target '${target}' requires asm to implement atomic CAS (skipped API check)"
        fi
      fi
    fi

    args+=(
      --feature-powerset --depth 2 --optional-deps --no-dev-deps
      ${exclude_features+"--exclude-features=${exclude_features}"}
      --workspace --no-private
    )
    # critical-section requires 1.54
    if [[ "${rustc_minor_version}" -lt 54 ]]; then
      args+=(--exclude-features "critical-section")
    fi
    if is_no_std "${target}"; then
      args+=(--exclude-features "std")
      if [[ -z "${has_atomic_cas}" ]]; then
        if [[ -n "${has_asm}" ]]; then
          case "${target}" in
            avr* | msp430*) ;; # always single-core
            bpf* | mips*) ;;   # TODO, Arc can't be used here yet
            *)
              CARGO_TARGET_DIR="${target_dir}/assume-single-core" \
                RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core" \
                x_cargo "${args[@]}" --exclude-features "critical-section" "$@"
              case "${target}" in
                thumbv[4-5]t* | armv[4-5]t*)
                  CARGO_TARGET_DIR="${target_dir}/assume-single-core-disable-fiq" \
                    RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_disable_fiq" \
                    x_cargo "${args[@]}" --exclude-features "critical-section" "$@"
                  ;;
                riscv*)
                  CARGO_TARGET_DIR="${target_dir}/assume-single-core-s-mode" \
                    RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_s_mode" \
                    x_cargo "${args[@]}" --exclude-features "critical-section" "$@"
                  # .option arch requires 1.72
                  if [[ "${rustc_minor_version}" -ge 72 ]]; then
                    CARGO_TARGET_DIR="${target_dir}/assume-single-core-force-amo" \
                      RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_force_amo" \
                      x_cargo "${args[@]}" --exclude-features "critical-section" "$@"
                    CARGO_TARGET_DIR="${target_dir}/assume-single-core-zaamo" \
                      RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core -C target-feature=+zaamo" \
                      x_cargo "${args[@]}" --exclude-features "critical-section" "$@"
                    CARGO_TARGET_DIR="${target_dir}/zaamo" \
                      RUSTFLAGS="${target_rustflags} -C target-feature=+zaamo" \
                      x_cargo "${args[@]}" --exclude-features "critical-section,require-cas" --exclude portable-atomic-util "$@"
                    # Support for Zabha extension requires LLVM 19+.
                    if [[ "${llvm_version}" -ge 19 ]]; then
                      CARGO_TARGET_DIR="${target_dir}/assume-single-core-zabha" \
                        RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core -C target-feature=+zaamo,+zabha" \
                        x_cargo "${args[@]}" --exclude-features "critical-section" "$@"
                      CARGO_TARGET_DIR="${target_dir}/zabha" \
                        RUSTFLAGS="${target_rustflags} -C target-feature=+zaamo,+zabha" \
                        x_cargo "${args[@]}" --exclude-features "critical-section,require-cas" --exclude portable-atomic-util "$@"
                    fi
                  fi
                  ;;
              esac
              ;;
          esac
        else
          printf '%s\n' "target '${target}' requires asm to implement atomic CAS (skipped build with --cfg portable_atomic_unsafe_assume_single_core)"
        fi
        case "${target}" in
          avr* | msp430*) ;; # always single-core
          *)
            # portable-atomic-util crate and portable-atomic's require-cas feature require atomic CAS,
            # so doesn't work on this target without portable_atomic_unsafe_assume_single_core cfg
            # or critical-section feature.
            args+=(
              --exclude portable-atomic-util
              --exclude-features require-cas
            )
            ;;
        esac
      fi
    fi
  fi
  RUSTFLAGS="${target_rustflags}" \
    x_cargo "${args[@]}" "$@"
  # Check {,no-}outline-atomics
  case "${target}" in
    # portable_atomic_no_outline_atomics only affects x86_64, AArch64, Arm, powerpc64, and RISC-V Linux.
    # outline-atomics is disabled by default on AArch64/powerpc64 musl with static linking, AArch64 illumos, and AIX.
    # powerpc64le- (little-endian) is skipped because it is pwr8 by default
    aarch64*-linux-musl* | aarch64*-illumos* | powerpc64-*-linux-musl* | powerpc64-*-aix) ;;
    x86_64* | aarch64* | arm* | thumb* | powerpc64-* | riscv*-linux-*)
      CARGO_TARGET_DIR="${target_dir}/no-outline-atomics" \
        RUSTFLAGS="${target_rustflags} --cfg portable_atomic_no_outline_atomics" \
        x_cargo "${args[@]}" "$@"
      ;;
  esac
  case "${target}" in
    # portable_atomic_outline_atomics only affects AArch64 non-glibc-Linux/illumos, powerpc64, and RISC-V Linux.
    # powerpc64le- (little-endian) is skipped because it is pwr8 by default
    # RISC-V Linux is skipped because outline-atomics is enabled by default.
    aarch64*-linux-gnu*) ;;
    aarch64*-linux-* | aarch64*-illumos* | powerpc64-*)
      CARGO_TARGET_DIR="${target_dir}/outline-atomics" \
        RUSTFLAGS="${target_rustflags} --cfg portable_atomic_outline_atomics" \
        x_cargo "${args[@]}" "$@"
      CARGO_TARGET_DIR="${target_dir}/outline-atomics-no-outline-atomics" \
        RUSTFLAGS="${target_rustflags} --cfg portable_atomic_outline_atomics --cfg portable_atomic_no_outline_atomics" \
        x_cargo "${args[@]}" "$@"
      ;;
  esac
  # Check target features
  case "${target}" in
    # Only AArch64 and powerpc64 detections are affected by crt-static.
    aarch64* | powerpc64-*)
      # Script to get builtin targets that support crt-static:
      #   rustc -Z unstable-options --print all-target-specs-json | jq -r '. | to_entries[] | if .value."crt-static-respected" == true then .value.os else empty end' | LC_ALL=C sort -u | tr '\n' '|' | sed -E 's/\|$/\n/g'
      if grep -Eq "^target_os=\"(aix|android|freebsd|hurd|linux|nto|redox|teeos|trusty|vxworks|wasi|windows)\"" <<<"${cfgs}"; then
        if grep -Eq '^target_feature="crt-static"' <<<"${cfgs}"; then
          CARGO_TARGET_DIR="${target_dir}/no-crt-static" \
            RUSTFLAGS="${target_rustflags} -C target_feature=-crt-static" \
            x_cargo "${args[@]}" "$@"
          CARGO_TARGET_DIR="${target_dir}/no-crt-static-no-outline-atomics" \
            RUSTFLAGS="${target_rustflags} -C target_feature=-crt-static --cfg portable_atomic_no_outline_atomics" \
            x_cargo "${args[@]}" "$@"
        else
          CARGO_TARGET_DIR="${target_dir}/crt-static" \
            RUSTFLAGS="${target_rustflags} -C target_feature=+crt-static" \
            x_cargo "${args[@]}" ${no_target_flags+"--target=${target}"} "$@"
        fi
      fi
      ;;
  esac
  case "${target}" in
    x86_64*)
      # Apple, Windows (except Windows 7, since Rust 1.78), and Fuchsia (since Rust 1.87) targets are +cmpxchg16b by default
      if ! grep -Eq '^target_feature="cmpxchg16b"' <<<"${cfgs}"; then
        CARGO_TARGET_DIR="${target_dir}/cmpxchg16b" \
          RUSTFLAGS="${target_rustflags} -C target-feature=+cmpxchg16b" \
          x_cargo "${args[@]}" "$@"
        # Check no-outline-atomics
        CARGO_TARGET_DIR="${target_dir}/cmpxchg16b-no-outline-atomics" \
          RUSTFLAGS="${target_rustflags} -C target-feature=+cmpxchg16b --cfg portable_atomic_no_outline_atomics" \
          x_cargo "${args[@]}" "$@"
      fi
      ;;
    aarch64* | arm64*)
      # macOS is +lse,+lse2 by default
      if ! grep -Eq '^target_feature="lse"' <<<"${cfgs}"; then
        CARGO_TARGET_DIR="${target_dir}/lse" \
          RUSTFLAGS="${target_rustflags} -C target-feature=+lse" \
          x_cargo "${args[@]}" "$@"
      fi
      case "${target}" in
        *-darwin) ;;
        *)
          # FEAT_LSE2 doesn't imply FEAT_LSE.
          CARGO_TARGET_DIR="${target_dir}/lse2" \
            RUSTFLAGS="${target_rustflags} -C target-feature=+lse,+lse2" \
            x_cargo "${args[@]}" "$@"
          ;;
      esac
      CARGO_TARGET_DIR="${target_dir}/rcpc3" \
        RUSTFLAGS="${target_rustflags} -C target-feature=+lse,+lse2,+rcpc3" \
        x_cargo "${args[@]}" "$@"
      # FEAT_LSE128 implies FEAT_LSE but not FEAT_LSE2.
      CARGO_TARGET_DIR="${target_dir}/lse128" \
        RUSTFLAGS="${target_rustflags} -C target-feature=+lse2,+lse128" \
        x_cargo "${args[@]}" "$@"
      CARGO_TARGET_DIR="${target_dir}/lse128-rcpc3" \
        RUSTFLAGS="${target_rustflags} -C target-feature=+lse2,+lse128,+rcpc3" \
        x_cargo "${args[@]}" "$@"
      CARGO_TARGET_DIR="${target_dir}/lsfe" \
        RUSTFLAGS="${target_rustflags} -C target-feature=+lsfe" \
        x_cargo "${args[@]}" "$@"
      ;;
    powerpc64-*)
      # powerpc64le- (little-endian) is skipped because it is pwr8 by default
      CARGO_TARGET_DIR="${target_dir}/pwr8" \
        RUSTFLAGS="${target_rustflags} -C target-cpu=pwr8" \
        x_cargo "${args[@]}" "$@"
      ;;
    powerpc64le-*)
      # powerpc64- (big-endian) is skipped because it is pre-pwr8 by default
      CARGO_TARGET_DIR="${target_dir}/pwr7" \
        RUSTFLAGS="${target_rustflags} -C target-cpu=pwr7" \
        x_cargo "${args[@]}" "$@"
      ;;
    riscv*)
      case "${target}" in
        # TODO(riscv): support CAS in riscv.rs when zacas enabled
        riscv??[ie]-* | riscv??[ie]m-* | riscv??[ie]mc-*) ;;
        *)
          CARGO_TARGET_DIR="${target_dir}/zacas" \
            RUSTFLAGS="${target_rustflags} -C target-feature=+zacas" \
            x_cargo "${args[@]}" "$@"
          ;;
      esac
      ;;
    s390x*)
      CARGO_TARGET_DIR="${target_dir}/z196" \
        RUSTFLAGS="${target_rustflags} -C target-cpu=z196" \
        x_cargo "${args[@]}" "$@"
      CARGO_TARGET_DIR="${target_dir}/z15" \
        RUSTFLAGS="${target_rustflags} -C target-cpu=z15" \
        x_cargo "${args[@]}" "$@"
      ;;
  esac
}

for target in "${targets[@]}"; do
  case "${target}" in
    host) target="${host}" ;;
  esac
  if [[ -n "${SKIP_DEFAULT_TARGET:-}" ]]; then
    for default_target in "${default_targets[@]}"; do
      if [[ "${target}" == "${default_target}" ]]; then
        if [[ -n "${CI:-}" ]]; then
          printf '%s\n' "target '${target}' is included in the default targets list and covered by other CI jobs or matrices (skipped all checks)"
        else
          printf '%s\n' "target '${target}' is included in the default targets list (skipped all checks because SKIP_DEFAULT_TARGET is set)"
        fi
        target=''
        break
      fi
    done
    if [[ -z "${target}" ]]; then
      continue
    fi
  fi
  build "${target}"
done

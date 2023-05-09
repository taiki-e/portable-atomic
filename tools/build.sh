#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

# shellcheck disable=SC2154
trap 's=$?; echo >&2 "$0: Error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}' ERR
trap -- 'exit 1' SIGINT

# USAGE:
#    ./tools/build.sh [+toolchain] [target]...
#    TESTS=1 ./tools/build.sh [+toolchain] [target]...
#    TARGET_GROUP=tier1/tier2 ./tools/build.sh [+toolchain]
#    TARGET_GROUP=tier3 ./tools/build.sh [+toolchain]

default_targets=(
    # no atomic load/store (16-bit)
    avr-unknown-gnu-atmega2560 # custom target
    avr-unknown-gnu-atmega328
    msp430-none-elf
    msp430-unknown-none-elf # same as msp430-none-elf, but for checking custom target
    # no atomic load/store (32-bit)
    riscv32i-unknown-none-elf
    mipsel-sony-psx
    # no atomic load/store (64-bit)
    riscv64i-unknown-none-elf # custom target

    # no atomic CAS (32-bit)
    thumbv4t-none-eabi
    thumbv6m-none-eabi
    # no atomic CAS (64-bit)
    bpfeb-unknown-none
    bpfel-unknown-none

    # no-std 32-bit with 32-bit atomic
    thumbv7m-none-eabi
    # no-std 64-bit with 64-bit atomic
    x86_64-unknown-none
    # no-std 64-bit with 128-bit atomic
    aarch64-unknown-none

    # x86_64
    # rustc --print target-list | grep -E '^x86_64'
    x86_64-unknown-linux-gnu
    # x86_64 always support cmpxchg16b
    x86_64-apple-darwin
    # x86_64 X32 ABI
    x86_64-unknown-linux-gnux32
    # x86_64 without CPUID
    x86_64-fortanix-unknown-sgx

    # x86
    i686-unknown-linux-gnu
    i586-unknown-linux-gnu

    # aarch64
    # rustc --print target-list | grep -E '^(aarch64|arm64)'
    aarch64-linux-android
    aarch64-pc-windows-gnullvm
    aarch64-pc-windows-msvc
    aarch64-unknown-freebsd
    aarch64-unknown-fuchsia
    aarch64-unknown-linux-gnu
    aarch64-unknown-linux-musl
    aarch64-unknown-linux-uclibc # custom target
    aarch64-unknown-openbsd
    # aarch64 always support lse & lse2
    aarch64-apple-darwin
    # aarch64 big endian
    aarch64_be-unknown-linux-gnu
    # aarch64 ILP32 ABI
    aarch64-unknown-linux-gnu_ilp32
    # aarch64 ILP32 ABI big endian
    aarch64_be-unknown-linux-gnu_ilp32

    # pre-v6 arm linux-like
    armv4t-unknown-linux-gnueabi
    armv5te-unknown-linux-gnueabi
    arm-linux-androideabi

    # riscv32 with atomic
    riscv32imac-unknown-none-elf
    riscv32imc-esp-espidf
    # riscv64 with atomic
    riscv64gc-unknown-linux-gnu

    # powerpc64
    # rustc --print target-list | grep -E '^powerpc64'
    powerpc64-unknown-linux-gnu
    powerpc64le-unknown-linux-gnu
    powerpc64-unknown-linux-musl
    powerpc64le-unknown-linux-musl
    powerpc64-unknown-freebsd
    powerpc64le-unknown-freebsd

    # s390x
    # rustc --print target-list | grep -E '^s390x'
    s390x-unknown-linux-gnu
)
known_cfgs=(
    # Public APIs
    portable_atomic_unsafe_assume_single_core
    portable_atomic_s_mode
    portable_atomic_disable_fiq
    portable_atomic_no_outline_atomics
    portable_atomic_outline_atomics

    # Not public APIs
    portable_atomic_test_outline_atomics_detect_false
    docsrs
    qemu
    rustfmt
    valgrind
)

x() {
    local cmd="$1"
    shift
    (
        set -x
        "${cmd}" "$@"
    )
}
x_cargo() {
    if [[ -n "${RUSTFLAGS:-}" ]]; then
        echo "+ RUSTFLAGS='${RUSTFLAGS}' \\"
    fi
    RUSTFLAGS="${RUSTFLAGS:-} ${check_cfg:-}" \
        x cargo "$@"
    echo
}
bail() {
    echo "error: $*" >&2
    exit 1
}
is_no_std() {
    case "$1" in
        # https://github.com/rust-lang/rust/blob/1.69.0/library/std/build.rs#L38
        # TODO: aarch64-unknown-linux-uclibc is a custom target and libc/std currently doesn't support it.
        *-none* | *-uefi* | *-psp* | *-psx* | *-cuda* | avr-* | aarch64-unknown-linux-uclibc) return 0 ;;
        *) return 1 ;;
    esac
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
    rustup_targets=($(rustup ${pre_args[@]+"${pre_args[@]}"} target list | sed 's/ .*//g'))
fi
# shellcheck disable=SC2207
all_targets=($(rustc ${pre_args[@]+"${pre_args[@]}"} --print target-list))
if [[ -n "${TARGET_GROUP:-}" ]] && [[ -n "${TESTS:-}" ]]; then
    bail "when TARGET_GROUP is set, you cannot use TESTS"
fi
if [[ $# -gt 0 ]]; then
    targets=("$@")
elif [[ -n "${TARGET_GROUP:-}" ]]; then
    case "${TARGET_GROUP:-}" in
        tier1/tier2) targets=("${rustup_targets[@]}") ;;
        tier3)
            targets=()
            for target in "${all_targets[@]}"; do
                for t in "${rustup_targets[@]}"; do
                    if [[ "${target}" == "${t}" ]]; then
                        target=""
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
    rustup_target_list=$(rustup ${pre_args[@]+"${pre_args[@]}"} target list | sed 's/ .*//g')
fi
rustc_target_list=$(rustc ${pre_args[@]+"${pre_args[@]}"} --print target-list)
rustc_version=$(rustc ${pre_args[@]+"${pre_args[@]}"} -Vv | grep 'release: ' | sed 's/release: //')
rustc_minor_version="${rustc_version#*.}"
rustc_minor_version="${rustc_minor_version%%.*}"
llvm_version=$(rustc ${pre_args[@]+"${pre_args[@]}"} -Vv | (grep 'LLVM version: ' || true) | (sed 's/LLVM version: //' || true))
llvm_version="${llvm_version%%.*}"
host=$(rustc ${pre_args[@]+"${pre_args[@]}"} -Vv | grep 'host: ' | sed 's/host: //')
metadata=$(cargo metadata --format-version=1 --no-deps)
target_dir=$(jq <<<"${metadata}" -r '.target_directory')
subcmd=check
if [[ -n "${TARGET_GROUP:-}" ]]; then
    base_args=(${pre_args[@]+"${pre_args[@]}"} no-dev-deps --no-private "${subcmd}")
else
    case "${TESTS:-}" in
        '') base_args=(${pre_args[@]+"${pre_args[@]}"} hack "${subcmd}") ;;
        *) base_args=(${pre_args[@]+"${pre_args[@]}"} "${subcmd}") ;;
    esac
fi
nightly=''
if [[ "${rustc_version}" == *"nightly"* ]] || [[ "${rustc_version}" == *"dev"* ]]; then
    nightly=1
    if [[ -z "${is_custom_toolchain}" ]]; then
        rustup ${pre_args[@]+"${pre_args[@]}"} component add rust-src &>/dev/null
    fi
    # -Z check-cfg requires 1.63.0-nightly
    # we only check this on the recent nightly to avoid old clippy bugs.
    # shellcheck disable=SC2207
    if [[ "${rustc_minor_version}" -ge 70 ]] && [[ -n "${TESTS:-}" ]] && [[ -z "${TARGET_GROUP:-}" ]]; then
        build_scripts=(build.rs portable-atomic-util/build.rs)
        check_cfg='-Z unstable-options --check-cfg=values(target_pointer_width,"128") --check-cfg=values(target_arch,"xtensa","loongarch64") --check-cfg=values(feature,"cargo-clippy")'
        known_cfgs+=($(grep -E 'cargo:rustc-cfg=' "${build_scripts[@]}" | sed -E 's/^.*cargo:rustc-cfg=//; s/(=\\)?".*$//' | LC_ALL=C sort -u))
        # TODO: handle multi-line target_feature_if
        known_target_feature_values+=($(grep -E 'target_feature_if\("' "${build_scripts[@]}" | sed -E 's/^.*target_feature_if\(//; s/",.*$/"/' | LC_ALL=C sort -u))
        check_cfg+=" --check-cfg=values(portable_atomic_target_feature,$(IFS=',' && echo "${known_target_feature_values[*]}"))"
        check_cfg+=" --check-cfg=names($(IFS=',' && echo "${known_cfgs[*]}"))"
        subcmd=clippy
        rustup ${pre_args[@]+"${pre_args[@]}"} component add clippy &>/dev/null
        target_dir="${target_dir}/check-cfg"
        case "${TESTS:-}" in
            '') base_args=(${pre_args[@]+"${pre_args[@]}"} hack "${subcmd}" -Z check-cfg="names,values,output,features") ;;
            *) base_args=(${pre_args[@]+"${pre_args[@]}"} "${subcmd}" -Z check-cfg="names,values,output,features") ;;
        esac
    fi
fi
export CARGO_TARGET_DIR="${target_dir}"

has_asm=''
# asm! requires 1.59
# concat! in asm! requires 1.46.0-nightly (nightly-2020-06-21).
if [[ "${rustc_minor_version}" -ge 59 ]] || [[ "${rustc_minor_version}" -ge 46 ]] && [[ -n "${nightly}" ]]; then
    has_asm='1'
fi

build() {
    local target="$1"
    shift
    case "${target}" in
        host) target="${host}" ;;
    esac
    local args=("${base_args[@]}")
    local target_rustflags="${RUSTFLAGS:-}"
    if ! grep <<<"${rustc_target_list}" -Eq "^${target}$" || [[ -f "target-specs/${target}.json" ]]; then
        if [[ ! -f "target-specs/${target}.json" ]]; then
            echo "target '${target}' not available on ${rustc_version} (skipped all checks)"
            return 0
        fi
        if [[ "${rustc_minor_version}" -lt 47 ]]; then
            echo "custom target ('${target}') is not work well with old rustc (${rustc_version}) (skipped all checks)"
            return 0
        fi
        local target_flags=(--target "$(pwd)/target-specs/${target}.json")
    else
        local target_flags=(--target "${target}")
    fi
    args+=("${target_flags[@]}")
    cfgs=$(RUSTC_BOOTSTRAP=1 rustc ${pre_args[@]+"${pre_args[@]}"} --print cfg "${target_flags[@]}")
    if grep <<<"${rustup_target_list}" -Eq "^${target}$"; then
        rustup ${pre_args[@]+"${pre_args[@]}"} target add "${target}" &>/dev/null
    elif [[ -n "${nightly}" ]]; then
        # -Z build-std requires 1.39.0-nightly: https://github.com/rust-lang/cargo/pull/7216
        if [[ "${rustc_minor_version}" -lt 39 ]]; then
            echo "-Z build-std not available on ${rustc_version} (skipped all checks for '${target}')"
            return 0
        fi
        if [[ -n "${TARGET_GROUP:-}" ]]; then
            args+=(-Z build-std="core")
        elif is_no_std "${target}"; then
            args+=(-Z build-std="core,alloc")
        elif [[ "${rustc_minor_version}" -lt 59 ]]; then
            # On most targets, building std with the version before backtrace-sys was removed is painful.
            # https://github.com/rust-lang/rust/commit/c058a8b8dc5dea0ed9b33e14da9e317e2749fcd7
            # On musl, building std with pre-1.59 nightly requires musl toolchain.
            args+=(-Z build-std="core,alloc")
            args+=(--exclude-features "std")
        elif grep <<<"${cfgs}" -q 'panic="abort"'; then
            args+=(-Z build-std="panic_abort,std")
        else
            args+=(-Z build-std)
        fi
    else
        echo "target '${target}' requires nightly compiler (skipped all checks)"
        return 0
    fi
    has_atomic_cas='1'
    # target_has_atomic changed in 1.40.0-nightly: https://github.com/rust-lang/rust/pull/65214
    if [[ "${rustc_minor_version}" -ge 40 ]]; then
        if ! grep <<<"${cfgs}" -q 'target_has_atomic='; then
            has_atomic_cas=''
        fi
    else
        if ! grep <<<"${cfgs}" -q 'target_has_atomic="cas"'; then
            has_atomic_cas=''
        fi
    fi
    if [[ "${target}" == "riscv"* ]] && [[ -z "${has_atomic_cas}" ]] && [[ -z "${has_asm}" ]]; then
        # RISC-V without A-extension requires asm to implement atomics.
        echo "target '${target}' requires asm to implement atomics (skipped all checks)"
        return 0
    fi
    if [[ "${target}" == "avr"* ]]; then
        if [[ "${llvm_version}" == "16" ]]; then
            # TODO: LLVM 16 broke AVR: https://github.com/rust-lang/compiler-builtins/issues/523
            echo "target '${target}' is broken with LLVM 16 (skipped all checks)"
            return 0
        fi
        # https://github.com/rust-lang/rust/issues/88252
        target_rustflags+=" -C opt-level=s"
    fi

    if [[ -n "${TESTS:-}" ]]; then
        # We use std in main tests, so we cannot build them on no-std targets.
        # Some no-std targets have target-specific test crates, so build public
        # crates' library part and (if they exist) target-specific test crates.
        if is_no_std "${target}"; then
            local build_util_with_critical_section=''
            if [[ -z "${has_atomic_cas}" ]]; then
                case "${target}" in
                    thumbv[4-5]t* | armv[4-5]t* | thumbv6m* | riscv??i-*-none* | riscv??im-*-none* | riscv??imc-*-none*)
                        target_rustflags+=" --cfg portable_atomic_unsafe_assume_single_core"
                        ;;
                    bpf* | mips*) build_util_with_critical_section='1' ;;
                esac
            fi
            RUSTFLAGS="${target_rustflags}" \
                x_cargo "${args[@]}" --features float --manifest-path Cargo.toml "$@"
            if [[ -z "${build_util_with_critical_section}" ]]; then
                RUSTFLAGS="${target_rustflags}" \
                    x_cargo "${args[@]}" --features alloc --manifest-path portable-atomic-util/Cargo.toml "$@"
            else
                RUSTFLAGS="${target_rustflags}" \
                    x_cargo "${args[@]}" --features alloc,portable-atomic/critical-section --manifest-path portable-atomic-util/Cargo.toml "$@"
            fi
            # target-specific test crates are nightly-only.
            if [[ -n "${nightly}" ]]; then
                local test_dir=''
                # NB: sync with tools/no-std.sh
                case "${target}" in
                    armv4t* | thumbv4t*) test_dir=tests/gba ;;
                    arm* | thumb* | riscv*) test_dir=tests/no-std-qemu ;;
                    avr-unknown-gnu-atmega2560) test_dir=tests/avr ;; # tests/avr is for atmega2560 not atmega328
                esac
                if [[ -n "${test_dir}" ]]; then
                    RUSTFLAGS="${target_rustflags}" \
                        x_cargo "${args[@]}" --all-features --manifest-path "${test_dir}"/Cargo.toml "$@"
                fi
            fi
            return 0
        fi
        args+=(
            --all-features --tests
            --workspace --exclude bench --exclude portable-atomic-internal-codegen
        )
    elif [[ -n "${TARGET_GROUP:-}" ]]; then
        case "${target}" in
            # TODO: rustc bug: https://github.com/rust-lang/rust/issues/111217
            arm64_32-apple-watchos) return 0 ;;
            # TODO: LLVM bug: https://github.com/rust-lang/rust/issues/89498
            m68k-unknown-linux-gnu) return 0 ;;
            # TODO: rustc bug: will be fixed by https://github.com/rust-lang/rust/pull/103503
            x86_64-apple-tvos) return 0 ;;
        esac
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
                        avr-* | msp430-*) # always single-core
                            RUSTFLAGS="${target_rustflags}" \
                                x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                            ;;
                        bpf* | mips*) ;;
                        *)
                            RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core" \
                                x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                            case "${target}" in
                                thumbv[4-5]t* | armv[4-5]t*)
                                    RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_disable_fiq" \
                                        x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                                    ;;
                                riscv*)
                                    RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core --cfg portable_atomic_s_mode" \
                                        x_cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                                    ;;
                            esac
                            ;;
                    esac
                else
                    echo "target '${target}' requires asm to implement atomic CAS (skipped API check)"
                fi
            fi
        fi

        args+=(
            --workspace --ignore-private
            --no-dev-deps --feature-powerset --depth 2 --optional-deps
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
                        avr-* | msp430-*) ;; # always single-core
                        bpf* | mips*) ;;     # TODO, Arc can't be used here yet
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
                                    ;;
                            esac
                            ;;
                    esac
                else
                    echo "target '${target}' requires asm to implement atomic CAS (skipped build with --cfg portable_atomic_unsafe_assume_single_core)"
                fi
                case "${target}" in
                    avr-* | msp430-*) ;; # always single-core
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
        # portable_atomic_no_outline_atomics only affects x86_64, aarch64, arm, and powerpc64.
        # powerpc64 is skipped because outline-atomics is currently disabled by default on powerpc64.
        x86_64* | aarch64* | arm*)
            CARGO_TARGET_DIR="${target_dir}/no-outline-atomics" \
                RUSTFLAGS="${target_rustflags} --cfg portable_atomic_no_outline_atomics" \
                x_cargo "${args[@]}" "$@"
            ;;
    esac
    case "${target}" in
        # portable_atomic_outline_atomics only affects aarch64 Linux and powerpc64.
        # powerpc64le- (little-endian) is skipped because it is pwr8 by default
        aarch64*-linux-* | powerpc64-*)
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
        mips*-linux-musl*) ;; # -crt-static by default
        *-linux-musl*)
            CARGO_TARGET_DIR="${target_dir}/no-crt-static" \
                RUSTFLAGS="${target_rustflags} -C target_feature=-crt-static" \
                x_cargo "${args[@]}" "$@"
            CARGO_TARGET_DIR="${target_dir}/no-crt-static-no-outline-atomics" \
                RUSTFLAGS="${target_rustflags} -C target_feature=-crt-static --cfg portable_atomic_no_outline_atomics" \
                x_cargo "${args[@]}" "$@"
            ;;
    esac
    case "${target}" in
        x86_64*)
            # macOS is skipped because it is +cmpxchg16b by default
            case "${target}" in
                *-darwin) ;;
                *)
                    CARGO_TARGET_DIR="${target_dir}/cmpxchg16b" \
                        RUSTFLAGS="${target_rustflags} -C target-feature=+cmpxchg16b" \
                        x_cargo "${args[@]}" "$@"
                    # Check no-outline-atomics
                    CARGO_TARGET_DIR="${target_dir}/cmpxchg16b-no-outline-atomics" \
                        RUSTFLAGS="${target_rustflags} -C target-feature=+cmpxchg16b --cfg portable_atomic_no_outline_atomics" \
                        x_cargo "${args[@]}" "$@"
                    ;;
            esac
            ;;
        aarch64* | arm64*)
            # macOS is skipped because it is +lse,+lse2 by default
            case "${target}" in
                *-darwin) ;;
                *)
                    CARGO_TARGET_DIR="${target_dir}/lse" \
                        RUSTFLAGS="${target_rustflags} -C target-feature=+lse" \
                        x_cargo "${args[@]}" "$@"
                    # FEAT_LSE2 doesn't imply FEAT_LSE.
                    CARGO_TARGET_DIR="${target_dir}/lse2" \
                        RUSTFLAGS="${target_rustflags} -C target-feature=+lse,+lse2" \
                        x_cargo "${args[@]}" "$@"
                    ;;
            esac
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
    esac
}

for target in "${targets[@]}"; do
    build "${target}"
done

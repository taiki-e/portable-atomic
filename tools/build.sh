#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

trap -- 'exit 0' SIGINT

default_targets=(
    # no atomic load/store (16-bit)
    avr-unknown-gnu-atmega328
    msp430-none-elf
    # no atomic load/store (32-bit)
    riscv32i-unknown-none-elf
    riscv32im-unknown-none-elf
    riscv32imc-unknown-none-elf
    # no atomic load/store (64-bit)
    riscv64i-unknown-none-elf

    # no atomic CAS (32-bit)
    thumbv4t-none-eabi
    thumbv6m-none-eabi
    # no atomic CAS (64-bit)
    bpfeb-unknown-none
    bpfel-unknown-none

    # no-std 32-bit
    thumbv7m-none-eabi
    # no-std 64-bit
    x86_64-unknown-none
    # x86_64 X32 ABI
    x86_64-unknown-linux-gnux32
    # no-std 64-bit has Atomic{I,U}128
    aarch64-unknown-none
    # aarch64 no Atomic{I,U}128
    aarch64-pc-windows-msvc
    # aarch64 has Atomic{I,U}128
    aarch64-unknown-freebsd
    # aarch64 always support lse
    aarch64-apple-darwin
    # aarch64_be
    aarch64_be-unknown-linux-gnu
    # aarch64 ILP32 ABI
    aarch64-unknown-linux-gnu_ilp32
    # aarch64 ILP32 ABI big endian
    aarch64_be-unknown-linux-gnu_ilp32
    # riscv32 with atomic
    riscv32imac-unknown-none-elf
    riscv32imc-esp-espidf

    # tier 1 targets
    aarch64-unknown-linux-gnu
    i686-pc-windows-gnu
    i686-pc-windows-msvc
    i686-unknown-linux-gnu
    x86_64-apple-darwin
    x86_64-pc-windows-gnu
    x86_64-pc-windows-msvc
    x86_64-unknown-linux-gnu

    # tier 2 targets we run tests on CI
    arm-unknown-linux-gnueabi
    armv5te-unknown-linux-gnueabi
    armv7-unknown-linux-gnueabi
    armv7-unknown-linux-gnueabihf
    i586-unknown-linux-gnu
    mips-unknown-linux-gnu
    mips64-unknown-linux-gnuabi64
    mips64el-unknown-linux-gnuabi64
    mipsel-unknown-linux-gnu
    powerpc-unknown-linux-gnu
    powerpc64-unknown-linux-gnu
    powerpc64le-unknown-linux-gnu
    riscv64gc-unknown-linux-gnu
    s390x-unknown-linux-gnu
    sparc64-unknown-linux-gnu
    thumbv7neon-unknown-linux-gnueabihf
)
known_cfgs=(
    docsrs
    portable_atomic_unsafe_assume_single_core
)

x() {
    local cmd="$1"
    shift
    (
        set -x
        "${cmd}" "$@"
    )
}

pre_args=()
if [[ "${1:-}" == "+"* ]]; then
    pre_args+=("$1")
    shift
fi
if [[ $# -gt 0 ]]; then
    targets=("$@")
else
    targets=("${default_targets[@]}")
fi

rustup_target_list=$(rustup ${pre_args[@]+"${pre_args[@]}"} target list)
rustc_target_list=$(rustc ${pre_args[@]+"${pre_args[@]}"} --print target-list)
rustc_version=$(rustc ${pre_args[@]+"${pre_args[@]}"} -Vv | grep 'release: ' | sed 's/release: //')
base_args=(${pre_args[@]+"${pre_args[@]}"} hack build)
nightly=''
if [[ "${rustc_version}" == *"nightly"* ]] || [[ "${rustc_version}" == *"dev"* ]]; then
    nightly=1
    rustup ${pre_args[@]+"${pre_args[@]}"} component add rust-src &>/dev/null
    case "${rustc_version}" in
        # -Z check-cfg requires 1.63.0-nightly
        1.[0-5]* | 1.6[0-2].*) ;;
        *)
            # TODO: handle key-value cfg from build script as --check-cfg=values(name, "value1", "value2", ... "valueN")
            # shellcheck disable=SC2207
            known_cfgs+=($(grep -E 'cargo:rustc-cfg=' build.rs portable-atomic-util/build.rs | sed -E 's/^.*cargo:rustc-cfg=//' | sed -E 's/(=\\)?".*$//' | LC_ALL=C sort | uniq))
            check_cfg="-Z unstable-options --check-cfg=names($(IFS=',' && echo "${known_cfgs[*]}")) --check-cfg=values(target_pointer_width,\"128\") --check-cfg=values(feature,\"cargo-clippy\")"
            rustup ${pre_args[@]+"${pre_args[@]}"} component add clippy &>/dev/null
            base_args=(${pre_args[@]+"${pre_args[@]}"} hack clippy -Z check-cfg="names,values,output,features")
            ;;
    esac
fi
echo "base rustflags='${RUSTFLAGS:-} ${check_cfg:-}'"

has_asm=''
case "${rustc_version}" in
    # asm requires 1.59
    1.[0-4]* | 1.5[0-8].*)
        if [[ -n "${nightly}" ]]; then
            has_asm='1'
        fi
        ;;
    *) has_asm='1' ;;
esac

build() {
    local target="$1"
    shift
    local args=("${base_args[@]}")
    local target_rustflags="${RUSTFLAGS:-} ${check_cfg:-}"
    if ! grep <<<"${rustc_target_list}" -Eq "^${target}$"; then
        if [[ ! -f "target-specs/${target}.json" ]]; then
            echo "target '${target}' not available on ${rustc_version} (skipped all checks)"
            return 0
        fi
        local target_flags=(--target "$(pwd)/target-specs/${target}.json")
    else
        local target_flags=(--target "${target}")
    fi
    args+=("${target_flags[@]}")
    if grep <<<"${rustup_target_list}" -Eq "^${target}( |$)"; then
        x rustup ${pre_args[@]+"${pre_args[@]}"} target add "${target}" &>/dev/null
    elif [[ -n "${nightly}" ]]; then
        case "${target}" in
            *-none* | avr-* | *-esp-espidf) args+=(-Z build-std="core,alloc") ;;
            *) args+=(-Z build-std) ;;
        esac
    else
        echo "target '${target}' requires nightly compiler (skipped all checks)"
        return 0
    fi
    if [[ "${target}" == "avr-"* ]]; then
        # https://github.com/rust-lang/rust/issues/88252
        target_rustflags="${target_rustflags} -C opt-level=s"
    fi
    cfgs=$(RUSTC_BOOTSTRAP=1 rustc ${pre_args[@]+"${pre_args[@]}"} --print cfg "${target_flags[@]}")
    has_atomic_cas='1'
    if ! grep <<<"${cfgs}" -q "target_has_atomic="; then
        has_atomic_cas=''
    fi
    if [[ "${target}" == "riscv"* ]] && [[ -z "${has_atomic_cas}" ]] && [[ -z "${has_asm}" ]]; then
        # RISC-V without A-extension requires asm to implement atomics.
        echo "target '${target}' requires asm to implement atomics (skipped all checks)"
        return 0
    fi

    case "${rustc_version}" in
        # paste! on statements requires 1.45
        1.[0-3]* | 1.4[0-4].*) ;;
        *)
            if [[ -n "${has_atomic_cas}" ]]; then
                RUSTFLAGS="${target_rustflags}" \
                    x cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
            else
                # target without CAS requires asm to implement CAS.
                if [[ -n "${has_asm}" ]]; then
                    case "${target}" in
                        avr-* | msp430-*) # always single-core
                            RUSTFLAGS="${target_rustflags}" \
                                x cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                            ;;
                        bpf*) ;; # TODO
                        *)
                            RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core" \
                                x cargo "${args[@]}" --feature-powerset --manifest-path tests/api-test/Cargo.toml "$@"
                            ;;
                    esac
                else
                    echo "target '${target}' requires asm to implement atomic CAS (skipped API check)"
                fi
            fi
            ;;
    esac

    args+=(
        --workspace --ignore-private --exclude portable-atomic-derive
        --no-dev-deps --feature-powerset --depth 3 --optional-deps --exclude-features "portable-atomic-derive"
    )
    case "${target}" in
        x86_64* | aarch64* | arm64*) ;;
        # outline-atomics feature only affects x86_64 and aarch64.
        *) args+=(--exclude-features "outline-atomics") ;;
    esac
    case "${target}" in
        *-none* | avr-* | *-esp-espidf)
            args+=(--exclude-features "std")
            if ! grep <<<"${cfgs}" -q "target_has_atomic=" && [[ -n "${has_asm}" ]]; then
                case "${target}" in
                    avr-* | msp430-*) ;; # always single-core
                    bpf*) args+=(--exclude portable-atomic-util) ;; # TODO, Arc can't be used here yet
                    *)
                        RUSTFLAGS="${target_rustflags} --cfg portable_atomic_unsafe_assume_single_core" \
                            x cargo "${args[@]}" --target-dir target/assume-single-core "$@"
                        # portable-atomic-util uses atomic CAS, so doesn't work on
                        # this target without portable_atomic_unsafe_assume_single_core cfg.
                        args+=(--exclude portable-atomic-util)
                        ;;
                esac
            fi
            ;;
    esac
    RUSTFLAGS="${target_rustflags}" \
        x cargo "${args[@]}" "$@"
    case "${target}" in
        x86_64*)
            RUSTFLAGS="${target_rustflags} -C target-feature=+cmpxchg16b" \
                x cargo "${args[@]}" --target-dir target/cmpxchg16b "$@"
            ;;
        aarch64* | arm64*)
            RUSTFLAGS="${target_rustflags} -C target-feature=+lse" \
                x cargo "${args[@]}" --target-dir target/lse "$@"
            RUSTFLAGS="${target_rustflags} -C target-feature=+lse,+lse2" \
                x cargo "${args[@]}" --target-dir target/lse2 "$@"
            ;;
        powerpc64-*)
            RUSTFLAGS="${target_rustflags} -C target-cpu=pwr8" \
                x cargo "${args[@]}" --target-dir target/pwr8 "$@"
            ;;
        powerpc64le-*)
            RUSTFLAGS="${target_rustflags} -C target-cpu=pwr7" \
                x cargo "${args[@]}" --target-dir target/pwr7 "$@"
            ;;
    esac
}

for target in "${targets[@]}"; do
    build "${target}"
done

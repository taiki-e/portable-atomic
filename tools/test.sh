#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

# shellcheck disable=SC2154
trap 's=$?; echo >&2 "$0: Error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}' ERR
trap -- 'exit 1' SIGINT

# USAGE:
#    ./tools/test.sh [+toolchain] [cargo_options]...

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
    if [[ -n "${RUSTDOCFLAGS:-}" ]]; then
        echo "+ RUSTDOCFLAGS='${RUSTDOCFLAGS}' \\"
    fi
    if [[ -n "${CARGO_PROFILE_RELEASE_CODEGEN_UNITS:-}" ]]; then
        echo "+ CARGO_PROFILE_RELEASE_CODEGEN_UNITS='${CARGO_PROFILE_RELEASE_CODEGEN_UNITS}' \\"
    fi
    if [[ -n "${CARGO_PROFILE_RELEASE_LTO:-}" ]]; then
        echo "+ CARGO_PROFILE_RELEASE_LTO='${CARGO_PROFILE_RELEASE_LTO}' \\"
    fi
    if [[ -n "${TS:-}" ]]; then
        x "${cargo}" "$@" 2>&1 | "${TS}" -i '%.s  '
    else
        x "${cargo}" "$@"
    fi
    echo
}
bail() {
    echo >&2 "error: $*"
    exit 1
}

pre_args=()
if [[ "${1:-}" == "+"* ]]; then
    pre_args+=("$1")
    shift
fi
target=''
build_std=''
tests=()
cargo_options=()
rest_cargo_options=()
while [[ $# -gt 0 ]]; do
    case "$1" in
        --)
            rest_cargo_options=("$@")
            break
            ;;
        --target)
            shift
            target="$1"
            ;;
        --target=*) target="${1#--target=}" ;;
        --tests) tests=("$1") ;;
        -Zbuild-std | -Zbuild-std=* | build-std | build-std=*)
            cargo_options+=("$1")
            build_std=1
            ;;
        *) cargo_options+=("$1") ;;
    esac
    shift
done

cargo="${cargo:-cargo}"
if type -P rustup &>/dev/null; then
    rustup_target_list=$(rustup ${pre_args[@]+"${pre_args[@]}"} target list | sed 's/ .*//g')
fi
rustc_target_list=$(rustc ${pre_args[@]+"${pre_args[@]}"} --print target-list)
rustc_version=$(rustc ${pre_args[@]+"${pre_args[@]}"} -Vv | grep 'release: ' | sed 's/release: //')
rustc_minor_version="${rustc_version#*.}"
rustc_minor_version="${rustc_minor_version%%.*}"
host=$(rustc ${pre_args[@]+"${pre_args[@]}"} -Vv | grep 'host: ' | sed 's/host: //')
nightly=''
if [[ "${rustc_version}" == *"nightly"* ]] || [[ "${rustc_version}" == *"dev"* ]]; then
    nightly=1
    if type -P rustup &>/dev/null; then
        rustup ${pre_args[@]+"${pre_args[@]}"} component add rust-src &>/dev/null
    fi
fi
export RUST_TEST_THREADS=1
if [[ -n "${CI:-}" ]]; then
    if type -P ts &>/dev/null; then
        TS=ts
    elif [[ -e C:/msys64/usr/bin/ts ]]; then
        TS=C:/msys64/usr/bin/ts
    fi
fi

args=()
if [[ -z "${target}" ]] && [[ -n "${build_std}" ]]; then
    target="${target:-"${host}"}"
fi
if [[ -n "${target}" ]]; then
    if ! grep <<<"${rustc_target_list}" -Eq "^${target}$" || [[ -f "target-specs/${target}.json" ]]; then
        if [[ ! -f "target-specs/${target}.json" ]]; then
            bail "target '${target}' not available on ${rustc_version}"
        fi
        target_flags=(--target "$(pwd)/target-specs/${target}.json")
    else
        target_flags=(--target "${target}")
    fi
    args+=("${target_flags[@]}")
    if type -P rustup &>/dev/null; then
        if grep <<<"${rustup_target_list}" -Eq "^${target}$"; then
            rustup ${pre_args[@]+"${pre_args[@]}"} target add "${target}" &>/dev/null
        elif [[ -n "${nightly}" ]]; then
            if [[ -z "${build_std}" ]]; then
                args+=(-Z build-std)
            fi
        else
            bail "target '${target}' requires nightly compiler"
        fi
    fi
fi
args+=(
    --all-features
    --workspace --exclude bench --exclude portable-atomic-internal-codegen
)
target="${target:-"${host}"}"
target_lower="${target//-/_}"
target_lower="${target_lower//./_}"
target_upper="$(tr '[:lower:]' '[:upper:]' <<<"${target_lower}")"
randomize_layout=' -Z randomize-layout'

if [[ -n "${VALGRIND:-}" ]]; then
    export "CARGO_TARGET_${target_upper}_RUNNER"="${VALGRIND} -v --error-exitcode=1 --error-limit=no --leak-check=full --show-leak-kinds=all --track-origins=yes --fair-sched=yes"
    export RUSTFLAGS="${RUSTFLAGS:-} --cfg valgrind"
    export RUSTDOCFLAGS="${RUSTDOCFLAGS:-} --cfg valgrind"
    # doctest on Valgrind is very slow
    if [[ ${#tests[@]} -eq 0 ]]; then
        tests=(--tests)
    fi
fi

run() {
    if [[ "${RUSTFLAGS:-}" == *"-Z sanitizer="* ]] || [[ "${RUSTFLAGS:-}" == *"-Zsanitizer="* ]]; then
        # doctest with debug build on Sanitizer is slow
        x_cargo ${pre_args[@]+"${pre_args[@]}"} test --tests "$@"
    else
        x_cargo ${pre_args[@]+"${pre_args[@]}"} test ${tests[@]+"${tests[@]}"} "$@"
    fi

    # release mode + doctests is slow on some platforms (probably related to the fact that they compile binaries for each example)
    if [[ "${RUSTFLAGS:-}" == *"-Z sanitizer=memory"* ]] || [[ "${RUSTFLAGS:-}" == *"-Zsanitizer=memory"* ]]; then
        # Workaround https://github.com/google/sanitizers/issues/558
        CARGO_PROFILE_RELEASE_OPT_LEVEL=0 \
            x_cargo ${pre_args[@]+"${pre_args[@]}"} test --release --tests "$@"
    else
        x_cargo ${pre_args[@]+"${pre_args[@]}"} test --release --tests "$@"
    fi

    # LTO + doctests is very slow on some platforms (probably related to the fact that they compile binaries for each example)
    CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1 \
        CARGO_PROFILE_RELEASE_LTO=fat \
        x_cargo ${pre_args[@]+"${pre_args[@]}"} test --release --tests --target-dir target/fat-lto "$@"

    # cargo-careful only supports nightly. rustc-build-sysroot doesn't work on old nightly (at least on nightly-2022-08-12 - 1.65.0-nightly).
    if [[ "${rustc_minor_version}" -ge 66 ]] && [[ -n "${nightly}" ]] && type -P cargo-careful &>/dev/null && [[ "${cargo}" == "cargo" ]]; then
        # Since nightly-2022-12-23, -Z build-std + -Z randomize-layout + release mode on Windows
        # sometimes causes segfault in build script or proc-macro.
        if [[ -z "${cargo_options[*]+"${cargo_options[*]}"}" ]] && [[ "${target}" == *"-windows"* ]]; then
            args+=(--target "${target}")
        fi
        RUSTFLAGS="${RUSTFLAGS:-}${randomize_layout:-}" \
            RUSTDOCFLAGS="${RUSTDOCFLAGS:-}${randomize_layout:-}" \
            x_cargo ${pre_args[@]+"${pre_args[@]}"} careful test ${tests[@]+"${tests[@]}"} --target-dir target/careful "$@"
    fi
}

run ${cargo_options[@]+"${cargo_options[@]}"} "${args[@]}" ${rest_cargo_options[@]+"${rest_cargo_options[@]}"}

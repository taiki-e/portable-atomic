#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

# shellcheck disable=SC2154
trap 's=$?; echo >&2 "$0: error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}' ERR
trap -- 'echo >&2 "$0: trapped SIGINT"; exit 1' SIGINT

# USAGE:
#    ./tools/test.sh [+toolchain] [cargo_options]...
#    ./tools/test.sh [+toolchain] build|miri|valgrind [cargo_options]...

# NB: sync with:
# - docs.rs metadata in Cargo.toml
# - env.TEST_FEATURES in .github/workflows/ci.yml.
# - test_features list in tools/build.sh.
test_features="float,std,serde,critical-section"

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
    if [[ "${cmd}" == "miri" ]] && [[ -n "${MIRIFLAGS:-}" ]]; then
        echo "+ MIRIFLAGS='${MIRIFLAGS}' \\"
    fi
    if [[ -n "${TS:-}" ]]; then
        x "${cargo}" ${pre_args[@]+"${pre_args[@]}"} "$@" 2>&1 | "${TS}" -i '%.s  '
    else
        x "${cargo}" ${pre_args[@]+"${pre_args[@]}"} "$@"
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
cmd="test"
case "${1:-}" in
    build | miri | valgrind)
        cmd="$1"
        shift
        ;;
esac
target=''
build_std=()
release=()
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
            if [[ -n "${target}" ]]; then
                bail "multiple --target option"
            fi
            shift
            target="$1"
            ;;
        --target=*)
            if [[ -n "${target}" ]]; then
                bail "multiple --target option"
            fi
            target="${1#--target=}"
            ;;
        --tests) tests=("$1") ;;
        -Z*)
            arg="$1"
            case "${arg}" in
                -Z)
                    shift
                    arg="$1"
                    ;;
                -Z*) arg="${arg#-Z}" ;;
            esac
            case "${arg}" in
                build-std | build-std=*)
                    if [[ ${#build_std[@]} -gt 0 ]]; then
                        bail "multiple -Z build-std option"
                    fi
                    build_std=(-Z "${arg}")
                    ;;
                *) cargo_options+=(-Z "${arg}") ;;
            esac
            ;;
        --release) release=(--release) ;;
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
if [[ -z "${target}" ]] && [[ ${#build_std[@]} -gt 0 ]]; then
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
            if [[ ${#build_std[@]} -eq 0 ]]; then
                build_std=(-Z build-std)
            fi
        else
            bail "target '${target}' requires nightly compiler"
        fi
    fi
fi
args+=(--features "${test_features}")
case "${cmd}" in
    build) ;;
    *) args+=(--workspace --exclude bench --exclude portable-atomic-internal-codegen) ;;
esac
target="${target:-"${host}"}"
target_lower="${target//-/_}"
target_lower="${target_lower//./_}"
target_upper=$(tr '[:lower:]' '[:upper:]' <<<"${target_lower}")
randomize_layout=' -Z randomize-layout'

case "${cmd}" in
    build)
        TS=''
        args+=(--no-run ${release[@]+"${release[@]}"})
        x_cargo test ${build_std[@]+"${build_std[@]}"} ${cargo_options[@]+"${cargo_options[@]}"} "${args[@]}" >&2
        binary_path=$(
            "${cargo}" ${pre_args[@]+"${pre_args[@]}"} test ${build_std[@]+"${build_std[@]}"} ${cargo_options[@]+"${cargo_options[@]}"} "${args[@]}" -q --message-format=json \
                | jq -r "select(.manifest_path == \"$(cargo ${pre_args[@]+"${pre_args[@]}"} locate-project --message-format=plain)\") | select(.executable != null) | .executable"
        )
        echo "${binary_path}"
        exit 0
        ;;
    miri)
        export MIRIFLAGS="${MIRIFLAGS:-} -Zmiri-strict-provenance -Zmiri-symbolic-alignment-check -Zmiri-retag-fields -Zmiri-disable-isolation"
        export RUSTFLAGS="${RUSTFLAGS:-}${randomize_layout}"
        export RUSTDOCFLAGS="${RUSTDOCFLAGS:-}${randomize_layout}"
        export QUICKCHECK_TESTS=10
        x_cargo miri test ${cargo_options[@]+"${cargo_options[@]}"} "${args[@]}" ${rest_cargo_options[@]+"${rest_cargo_options[@]}"}
        exit 0
        ;;
    valgrind)
        export "CARGO_TARGET_${target_upper}_RUNNER"="valgrind -v --error-exitcode=1 --error-limit=no --leak-check=full --show-leak-kinds=all --track-origins=yes --fair-sched=yes"
        export RUSTFLAGS="${RUSTFLAGS:-} --cfg valgrind"
        export RUSTDOCFLAGS="${RUSTDOCFLAGS:-} --cfg valgrind"
        # doctest on Valgrind is very slow
        if [[ ${#tests[@]} -eq 0 ]]; then
            tests=(--tests)
        fi
        ;;
    test) ;;
    *) bail "unrecognized command '${cmd}'" ;;
esac

run() {
    if [[ ${#release[@]} -eq 0 ]]; then
        if [[ "${RUSTFLAGS:-}" == *"-Z sanitizer="* ]] || [[ "${RUSTFLAGS:-}" == *"-Zsanitizer="* ]]; then
            # doctest with debug build on Sanitizer is slow
            x_cargo test ${build_std[@]+"${build_std[@]}"} --tests "$@"
        else
            x_cargo test ${build_std[@]+"${build_std[@]}"} ${tests[@]+"${tests[@]}"} "$@"
        fi
    fi

    # release mode + doctests is slow on some platforms (probably related to the fact that they compile binaries for each example)
    if [[ "${RUSTFLAGS:-}" == *"-Z sanitizer=memory"* ]] || [[ "${RUSTFLAGS:-}" == *"-Zsanitizer=memory"* ]]; then
        # Workaround https://github.com/google/sanitizers/issues/558
        CARGO_PROFILE_RELEASE_OPT_LEVEL=0 \
            x_cargo test ${build_std[@]+"${build_std[@]}"} --release --tests "$@"
    else
        x_cargo test ${build_std[@]+"${build_std[@]}"} --release --tests "$@"
    fi

    # LTO + doctests is very slow on some platforms (probably related to the fact that they compile binaries for each example)
    CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1 \
        CARGO_PROFILE_RELEASE_LTO=fat \
        x_cargo test ${build_std[@]+"${build_std[@]}"} --release --tests --target-dir target/fat-lto "$@"

    # cargo-careful only supports nightly. rustc-build-sysroot doesn't work on old nightly (at least on nightly-2022-08-12 - 1.65.0-nightly).
    if [[ "${rustc_minor_version}" -ge 66 ]] && [[ -n "${nightly}" ]] && type -P cargo-careful &>/dev/null && [[ "${cargo}" == "cargo" ]]; then
        # Since nightly-2022-12-23, -Z build-std + -Z randomize-layout + release mode on Windows
        # sometimes causes segfault in build script or proc-macro.
        if [[ "${target}" == *"-windows"* ]]; then
            randomize_layout=''
        fi
        flags="${randomize_layout}"
        case "${target}" in
            *-linux-musl*) flags+=" -C target-feature=-crt-static" ;;
        esac
        case "${target}" in
            # cannot find rsbegin.o/rsend.o when building std
            *-windows-gnu*) ;;
            *)
                if [[ ${#build_std[@]} -gt 0 ]]; then
                    RUSTFLAGS="${RUSTFLAGS:-}${flags}" \
                        RUSTDOCFLAGS="${RUSTDOCFLAGS:-}${flags}" \
                        x_cargo careful test -Z doctest-xcompile ${release[@]+"${release[@]}"} ${tests[@]+"${tests[@]}"} --target-dir target/careful "$@"
                else
                    # -Z doctest-xcompile is already passed
                    RUSTFLAGS="${RUSTFLAGS:-}${flags}" \
                        RUSTDOCFLAGS="${RUSTDOCFLAGS:-}${flags}" \
                        x_cargo careful test ${release[@]+"${release[@]}"} ${tests[@]+"${tests[@]}"} --target-dir target/careful "$@"
                fi
                ;;
        esac
    fi
}

run ${cargo_options[@]+"${cargo_options[@]}"} "${args[@]}" ${rest_cargo_options[@]+"${rest_cargo_options[@]}"}

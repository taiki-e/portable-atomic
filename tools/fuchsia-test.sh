#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'
trap -- 's=$?; printf >&2 "%s\n" "${0##*/}:${LINENO}: \`${BASH_COMMAND}\` exit with ${s}"; exit ${s}' ERR
trap -- 'printf >&2 "%s\n" "${0##*/}: trapped SIGINT"; exit 1' SIGINT
cd -- "$(dirname -- "$0")"/..

# USAGE:
#    ./tools/fuchsia-test.sh [+toolchain] <aarch64|x86_64> [cargo_options]...
#    ./tools/fuchsia-test.sh emu <aarch64|x86_64>
#
# Note: SDK_PATH environment variable must be set.
#
# Refs:
# - https://github.com/rust-lang/rust/blob/1.74.0/src/doc/rustc/src/platform-support/fuchsia.md
# - https://github.com/rust-lang/rust/blob/1.74.0/src/ci/docker/scripts/fuchsia-test-runner.py

# TODO: ffx product-bundle has been removed: https://github.com/rust-lang/rust/pull/117799

x() {
  (
    set -x
    "$@"
  )
}
bail() {
  printf >&2 'error: %s\n' "$*"
  exit 1
}

if [[ -z "${SDK_PATH:-}" ]]; then
  bail "SDK_PATH must be set"
fi
tool_dir="${SDK_PATH}/tools/x64"

pre_args=()
if [[ "${1:-}" == "+"* ]]; then
  pre_args+=("$1")
  shift
fi
cmd='test'
case "${1:-}" in
  emu)
    cmd="$1"
    shift
    ;;
esac
case "${1:-}" in
  aarch64) arch=arm64 ;;
  x86_64) arch=x64 ;;
  *) bail "unrecognized arch '${1:-}'" ;;
esac
target="$1-unknown-fuchsia"
shift
export PORTABLE_ATOMIC_DENY_WARNINGS=1

cargo_options=()
rest_cargo_options=(--test-threads=1)
while [[ $# -gt 0 ]]; do
  case "$1" in
    --tests | --all-targets | --doc | --target | --target=*) bail "unsupported option '$1'" ;;
    --)
      shift
      rest_cargo_options+=("$@")
      break
      ;;
    *) cargo_options+=("$1") ;;
  esac
  shift
done

case "${cmd}" in
  emu)
    x "${tool_dir}"/ffx product-bundle get "terminal.qemu-${arch}"
    if "${tool_dir}"/ffx emu list | grep -Fq fuchsia-emulator; then
      x "${tool_dir}"/ffx emu stop fuchsia-emulator
    fi
    x "${tool_dir}"/ffx emu start "terminal.qemu-${arch}" --headless
    trap -- 'x "${tool_dir}"/ffx emu stop fuchsia-emulator; exit 0' SIGINT
    x "${tool_dir}"/ffx log --since now
    x "${tool_dir}"/ffx emu stop fuchsia-emulator
    exit 0
    ;;
  test) ;;
  *) bail "unrecognized command '${cmd}'" ;;
esac

rustup ${pre_args[@]+"${pre_args[@]}"} target add "${target}" &>/dev/null
target_libdir=$(rustc ${pre_args[@]+"${pre_args[@]}"} --print target-libdir --target "${target}")
libstd_name=$(basename -- "$(ls -- "${target_libdir}"/libstd-*.so)")
libtest_name=$(basename -- "$(ls -- "${target_libdir}"/libtest-*.so)")

export RUSTFLAGS="${RUSTFLAGS:-} -L native=${SDK_PATH}/arch/${arch}/lib -L native=${SDK_PATH}/arch/${arch}/sysroot/lib"
binary_path=$(./tools/test.sh ${pre_args[@]+"${pre_args[@]}"} build --target "${target}" "${cargo_options[@]}")

package_name=t
package_dir=target/pkg
test_output_dir=target/fuchsia-test
rm -rf -- ./"${package_dir}"
mkdir -p -- "${package_dir}/meta"
rm -rf -- ./"${test_output_dir}"
mkdir -p -- "${test_output_dir}"

test_repo_name=repo
repo_dir="${package_dir}/${test_repo_name}"
cml_path="${package_dir}/meta/${package_name}.cml"
cm_path="${package_dir}/meta/${package_name}.cm"
manifest_path="${package_dir}/${package_name}.manifest"
api_level=$("${tool_dir}"/ffx version -v | grep -F api-level | head -1 | awk -F ' ' '{print $2}')

cat >"${package_dir}/meta/package" <<EOF
{
  "name": "${package_name}",
  "version": "0"
}
EOF

cat >"${manifest_path}" <<EOF
meta/package=${package_dir}/meta/package
meta/${package_name}.cm=${cm_path}
bin/${package_name}=${binary_path}
lib/${libstd_name}=${target_libdir}/${libstd_name}
lib/${libtest_name}=${target_libdir}/${libtest_name}
lib/ld.so.1=${SDK_PATH}/arch/${arch}/sysroot/dist/lib/ld.so.1
lib/libfdio.so=${SDK_PATH}/arch/${arch}/dist/libfdio.so
EOF

args=''
for arg in ${rest_cargo_options[@]+"${rest_cargo_options[@]}"}; do
  if [[ -z "${args}" ]]; then
    args+="\"${arg}\""
  else
    args+=", \"${arg}\""
  fi
done
cat >"${cml_path}" <<EOF
{
    include: ["syslog/client.shard.cml"],
    program: {
        runner: "elf",
        binary: "bin/${package_name}",
        args: [${args}],
        forward_stderr_to: "log",
        forward_stdout_to: "log"
    }
}
EOF

x "${tool_dir}"/cmc compile \
  "${cml_path}" \
  --includepath "${SDK_PATH}"/pkg \
  -o "${cm_path}"

x "${tool_dir}"/pm \
  -api-level "${api_level}" \
  -o "${manifest_path//./_}" \
  -m "${manifest_path}" \
  build \
  -output-package-manifest "${package_dir}/${package_name}_package_manifest"

x "${tool_dir}"/pm newrepo -repo "${repo_dir}"

x "${tool_dir}"/pm publish \
  -repo "${repo_dir}" \
  -lp -f <(printf '%s\n' "${package_dir}/${package_name}_package_manifest")
x "${tool_dir}"/ffx repository add-from-pm \
  "${repo_dir}" \
  -r "${package_name}"

x "${tool_dir}"/ffx repository server start
x "${tool_dir}"/ffx target repository register \
  --repository "${package_name}"

x "${tool_dir}"/ffx component run \
  --recreate \
  /core/ffx-laboratory:"${package_name}" \
  "fuchsia-pkg://${package_name}/${package_name}_manifest#meta/${package_name}.cm"

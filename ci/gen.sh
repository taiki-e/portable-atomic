#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

# shellcheck disable=SC2154
trap 's=$?; echo >&2 "$0: error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}' ERR

bail() {
    echo >&2 "error: $*"
    exit 1
}

if [[ -z "${CI:-}" ]]; then
    bail "this script is intended to call from release workflow on CI"
fi

git config user.name "Taiki Endo"
git config user.email "te316e89@gmail.com"

for path in no_atomic.rs src/gen/* tools/codegen/src/gen/* tests/helper/src/gen/sys/*; do
    git add -N "${path}"
    if ! git diff --exit-code -- "${path}"; then
        git add "${path}"
        git commit -m "Update ${path}"
        has_update=1
    fi
done

if [[ -n "${has_update:-}" ]] && [[ -n "${GITHUB_OUTPUT:-}" ]]; then
    echo "success=false" >>"${GITHUB_OUTPUT}"
fi

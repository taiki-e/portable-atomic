#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'
trap -- 's=$?; printf >&2 "%s\n" "${0##*/}:${LINENO}: \`${BASH_COMMAND}\` exit with ${s}"; exit ${s}' ERR
cd -- "$(dirname -- "$0")"/../..

bail() {
  printf >&2 'error: %s\n' "$*"
  exit 1
}

if [[ -z "${CI:-}" ]]; then
  bail "this script is intended to call from release workflow on CI"
fi

git config user.name 'Taiki Endo'
git config user.email 'te316e89@gmail.com'

has_update=''
for path in src/gen/* .github/workflows/*-matrix.json; do
  git add -N "${path}"
  if ! git diff --exit-code -- "${path}" &>/dev/null; then
    git add "${path}"
    git commit -m "codegen: Update ${path}"
    has_update=1
  fi
done

if [[ -n "${has_update}" ]] && [[ -n "${GITHUB_OUTPUT:-}" ]]; then
  printf 'success=false\n' >>"${GITHUB_OUTPUT}"
fi

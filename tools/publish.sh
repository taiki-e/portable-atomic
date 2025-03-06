#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT
set -CeEuo pipefail
IFS=$'\n\t'
trap -- 's=$?; printf >&2 "%s\n" "${0##*/}:${LINENO}: \`${BASH_COMMAND}\` exit with ${s}"; exit ${s}' ERR
cd -- "$(dirname -- "$0")"/..

# Publish a new release.
#
# USAGE:
#    ./tools/publish.sh <CRATE> <VERSION>
#
# Note: This script requires the following tools:
# - parse-changelog <https://github.com/taiki-e/parse-changelog>

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

name="${1:?}"
version="${2:?}"
version="${version#v}"
case "${name}" in
  portable-atomic)
    tag_prefix="v"
    dir="."
    ;;
  *)
    tag_prefix="${name}-"
    dir="${name}"
    ;;
esac
tag="${tag_prefix}${version}"
changelog="${dir}/CHANGELOG.md"
manifest_path="${dir}/Cargo.toml"
if [[ ! "${version}" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z\.-]+)?(\+[0-9A-Za-z\.-]+)?$ ]]; then
  bail "invalid version format '${version}'"
fi
if [[ $# -gt 2 ]]; then
  bail "invalid argument '$3'"
fi
if { sed --help 2>&1 || true; } | grep -Eq -e '-i extension'; then
  in_place=(-i '')
else
  in_place=(-i)
fi

# Make sure there is no uncommitted change.
git diff --exit-code
git diff --exit-code --staged

# Make sure the same release has not been created in the past.
if gh release view "${tag}" &>/dev/null; then
  bail "tag '${tag}' has already been created and pushed"
fi

# Make sure that the release was created from an allowed branch.
if ! git branch | grep -Eq '\* main$'; then
  bail "current branch is not 'main'"
fi
if ! git remote -v | grep -F origin | grep -Eq 'github\.com[:/]taiki-e/'; then
  bail "cannot publish a new release from fork repository"
fi

release_date=$(date -u '+%Y-%m-%d')
tags=$(git --no-pager tag | { grep -E "^${tag_prefix}[0-9]+" || true; })
docs=("${dir}/README.md" "${dir}/src/lib.rs")
changed_paths=("${changelog}" "${docs[@]}" "${manifest_path}")
if [[ -n "${tags}" ]]; then
  # Make sure the same release does not exist in changelog.
  if grep -Eq "^## \\[${version//./\\.}\\]" "${changelog}"; then
    bail "release ${version} already exist in ${changelog}"
  fi
  if grep -Eq "^\\[${version//./\\.}\\]: " "${changelog}"; then
    bail "link to ${version} already exist in ${changelog}"
  fi
  # Update changelog.
  remote_url=$(grep -E '^\[Unreleased\]: https://' "${changelog}" | sed -E 's/^\[Unreleased\]: //; s/\.\.\.HEAD$//')
  prev_tag="${remote_url#*/compare/}"
  remote_url="${remote_url%/compare/*}"
  sed -E "${in_place[@]}" \
    -e "s/^## \\[Unreleased\\]/## [Unreleased]\\n\\n## [${version}] - ${release_date}/" \
    -e "s#^\[Unreleased\]: https://.*#[Unreleased]: ${remote_url}/compare/${tag}...HEAD\\n[${version}]: ${remote_url}/compare/${prev_tag}...${tag}#" "${changelog}"
  if ! grep -Eq "^## \\[${version//./\\.}\\] - ${release_date}$" "${changelog}"; then
    bail "failed to update ${changelog}"
  fi
  if ! grep -Eq "^\\[${version//./\\.}\\]: " "${changelog}"; then
    bail "failed to update ${changelog}"
  fi
  prev_version="${prev_tag#"${tag_prefix}"}"
  # Update version in Cargo.toml.
  if ! grep -Eq "^version = \"${prev_version}\" #publish:version" "${manifest_path}"; then
    bail "not found '#publish:version' in version in ${manifest_path}"
  fi
  sed -E "${in_place[@]}" "s/^version = \"${prev_version}\" #publish:version/version = \"${version}\" #publish:version/g" "${manifest_path}"
  # Update version in readme and lib.rs.
  for path in "${docs[@]}"; do
    # TODO: handle pre-release
    if [[ "${version}" == "0.0."* ]]; then
      # 0.0.x -> 0.0.y
      if grep -Eq "^${name} = \"${prev_version}\"" "${path}"; then
        sed -E "${in_place[@]}" "s/^${name} = \"${prev_version}\"/${name} = \"${version}\"/g" "${path}"
      fi
      if grep -Eq "^${name} = \\{ version = \"${prev_version}\"" "${path}"; then
        sed -E "${in_place[@]}" "s/^${name} = \\{ version = \"${prev_version}\"/${name} = { version = \"${version}\"/g" "${path}"
      fi
    elif [[ "${version}" == "0."* ]]; then
      prev_major_minor="${prev_version%.*}"
      major_minor="${version%.*}"
      if [[ "${prev_major_minor}" != "${major_minor}" ]]; then
        # 0.x -> 0.y
        # 0.x.* -> 0.y
        if grep -Eq "^${name} = \"${prev_major_minor}(\\.[0-9]+)?\"" "${path}"; then
          sed -E "${in_place[@]}" "s/^${name} = \"${prev_major_minor}(\\.[0-9]+)?\"/${name} = \"${major_minor}\"/g" "${path}"
        fi
        if grep -Eq "^${name} = \\{ version = \"${prev_major_minor}(\\.[0-9]+)?\"" "${path}"; then
          sed -E "${in_place[@]}" "s/^${name} = \\{ version = \"${prev_major_minor}(\\.[0-9]+)?\"/${name} = { version = \"${major_minor}\"/g" "${path}"
        fi
      fi
    else
      prev_major="${prev_version%%.*}"
      major="${version%%.*}"
      if [[ "${prev_major}" != "${major}" ]]; then
        # x -> y
        # x.* -> y
        # x.*.* -> y
        if grep -Eq "^${name} = \"${prev_major}(\\.[0-9]+(\\.[0-9]+)?)?\"" "${path}"; then
          sed -E "${in_place[@]}" "s/^${name} = \"${prev_major}(\\.[0-9]+(\\.[0-9]+)?)?\"/${name} = \"${major}\"/g" "${path}"
        fi
        if grep -Eq "^${name} = \\{ version = \"${prev_major}(\\.[0-9]+(\\.[0-9]+)?)?\"" "${path}"; then
          sed -E "${in_place[@]}" "s/^${name} = \\{ version = \"${prev_major}(\\.[0-9]+(\\.[0-9]+)?)?\"/${name} = { version = \"${major}\"/g" "${path}"
        fi
      fi
    fi
  done
else
  # Make sure the release exists in changelog.
  if ! grep -Eq "^## \\[${version//./\\.}\\] - ${release_date}$" "${changelog}"; then
    bail "release ${version} does not exist in ${changelog} or has wrong release date"
  fi
  if ! grep -Eq "^\\[${version//./\\.}\\]: " "${changelog}"; then
    bail "link to ${version} does not exist in ${changelog}"
  fi
fi

# Make sure that a valid release note for this version exists.
# https://github.com/taiki-e/parse-changelog
changes=$(parse-changelog "${changelog}" "${version}")
if [[ -z "${changes}" ]]; then
  bail "changelog for ${version} has no body"
fi
printf '============== CHANGELOG ==============\n'
printf '%s\n' "${changes}"
printf '=======================================\n'

if [[ -n "${tags}" ]]; then
  # Create a release commit.
  (
    set -x
    git add "${changed_paths[@]}"
    git commit -m "Release ${name} ${version}"
  )
fi

set -x

git tag "${tag}"

(
  cd -- "${dir}"
  cargo +stable publish
)

retry git push origin refs/heads/main
retry git push origin refs/tags/"${tag}"

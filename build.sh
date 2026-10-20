#!/usr/bin/env bash
set -euo pipefail

project_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
upstream_dir="$(mktemp -d)"
source_dir="${UPSTREAM_SOURCE_DIR:-}"

cleanup() {
  rm -rf "${upstream_dir}"
}
trap cleanup EXIT

# Upstream publishes no releases or tags, so build the current main head.
if [[ -z "${source_dir}" ]]; then
  upstream_sha="$(git ls-remote https://github.com/whyubel1eve/Mars-Editor-Web.git refs/heads/main | awk '{print $1}')"
  test -n "${upstream_sha}"
  source_dir="${upstream_dir}/source"
  mkdir -p "${source_dir}"
  curl --fail --location --retry 3 --retry-all-errors     "https://codeload.github.com/whyubel1eve/Mars-Editor-Web/tar.gz/${upstream_sha}"     | tar -xz --strip-components=1 -C "${source_dir}"
else
  source_dir="$(cd "${source_dir}" && pwd)"
  upstream_sha="$(git -C "${source_dir}" rev-parse HEAD 2>/dev/null || echo local)"
fi

test -f "${source_dir}/package.json"
cd "${source_dir}"
printf "Building upstream commit %s
" "${upstream_sha}"

npm ci
npm run build

rm -rf "${project_root}/dist"
cp -a dist "${project_root}/dist"

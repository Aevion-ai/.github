#!/usr/bin/env bash
set -euo pipefail

# shellcheck source=markdownlint-baseline-lib.sh
source "${GITHUB_ACTION_PATH}/markdownlint-baseline-lib.sh"

if [ "${GITHUB_EVENT_NAME}" = "pull_request" ]; then
  base="${GITHUB_PR_BASE_SHA}"
else
  base="${GITHUB_EVENT_BEFORE}"
  if [ -z "${base}" ] || [ "${base}" = "0000000000000000000000000000000000000000" ]; then
    base="$(git rev-parse HEAD^ 2>/dev/null || git rev-parse HEAD)"
  fi
fi

list="$(mktemp)"
collect_changed_markdown_files "${base}" "${list}"
mapfile -t changed_md < "${list}"
rm -f "${list}"

if [ "${#changed_md[@]}" -eq 0 ]; then
  echo "No changed Markdown files to lint."
  exit 0
fi

config_args=()
if [ -f "${MARKDOWNLINT_CONFIG}" ]; then
  config_args+=(--config "${MARKDOWNLINT_CONFIG}")
fi

findings="$(mktemp)"
set +e
markdownlint "${changed_md[@]}" "${config_args[@]}" --json --output "${findings}"
markdownlint_status=$?
set -e

echo "markdownlint exit status: ${markdownlint_status}"
normalize_markdownlint_findings "${findings}" "${markdownlint_status}"

if [ -z "${MARKDOWNLINT_GATE_SCRIPT}" ]; then
  echo "::error::markdownlint-gate-script is required when markdownlint-baseline-enabled is true"
  exit 1
fi
if [ ! -f "${MARKDOWNLINT_GATE_SCRIPT}" ]; then
  echo "::error::markdownlint gate script not found: ${MARKDOWNLINT_GATE_SCRIPT}"
  exit 1
fi
chmod +x "${MARKDOWNLINT_GATE_SCRIPT}"
"${MARKDOWNLINT_GATE_SCRIPT}" "${MARKDOWNLINT_BASELINE_PATH}" "${findings}"

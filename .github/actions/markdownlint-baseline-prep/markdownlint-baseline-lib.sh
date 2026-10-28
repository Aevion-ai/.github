#!/usr/bin/env bash
# Shared logic for the markdown-lint-baseline job (also covered by scripts/ci tests).

collect_changed_markdown_files() {
  local base="$1"
  local list_file="$2"
  git diff --name-only --diff-filter=ACMR "${base}" HEAD -- '*.md' > "${list_file}"
}

# Normalize markdownlint --output findings for the gate script.
# Exit 0/1 are expected from markdownlint; other codes fail here.
normalize_markdownlint_findings() {
  local findings="$1"
  local markdownlint_status="$2"

  if [ "${markdownlint_status}" -ne 0 ] && [ "${markdownlint_status}" -ne 1 ]; then
    echo "::error::markdownlint failed with unexpected exit status ${markdownlint_status}"
    return "${markdownlint_status}"
  fi

  if [ "${markdownlint_status}" -eq 0 ]; then
    if [ ! -s "${findings}" ]; then
      printf '[]\n' > "${findings}"
    fi
    return 0
  fi

  if [ ! -s "${findings}" ]; then
    echo "::error::markdownlint reported violations but findings file is empty"
    return 1
  fi
  if ! python3 -c "import json,sys; json.load(open(sys.argv[1]))" "${findings}"; then
    echo "::error::markdownlint findings file is not valid JSON"
    return 1
  fi
  return 0
}

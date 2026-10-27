#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
# shellcheck source=/dev/null
source "${ROOT}/.github/actions/markdownlint-baseline-prep/markdownlint-baseline-lib.sh"

pass() { echo "PASS: $*"; }
fail() { echo "FAIL: $*"; exit 1; }

# Cross-repo kit checkout in aevion-lint.yml uses job.workflow_repository and
# job.workflow_sha (the called reusable workflow), not github.workflow_ref (caller).
echo "SKIP: job.workflow_* checkout identity is validated by AVA #377 workflow_call"

tmpdir="$(mktemp -d)"
trap 'rm -rf "${tmpdir}"' EXIT

cd "${tmpdir}"
git init -q
git config user.email "test@example.com"
git config user.name "Test"
echo '# hello' > README.md
git add README.md
git commit -q -m 'init'

list_file="${tmpdir}/changed.txt"
set +e
collect_changed_markdown_files 'not-a-real-base-ref' "${list_file}" >/dev/null 2>&1
bad_diff_rc=$?
set -e
if [ "${bad_diff_rc}" -eq 0 ]; then
  fail 'git diff with bad base must exit non-zero'
fi
pass 'bad base revision fails collect_changed_markdown_files'

findings_clean="${tmpdir}/clean.json"
: > "${findings_clean}"
if ! normalize_markdownlint_findings "${findings_clean}" 0; then
  fail 'normalize_markdownlint_findings should accept exit 0'
fi
if [ "$(tr -d '\n' < "${findings_clean}")" != '[]' ]; then
  fail "exit 0 with empty output must write [], got: $(cat "${findings_clean}")"
fi
pass 'markdownlint exit 0 with empty file produces []'

findings_bad="${tmpdir}/bad.json"
: > "${findings_bad}"
set +e
normalize_markdownlint_findings "${findings_bad}" 1 >/dev/null 2>&1
exit1_empty_rc=$?
set -e
if [ "${exit1_empty_rc}" -eq 0 ]; then
  fail 'exit 1 with empty findings must fail'
fi
pass 'markdownlint exit 1 with empty file fails normalization'

findings_invalid="${tmpdir}/invalid.json"
printf 'not json' > "${findings_invalid}"
set +e
normalize_markdownlint_findings "${findings_invalid}" 1 >/dev/null 2>&1
invalid_rc=$?
set -e
if [ "${invalid_rc}" -eq 0 ]; then
  fail 'exit 1 with invalid JSON must fail'
fi
pass 'markdownlint exit 1 with invalid JSON fails normalization'

set +e
normalize_markdownlint_findings "${findings_clean}" 2 >/dev/null 2>&1
unexpected_rc=$?
set -e
if [ "${unexpected_rc}" -eq 0 ]; then
  fail 'unexpected markdownlint exit code must fail'
fi
pass 'markdownlint exit codes other than 0 or 1 fail normalization'

ROOT_ACTION="${ROOT}/.github/actions/markdownlint-baseline-prep"
if [ ! -x "${ROOT_ACTION}/run.sh" ]; then
  fail 'run.sh must exist for cross-repo baseline checkout'
fi
pass 'baseline prep run.sh present at pinned workflow kit path'

echo "All markdownlint-baseline-lib tests passed."

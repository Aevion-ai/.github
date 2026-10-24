import json
import re
import shlex
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
WORKFLOW = ROOT / ".github" / "workflows" / "aevion-lint.yml"
FIXTURES = ROOT / "tests" / "fixtures" / "lint_all_clear_cases.json"
JOBS = (
    "detect",
    "python-lint",
    "markdown-lint",
    "shell-lint",
    "yaml-lint",
    "rust-lint",
    "js-lint",
)


def aggregate_script() -> str:
    text = WORKFLOW.read_text(encoding="utf-8")
    block = re.search(r"^  all-clear:\n(?P<body>.*)\Z", text, re.M | re.S)
    if block is None:
        raise AssertionError("all-clear job is missing")
    body = block.group("body")
    for job in JOBS:
        if not re.search(rf"^      - {re.escape(job)}$", body, re.M):
            raise AssertionError(f"all-clear does not need {job}")
        if not re.search(rf"needs\.{re.escape(job)}\.result", body):
            raise AssertionError(f"all-clear does not evaluate {job}")
    step = re.search(
        r"^      - name: Evaluate needed job results\n"
        r"        run: \|\n(?P<script>(?:          .*(?:\n|$))+)",
        body,
        re.M,
    )
    if step is None:
        raise AssertionError("aggregate evaluation script is missing")
    return step.group("script")


class LintAllClearTests(unittest.TestCase):
    def run_fixture(self, case: dict) -> None:
        rendered = aggregate_script()
        for job, result in case["results"].items():
            expression = re.compile(
                rf"\$\{{\{{\s*needs\.{re.escape(job)}\.result\s*\}}\}}"
            )
            rendered, count = expression.subn(shlex.quote(result), rendered)
            self.assertGreaterEqual(count, 1, job)
        self.assertNotIn("${{", rendered)
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "aggregate.sh"
            path.write_text(rendered, encoding="utf-8")
            completed = subprocess.run(
                ["bash", str(path)],
                capture_output=True,
                text=True,
                check=False,
            )
        self.assertEqual(
            case["expected_returncode"],
            completed.returncode,
            completed.stdout + completed.stderr,
        )


def add_fixture_test(case: dict) -> None:
    def test(self: LintAllClearTests) -> None:
        self.run_fixture(case)

    setattr(LintAllClearTests, f"test_{case['name']}", test)


for fixture in json.loads(FIXTURES.read_text(encoding="utf-8")):
    add_fixture_test(fixture)


if __name__ == "__main__":
    unittest.main()

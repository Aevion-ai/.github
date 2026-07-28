# Owner handoff — push H1 with `workflow` OAuth scope

Local branch ready (do not re-implement):

- Repo: `Aevion-ai/.github` (local clone: `C:\Users\Scott\Desktop\Aevion-ai-dotgithub`)
- Branch: `fix/lint-all-clear-fail-closed-001` @ `78d3999`
- Change: fail-closed all-clear aggregator + `contents: read` permissions

## Why agents cannot push

GitHub OAuth tokens used by agents here lack the `workflow` scope. Pushing a branch that touches `.github/workflows/*` is rejected until that scope is present.

## What Scott runs (interactive)

```powershell
cd C:\Users\Scott\Desktop\Aevion-ai-dotgithub
gh auth refresh -h github.com -s workflow
gh auth status
git push -u origin fix/lint-all-clear-fail-closed-001
gh pr create --title "fix(ci): fail-closed all-clear + contents:read" --body "H1: hollow all-clear aggregator made fail-closed; least-privilege contents:read."
```

If `gh auth refresh` is unavailable, re-auth with workflow scope:

```powershell
gh auth login -h github.com -s workflow,repo -p https
```

## After push

Open/merge the PR in `Aevion-ai/.github`. Monorepo hygiene (#252) does not depend on this push landing first.

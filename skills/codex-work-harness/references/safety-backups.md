# Safety Backups

Before deletion, moves, mass formatting, config changes, dependency changes, generated-code overwrite, or large edits:

1. If the project uses git, run `git status --short` and avoid reverting user changes.
2. If there is no git or the change is risky, create a snapshot with `scripts/snapshot.ps1 -Root .`.
3. Delete only after reference checks.
4. Report snapshot path if created.

Never run destructive git commands such as `git reset --hard` or force push without explicit user approval.


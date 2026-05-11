# Operational Guardrails

Use documents for judgment and scripts/rules/hooks for repeatable safety checks.

## Layers
- `AGENTS.md`: short always-on rules
- `harness/00-start-here.md`: router
- `skills/`: on-demand workflows
- `scripts/`: repeatable checks
- Codex rules/hooks examples: optional safety layer

## Rules
- Do not enable project `.codex/` settings without user or team approval.
- Keep examples inactive by default.
- Use scripts for file presence, size, stale term, and verification checks.
- Treat hooks as helpers, not proof of correctness.

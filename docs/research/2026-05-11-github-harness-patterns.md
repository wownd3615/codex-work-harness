# GitHub Harness Pattern Research

Date: 2026-05-11

This note records lessons from public GitHub repositories. Do not copy names, commands, prompts, or branding into the active harness.

## Repositories Checked

Star counts were checked through GitHub pages/API on 2026-05-11.

| Repository | Stars | Useful Pattern |
|---|---:|---|
| `agentsmd/agents.md` | 21.2k | Keep agent instructions predictable and minimal. |
| `addyosmani/agent-skills` | 39.1k | Package repeatable engineering work as skills. |
| `bmad-code-org/BMAD-METHOD` | 46.8k | Adjust planning depth by project size and lifecycle. |
| `ciembor/agent-rules-books` | 1.3k | Provide compact, medium, and full rule variants. |
| `yzhao062/anywhere-agents` | 171 | Guard destructive commands instead of only warning in prose. |
| `ninjaa/openai-codex-exec-plan` | 21 | Use a task-scoped living plan for multi-step work. |

## Lessons For This Harness

1. Keep `AGENTS.md` short. Long always-on rules can waste context.
2. Move specialized behavior into skills and references.
3. Use a lightweight Task Card for work that is bigger than a quick fix.
4. Add inactive Codex config examples for teams that want rules/hooks.
5. Add an audit script so quality is measured, not guessed.

## Decisions

- Do not add third-party command names to active workflow.
- Do not make `.codex/` active by default.
- Keep examples separate from the default harness.
- Prefer small scripts over more prose when checking repeatable rules.

---
name: codex-work-harness
description: Apply the user's personal Codex work harness for project planning, outsourcing checks, direct development, CAD LSP/AutoLISP work, minimal code implementation, dead-code cleanup, skill routing, token budgeting, subagent routing, testing, and concise reporting. Use when starting a new project, turning an idea into an app, reviewing outsourced work, modifying CAD LSP scripts, modifying code under the user's rules, or setting up repeatable Codex project workflow.
---

# Codex Work Harness

Use this skill to run the user's preferred Codex workflow.

## Core Rules
- Write the shortest simple code that satisfies the request.
- Never lie. Never claim unperformed work, unread files, or unrun tests.
- Delete code made unnecessary by the change.
- Split files by maintainable roles without over-abstracting.
- Load only the skill and files needed for the task.
- Separate verified facts, reasonable inference, and uncertainty.
- Check git status or create a snapshot before deletion or large edits.
- Apply CAD LSP safety rules for `.lsp`, `.dcl`, AutoLISP, AutoCAD, BricsCAD, or ZWCAD scripts.
- Explain work in beginner-friendly language when the user is non-technical.
- Add comments only when they explain non-obvious intent, risk, or domain rules.
- Prefer existing project style.
- Verify before reporting when feasible.
- Report briefly.

## Workflow
1. Classify work mode: direct development, outsourced project, or unknown.
2. For new projects, run a short intake interview before planning or coding.
3. Classify project level: Simple, Connected, or Scale.
4. Classify lifecycle: idea, planning, design, build, or review.
5. Use Planning Cycle for features and major changes; skip it for quick fixes.
6. Use a Task Card for multi-step work that does not need full planning docs.
7. Read only the relevant harness reference files.
8. Use required Codex skills only.
9. For large parallel work, use subagents with narrow ownership.
10. Finish with concise report and verification status.

## References
Read only what is needed:
- `references/work-mode.md`: direct vs outsourced work
- `references/project-intake.md`: project-start interview
- `references/truthfulness.md`: no lying, verification honesty
- `references/project-level.md`: Simple/Connected/Scale routing
- `references/project-lifecycle.md`: idea to review workflow
- `references/task-card.md`: lightweight task-scoped living plan
- `references/planning-cycle.md`: Plan-Design-Build-Review-Improve workflow
- `references/fact-based-reasoning.md`: fact, inference, uncertainty rules
- `references/operational-guardrails.md`: scripts, rules, and hooks as guardrails
- `references/beginner-explanation.md`: non-technical user explanations
- `references/code-rules.md`: minimal code, cleanup, file separation
- `references/comment-rules.md`: when to add or avoid comments
- `references/safety-backups.md`: git checks and snapshots before risky edits
- `references/cad-lsp.md`: CAD LSP and AutoLISP safety rules
- `references/skill-router.md`: skill selection
- `references/subagents.md`: subagent roles
- `references/security-business-ux.md`: security, business, and UX gates
- `references/team-project-setup.md`: team repository setup, PR, review, roles
- `references/done-checklist.md`: completion checks


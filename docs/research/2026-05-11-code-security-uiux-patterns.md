# Code, Security, UI/UX Pattern Research

Date: 2026-05-11

This note records public GitHub repositories checked for reusable patterns. Do not copy their prompts, commands, branding, or text into the active harness.

## Repositories Checked

Star counts were checked through GitHub API on 2026-05-11.

| Area | Repository | Stars | Useful Pattern |
|---|---|---:|---|
| Agent instructions | `agentsmd/agents.md` | 21.2k | Keep always-on instructions short and predictable. |
| Code quality | `addyosmani/agent-skills` | 39.2k | Treat skills as workflows with evidence requirements. |
| Code quality | `ciembor/agent-rules-books` | 1.3k | Provide compact rules and avoid long always-on guidance. |
| Security | `trailofbits/skills` | 5.1k | Security review should be a dedicated workflow, not a vague checklist. |
| Security | `cisco-ai-defense/skill-scanner` | 2.0k | Agent skills themselves can carry risk and should be scanned or reviewed. |
| Security | `ghostsecurity/skills` | 410 | AppSec checks should be task-specific. |
| UI/UX | `nextlevelbuilder/ui-ux-pro-max-skill` | 76.8k | Design systems need industry, color, typography, accessibility, and anti-pattern rules. |
| Web quality | `addyosmani/web-quality-skills` | 1.9k | UI quality should include performance, accessibility, and measurable browser checks. |
| UI/UX | `siuserxiaowei/visual-taste-lab` | 27 | Understand visual identity before building pages. |
| UI/UX | `rgranet/designlint-skill` | 1 | Force deliberate design decisions before coding. |
| Design system | `sso-ss/vibe-ship-it` | 8 | `DESIGN.md` can hold reusable visual tokens and component rules. |

## Decisions For This Harness

1. Add code quality gates under `harness/coding/`.
2. Split security hardening into its own domain document.
3. Split visual design into its own domain document.
4. Add a consistency system for code and design reuse.
5. Add small review templates instead of long playbooks.
6. Add an advisory consistency script, but do not make it block normal work.

# Security Max Pattern Research

Date: 2026-05-11

This note records public security references checked for strengthening the harness. Do not copy prompts, commands, branding, or large text from third-party repositories.

## Official References

| Source | Useful Pattern |
|---|---|
| OWASP Top 10:2021 | Cover access control, crypto, injection, insecure design, misconfiguration, vulnerable components, auth failures, integrity, logging, SSRF. |
| OWASP Authorization Cheat Sheet | Deny by default, least privilege, every-request checks, object-level permissions, authorization tests. |
| OWASP Authentication Cheat Sheet | Session handling, MFA for high-risk accounts, brute-force defenses, password reset care. |
| OWASP SQL Injection Prevention Cheat Sheet | Parameterized queries and safe binding over string-built SQL. |
| OWASP File Upload Cheat Sheet | Allowlist extensions, validate type/signature, randomize names, size limits, store outside webroot, require permissions. |
| OWASP Logging Cheat Sheet | Log auth failures, authorization failures, admin actions, sensitive data access, file uploads; do not log secrets. |
| OWASP Top 10 for LLM Applications | Prompt injection, unsafe output handling, supply chain, sensitive information disclosure, excessive agency. |

## GitHub Repositories Checked

Star counts were checked through GitHub API on 2026-05-11.

| Repository | Stars | Useful Pattern |
|---|---:|---|
| `trailofbits/skills` | 5.1k | Security audit should be a dedicated workflow. |
| `mukul975/Anthropic-Cybersecurity-Skills` | 6.2k | Security domains can be routed instead of loaded all at once. |
| `cisco-ai-defense/skill-scanner` | 2.0k | Skills and agent tooling themselves can carry supply-chain risk. |
| `ghostsecurity/skills` | 410 | AppSec checks should be task-specific. |
| `codexstar69/bug-hunter` | 368 | Bug/security review should run on a safe branch and report findings. |
| `AgentSecOps/SecOpsAgentKit` | 131 | Combine secret scanning, container/dependency checks, and policy gates. |
| `agamm/claude-code-owasp` | 179 | Map AI coding guidance to OWASP/ASVS style categories. |
| `awslabs/automated-security-helper` | 647 | Orchestrate multiple scanners instead of trusting one check. |

## Decisions For This Harness

1. Add security levels S0-S3.
2. Add stop conditions for high-risk work.
3. Add Threat Model template.
4. Add advisory `check-security.ps1`.
5. Strengthen auth, authorization, injection, file upload, logging, dependency, CI/CD, and LLM-agent checks.
6. Keep security references routed and short to avoid token waste.

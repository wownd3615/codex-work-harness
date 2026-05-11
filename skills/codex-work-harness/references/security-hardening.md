# Security Hardening

Use this reference for auth, permissions, payments, personal data, uploads, external APIs, webhooks, deployment, environment variables, and server configuration.

## Security Level
- S0: local experiment, public data, no storage.
- S1: internal/local file work without secrets.
- S2: auth, company files, personal data, external APIs, uploads.
- S3: payments, admin, public services, customer data, automated send/delete/payment, LLM tool execution.

Do not claim S3 is safe from vibe coding alone. Report that expert review or operational verification is needed.

## Check
- No secrets or API keys in client code or public repos.
- Permissions are enforced on the server, on every request, and at object/resource level.
- Input validation happens on the server.
- SQL uses parameterized queries or safe ORM binding.
- Shell commands, paths, URLs, and HTML do not directly concatenate user input.
- File uploads restrict type, size, and storage path.
- Errors and logs do not expose internals or sensitive values.
- Sensitive data is stored only when necessary.
- CORS, redirects, and webhooks are narrowly scoped.
- Dependencies are necessary and not obviously risky.
- Cookie-based state changes have CSRF protection.
- Auth/session flows consider MFA for admin/high-risk actions, rate limits, secure cookies, and reset flows.
- LLM/agent features consider prompt injection, unsafe output handling, excessive agency, sensitive data disclosure, and tool permissions.
- CI/CD, deployment scripts, Dockerfiles, and IaC are checked for secrets, broad permissions, and unpinned external actions.

## Stop Before Implementing
Pause for clarification when:
- Real customer data, payments, or company secrets are involved.
- Deletion, transfer, payment, or permission changes run automatically.
- The permission model is unclear.
- Data egress to third parties is unclear.
- A secret may already be committed.
- There is no feasible verification method.

## Threat Model
For risky features, fill `templates/threat-model-lite.md` before implementation:
- Assets
- Actors
- Top risks
- Controls
- Verification

## Advisory Scan
Run `scripts/check-security.ps1` when adding auth, secrets, uploads, deployment config, external APIs, or LLM tools.

## Report
- Risks checked
- Risks fixed
- Risks not yet verified
- Environment variables or permissions the user must configure

# Security Hardening

Use this reference for auth, permissions, payments, personal data, uploads, external APIs, webhooks, deployment, environment variables, and server configuration.

## Check
- No secrets or API keys in client code or public repos.
- Permissions are enforced on the server.
- Input validation happens on the server.
- File uploads restrict type, size, and storage path.
- Errors and logs do not expose internals or sensitive values.
- Sensitive data is stored only when necessary.
- CORS, redirects, and webhooks are narrowly scoped.
- Dependencies are necessary and not obviously risky.

## Report
- Risks checked
- Risks fixed
- Risks not yet verified
- Environment variables or permissions the user must configure

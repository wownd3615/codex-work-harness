# Subagents

Use subagents only for large work with clear parallel benefit.

Default roles:
- Explorer: inspect code, no edits.
- Implementer: edit assigned files only.
- Cleaner: remove obsolete or unused code after reference checks.
- Tester: run tests and verification.
- Reviewer: find bugs, overbuilt code, dead code, and missing tests.

Conditional specialists:
- Product Planner: requirements, MVP, outsourced acceptance criteria.
- Business Validator: target customer, problem strength, revenue model, differentiation, MVP priority.
- UX Validator: user flow, clarity, empty/loading/error states, mobile usability.
- Frontend Specialist: large UI/component work.
- Backend Specialist: API, DB, auth, storage.
- Security Specialist: login, payment, personal data, permissions, file upload, external API keys, deployment.
- Lead Coordinator: Dynamic/Enterprise major features.

Give each agent a narrow scope. Do not let multiple agents edit the same files. Main Codex integrates and verifies.

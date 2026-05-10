# Security, Business, UX Gates

Security gate is required when work touches login, payment, personal data, permissions, file upload, external API keys, deployment, or environment variables.

Check: no client-side secrets, server-side validation, server-side authorization, minimal personal data storage, safe error messages, upload type/size limits.

Business gate is required for new services or major features.

Check: target customer, painful problem, MVP value, revenue or operating-cost logic, differentiation, and whether the feature is needed for validation now.

UX gate is required for user-facing screens.

Check: clear next action, short core flow, empty/loading/error states, mobile fit, readable repeated-work/admin screens.

Security risk outranks feature completeness. Business and UX review should reduce scope, not add nice-to-have features.

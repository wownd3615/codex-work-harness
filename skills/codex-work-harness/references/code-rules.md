# Code Rules

Write the shortest simple code that satisfies the request.

Avoid over-abstraction, future-proofing, unnecessary files, unnecessary functions, and unnecessary dependencies.

After changes, remove obsolete code, unused imports, unused variables, unused functions, unused components, temporary code, and commented-out old code.

Before deletion, check references with `rg`. If unsure, report a deletion candidate instead of deleting.

Separate files by role when it improves maintenance now. Extract shared functions/components only after a second use or clear immediate reuse. Do not split short one-off code just to look structured.

For refactoring, quality gates, UI components, or repeated patterns, also use `code-quality-gates.md` and `consistency-system.md`.


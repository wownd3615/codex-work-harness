# Code Quality Gates

Use this reference when writing, refactoring, reviewing, or simplifying code.

## Before Editing
- Search for similar functions, components, API calls, folder conventions, and tests.
- Prefer existing project style over new abstractions.
- Avoid new dependencies unless clearly needed.

## During Editing
- Write the shortest code that satisfies the request.
- Split by responsibility only when it improves maintenance.
- Avoid copy-paste logic, hidden global state, and temporary flags.
- Use names that reveal purpose.

## After Editing
- Remove unused imports, functions, variables, and replaced code.
- Check whether similar logic now exists in more than one place.
- Run available tests, lint, build, or focused manual verification.
- Report verification honestly.

## Refactor Only When
- Duplication creates real risk.
- A file is too hard to change safely.
- The change can be tested.
- Behavior changes are not mixed with broad cleanup.

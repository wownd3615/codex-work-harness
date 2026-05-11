# Consistency System

Use this reference when modifying UI, frontend code, shared components, styling, folder structure, or repeated business logic.

## Core Rules
- Search for existing patterns before adding code.
- Reuse existing components, helpers, API patterns, state patterns, and test patterns.
- Use `DESIGN.md` or existing design tokens for colors, spacing, typography, radius, and shadows.
- Do not create new visual styles when existing tokens or components cover the need.
- Remove duplicate code or duplicate styles introduced or made obsolete by the change.
- Keep file separation useful, not decorative.

## Before Editing
Check for:
- Similar components or pages
- Shared UI primitives
- Existing CSS variables, Tailwind theme, or design tokens
- Existing API/service/helper patterns
- Existing naming and folder conventions
- Existing test patterns

## DESIGN.md
For user-facing projects, create or update `DESIGN.md` from `templates/design-system-lite.md`.

Use it as the source of truth for:
- Identity and user mood
- Colors
- Typography
- Spacing and layout
- Buttons, cards, inputs, lists, tables, modals
- Loading, empty, error, success states
- Visual anti-patterns

## Report
Include:
- Existing patterns reused
- New components or styles and why they were necessary
- Duplicate code or styles removed
- Viewports or tests checked

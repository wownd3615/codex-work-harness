# PDCA

Use for features and major changes. Skip for quick fixes.

Docs:
- Plan: `docs/01-plan/features/{feature}.plan.md`
- Design: `docs/02-design/features/{feature}.design.md`
- Check: `docs/03-analysis/{feature}.analysis.md`
- Report: `docs/04-report/features/{feature}.report.md`
- Status: `docs/.pdca-status.json`

Flow:
1. Plan: goal, MVP, exclusions, success criteria.
2. Design: screens, data, API, files, risks.
3. Do: implement with minimal code and remove obsolete code.
4. Check: compare design vs implementation and run tests.
5. Act: fix only the gaps. Stop after 5 iterations.

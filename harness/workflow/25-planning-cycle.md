# Planning Cycle

큰 기능은 Plan, Design, Build, Review, Improve로 진행한다. 작은 수정은 바로 처리한다.

## 적용 기준
- Quick Fix: 바로 수정
- Minor Change: 짧게 요약 후 수정
- Feature: 간단한 Plan/Design 후 구현
- Major Feature: Plan/Design을 먼저 만들고 확인 후 구현

## 문서 위치
- Plan: `docs/01-plan/features/{feature}.plan.md`
- Design: `docs/02-design/features/{feature}.design.md`
- Check: `docs/03-analysis/{feature}.analysis.md`
- Report: `docs/04-report/features/{feature}.report.md`
- Status: `docs/.work-status.json`

## 템플릿
기본은 짧은 템플릿을 사용한다.

- Task Card: `templates/task-card-lite.md`
- Plan: `templates/plan-lite.md`
- Design: `templates/design-lite.md`
- Check: `templates/check-lite.md`
- Report: `templates/report-lite.md`

Feature는 Task Card 하나로 시작해도 된다. Scale이거나 외주 검수 문서가 필요할 때만 Plan/Design/Check/Report로 확장한다.

상태 파일이 필요하면 `templates/work-status.template.json`을 복사해서 시작한다.

## 흐름
1. Plan: 목표, MVP, 제외할 것, 성공 기준
2. Design: 화면, 데이터, API, 파일 구조, 위험
3. Build: 최소 코드로 구현, 불필요 코드 삭제
4. Review: Design과 구현 비교, 테스트, 쓰레기 코드 확인
5. Improve: 부족한 부분만 최소 수정

## 완료 기준
요구사항 충족률이 낮으면 Improve를 반복한다. 반복은 최대 5번까지만 한다.


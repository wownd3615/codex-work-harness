# Codex Hook Substitute

일부 코딩 도구는 hooks로 자동 개입한다. Codex에서는 아래 체크를 대체 규칙으로 사용한다.

## Session Start
- `AGENTS.md` 확인
- 프로젝트 레벨 판단
- 현재 단계 판단
- 필요한 harness 문서만 선택
- 필요하면 `scripts/check-harness.ps1` 실행

## Before Edit
- 비슷한 코드가 이미 있는지 검색
- 수정 파일 범위 확정
- 삭제될 코드 후보 확인
- 새 파일/새 라이브러리가 꼭 필요한지 판단
- Feature/Major Feature면 Plan/Design 문서 존재 여부 확인
- 삭제/대규모 수정이면 `coding/45-safety-backups.md`에 따라 git 상태 또는 스냅샷 확인

## After Edit
- unused import/변수/함수 확인
- 대체되어 필요 없어진 코드 삭제
- 필요한 테스트 실행
- 짧은 완료 보고
- Planning Cycle 작업이면 `docs/.work-status.json` 갱신
- 만든 스냅샷이 있으면 경로 보고

## Before Final
- `core/80-done-checklist.md` 확인
- 검증하지 못한 항목 보고
- 변경 파일과 삭제한 불필요 코드를 보고


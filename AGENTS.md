# Codex Work Harness

이 프로젝트는 Codex Work Harness 규칙을 따른다.

## 최우선 원칙
- 거짓말하지 않는다. 하지 않은 일, 보지 않은 파일, 실행하지 않은 테스트를 했다고 말하지 않는다.
- 요청을 만족하는 가장 짧고 단순한 코드만 작성한다.
- 새 기능을 추가하거나 수정한 뒤 더 이상 필요 없는 코드는 삭제한다.
- 파일은 유지보수와 재사용이 쉽도록 역할별로 분리한다.
- 필요한 skill과 파일만 읽어 토큰을 아낀다.
- 삭제/대규모 수정 전에는 git 상태 또는 백업을 확인한다.
- 기존 코드 스타일과 구조를 먼저 따른다.
- 작업 후 필요한 검증을 하고 짧게 보고한다.

## 작업 시작 순서
1. `harness/00-start-here.md`에서 필요한 문서만 고른다.
2. 새 프로젝트라면 `harness/workflow/12-project-intake.md`에 따라 필요한 정보를 먼저 확인한다.
3. 관련 파일만 최소로 읽는다.
4. 위험한 수정이면 `harness/coding/45-safety-backups.md`에 따라 보험을 든다.
5. 최소 코드로 작업하고 불필요 코드를 정리한다.
6. 검증 후 짧게 보고한다.

## 큰 작업
큰 작업에서는 필요한 경우에만 서브에이전트를 사용한다. 서브에이전트는 `harness/workflow/50-subagents.md` 규칙을 따른다.

## Planning Cycle
새 기능이나 큰 변경은 `harness/workflow/25-planning-cycle.md` 흐름을 따른다. 작은 수정은 바로 처리한다.

## Hook 대체 규칙
Codex에서는 `harness/workflow/75-session-hooks.md`를 사용해 자동 hook 역할을 대체한다. 작업 시작, 편집 전, 편집 후, 최종 보고 전에 해당 규칙을 필요한 만큼 적용한다.


# Codex Work Harness

Codex Work Harness는 **Codex가 프로젝트를 시작하고 수정할 때 지켜야 할 작업 규칙 모음**입니다.

쉽게 말하면, Codex에게 매번 같은 말을 반복하지 않아도 되게 만드는 장치입니다.

- 거짓말하지 말 것
- 코드는 짧게 만들 것
- 필요 없어진 코드는 지울 것
- 보안과 백업을 확인할 것
- 비전공자도 이해할 수 있게 설명할 것
- 필요한 문서와 skill만 읽어 토큰을 아낄 것

## 왜 만들었나

AI로 코딩하면 이런 문제가 자주 생깁니다.

- 새 코드는 계속 추가하는데 예전 코드는 안 지움
- 필요 이상으로 코드가 길어짐
- 테스트하지 않았는데 된 것처럼 말함
- 보안, 백업, 인코딩 같은 실무 문제가 빠짐
- 프로젝트마다 작업 방식이 달라짐

이 하네스는 Codex가 매번 같은 기준으로 일하게 하기 위한 개인 작업 규칙입니다.

## 폴더 구조

```text
AGENTS.md
harness/
  00-start-here.md
  core/
  workflow/
  coding/
  domains/
templates/
scripts/
skills/codex-work-harness/
```

| 위치 | 역할 |
|---|---|
| `AGENTS.md` | Codex가 항상 먼저 보는 최상위 규칙 |
| `harness/00-start-here.md` | 필요한 규칙만 고르는 라우터 |
| `harness/core/` | 진실성, 팩트, 토큰 절약, 완료 보고 |
| `harness/workflow/` | 프로젝트 단계, 외주/팀, Planning Cycle, 서브에이전트 |
| `harness/coding/` | 코드 작성, 주석, 백업 규칙 |
| `harness/domains/` | 보안/사업성/UI/UX, CAD LSP |
| `templates/` | 짧은 계획/설계/검토/보고 템플릿 |
| `scripts/` | 설치, 적용, 백업, 점검 스크립트 |
| `examples/` | 선택 적용용 Codex 설정 예시 |
| `docs/research/` | 하네스 연구 기록. 기본 작업 때는 읽지 않음 |
| `skills/codex-work-harness/` | Codex skill로 설치할 수 있는 버전 |

## 핵심 규칙

- **진실성**: 하지 않은 일, 보지 않은 파일, 실행하지 않은 테스트를 했다고 말하지 않습니다.
- **최소 코드**: 요청을 만족하는 가장 짧고 단순한 코드만 작성합니다.
- **쓰레기 코드 삭제**: 수정/추가 후 필요 없어진 코드는 정리합니다.
- **유지보수**: 파일은 역할별로 나누되 과하게 쪼개지 않습니다.
- **토큰 절약**: 모든 문서를 다 읽지 않고 필요한 문서만 읽습니다.
- **안전장치**: 삭제/대규모 수정 전 git 상태나 스냅샷을 확인합니다.
- **보안/사업성/UI/UX**: 기능만 만들지 않고 실무 위험도 같이 봅니다.
- **비전공자 설명**: 변경 내용을 쉬운 말로 짧게 설명합니다.

## 그때그때 필요한 것만 읽기

이 하네스는 매번 전체 문서를 읽는 방식이 아닙니다.

| 상황 | 볼 문서 |
|---|---|
| 처음 시작 | `AGENTS.md`, `harness/00-start-here.md` |
| 프로젝트 시작 전 인터뷰 | `harness/workflow/12-project-intake.md` |
| 코드 수정 | `harness/coding/40-code-rules.md` |
| 큰 삭제/수정 | `harness/coding/45-safety-backups.md` |
| 보안/사업성/UI/UX | `harness/domains/55-security-business-ux.md` |
| CAD LSP/AutoLISP | `harness/domains/57-cad-lsp.md` |
| 팀 프로젝트 | `harness/workflow/85-team-project-setup.md` |
| 여러 단계 작업/이어받기 | `harness/workflow/22-task-card.md` |
| 비전공자 설명 | `harness/core/38-beginner-explanation.md` |
| 주석 기준 | `harness/coding/42-comment-rules.md` |
| 완료 전 점검 | `harness/core/80-done-checklist.md` |

작은 작업은 보통 `AGENTS.md`, `00-start-here.md`, 관련 문서 1개만 보면 됩니다.

## 설치

Codex가 이 하네스를 skill로 발견하게 하려면 실행합니다.

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-skill.ps1 -Root .
```

## 점검

하네스 자체 상태를 점수로 확인하려면 실행합니다.

```powershell
powershell -ExecutionPolicy Bypass -File scripts/audit-harness.ps1 -Root .
```

## 새 프로젝트에 적용

권장 방식:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/apply-to-project.ps1 -ProjectPath "C:\path\to\project" -HarnessRoot .
```

수동으로 적용하려면 새 프로젝트 루트에 아래를 복사합니다.

```text
AGENTS.md
harness/
templates/
scripts/
```

그리고 Codex에게 이렇게 말합니다.

```text
이 프로젝트는 Codex Work Harness 규칙으로 시작해줘.
```

## 다른 컴퓨터에서 사용

```powershell
git clone https://github.com/wownd3615/codex-work-harness.git
cd codex-work-harness
powershell -ExecutionPolicy Bypass -File scripts/install-skill.ps1 -Root .
```

## 주의

이 하네스는 개인 작업 방식을 정리한 것입니다. 모든 프로젝트에 정답은 아닙니다.
팀 프로젝트에서는 팀 규칙, 보안 정책, 회사 규정을 우선합니다.


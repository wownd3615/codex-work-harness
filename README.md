# Codex Work Harness

Codex를 매 프로젝트마다 같은 방식으로 움직이게 만드는 하네스 초안이다.

## 구성
- `AGENTS.md`: 프로젝트 루트에 두는 최상위 규칙
- `harness/`: 단계별 상세 규칙
- `templates/`: 짧은 PDCA 문서 템플릿
- `scripts/check-harness.ps1`: 하네스 파일 존재 확인
- `scripts/install-skill.ps1`: Codex skill 설치
- `scripts/apply-to-project.ps1`: 새 프로젝트에 하네스 적용
- `scripts/snapshot.ps1`: 큰 작업 전 파일 스냅샷 생성
- `scripts/check-lsp-encoding.ps1`: CAD LSP 인코딩 확인
- `skills/codex-work-harness/`: Codex skill로 옮겨 쓸 수 있는 버전

## 새 프로젝트 적용
권장 방식:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/apply-to-project.ps1 -ProjectPath "C:\path\to\project" -HarnessRoot .
```

수동으로 적용하려면 새 프로젝트 루트에 아래를 복사한다.

```text
AGENTS.md
harness/
templates/
scripts/
```

그리고 Codex에게 이렇게 말한다.

```text
이 프로젝트는 Codex Work Harness 규칙으로 시작해줘.
```

## Skill 설치
Codex가 `codex-work-harness` skill을 발견하게 하려면 실행한다.

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-skill.ps1 -Root .
```

## GitHub 보관
이 폴더를 GitHub 저장소로 보관하면 새 컴퓨터에서도 clone 후 설치할 수 있다.

```powershell
git clone <repo-url>
cd codex-work-harness
powershell -ExecutionPolicy Bypass -File scripts/install-skill.ps1 -Root .
```

## 핵심 규칙
- 거짓말하지 않는다. 하지 않은 일은 했다고 말하지 않는다.
- 코드는 최소한으로 짧게 작성한다.
- 수정/추가 후 필요 없어진 코드는 삭제한다.
- 파일은 유지보수와 재사용이 쉽도록 분리한다.
- 필요한 skill과 파일만 읽는다.
- 삭제/대규모 수정 전에는 git 상태 또는 스냅샷을 확인한다.
- 외주/직접개발 모드를 먼저 판단한다.
- 팀 프로젝트면 브랜치, PR, 리뷰, 보안 규칙을 먼저 따른다.
- 아이디어, 설계, 구현, 검증까지 단계별로 돕는다.

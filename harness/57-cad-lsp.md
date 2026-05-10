# CAD LSP Rules

AutoCAD/BricsCAD/ZWCAD 등 CAD용 LSP/AutoLISP 작업에 적용한다.

## 기본 원칙
- 도면 데이터를 바꾸는 코드는 특히 보수적으로 작성한다.
- 최소 코드 원칙을 지키되, 도면 손상 방지 코드는 생략하지 않는다.
- 명령어 이름, 입력값, 선택집합, undo, error 처리를 명확히 한다.
- 기존 사용자가 쓰던 명령어 이름과 작업 흐름을 우선 유지한다.

## 파일/이름 규칙
- `.lsp`, `.dcl`, `.vlx`, `.fas` 관련 작업은 CAD LSP 작업으로 분류한다.
- 명령어 함수는 `c:commandName` 형태를 명확히 사용한다.
- 내부 helper 함수는 충돌을 줄이기 위해 프로젝트 접두어를 붙인다.
- 전역 변수는 최소화한다.
- 사용하지 않는 함수와 예전 명령어는 참조 확인 후 삭제한다.

## 인코딩 규칙
CAD LSP 파일은 UTF-8로 저장하면 로드 실패나 한글 깨짐이 생길 수 있다.

- 기존 `.lsp` 파일의 인코딩을 먼저 확인하고 유지한다.
- 새 `.lsp` 파일은 사용 CAD 환경에 맞는 ANSI/CP949 계열을 기본 후보로 둔다.
- 한글 문자열이 있는 LSP를 무작정 UTF-8로 저장하지 않는다.
- PowerShell `Set-Content` 기본값으로 `.lsp`를 쓰지 않는다.
- 코드 편집 후 한글 주석/프롬프트가 깨졌는지 확인한다.
- 인코딩을 바꿨다면 반드시 보고한다.
- 확실하지 않으면 사용자에게 CAD 종류와 저장 인코딩을 확인한다.

권장 확인:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/check-lsp-encoding.ps1 -Path path\to\file.lsp
```

## 안전 규칙
- 도면을 수정하는 명령은 가능한 undo group을 사용한다.
- 에러 핸들러에서 시스템 변수를 원복한다.
- 변경한 system variable은 반드시 원래 값으로 되돌린다.
- `ssget` 결과가 nil일 때 바로 종료한다.
- entity data를 수정하기 전 대상 타입을 확인한다.
- 레이어, 블록, 스타일, 치수 설정을 만들거나 바꿀 때 기존 이름 충돌을 확인한다.

## 금지
- 사용자의 도면 전체를 무조건 변경하는 코드
- 확인 없는 purge/delete/erase
- hardcoded layer/style 이름 남발
- 에러 시 system variable이 바뀐 채로 남는 코드
- 테스트 없이 "도면에서 잘 돈다"고 말하기

## 테스트/검증
Codex가 CAD를 직접 실행할 수 없으면 정적 검토만 했다고 보고한다.

확인할 것:
- 괄호 균형
- 파일 인코딩과 한글 문자열 깨짐 여부
- 명령어 함수 존재
- nil 선택집합 처리
- undo/error 처리
- system variable 원복
- 대상 entity type 검증
- 기존 명령어/함수 참조 확인

## 보고
보고에는 다음을 포함한다.
- 추가/수정한 명령어 이름
- 도면을 변경하는 동작
- 안전장치
- 실제 CAD 실행 여부
- 실행하지 못했다면 사용자가 CAD에서 테스트할 최소 절차

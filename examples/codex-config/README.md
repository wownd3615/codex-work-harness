# Codex Config Examples

이 폴더는 예시다. 자동 적용되지 않는다.

실제 프로젝트에서 Codex rules/hooks를 쓰고 싶을 때만 아래처럼 복사한다.

```powershell
Copy-Item -Recurse examples/codex-config/.codex .codex
```

적용 전 확인:

- 팀 프로젝트라면 팀 합의가 있는가
- 위험 명령 확인이 업무 흐름을 막지 않는가
- Codex가 프로젝트 `.codex/` 설정을 신뢰하도록 되어 있는가

예시는 보수적으로 시작한다. 프로젝트에 맞게 줄여서 쓴다.

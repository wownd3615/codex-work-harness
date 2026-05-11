# Security Review

## Scope
{검토한 기능/파일}

## Security Level
{S0/S1/S2/S3}

## Threat Model
- Assets: {지켜야 할 데이터/권한/비용}
- Actors: {공격자/권한 없는 사용자}
- Top Risks: {상위 위험 3개}

## Risks Checked
- [ ] Secret/API key exposure
- [ ] Server-side permission check
- [ ] Object-level authorization / IDOR
- [ ] Server-side input validation
- [ ] SQL/command/path injection
- [ ] CSRF for cookie-based state changes
- [ ] Personal/sensitive data storage
- [ ] Error/log information leak
- [ ] File upload/download safety
- [ ] External API/webhook safety
- [ ] Dependency/supply-chain risk
- [ ] LLM/agent prompt injection or excessive agency
- [ ] Logging/monitoring without sensitive data leakage
- [ ] Deployment/CI/CD permissions and secrets

## Findings
- {발견한 위험}

## Fixes
- {수정한 내용}

## Verification
- {테스트/수동 확인/스캔 결과}

## Remaining Risk
- {아직 확인 못 한 것}



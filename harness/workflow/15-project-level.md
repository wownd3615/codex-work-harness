# Project Level

프로젝트 복잡도를 먼저 판단한다.

## Starter
정적 사이트, 간단한 웹앱, 로컬 도구, MVP.

우선순위:
- 쉬운 설명
- 최소 코드
- 빠른 실행
- 적은 파일

## Dynamic
로그인, DB, API, 관리자 화면, 외부 서비스 연동이 있는 앱.

우선순위:
- 데이터 흐름 명확화
- API/상태/UI 분리
- 테스트와 에러 처리
- 배포 가능한 구조

## Enterprise
여러 서비스, 인프라, 권한, 보안, CI/CD, 대규모 운영이 있는 시스템.

우선순위:
- 설계 문서
- 보안/권한
- 운영/배포
- 변경 영향 분석

## 감지 기준
- `api`, `backend`, `supabase`, `firebase`, `docker-compose.yml`가 있으면 Dynamic 후보.
- `kubernetes`, `terraform`, `infra`, `services`, `pnpm-workspace.yaml`, `.github/workflows`가 있으면 Enterprise 후보.
- 위 조건이 없으면 Starter로 시작한다.

레벨 판단은 작업 방식을 고르는 기준일 뿐, 코드를 길게 짜도 된다는 뜻이 아니다.

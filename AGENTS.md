# AGENTS.md — 채용 파이프라인 공통 규약

이 파일은 프로젝트(작업 디렉터리) 컨텍스트다. 5개 에이전트가 **공유하는 작업 규칙**을 정의한다.
(개별 정체성/말투는 각 프로필의 `SOUL.md`에, 단계별 절차는 각 `SKILL.md`에 있다.)

## 파이프라인 개요
```
PORTFOLIO.md
   │
   ▼ 1. 수집자(collector)   → workspace/01_collected.json
   ▼ 2. 평가자(evaluator)   → workspace/02_evaluated.json   (passed/dropped)
   ▼ 3. 분석가(analyst)     → workspace/03_analysis.md      (passed 회사만)
   ▼ 4. 작성자(writer)      → workspace/04_cover_letters/*.md
   ▼ 5. 결정자(decider)     → workspace/05_decision.md      (apply/hold/drop)
```

## 핸드오프 규칙 (가장 중요)
- 각 단계는 **앞 단계의 산출물 파일만** 입력으로 받고, 자기 산출물 파일만 쓴다.
- 파일 경로와 스키마는 각 단계 `SKILL.md`에 정의된 그대로 따른다. 임의로 바꾸지 않는다.
- 산출물은 항상 `workspace/`에 저장한다. 다른 단계의 산출물을 덮어쓰지 않는다.
- 입력 파일이 없거나 비었으면 작업을 멈추고 "이전 단계 먼저 실행 필요"라고 보고한다.

## 사실성·인용 규칙
- 확인 불가한 값은 `(미확인)`으로 표시한다. 추측을 사실처럼 쓰지 않는다.
- 외부 정보(채용공고·기업정보)에는 출처 URL을 남긴다.
- 자소서에는 포트폴리오에 **근거가 있는 내용만** 쓴다(날조 금지).

## 책임 있는 사용 (필수)
- 채용 사이트는 robots.txt·이용약관을 존중한다. 무단 대량 스크래핑 금지.
- 로그인/유료 데이터가 필요하면 공식 검색·RSS·API로 대체하고, 안 되면 `(미확인)`으로 남긴다.
- **최종 지원 버튼은 사람이 누른다.** 이 파이프라인은 추천·초안까지만. 자동 제출하지 않는다.
- 개인정보(연락처·주민번호 등)는 산출물에 평문으로 남기지 않는다.

## 입력 파일
- `PORTFOLIO.md` — 지원자가 직접 채운다. 템플릿은 `PORTFOLIO.example.md` 참고.
- 실제 개인정보가 든 `PORTFOLIO.md`, `workspace/` 산출물은 git에 커밋하지 않는다(.gitignore 처리).

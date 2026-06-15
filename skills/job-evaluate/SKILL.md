---
name: job-evaluate
description: 수집된 채용 공고가 지원자 포트폴리오에 정말 적합한지 점수화하고 통과/탈락으로 거른다. 채용 파이프라인 2단계 또는 "이 공고들 나한테 맞아?" 요청에 사용.
---

# 채용 공고 평가·필터링 (job-evaluate)

## 언제 쓰나 (triggers)
- 채용 파이프라인의 **2단계**로 실행될 때
- 수집된 공고 목록을 지원자 기준으로 걸러야 할 때

## 입력
- `workspace/01_collected.json` — 수집자의 산출물(필수)
- `PORTFOLIO.md` — 지원자 포트폴리오(필수)

## 평가 기준 (scoring)
각 항목 0~5점, 가중치 적용 → 100점 만점으로 환산:
- **직무 적합성** ×3 — 핵심 자격요건 대비 보유 역량
- **연차/레벨 정합성** ×2 — 주니어↔시니어 미스매치 여부
- **기술 스택 일치** ×2 — 필수 스택 보유 여부
- **현실 조건** ×1 — 지역·고용형태·도메인 선호
- 환산 점수 **60점 미만 → `fail`**, 60~74 → `borderline`(통과하되 표시), 75+ → `pass`.

## 절차 (steps)
1. `01_collected.json`과 `PORTFOLIO.md`를 읽는다.
2. 각 공고를 위 기준으로 채점하고 항목별 점수와 환산 총점을 계산한다.
3. `verdict`(pass/borderline/fail)와 **구체적 사유**를 작성한다.
   - 나쁜 예: "스택 불일치" / 좋은 예: "필수 Kotlin 미보유, 지원자는 Python 중심 3년차".
4. `fail` 공고는 `dropped`로 분리하고, `pass`·`borderline`은 `passed`로 정리한다.
5. 결과를 `workspace/02_evaluated.json`에 저장한다.

## 출력 스키마 — `workspace/02_evaluated.json`
```json
{
  "evaluated_at": "YYYY-MM-DD",
  "summary": { "total": 12, "passed": 5, "dropped": 7 },
  "passed": [
    {
      "id": "c01", "company": "회사명", "title": "직무명", "url": "https://...",
      "fit_score": 82,
      "breakdown": { "role": 5, "level": 4, "stack": 4, "reality": 3 },
      "verdict": "pass",
      "reasons": ["통과 사유1", "통과 사유2"],
      "concerns": ["남은 우려(있으면)"]
    }
  ],
  "dropped": [
    { "id": "c07", "company": "...", "fit_score": 41, "verdict": "fail",
      "reasons": ["탈락 사유(구체적으로)"] }
  ]
}
```

## 흔한 함정 (pitfalls)
- 공고를 새로 수집하지 않는다 — 들어온 목록만 평가한다.
- 회사 이름값에 흔들리지 말 것. 오직 "이 지원자 ↔ 이 공고" 적합성만 본다.
- 점수 없이 감으로 통과시키지 않는다.
- 애매하면 보수적으로 — `borderline`으로 표시하되 사유를 남긴다.

## 성공 기준 (verify)
- `workspace/02_evaluated.json`이 유효한 JSON이고 모든 공고가 `passed` 또는 `dropped`에 분류됨.
- 모든 항목에 `fit_score`와 `reasons`가 있다.
- `summary.passed + summary.dropped == summary.total`.

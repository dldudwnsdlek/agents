---
name: job-collect
description: 지원자 포트폴리오를 분석해 대한민국 최신 채용 공고를 폭넓게 수집하고 표준 JSON으로 저장한다. "채용 공고 찾아줘", "잡서치", "공고 수집" 요청이나 채용 파이프라인 1단계에서 사용.
---

# 채용 공고 수집 (job-collect)

## 언제 쓰나 (triggers)
- 사용자가 포트폴리오 기반으로 채용 공고를 찾아달라고 할 때
- 채용 파이프라인의 **1단계**로 실행될 때

## 입력
- `PORTFOLIO.md` — 지원자 포트폴리오(필수)
- 선택 필터: 희망 지역 / 연봉 / 고용형태 / 직무 / 제외 키워드

## 절차 (steps)
1. `PORTFOLIO.md`를 읽고 핵심 직무·기술 스택·경력 연차·강점을 **3~7개 키워드**로 추출한다.
2. 전이 가능한 인접 직무까지 검색어를 확장한다(표면 일치에 갇히지 말 것).
3. `web` 툴셋으로 다음 소스를 검색한다 — 원티드, 점핏, 사람인, 잡코리아, 프로그래머스,
   링크드인, 기업 채용페이지. **공식 검색 URL / API / RSS를 우선**한다.
4. 공고별로 회사명·직무명·URL·지역·고용형태·마감일·핵심 자격요건을 수집한다.
5. 같은 회사·직무의 중복 공고는 1건으로 병합하고 모든 출처 URL을 보존한다.
6. 마감 지난 공고는 제외한다.
7. 공고별 `match_reason`(이 지원자에게 맞는 이유)을 1~2문장으로 작성한다.
8. 결과를 아래 스키마로 `workspace/01_collected.json`에 저장한다.

## 출력 스키마 — `workspace/01_collected.json`
```json
{
  "generated_at": "YYYY-MM-DD",
  "candidate_keywords": ["백엔드", "Spring", "결제", "MSA", "3년차"],
  "jobs": [
    {
      "id": "c01",
      "company": "회사명",
      "title": "직무명",
      "url": "https://...",
      "source": "wanted|jumpit|saramin|jobkorea|linkedin|corp",
      "location": "서울 강남구",
      "employment_type": "정규직",
      "deadline": "YYYY-MM-DD | 상시채용",
      "requirements": ["필수 자격요건1", "우대사항2"],
      "match_reason": "이 지원자에게 맞는 이유(1~2문장)"
    }
  ]
}
```

## 흔한 함정 (pitfalls)
- 로그인/유료 API가 필요한 보드는 공개 검색 결과·RSS로 대체하고, 못 가져온 값은 `"(미확인)"`으로 남긴다.
- 키워드 표면 일치에만 의존하지 말 것 — 직무 상세를 읽고 실제 적합성으로 판단.
- 적합/부적합 **판정을 하지 않는다**(평가자의 일). 넓게, 그러나 정확하게 모은다.
- 무단 스크래핑 금지. robots.txt·이용약관을 존중한다.

## 성공 기준 (verify)
- `workspace/01_collected.json`이 유효한 JSON이고 **1건 이상**의 공고를 포함한다.
- 모든 공고에 `url`과 `match_reason`이 있다.
- 마감 지난 공고가 없다.

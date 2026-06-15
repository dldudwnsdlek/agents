# 기업 분석 리포트 (2026-06-15)

> 분석가(analyst) 산출물. 입력: `workspace/02_evaluated.json`(passed 7개사) + `PORTFOLIO.md`(이영준).
> 지원자 핏 기준 = 추천시스템 · XAI(SHAP/TabNet) · 금융 FDS · LLM 경량화(GPTQ)/RAG, 신입, 수도권(분당·판교·서울) 선호, 정규직 우선.
> 원칙: 핵심 주장마다 출처 URL. 확인 불가 = `(미확인)`. 익명 커뮤니티(블라인드 등)는 '단서'로만. 오늘 2026-06-15 기준 최신 정보 우선.

## 요약표

| 회사 | 직무 | 별점 | 한 줄 평 | 핵심 리스크 |
|---|---|---|---|---|
| 버즈빌 | [광고 추천팀] ML Engineer | ★★★★★ | 광고 추천(DSP) ML이 지원자 CTR/추천 강점과 1:1, 흑자+IPO 준비 안정 기업 | 근무지 서울 송파(분당/판교 1순위 아님), 신입 채용 경쟁 강도 |
| 카카오뱅크 | 데이터 사이언티스트 (Data Science) | ★★★★ | 분당 인터넷전문은행, 금융 ML 정공·안정성 최상 | 신입은 채용연계형 인턴 진입(정규직 전환율 미공개) |
| 카카오뱅크 | [Data] DS (FDS·AML) | ★★★★½ | FDS 직무가 지원자 사기탐지 프로젝트와 거의 완전 일치(최강 핏) | 공고 최신성·신입 가능 여부 (미확인), AML/STR 규제 실무 경험 없음 |
| 랩큐(LabQ) | AI/ML 엔지니어 (신입/경력) | ★★★ | RAG/sLLM이 지원자 LLM·RAG 강점과 부합하나 9인 초소형사 | 직원 ~9명, 2024 매출 -43%, 처우·안정성 불확실 |
| 토스(비바리퍼블리카) | ML Engineer (추천/Ads) | ★★★★ | 추천/광고 랭킹 ML 정상급, 첫 흑자·US IPO 추진 톱티어 | 신입 집중채용 종료(현 신입 가능 시점 미확인), 근무지 강남 |
| 라피치(Raviche) | STT·NLP 엔지니어 (신입/경력) | ★★½ | 음성(STT) 중심이라 지원자 텍스트 NLP/추천 강점 활용도 낮음 | 2024 영업적자 전환, 핵심 직무(ASR) 미스매치 |
| 마키나락스 | [신입/인턴] ML 엔지니어 (LLM) | ★★★½ | LLM 직무가 지원자 경량화/RAG와 정렬, 2026 코스닥 상장 임박 | 인턴→정규직 '검토'(보장X), 산업/국방 도메인 신규·추천/금융 선호와 이격 |

---

## 1. 버즈빌(Buzzvil) — [광고 추천팀] ML Engineer / 머신러닝 엔지니어 (신입 가능, 병역특례요원)

- **개요**: 2012년 4월 설립된 AI 기반 리워드 애드테크 기업. 주력은 잠금화면 리워드 광고('허니스크린') 및 B2B 광고 네트워크/SaaS. 직원 약 113명, 본사 서울 송파구. 국내 이통 3사 및 CJ·SPC·롯데·라인 등 150개+ 퍼블리셔 보유. (출처: https://www.wanted.co.kr/company/99 , https://www.saramin.co.kr/zf_user/company-info/view/csn/eUU2c1ptVjc4WDNoNWJaM2MvanduZz09 , https://platum.kr/archives/164492 )
- **사업/성장성**: B2B 광고 네트워크 + 리워드 마케팅 모델. **2024년 연결 매출 1,012억원, 영업이익 43.9억원으로 흑자 전환(역대 최고)**, 최근 5년 연평균 매출 성장 약 33%. 누적 투자 약 345억원(위메이드·소프트뱅크벤처스·LB인베스트먼트·산업은행·신한은행 등 4라운드). 미래에셋증권을 주관사로 코스닥 IPO를 추진해 왔으나(2021 발표) 일정이 지연되어 왔고, **흑자 전환에도 상장을 미루는 상황**으로 보도됨. 정확한 2026 상장 일정은 (미확인). 2026 전략으로 'AI 기술 투자·범용 포인트 제휴·SaaS 통합', '에이전틱 애드' 언급. (출처: https://wowtale.net/2025/04/01/239216/ , https://www.thebell.co.kr/free/content/ArticleView.asp?key=202504221445582960109052 , https://thevc.kr/buzzvil , https://www.buzzvil.com/resources/39y7VR0LWyLseuP7VH825Z )
- **조직/문화**: 백엔드는 Python/Go 마이크로서비스(2021.10 기준 Python 21·Go 16·Node.js 7). **광고 추천팀(DSP)의 ML 스택은 PyTorch·SageMaker·Triton·MLflow, 데이터 인프라는 S3·Athena.** 광고 추천/입찰/예산관리 모델을 개발하고 A/B 테스트로 가설 검증, 온·오프라인 추론 서비스 및 성과 모니터링 운영. 기술블로그(tech.buzzvil.com) 활발, AWS 기반 딥러닝 사례로도 소개됨. 잡플래닛 평점 약 4.0~4.1(리뷰 130여 건), '자율적 조직문화·워라밸' 평가는 단서 수준으로 참고. (출처: https://tech.buzzvil.com/blog/buzzvil-backend-tech-stack/ , https://www.blindhire.co.kr/job/10439 , https://aws.amazon.com/ko/blogs/korea/deep-learning-on-aws-wanted-mathpresso-buzzbill/ , https://www.jobplanet.co.kr/companies/313882/reviews/%EB%B2%84%EC%A6%88%EB%B9%8C )
- **평판/리스크**: 강점 — 흑자 전환·견조한 성장·IPO 준비 단계로 스타트업치고 재무 안정성 양호, 애드테크/DSP 추천 분야 국내 선두. 우려 — IPO 일정 불확실(반복 지연), 광고 시장/플랫폼 정책 변동 노출. 평균 연봉 약 5,600~5,700만원(초봉 약 3,800만원, 캐치/원티드 집계)은 참고치. (출처: https://www.thebell.co.kr/free/content/ArticleView.asp?key=202504221445582960109052 , https://www.catch.co.kr/Comp/CompSummary/I05465 )
- **지원자 관점 핏**: 기회 — 직무 핵심이 광고 추천(CTR/랭킹) ML로, 지원자의 **AutoInt(CTR, TF 커스텀 레이어 직접 구현)·NCF·LightGCN** 경험과 정확히 정렬. '논문 읽고 구현 가능' 요건을 제1저자 2편(은상)으로 정면 충족. SageMaker/Triton/MLflow 등 실서비스 MLOps를 배우며 모델링 임팩트를 낼 수 있어 신입 성장 환경 우수. 리스크 — 근무지 송파(석촌호수)로 희망 1순위(분당/판교) 아님(수도권은 충족). '신입 가능' 공고이나 추천 ML 신입 경쟁 강도 높음. 병역특례 트랙은 해당자 한정(지원자 병역 상태 미확인)으로 일반 정규직 지원에는 영향 없음.
- **별점**: ★★★★★ · **한 줄 평**: 7개사 중 직무-강점 정합성과 재무 안정성을 함께 만족하는 최상위 후보. 근무지만 1순위 아님.

---

## 2. 카카오뱅크 — 데이터 사이언티스트 (Data Science) [c02] / [Data] 데이터 사이언티스트 (금융분석·FDS·AML) [c03]

> 동일 회사·인접 직무라 한 섹션에서 두 공고를 함께 다루되, 직무별 핏 차이를 구분한다.

- **개요**: 2016년 출범한 국내 대표 인터넷전문은행(코스피 상장사, 카카오 계열). 본사·근무지 경기 성남 분당구 백현동(판교 인접) — **지원자 희망지역 1순위 충족**. (출처: 공고 https://www.catch.co.kr/NCS/RecruitInfoDetails/417274 , https://recruit.kakaobank.com/jobs )
- **사업/성장성**: 모바일 리테일 뱅킹 기반의 안정적 수익 구조와 플랫폼·데이터 사업 확장. 상장 은행으로 재무 안정성은 7개사 중 최상위급(스타트업 대비 도산 리스크 낮음). (출처: https://recruit.kakaobank.com/jobs )
- **조직/문화**: 데이터 조직(빅데이터팀)이 데이터 엔지니어링(실시간)과 데이터 사이언스(ML 모형)를 결합해 FDS 등 은행 서비스에 직접 적용. **2026-06-09 보도: 카카오뱅크가 어텐션 메커니즘 기반 'AI 시퀀스 탐지 모델'을 FDS에 적용 — 거래 발생 순서·행동 간 시간 간격·기기 변경 행태를 종합 분석.** 2025년 11월 시범 도입 후 금융사기 예방 건수 월평균 4.4배 증가, 2026년 1분기 사기 의심 사례의 49.8%를 이 모델이 독자 탐지. 우대 스택으로 Hadoop/Spark, AWS/Azure, 데이터 엔지니어링/금융·플랫폼 이해 언급. (출처: https://blog.kakaobank.com/219 , https://www.cnbnews.com/news/articleView.html?idxno=1003984 , https://biz.heraldcorp.com/article/10766945 , https://zdnet.co.kr/view/?no=20260609161045 )
- **평판/리스크**: 강점 — 금융 데이터 규모·안정성·브랜드, 최신 어텐션 기반 FDS 등 ML 적용이 활발해 학습 환경 우수. 우려 — **신입은 정규직이 아닌 '채용연계형 인턴(Tech Intern)'으로 진입**하며, 근무 종료 시 정규직 전환 평가를 받으나 **전환율은 공개되지 않음**(블라인드 등에서 전환율 문의가 단서로 관측 — 무비판 인용은 지양). 채용 절차는 서류→코딩테스트→실무진 면접→경영진 면접. 면접 난이도 평가는 단서 수준. (출처: https://www.jobkorea.co.kr/Recruit/GI_Read/36917039 , https://jasoseol.com/recruit/87318 , https://www.teamblind.com/kr/post/... [단서], https://www.jobplanet.co.kr/companies/318225/interviews/... )
- **지원자 관점 핏(직무별 구분)**:
  - **c02 DS(일반)**: 예측·ML/DL 모델 개발 핵심 직무로 지원자의 앙상블 ML(CatBoost/XGBoost/LightGBM)·예측모델 경험과 정렬. 다만 데이터 시각화 도구(Tableau/imply) 직접 경험은 (미확인) — Streamlit 대시보드로 일부 대체. 범용성이 높아 진입·성장 안정적.
  - **c03 DS(FDS·AML)**: **지원자 최강 핏.** 금융결제원 FDS 프로젝트(사기비율 0.03% 불균형 해결, 파생 Feature 45개+, SMOTE+UnderSampling, 누수 차단 날짜 분할, **CatBoost F1 0.968**)가 직무와 거의 1:1. 특히 카카오뱅크의 **시퀀스·어텐션 FDS** 방향은 지원자의 AutoInt(Self-Attention) 경험과도 개념적으로 맞닿아 기술 서사 연결이 자연스러움. 리스크 — AML/STR(자금세탁방지) 규제 영역 실무 경험은 없음(FDS 모델링 경험으로 전이 가능). c03 공고가 과거 동일 직무 기준이라 **최신 요건·신입 가능 여부는 (미확인) → 채용페이지 재확인 필수.** c02/c03는 직무 인접 → 중복 지원 시 FDS 강점이 더 사는 c03 우선 정리 권장.
- **별점**: c02 ★★★★ / c03 ★★★★½ · **한 줄 평**: 분당 소재 안정 금융사에서 지원자 FDS 강점이 정면으로 빛나는 자리. 단, 신입은 인턴 트랙·전환율 미공개가 변수.

---

## 3. 랩큐(LabQ) — [정규직/계약직/인턴][신입/경력] AI 개발자 / ML 엔지니어

- **개요**: 2019년 7월 설립된 AI 연구개발·서비스 기업. 업종은 컴퓨터시스템 통합 자문·구축. **직원 약 9명(초소형)**, 본사 서울 영등포구 양평동. 자본금 약 5,055만원. (출처: https://www.jobkorea.co.kr/recruit/co_read/c/labqhost )
- **사업/성장성**: 생성형 AI 기반 — sLLM 구축 컨설팅+POC, 최신 RAG·벡터DB 산업특화 챗봇, 대규모 학습데이터 구축/품질관리, 딥러닝 모델 개발. 별도 제품으로 이상탐지 엔진(DeepQ for Anomaly Detection), AI Vision/OCR, NLP 엔진(DeepQ for NLP) 보유. 'AI 경마 예측(WiseRun)'으로 화제. 베트남 사이버보안 시장 진출 보도. **매출은 자료 간 편차** — 잡코리아 2025년 기준 약 21.5억원으로 표기되나, 별도 검색에서는 2024년 매출 약 10.5억원(전년比 -43%)으로 보도되어 수치 신뢰도에 주의(둘 중 하나 또는 회계연도 차이 가능, 정확치 (미확인)). (출처: https://www.aitimes.kr/news/articleView.html?idxno=25015 , https://www.labq.kr/ , http://www.dataeconomy.co.kr/news/articleView.html?idxno=9991 , https://www.jobkorea.co.kr/recruit/co_read/c/labqhost )
- **조직/문화**: RAG·벡터DB·sLLM·딥러닝 NLP/Vision/이상탐지 등 기술 폭은 넓으나, **공개된 기술블로그·개발문화 단서가 거의 없음**(미확인). 9인 규모상 직무 경계가 넓고 1인 다역일 가능성이 높음(추정 — 사실 아님). (출처: https://www.labq.kr/ )
- **평판/리스크**: 강점 — 신입/학력·경력 무관 명시로 진입 장벽 낮음, RAG·sLLM 등 트렌디 기술 직접 경험 가능. 우려 — **직원 약 9명·자본금 영세·매출 변동성**으로 재무·고용 안정성 불확실, 급여 '면접 후 결정'·수습 3개월 등 처우 불투명, 잡플래닛 리뷰 표본도 부족해 평판 검증이 어려움. 공공 SI 프로젝트 비중이 커 보여 직무가 컨설팅/구축에 치우칠 가능성(단서). (출처: https://www.jobkorea.co.kr/Recruit/GI_Read/43592759 , https://www.jobkorea.co.kr/recruit/co_read/c/labqhost )
- **지원자 관점 핏**: 기회 — RAG(LangChain+ChromaDB)·LLM 경량화·앙상블 ML 등 지원자 스택과 부합하고, 소규모라 다양한 기술을 빠르게 경험 가능. 리스크 — 상세 자격요건·도메인이 공고 본문 미공개(미확인)로 추천/FDS 강점과의 정밀 매칭 근거 부족, 회사 규모·재무가 신입 정규직 안정성 측면에서 약함. 정규직 트랙은 존재하나 처우 협의 결과에 좌우.
- **별점**: ★★★ · **한 줄 평**: 기술 키워드는 맞지만 9인 영세·재무 변동·정보 부족이 겹쳐, 다른 합격지 대비 우선순위는 후순위. 본문/처우 재확인 후 판단 권장.

---

## 4. 토스(비바리퍼블리카) — ML Engineer (추천) / Ads ML Engineer

- **개요**: 2013년 설립된 핀테크 슈퍼앱 '토스' 운영사. 토스뱅크·토스증권·토스페이먼츠 등 계열. 근무지 서울 강남 역삼(수도권 충족, 분당/판교 1순위는 아님). (출처: 공고 https://toss.im/career/job-detail?job_id=4553599003 , https://namu.wiki/w/%EB%B9%84%EB%B0%94%EB%A6%AC%ED%8D%BC%EB%B8%94%EB%A6%AC%EC%B9%B4 )
- **사업/성장성**: 컨슈머 금융 플랫폼 + 광고 사업. **창사 이래 첫 연간 흑자 달성(2024년 첫 연간 흑자 보도), 2년 연속 흑자·이익 급증, 토스뱅크·토스증권 흑자 행진.** 광고 사업 월 매출 100억원대 돌파 보도. **기업가치 15조~20조 목표로 미국 증시 IPO 추진**(시기는 시장 상황에 따라 조정, 구체 일정 (미확인)). (출처: https://www.smedaily.co.kr/news/articleView.html?idxno=321741 , https://www.economytribune.co.kr/news/articleView.html?idxno=3902135 , https://www.ibtomato.com/view.aspx?no=12901 )
- **조직/문화**: ML Engineer는 Machine Learning Platform Team 소속으로 개인화 추천·검색·광고 최적화·생성형 AI 앱·MLOps를 담당. **토스 Ads ML 스택(기술블로그): Two-tower(임베딩 유사도 후보군)·Lookalike, CTR 예측에 FM/DeepFM/DCN, 동적입찰에 DQN 강화학습, 소재 최적화에 생성형 AI.** 노출 파이프라인은 Targeting→Filtering(Pacing/Frequency Capping)→Ranking(eCPM). toss.tech 기술블로그·공개채용 설명회 등 기술공유 문화 활발. (출처: https://toss.tech/article/ads-ml , https://toss.im/career/job-detail?job_id=4553599003 )
- **평판/리스크**: 강점 — 톱티어 핀테크의 대규모 트래픽·데이터, 추천/광고 ML 성숙도 높음, 흑자·IPO 단계로 사업 모멘텀 강함. 우려 — 채용 난도 높고(코딩테스트·ML 기초·시스템 설계·문화적합성·레퍼런스 체크), 성과·속도 중심 문화 강도(단서). (출처: https://jasoseol.com/recruit/100177 )
- **지원자 관점 핏**: 기회 — 추천/광고 랭킹 모델이 지원자 **AutoInt(CTR)·NCF·LightGCN**과 정확히 정렬, DeepFM/DCN 등 CTR 계열은 AutoInt와 같은 가계라 학습 연속성 큼. 임팩트가 곧 서비스 지표로 이어지는 환경. 리스크 — **신입 진입 시점이 핵심 변수.** 'Ads ML Engineer 신입 집중채용'은 2025-09-17~10-12로 종료, 현재 상시 공고의 신입 가능 여부·차기 신입 채용 시점은 (미확인) → 토스 채용페이지 재확인 필요(경력 중심 운영 시 신입 정합성 하락). 시스템 설계 비중이 커 데모(Streamlit) 수준 경험 대비 엔지니어링 기대치 높음. 근무지 강남(1순위 아님). (출처: https://kuds.korea.ac.kr/bbs/cdc/526/262931/artclView.do , https://www.jobkorea.co.kr/Recruit/GI_Read/45945912 )
- **별점**: ★★★★ · **한 줄 평**: 추천 ML 커리어 측면 최상급 무대. 단, '지금 신입을 뽑는가'와 강남 근무가 변수.

---

## 5. 라피치(Raviche) — [AI 음성기술 전문기업] STT 및 자연어 처리 엔지니어 (신입/경력)

- **개요**: 2005년 11월 설립된 AI 음성기술 전문기업(코넥스 상장, 종목코드 A403360). 직원 약 131명, 본사 서울. 음성인식 기반 고객응대 자동화·인증보안·대화형 AI 플랫폼 종합 제공. (출처: https://comp.fnguide.com/SVO2/ASP/SVD_Main.asp?gicode=A403360 , https://ko.wikipedia.org/wiki/%EB%9D%BC%ED%94%BC%EC%B9%98_(%EA%B8%B0%EC%97%85) , https://www.rapeech.com/board/news/22 )
- **사업/성장성**: 핵심은 대화형 AI(EMBUS·ORCHE·PS)와 음성인증 AI(ASENTI). SKT·KT·라이나생명 등 STT 고도화·금융권 최초 목소리 본인확인 구축 이력. 매출은 2021년 약 67.8억→2022년 약 105.1억으로 성장했으나, **2024년 매출 약 -7.4% 감소·영업이익/순이익 적자 전환**(주력 EMBUS 부진). LLM 기반 AI 콜봇 'RiLACC', 콜봇 구독서비스 등 신규 사업 추진 중. (출처: https://comp.fnguide.com/SVO2/ASP/SVD_Main.asp?gicode=A403360 , https://www.sisaweek.com/news/articleView.html?idxno=211073 , https://platum.kr/archives/... [신규사업] )
- **조직/문화**: STT/ASR·음성인증·대화형 AI 엔지니어링 중심. 공개 기술블로그·개발문화 단서는 제한적(미확인). 우대요건에 국문학 전공·Linux 등 언급(공고 기준). (출처: 공고 https://www.rallit.com/positions/1636/ )
- **평판/리스크**: 강점 — 20년 업력의 음성기술 전문성·대기업 레퍼런스, 코넥스 상장사로 일정 수준 공시 투명성. 우려 — **2024년 영업적자 전환·주력제품 부진으로 단기 수익성 악화**, 코넥스 특성상 유동성·규모 제약. (출처: https://comp.fnguide.com/SVO2/ASP/SVD_Main.asp?gicode=A403360 )
- **지원자 관점 핏**: 기회 — NLP 요건은 지원자의 DistilBERT 하이브리드·감정분류(Amazon 791만 건)·HuggingFace·RAG로 부분 충족, 신규 LLM 콜봇(RiLACC)·대화형 AI는 RAG/LLM 강점과 접점 가능. 리스크 — **직무 핵심이 STT(음성인식/ASR)인데 지원자는 텍스트 NLP·추천 중심이고 음성/오디오 경험 없음** → 핵심 적합성 낮음. 지원자 선호 도메인(추천/금융)과도 이격, 강점(추천/FDS) 활용도 낮음. 신입 명시는 긍정 요소.
- **별점**: ★★½ · **한 줄 평**: 도메인은 인접하나 음성(STT)이 핵심이라 지원자 강점이 덜 살고 최근 수익성도 부진. 7개사 중 우선순위 하위.

---

## 6. 마키나락스(MakinaRocks) — [신입/인턴] 머신러닝 엔지니어 (LLM)

- **개요**: 2017년 설립된 산업 특화 AI(피지컬 AI) 기업. 제조·국방 등 핵심 산업현장용 버티컬 AI 공급, 5,000개+ 산업 AI 모델 상용화 경험. 주요 제품: 엔터프라이즈 AI OS 'Runway'(폐쇄망 운영·GPU 자원 최적화로 학습효율 최대 90% 개선 주장), 설계 의사결정 AI 에이전트 'DrawX'. 본사 서울(강남 추정 — 정확 위치 (미확인)). (출처: https://ko.wikipedia.org/wiki/%EB%A7%88%ED%82%A4%EB%82%98%EB%9D%BD%EC%8A%A4 , https://www.makinarocks.ai/news/physical-ai-leader-makinarocks-ipo/ )
- **사업/성장성**: B2B 버티컬 AI. **매출 2023년 52억→2024년 82억→2025년 114.6억(연평균 약 84% 성장), 2025년 계약액 약 2,040억(전년比 2배).** Applied Ventures·LG·SK·네이버·GS·삼성·포스코·한화 등 전략적 투자자 중심 **누적 약 530억원** 유치. **코스닥 기술특례상장 진행: 2025-11 기술성평가 A·A, 2026-02 상장예비심사 통과, 증권신고서 2026-03-25 제출, 기관 수요예측 2026-04-28~05-06, 일반청약 2026-05-11~12, 상장 임박**(흑자/적자 명시는 자료상 (미확인) — 기술특례 상장 트랙). (출처: https://www.makinarocks.ai/news/physical-ai-leader-makinarocks-ipo/ , https://www.makinarocks.ai/news/마키나락스-예비심사-통과-ipo-도전/ , https://thevc.kr/makinarocks , https://magi-post.com/makinarocks-ipo-physical-ai-2026/ )
- **조직/문화**: 산업 AI/ML 연구·상용화 중심. LLM 직무는 산업 도메인에 LLM/생성형 AI를 접목하는 방향으로 추정(공고 본문 봇 차단으로 상세 (미확인)). 필수 스택은 Python·딥러닝 프레임워크·LLM 개발(평가 단계 확인). 잡플래닛에 리뷰·면접후기 다수 존재(표본은 단서). (출처: https://www.jobplanet.co.kr/companies/369458/landing/%EB%A7%88%ED%82%A4%EB%82%98%EB%9D%BD%EC%8A%A4 )
- **평판/리스크**: 강점 — 고성장 매출·대형 전략 투자자·코스닥 상장 임박으로 모멘텀·신뢰도 높음, 산업 AI 분야 국내 대표주자. 우려 — **3개월 인턴 후 정규직 전환은 '검토'로 보장 아님**(전환 조건 (미확인)), 상장 직후 실적 압박·기술특례 기업 특성상 수익성 변동 가능. 근무지·마감·상세요건 (미확인). (출처: https://makinarocks.career.greetinghr.com/ko/o/157208 [봇 차단], https://magi-post.com/makinarocks-ipo-physical-ai-2026/ )
- **지원자 관점 핏**: 기회 — LLM ML 직무가 지원자의 **EXAONE-4.0-1.2B GPTQ(W4A16) 경량화·llmcompressor 파이프라인·LangChain/ChromaDB RAG**와 정면 정렬, 상장 임박 기업에서 LLM 실무 경험 축적 가능. 리스크 — 산업/국방 AI 도메인은 지원자 신규 영역이고 **선호 도메인(추천/금융)과 이격**, 진입 형태가 인턴(전환 미보장)이라 정규직 우선 선호와 어긋남, 근무지 미확정.
- **별점**: ★★★½ · **한 줄 평**: LLM 기술 정합성은 높고 상장 임박 기업이라 매력적이나, 인턴-전환 불확실성과 도메인(산업 AI) 거리감이 변수.

---

## 부록 — 조사 한계 및 주의

- **봇 차단/403**: greetinghr ATS(버즈빌 c01·마키나락스 c07 원문)와 THE VC, 일부 언론사가 WebFetch 403을 반환 → 해당 공고의 세부 자격요건/마감은 검색 스니펫·평가자 노트로 보완했고, 미확정분은 (미확인) 표기. 지원 전 **각 사 채용페이지 직접 재확인**을 권장.
- **수치 편차**: LabQ 매출(2024 약 10.5억 vs 2025 약 21.5억), 버즈빌 평균연봉(5,608 vs 5,745) 등 출처 간 차이가 있어 본문에 병기하고 단정은 피함.
- **익명 커뮤니티**: 블라인드/잡플래닛 평점·후기는 '단서'로만 인용했으며 수치 단정의 근거로 쓰지 않음.
- **공고 최신성**: 카카오뱅크 c03(FDS·AML)와 토스 c05(신입 가능 시점)는 최신 요건·신입 트랙이 (미확인)이라 재판정 여지가 있음.

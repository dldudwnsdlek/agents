# 채용 파이프라인 — Hermes Agent 5인 팀

Nous Research의 오픈소스 에이전트 **[Hermes Agent](https://hermes-agent.org)** 위에
**서로 다른 페르소나를 가진 5개의 AI**를 만들어, 내 포트폴리오로 한국 채용 시장을 공략하는 자동 파이프라인입니다.

```
PORTFOLIO.md
  │
  ▼  ① 수집자(collector)  내 포트폴리오에 맞는 최신 공고를 폭넓게 수집     → 01_collected.json
  ▼  ② 평가자(evaluator)  정말 나에게 맞는지 점수화해 한 번 거름           → 02_evaluated.json
  ▼  ③ 분석가(analyst)    통과한 공고의 기업을 심층 분석                   → 03_analysis.md
  ▼  ④ 작성자(writer)     기업 분석 + 포트폴리오로 회사별 자기소개서 작성   → 04_cover_letters/*.md
  ▼  ⑤ 결정자(decider)    종합해 지원/보류/탈락 최종 결정 + 우선순위        → 05_decision.md
```

---

## 1. Hermes Agent란? (왜 이걸 쓰나)

Hermes Agent는 Nous Research가 2026년에 공개한 **오픈소스 자율 에이전트**입니다. 이 워크플로우에 딱 맞는 이유:

| 기능 | 설명 | 이 프로젝트에서의 역할 |
|---|---|---|
| **프로필(profiles)** | 설정·기억·페르소나·스킬이 **완전히 격리된** 다중 에이전트 인스턴스 | 5명의 에이전트를 각각 독립 인스턴스로 |
| **`SOUL.md`** | 에이전트의 **정체성/페르소나** (시스템 프롬프트 맨 앞에 주입) | "페르소나 주입"의 핵심 |
| **스킬(`SKILL.md`)** | 재사용 가능한 절차 문서(트리거→절차→함정→검증) | 각 단계가 할 일을 정의 |
| **헤드리스 실행(`-z`)** | 한 줄 프롬프트 → 최종 답만 stdout | 스크립트로 5단계 자동 연결 |
| **크론(cron)** | 자연어 스케줄 작업 | "매일 아침 새 공고 자동 수집" |
| **모델 무관** | Anthropic/OpenAI/OpenRouter/로컬(Ollama) 등 | 단계마다 다른 모델 사용 가능 |

> 결론: **"Hermes로 충분히 가능"** 합니다. 별도 프레임워크를 새로 만들 필요가 없어, 본 저장소는 Hermes에 바로 얹는 **설정 키트**로 구성했습니다.

---

## 2. 핵심 개념 — "페르소나 주입"은 어떻게 일어나나

Hermes에서 한 에이전트의 행동은 **3개 레이어**로 결정됩니다. 이 프로젝트는 이를 그대로 활용합니다:

| 레이어 | 파일 | 답하는 질문 | 이 저장소 위치 |
|---|---|---|---|
| **정체성(페르소나)** | `SOUL.md` | "나는 **누구**인가" (말투·태도·원칙) | `profiles/<역할>/SOUL.md` |
| **절차(스킬)** | `SKILL.md` | "이 작업을 **어떻게** 하나" | `skills/<스킬>/SKILL.md` |
| **공통 규약** | `AGENTS.md` | "팀이 **함께 지킬 규칙**" (핸드오프·파일 포맷) | `AGENTS.md` |

→ 각 프로필에 서로 다른 `SOUL.md`를 넣는 것이 곧 **"페르소나 주입"** 입니다.
예) `collector`에는 "절대 놓치지 않는 끈질긴 소서", `evaluator`에는 "No를 두려워 않는 깐깐한 스크리너".

---

## 3. 설치 & 셋업 (3단계면 끝)

### 사전 준비 — Hermes 설치
```bash
curl -fsSL https://hermes-agent.org/install.sh | bash   # Linux/macOS/WSL2
source ~/.bashrc

# 기본 프로필 1회 구성(모델·API 키). 여기서 넣은 키를 5개 프로필이 상속합니다.
hermes setup
```

### 1) 이 저장소 받기
```bash
git clone <이 저장소 URL> ~/job-agents
cd ~/job-agents
```

### 2) 5개 에이전트 자동 생성 + 페르소나/스킬 주입
```bash
bash scripts/setup.sh
```
이 스크립트가 하는 일:
- `hermes profile create <역할> --clone` 로 5개 프로필 생성(기본 프로필의 모델·API 키 상속 → 키를 5번 안 넣어도 됨)
- 각 `profiles/<역할>/SOUL.md` → `~/.hermes/profiles/<역할>/SOUL.md` 복사 = **페르소나 주입**
- 각 단계 스킬을 해당 프로필의 `skills/`에 설치

확인:
```bash
hermes profile list
collector chat -q "너는 누구야? 한 줄로 소개해"   # 페르소나가 주입됐는지 즉시 확인
```

### 3) 내 포트폴리오 작성
```bash
cp PORTFOLIO.example.md PORTFOLIO.md
$EDITOR PORTFOLIO.md      # 직무·기술스택·경력·핵심경험(STAR)을 구체적으로
```

---

## 4. 실행

### 한 방에 (5단계 자동)
```bash
bash scripts/run-pipeline.sh
```
산출물이 순서대로 `workspace/`에 쌓이고, 최종 결과는 **`workspace/05_decision.md`** (오늘 지원할 곳 Top 3 + 우선순위 표).

### 단계별로 (수동/디버깅)
각 프로필 별칭으로 직접 호출할 수 있습니다(별칭은 `profile create`가 자동 생성):
```bash
# ① 수집
collector -z "job-collect 스킬대로, 아래 포트폴리오로 공고 수집 → workspace/01_collected.json
$(cat PORTFOLIO.md)"

# ② 평가
evaluator -z "job-evaluate 스킬대로 workspace/01_collected.json 평가 → workspace/02_evaluated.json
$(cat PORTFOLIO.md)"

# ③ 분석 → ④ 작성 → ⑤ 결정 ... (run-pipeline.sh 참고)
```
중간 산출물(JSON/MD)을 직접 열어 고친 뒤 다음 단계를 돌려도 됩니다. **핸드오프가 파일 기반**이라 어디서든 끊고 이어붙일 수 있습니다.

### 매일 자동화 (선택)
```bash
# 매일 오전 9시에 새 공고 수집·평가까지 자동 실행
collector cron create "매일 09:00 새 채용공고 수집" --skill job-collect
```

---

## 5. 저장소 구조
```
.
├── README.md                  # 이 문서
├── AGENTS.md                  # 5인 공통 규약(핸드오프·파일포맷·책임있는 사용)
├── PORTFOLIO.example.md       # 포트폴리오 템플릿 → PORTFOLIO.md로 복사해 작성
├── config/
│   └── config.yaml.example    # 프로필 config 예시(모델·툴셋·단계별 모델 팁)
├── profiles/                  # ★ 페르소나(각 SOUL.md)
│   ├── collector/SOUL.md      #   수집자 — 끈질긴 소서
│   ├── evaluator/SOUL.md      #   평가자 — 깐깐한 스크리너
│   ├── analyst/SOUL.md        #   분석가 — 증거 기반 애널리스트
│   ├── writer/SOUL.md         #   작성자 — 자소서 카피라이터
│   └── decider/SOUL.md        #   결정자 — 냉정한 의사결정자
├── skills/                    # ★ 단계별 절차(각 SKILL.md, 입출력 스키마 포함)
│   ├── job-collect/  job-evaluate/  company-analyze/
│   └── cover-letter-write/  apply-decide/
├── scripts/
│   ├── setup.sh               # 프로필 생성 + 페르소나/스킬 주입
│   └── run-pipeline.sh        # 5단계 파이프라인 실행
└── workspace/                 # 산출물(개인정보 가능 → .gitignore)
```

---

## 6. 커스터마이즈
- **페르소나 바꾸기**: `profiles/<역할>/SOUL.md` 수정 → `bash scripts/setup.sh` 재실행(덮어쓰기).
- **평가 기준/스키마 바꾸기**: `skills/job-evaluate/SKILL.md`의 점수 가중치·기준선 수정.
- **단계별 모델 다르게**: 프로필별 `~/.hermes/profiles/<역할>/config.yaml`의 `model` 변경
  (예: 판단이 중요한 평가자·결정자·작성자는 상위 모델, 수집자는 빠른 모델).
- **단계 추가**: `skills/`에 새 `SKILL.md`, `profiles/`에 새 `SOUL.md`, `run-pipeline.sh`에 한 줄 추가.

---

## 7. 주의 & 한계 (꼭 읽기)
- **최종 지원 버튼은 사람이 누릅니다.** 이 파이프라인은 추천·초안까지만 — 자동 제출하지 않습니다.
- **채용 사이트 약관 준수**: 무단 대량 스크래핑 금지. 공식 검색/RSS/API를 우선하고, 못 가져오면 `(미확인)`으로 남깁니다. 원티드·사람인 등은 로그인/API가 필요할 수 있습니다.
- **개인정보**: 실제 `PORTFOLIO.md`와 `workspace/` 산출물은 `.gitignore`로 커밋에서 제외됩니다.
- **`-p` 플래그 버그(#8093)**: 일부 버전에서 `hermes -p <profile>`가 전역 `SOUL.md`를 로드할 수 있습니다. 그래서 스크립트는 **프로필 별칭**(`collector -z ...`)을 우선 사용합니다. 페르소나가 안 먹는 것 같으면 `collector chat -q "너는 누구야?"`로 확인하세요.
- **명령어/설정 키는 버전에 따라 다를 수 있음**: 정확한 건 `hermes --help`, `hermes profile --help`, `hermes config`로 확인하세요.

---

## 8. Hermes 없이 쓰려면?
`SOUL.md`(페르소나) + `SKILL.md`(절차/입출력 스키마) + `AGENTS.md`(규약)는 **순수 마크다운**이라 다른 에이전트 런타임에도 그대로 이식됩니다.
- **Claude / OpenAI 등 API**: `SOUL.md`를 system 프롬프트, `SKILL.md` 절차를 user 프롬프트로 넣고 단계별로 호출 → 출력 JSON을 다음 호출 입력으로 전달(파일 핸드오프와 동일 구조).
- **agentskills.io 표준**: 본 `SKILL.md`는 이 표준 형식을 따르므로 호환 런타임에서 재사용 가능.

---

## 참고 자료 (Sources)
- [Hermes Agent 공식 사이트](https://hermes-agent.org/)
- [Hermes Agent GitHub (NousResearch/hermes-agent)](https://github.com/NousResearch/hermes-agent)
- [Profiles: Running Multiple Agents (공식 문서)](https://hermes-agent.nousresearch.com/docs/user-guide/profiles)
- [Personality & SOUL.md (공식 문서)](https://hermes-agent.nousresearch.com/docs/user-guide/features/personality)
- [Multi-Agent Architecture 제안 (Issue #344)](https://github.com/NousResearch/hermes-agent/issues/344)
- [`-p` SOUL.md 로딩 버그 (Issue #8093)](https://github.com/NousResearch/hermes-agent/issues/8093)

#!/usr/bin/env bash
# run-pipeline.sh — 5단계 채용 파이프라인을 순서대로 실행한다.
#   수집자 → 평가자 → 분석가 → 작성자 → 결정자
# 사용:  bash scripts/run-pipeline.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WS="$ROOT/workspace"
PORT="$ROOT/PORTFOLIO.md"
mkdir -p "$WS/04_cover_letters"

[ -f "$PORT" ] || { echo "❌ PORTFOLIO.md 없음. PORTFOLIO.example.md를 복사해 작성하세요."; exit 1; }

# 프로필을 헤드리스로 실행. 별칭 우선(프로필 SOUL.md 정확히 로드) → 없으면 -p 폴백.
run_agent() {  # $1=프로필  $2=프롬프트
  local profile="$1" prompt="$2"
  if command -v "$profile" >/dev/null 2>&1; then
    "$profile" -z "$prompt"
  else
    # 주의: 일부 버전에서 -p가 전역 SOUL.md를 로드하는 버그(#8093). 별칭 사용 권장.
    hermes -p "$profile" -z "$prompt"
  fi
}

echo "[1/5] 🔎 수집자: 공고 수집..."
run_agent collector "job-collect 스킬을 따라라. 아래 포트폴리오를 분석해 대한민국 최신 채용 공고를 폭넓게 수집하고 결과를 $WS/01_collected.json 에 저장해라.

[PORTFOLIO]
$(cat "$PORT")"

echo "[2/5] 🧪 평가자: 적합도 평가·필터링..."
run_agent evaluator "job-evaluate 스킬을 따라라. $WS/01_collected.json 의 공고들을 아래 포트폴리오 기준으로 채점하고 통과/탈락을 갈라 $WS/02_evaluated.json 에 저장해라.

[PORTFOLIO]
$(cat "$PORT")"

echo "[3/5] 🏢 분석가: 기업 심층 분석..."
run_agent analyst "company-analyze 스킬을 따라라. $WS/02_evaluated.json 의 passed 회사들을 심층 분석해 $WS/03_analysis.md 에 저장해라."

echo "[4/5] ✍️  작성자: 자기소개서 작성..."
run_agent writer "cover-letter-write 스킬을 따라라. $WS/03_analysis.md 와 $WS/02_evaluated.json(passed), 아래 포트폴리오를 토대로 회사별 자기소개서를 $WS/04_cover_letters/<회사명>.md 로 작성해라.

[PORTFOLIO]
$(cat "$PORT")"

echo "[5/5] 🧭 결정자: 최종 지원 결정..."
run_agent decider "apply-decide 스킬을 따라라. $WS/02_evaluated.json, $WS/03_analysis.md, $WS/04_cover_letters/ 를 종합해 회사별 apply/hold/drop을 결정하고 $WS/05_decision.md 에 저장해라."

echo
echo "✅ 파이프라인 완료. 최종 결정 → $WS/05_decision.md"
ls -1 "$WS"

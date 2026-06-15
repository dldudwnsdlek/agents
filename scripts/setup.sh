#!/usr/bin/env bash
# setup.sh — 5개 채용 에이전트 프로필을 만들고 페르소나(SOUL.md)·스킬을 주입한다.
#
# 전제: 기본 프로필이 모델/API 키로 한 번 구성돼 있어야 함 (없으면 먼저: hermes setup)
# 사용:  bash scripts/setup.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HERMES_HOME="${HERMES_HOME:-$HOME/.hermes}"

# 프로필명(=별칭=파이프라인 순서) → 스킬명 매핑
PROFILES=(collector evaluator analyst writer decider)
declare -A SKILL=(
  [collector]=job-collect
  [evaluator]=job-evaluate
  [analyst]=company-analyze
  [writer]=cover-letter-write
  [decider]=apply-decide
)

command -v hermes >/dev/null 2>&1 || { echo "❌ hermes 미설치. https://hermes-agent.org 에서 먼저 설치하세요."; exit 1; }

echo "전제: 기본 프로필이 모델/API 키로 구성돼 있어야 합니다 (미구성 시: hermes setup)."
echo

for p in "${PROFILES[@]}"; do
  echo "▶ 프로필 [$p] 준비..."
  if hermes profile list 2>/dev/null | grep -qw "$p"; then
    echo "  - 이미 존재 → 생성 건너뜀"
  else
    # --clone: 기본 프로필의 모델/키/스킬 상속 → API 키를 5번 입력하지 않아도 됨
    hermes profile create "$p" --clone
  fi

  pdir="$HERMES_HOME/profiles/$p"
  mkdir -p "$pdir/skills"

  # 1) 페르소나 주입 (SOUL.md 덮어쓰기 = '페르소나 주입'의 핵심)
  cp "$ROOT/profiles/$p/SOUL.md" "$pdir/SOUL.md"
  echo "  - SOUL.md(페르소나) 주입 완료"

  # 2) 단계별 스킬 주입
  s="${SKILL[$p]}"
  rm -rf "$pdir/skills/$s"
  cp -r "$ROOT/skills/$s" "$pdir/skills/$s"
  echo "  - 스킬 [$s] 설치 완료"
done

echo
echo "✅ 완료."
echo "   확인:        hermes profile list"
echo "   페르소나 확인: collector chat -q \"너는 누구야? 한 줄로 소개해\""
echo "   스킬 확인:    collector skills list"

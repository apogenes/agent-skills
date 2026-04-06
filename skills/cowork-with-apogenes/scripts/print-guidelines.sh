#!/bin/bash
set -e

cleanup() {
  :
}
trap cleanup EXIT

echo "Emitting cowork-with-apogenes guidelines as JSON" >&2

printf '%s\n' '{
  "skill": "cowork-with-apogenes",
  "version": "1.0.0",
  "rules": [
    {
      "id": "locale-ko",
      "summary": "모든 사용자 대면 답변은 한국어로 작성"
    },
    {
      "id": "code-citations",
      "summary": "코드 설명 시 실제 파일 경로와 라인 번호를 명시"
    },
    {
      "id": "style-consistency",
      "summary": "기존 코드 스타일·패턴과 일관성 유지, 불필요한 범위 확장 금지"
    },
    {
      "id": "readme-agents",
      "summary": "README.md의 프로젝트 구조 및 규칙과 루트 AGENTS.md를 반드시 참고"
    }
  ],
  "required_repo_docs": [
    "README.md",
    "AGENTS.md"
  ]
}'

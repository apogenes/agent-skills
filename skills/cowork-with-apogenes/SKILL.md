---
name: cowork-with-apogenes
description:
  Apogenes 팀과 협업할 때 적용하는 공통 작업 규칙. 한국어 응답, 코드 인용 시
  파일 경로·라인 번호, README.md의 프로젝트 구조·규칙 준수, 기존 코드 스타일
  유지가 필요할 때 사용. 트리거 예시 "Apogenes 규칙으로", "이 레포 규칙대로",
  "README 구조 참고해서".
license: MIT
metadata:
  author: apogenes
  version: '1.0.0'
---

# Cowork with Apogenes

이 스킬은 **Apogenes**와 같은 저장소에서 작업할 때 에이전트가 따라야 할 **일반
협업 규칙**을 정의합니다. 레포지토리 전체 맥락은 루트의 `README.md`와
`AGENTS.md`를 우선 참고합니다.

## 레포지토리 참고 (필수)

작업을 시작하기 전에 다음을 읽고, 스킬·스크립트·배포 방식이 이 레포와 맞는지
확인합니다.

| 문서 | 역할 |
| ---- | ---- |
| `README.md` (저장소 루트) | 프로젝트 개요, **Skill Structure**(`SKILL.md`, `scripts/`, `references/`), 설치·사용 예시 |
| `AGENTS.md` (저장소 루트) | 새 스킬 디렉터리 구조, `SKILL.md` 형식, 스크립트 규칙, zip 패키징 |

개별 스킬 폴더(예: `skills/react-best-practices/`) 안에 `SKILL.md` 외에
`AGENTS.md` 등 보조 문서가 있으면, 해당 스킬 작업 시 그 문서도 함께 따릅니다.

## 일반 규칙

1. **한국어**  
   사용자에게 보이는 설명·요약·에러 안내 등 **모든 답변은 한국어**로 작성합니다.
   (코드 식별자·파일 경로·에러 원문은 그대로 둡니다.)

2. **코드 설명 시 경로와 라인**  
   기존 코드를 인용하거나 가리킬 때는 **실제 파일 경로**와 **라인 번호**를
   명시합니다. 이 레포의 에이전트 규칙과 동일하게, 인용 블록 형식은 한 줄에
   여는 백틱만 두는 방식을 따릅니다.  
   예: `42:48:src/components/Button.tsx` 형태의 코드 레퍼런스.

3. **코드 스타일 일관성**  
   수정·추가하는 코드는 같은 디렉터리·파일의 **네이밍, 포맷, import 스타일,
   추상화 수준**에 맞춥니다. 불필요한 리팩터나 범위 밖 파일 변경은 하지 않습니다.

4. **README.md의 구조와 규칙**  
   프로젝트 구조, 스킬 배치(`skills/{skill-name}/`), 네이밍, 문서화 관습은
   **루트 `README.md`** 및 **`AGENTS.md`**에 맞춥니다. 새 스킬이나 스크립트를
   추가할 때는 그 문서의 디렉터리·파일명 규칙을 위반하지 않습니다.

## How It Works

1. 작업이 Apogenes 협업 규칙을 요구하는지 판단합니다.
2. 필요 시 루트 `README.md`, `AGENTS.md`를 읽어 레포 규칙과 구조를 확인합니다.
3. 위 **일반 규칙**을 모든 응답·코드 변경에 적용합니다.
4. (선택) 아래 스크립트로 규칙 요약 JSON을 도구 출력으로 받을 수 있습니다.

## Usage

```bash
bash /mnt/skills/user/cowork-with-apogenes/scripts/print-guidelines.sh
```

**로컬 레포에서:**

```bash
bash skills/cowork-with-apogenes/scripts/print-guidelines.sh
```

## Output

스크립트는 stdout에 규칙 요약 JSON을 출력합니다. 진행 메시지는 stderr입니다.

## Present Results to User

- 요약과 결론은 **한국어**로 작성합니다.
- 코드 논의 시 **경로 + 라인**을 포함한 인용 또는 명시를 사용합니다.
- 레포 구조·스킬 관련 결정은 `README.md` / `AGENTS.md`와의 정합성을 한 줄이라도
  언급해 사용자가 추적하기 쉽게 합니다.

## Troubleshooting

- **스크립트 실행 거부**: `chmod +x skills/cowork-with-apogenes/scripts/print-guidelines.sh` 후 재시도하거나 `bash`로 직접 실행합니다.
- **규칙 충돌**: 다른 스킬이 더 구체적이면 해당 스킬을 우선하되, 한국어·경로/라인
  인용·README 준수는 가능한 한 유지합니다.

# (Holloway) Chew, Kean Ho's XuanQi

[![XuanQi](src/icons/animated-banner_1200x200.svg)](#)

[(de) Deutsch](README-de.md) |
[(en) English](README.md) |
[(es) Español](README-es.md) |
[(fr) Français](README-fr.md) |
[(ja) 日本語](README-ja.md) |
**(ko) 한국어** |
[(mn-Cyrl) Монгол](README-mn-Cyrl.md) |
[(ms) Bahasa Melayu](README-ms.md) |
[(nb) Norsk Bokmål](README-nb.md) |
[(nl) Nederlands](README-nl.md) |
[(nn) Norsk Nynorsk](README-nn.md) |
[(ru) Pусский](README-ru.md) |
[(sv) Svenska](README-sv.md) |
[(uk) Yкраїнська](README-uk.md) |
[(zh-Hans) 华语（简体）](README-zh-Hans.md) |
[(zh-Hant) 華語（繁體）](README-zh-Hant.md)

*콘텐츠 생산의 혼란을 길들이다.*

의존성 지옥, 취약한 툴체인, 보안 위험, 지정학적 복잡성——이것들이 여러분
의 워크플로를 방해해서는 안 됩니다.
XuanQi는 강력한 대안을 제공합니다: 어디서나, 언제나 안정적이고,
일관되게 콘텐츠를 재현할 수 있는 매우 이식성 높은, 사용자 정의 가능한 소
프트웨어를 보장합니다.

XuanQi는 일관성, 분산된 공급망, 단순함의 원칙을 기반으로 진정한 데이터 주
권을 보장합니다. 여러분의 데이터와 그 생산 프로세서는 중요한 의존성을 도
입하거나 미래 발전을 저해하지 않으면서재현 가능하고 유지보수 가능한 상
태를 유지합니다.

**XuanQi - 쉽고 매끄럽게, 창작에 집중하세요.**




## 주요 기능

[![XuanQi](src/icons/animated-banner_1200x100.svg)](#)

XuanQi는 현재 다양한 콘텐츠 생성 관련 작업을 처리할 수 있습니다. 하나씩 자
세히 알아보겠습니다!



### 정적 사이트 생성(SSG)

*   **전체 코드베이스 사용** - SSG 생성器的 성가신 제한에 맞추기 위해 파일 자
    산을 미리 복제할 필요가 없습니다.
*   **매끄러운 출력 구조** - 간단한 OS 파일 시스템 경로를 사용하여 전체 사이
    트를 매핑하며,
    복잡하거나 독점적인 데이터베이스 구문 분석이 필요 없습니다.
*   **매우 높은 사용자 정의 가능성** - 각 파일은 자체 `Shell` 스크립트로 처
    리됩니다. 생산 호출을 자유롭게결정할 수 있습니다.
*   **출력 제한 없음** - 내부 SSG 생성기의 제한적인 제약이 없습니다. 귀하와 귀
    하의 게시 공급자는 자유롭게결정할 수 있습니다.
*   **"만능 but 모든 것이 엉성한" 열등한 "기능" 거부** - 이미지 처리에
    는 `GIMP`, 오디오 및 비디오 처리에는 `FFPMEG`와 같은전용 도구를 직접 통합
    하고 사용하세요.
*   **검색 엔진 최적화(SEO) 지원** - XuanQi의 선택적 SEO 지원 기능을 통
    해 SEO 요구 사항을 쉽게 충족하세요.
*   **진화적인 웹사이트 앱(PWA) 지원** - XuanQi의 선택적 PWA 지원 기능을 사용
    하여 웹사이트를 PWA 웹 앱으로쉽게 변환하세요.
*   **WebAssembly (WASM) 지원** - XuanQi의 선택적 WASM 통합 기능을 사용하
    여 WASM을 "슈퍼 `HTML`"에포함하거나 통합할 준비를 하세요.



### 슈퍼 `HTML`

*   **제로 의존성** - 모든 콘텐츠 자원은 단일의 슈퍼 `HTML` 파일에 내장되
    어 있어, 브라우저가 있는 어떤 환경에서도실행됩니다.
*   **`PDF` 출력 지원** - 헤드리스 브라우저 인쇄를 사용하여 "슈
    퍼 `HTML`"을 `PDF`로 변환할 준비를 하세요(참고: 인쇄 호환 `CSS` 스타일
    시트를 직접 제공해야 합니다).




## 라이선스

[![XuanQi](src/icons/animated-banner_1200x100.svg)](#)

이 전체 프로젝트는 [(Holloway) Chew, Kean Ho's Liberal License](LICENSE.txt)
에 따라 라이선스가 부여됩니다. 제품 세부 사항은 다음과 같습니다:

| 항목       | 값                                                 |
|:-----------|:---------------------------------------------------|
| 이름       | `周健豪·玄器`, `(Holloway) Chew, Kean Ho's XuanQi` |
| 약칭       | `玄器`, `XuanQi`                                   |
| 제품 UUID  | `A1C8B6B1-CF6F-435B-9ECE-60AA15E7240D`             |
| 제품 SKU   | `chewkeanho-xuanqi`                                |
| 상표 소유자 | `(Holloway) Chew, Kean Ho` (자연인)               |




## Maintainer 지원하기

[![XuanQi](src/icons/animated-banner_1200x100.svg)](#)

첫째로, **이 프로젝트를 사용해 주시고 지원을 고려해 주셔서 감사합니다**.

이 프로젝트는 공익을 위해 개발 및 유지 관리되고 있지만, 세상에 공짜는 없습
니다. 이 제품이 마음에 드신다면, 언제든지Maintainer를 직접 지원해 주세요:



### `(Holloway) Chew, Kean Ho`, 말레이시아

현재 주요 개발자이자 Maintainer입니다.

[![XuanQi](src/buttons/animated-sponsor-button-ko_80x38.svg)](https://buy.stripe.com/dR614jehR5LfexG5kn?locale=ko&__embed_source=buy_btn_1ROCQCIjUIWX3dn3HLHjIqxm)

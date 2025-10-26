[//]: # Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
[//]: # Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
[//]: # Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
[//]: # Copyright 2023 "Holloway" Chew, Kean Ho <kean.ho.chew@zoralab.com>
[//]: # Copyright 2023 ZORALab Enterprise <tech@zoralab.com>
[//]: #
[//]: #
[//]: # Licensed under (Holloway) Chew, Kean Ho's Liberal License (the
[//]: # 'License'). You must comply with the license to use the content.
[//]: # Get the License at:
[//]: #
[//]: # https://doi.org/10.5281/zenodo.13770769
[//]: #
[//]: # You MUST ensure any interaction with the content STRICTLY COMPLIES
[//]: # with the permissions and limitations set forth in the license.




# 환영합니다!

이것은 다중 섹션으로 구성된 문서입니다. 이 방대한 읽기 자료의 범위를
줄이기 위해 "비즈니스 필요에 따라 알기" 정책을 사용하여 특별히 설계되었습니다.

아래에서 확인해 보세요!




## 빠른 가이드

빠르게 복습하기를 원하는 숙련된 사용자를 위해:

* `[XUANQI] build` - 전체 프로젝트를 빌드합니다.
* `[XUANQI] create [유형] [값1] [값2] ...`   - 무언가를 생성합니다.
* `[XUANQI] purge` - 전체 프로젝트를 정리합니다.

삭제하지 말아야 할 중요한 디렉토리:

* `configs`
  * XuanQi의 작업 공간 구성을 보관합니다. 여기에 있는 것은 삭제하지 마세요.
  * 디렉토리 이름이 `configs/`로 하드코딩되어 있습니다.
* `components`
  * 모든 외부 모듈식 구성 요소를 보관합니다.
* `layouts`
  * 라우터가 렌더링하기 위한 XuanQi 작업 공간의 모든 페이지 레이아웃을 보관합
    니다.
* `public`
  * `routers`에서 정의한 구조로 XuanQi의 출력 파일을 모두 보관합니다.
* `routers`
  * 프로젝트의 파일 구조와 출력 렌더링 스크립트를 매핑합니다.
* `tests`
  * 자체 테스트를 위한 XuanQi 작업 공간의 모든 테스트 스크립트를 보관합니다.




## 언어 정보

XuanQi는 `configs/xuanqi.conf` 구성 파일이나 시스템 `$LANG` 환경 변수를
사용하여 설정된 `$XUANQI_LANGUAGE` 환경 변수를 통해 다음 언어를 지원합니다.

* (de) Deutsch
* (en) English (기본 및 폴백)
* (es) Español
* (fr) Français
* (ja) 日本語
* (ko) 한국어
* (mn-Cyrl) Монгол
* (ms) Bahasa Melayu
* (nb) Norsk Bokmål
* (nl) Nederlands
* (nn) Norsk Nynorsk
* (ru) Pусский
* (sv) Svenska
* (uk) Yкраїнська
* (zh-Hans) 华语（简体）
* (zh-Hant) 華語（繁體）




## Build

```
$ [XUANQI] help build
```

이것은 `build` 명령어 도움말 인덱스 섹션을 열어 모든 사양을 다룹니다.




## Create

```
$ [XUANQI] help create
```

이것은 `create` 명령어 도움말 인덱스 섹션을 열어 모든 사양을 다룹니다.




## Purge

```
$ [XUANQI] help purge
```

이것은 `purge` 명령어 도움말 인덱스 섹션을 열어 모든 사양을 다룹니다.




## Test

```
$ [XUANQI] help test
```

이것은 `test` 명령어 도움말 인덱스 섹션을 열어 모든 사양을 다룹니다.

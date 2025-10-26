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




# XuanQi 구성 요소 생성 도움말 섹션에 오신 것을 환영합니다.

XuanQi는 주로 구성 요소 개념을 사용하여 운영됩니다.
모든 것이 구성 요소입니다. 다음은 구성 요소를 생성하기 위한 전
체 명령어입니다:

```
$ [XuanQi] create component [TYPES] [NAME]
```

여기서:

* `[TYPES]`는 생성하려는 구성 요소 내부의 구성 요소 유형 목록
  입니다.
* `[NAME]`은 구성 요소 이름에 대한 상대 경로입니다(예: 루트 렌
  더링 페이지의 경우 `pages/root`).

출력은 `$XUANQI_PATH_COMPONENTS` 디렉토리에 저장됩니다
(`$XUANQI_DIRECTORY_COMPONENTS`에서 파생됨).




## 구성 요소 유형

여러 구성 요소 유형이 있으며 각각 특정 문서를 가지고 있습니다.
관심 있는 유형에 대해 다음 명령어를 실행하여 자세히 알아볼 수 있
습니다:

```
[XUANQI] help create component [TYPE]
```

지원되는 `[TYPE]` 값은 다음과 같습니다:

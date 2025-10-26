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




# CSS 컴포넌트 도움말 섹션 생성

이것은 CSS 컴포넌트를 독립적으로 또는 다른 더 큰 컴포넌트의 일부로
생성하기 위한 도움말 섹션입니다. CSS 부분을 포함하려면 `[TYPES]`
값에 `css`를 입력하기만 하면 됩니다. 예:

```
# 명령 패턴
$ [XuanQi] create component [TYPES] [NAME]

# CSS 컴포넌트만
$ [XuanQi] create component css [NAME]

# 복합 컴포넌트 내 CSS 부분 포함
$ [XuanQi] create component "...,css,..." [NAME]
```



## 목적

CSS 컴포넌트는 주로 CSS 자산 출력 파일(예: `page.css`)을 생성하기
위한 것입니다. XuanQi는 `Shell` 함수의 내장 기능과 일반 CSS 파일
복사 모두를 갖추고 있습니다.




## 파일 구조

CSS 컴포넌트는 다음 기본 파일 구조를 준수합니다:

```
[XUANQI_PATH_COMPONENTS]
└── [XUANQI_COMPONENT_NAME]
       ├── CSS
       │    ├── sample.css
       │    ├── ...
       │    └── xuanqi.sh
       └── XuanQi
            └── import.sh
```

* 컴포넌트 디렉토리는 `CSS`입니다.
* 컴포넌트 운영자 셸 스크립트는 `CSS/xuanqi.sh`입니다.
* 컴포넌트 운영자 셸 스크립트는 메인 컴포넌트 임포트 셸 스크립트
  `XuanQi/import.sh`에 의해 호출됩니다.




## `CSS/xuanqi.sh` 메인 스크립트

당신의 **궁극적인 목표는 CSS 출력 파일을 `$XUANQI_CONTENT_PATH`에
당신의 방식으로 작성하는 것입니다**. 어떻게 할지는 전적으로 당신에
게 달려 있습니다.

여러 라우터 스크립트가 파일 렌더링을 위해 동일한 컴포넌트를 호출
할 수 있습니다(예: 동일한 콘텐츠에 대해 모바일, 인쇄, 이메일 등 다
른 미디어 대상). 따라서 사용자가 라우터 스크립트에서 설정할 수 있
는 필요한 환경 변수를전략적으로 설계해야 합니다.

그런 다음 `CSS/xuanqi.sh`가 실행되는 동안 이러한 환경 변수를 구
문 분석하고그에 따라 반응하십시오.

사용 가능한 API에 대해 프로젝트의 `XuanQi/.internals/API`를 참조
할 수 있습니다.




## 프로그래밍 방식 또는 복사

XuanQi는 CSS 파일을 쉽게 렌더링하기 위해 프로그래밍 가능한 함수와
원시 복사 함수를 모두 제공합니다. 결정은 팀에 달려 있습니다.

팀이 셸 스크립팅에 익숙하지 않은 경우 후자가 선호됩니다. 이렇게 하면
전체 팀이 제공된 `.css` 파일에서 작업하는 동안 XuanQi가 이를
`$XUANQI_CONTENT_PATH`로 복사하기만 하면 됩니다. 이것은 `Sass`
컴파일러를 사용하는 사람들에게 좋습니다.

XuanQi의 셸 스크립팅 프로그래밍 가능 함수는 렌더링에 대한 더 큰 내부
유연성을 용이하게 합니다(CSS 작성에 대한 매크로라고 생각하십시오).
장점은 의존성이 없고 콘텐츠 생성기와 매우 유연하다는 것입니다. 이것은
`Sass`를 방해물로 보는 노련한 CSS 개발자에게 적합합니다.

어떤 경우든 당신은 좋은 손에 맡겨져 있습니다. 그냥 시도해 보고 시간이
지남에 따라 적응하십시오.




## 에필로그

CSS 컴포넌트 생성 도움말 섹션에 대한 것은 모두입니다.

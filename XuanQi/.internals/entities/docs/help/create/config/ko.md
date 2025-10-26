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




# 구성 파일 생성 CLI

`create config` 명령줄 인터페이스(CLI)는 프로젝트 전체에서 사용 가능
한 단일 항목 `.conf` 데이터 파일을 생성하기 위한 것입니다. 전체 명령
은 다음과 같습니다:

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **필수**
  * `$XUANQI_PATH_CONFIGS`부터의 상대 파일 경로로, `.conf` 파일 확장
    자로 끝나야 합니다.
  * `.conf` 파일 확장자가 제공되지 않으면 XuanQi가 내부적으로 추가합
    니다.
  * `.conf` 파일이 프로젝트 구성 디렉토리 외부에 있거나 디렉토리가 존
    재하지 않으면 오류가 발생합니다.
  * 파일 이름은 사용자 재량에 따릅니다. XuanQi에 영향을 미치지 않습니
    다.
* `[KEY]`
  * **필수**
  * `key:value` 항목의 `key` 레이블입니다.
  * 키가 환경 변수로 사용되므로 밑줄(`_`)을 사용하십시오.
  * 값이 고유한지 확인하십시오. 그렇지 않으면 여러 구성 파일에서 동일
    한 키를 사용하면 예측할 수 없는 결과(마지막으로 구문 분석된 파일
    이 이전 파일을 덮어씀)가 발생할 수 있습니다.
* `[VALUE]`
  * **선택 사항**
  * `key:value` 항목의 `value` 레이블입니다.
  * 비워 두면 나중에 파일을 업데이트할 수 있는 샘플 텍스트로 대체됩니
    다.




## 경로 제한

보안상의 이유로 XuanQi는 데이터 파일을 `$PROJECT_PATH_ROOT` 내에서
만 생성할 수 있습니다. 그렇지 않으면 오류가 발생하고 아무 작업도 수
행되지 않습니다.

이 생성에 대해서만 `$XUANQI_PATH_CONFIGS` 디렉토리(이 또한
`$PROJECT_PATH_ROOT` 내에 있음)로 **엄격히** 제한됩니다.




## 알려진 문서

지원되는 환경 변수와 일치하는 `[KEY]`에 따라 생성된 구성 파일에
는 자체 전용 문서가 있을 수 있습니다. 다음을 참조하십시오:

```
$ [XUANQI] help variables
```

지원되는 변수 목록을 보려면.




## 에필로그

이 CLI에 대한 내용은 여기까지입니다.

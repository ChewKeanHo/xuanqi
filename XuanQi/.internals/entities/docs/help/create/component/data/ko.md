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




# 데이터 컴포넌트 생성 도움말 섹션

이는 독립적으로 또는 다른 더 큰 컴포넌트의 일부로 데이
터 컴포넌트를 생성하기 위한도움말 섹션입니다. 데이터 부
분을 포함시키려면 `[TYPES]` 값에 `data`를 입력하기만하
면 됩니다. 예시:

```
# 명령어 패턴
$ [XuanQi] create component [TYPES] [NAME]

# 데이터 컴포넌트만
$ [XuanQi] create component data [NAME]

# 복합 컴포넌트 내부에 데이터 부분 포함
$ [XuanQi] create component "...,data,..." [NAME]
```




## 목적

데이터 컴포넌트는 주로 프로젝트와 컴포넌트에 특정 데이
터 세트를 제공하기 위해 있습니다.이를 통해 동일한 파일 레이
아웃에 대해 변수 렌더링 변경이 가능해지며, 유지보수성을
희생하지 않으면서 출력 선택이 강력해집니다. XuanQi에는 모
든 구성 파일(`.conf`)과셸 스크립트(`.sh`) 함수를 원활하게 가
져오는 내장 기능이 있습니다.

일반적으로 XuanQi는 데이터 컴포넌트를 **데이터베이스 없
음**(`noDB`)데이터 저장소로 취급합니다.




## 파일 구조

데이터 컴포넌트는 다음과 같은 기본 파일 구조를 따릅니다:

```
[XUANQI_PATH_COMPONENTS]
└── [XUANQI_COMPONENT_NAME]
       ├── Data
       │    ├── i18n
       │    │     ├── title.sh
       │    │     └── ...
       │    ├── sample.conf
       │    └── ...
       └── XuanQi
            └── import.sh
```

* 컴포넌트 디렉토리는 `Data`입니다.
* 컴포넌트 운영자 셸 스크립트는 `XuanQi/import.sh` 내부에 직
  접 위치합니다. 이는 컴포넌트 초기화의 일부입니다.




## 주요 목표

당신의 **주요 목표는 변수 데이터 소스를 추상화하고 프로젝트 또
는 컴포넌트를 위한데이터 기능을 생성하는 것**입니다. 이를 수행
하는 방법은 전적으로 귀하에게 달려 있습니다.

각 컴포넌트의 초기화 시, 모든 컴포넌트는 내부 또는 다른 컴포넌
트 간에서 데이터 컴포넌트를파싱할 수 있습니다. 따라서 데이터 디
렉토리를 항상 유연하고 파싱 가능하게 **유지해야 합니다**.

사용 가능한 API에 대해서는 프로젝트의 `XuanQi/.internals/API`
를 참조할 수 있습니다.




## 구성 파일 또는 셸 스크립트

XuanQi는 데이터 관리에 대해 2가지 주요 방법을 제공합니다:

* 구성 파일(`.conf`)
* 셸 스크립트 함수 파일(`.sh`)

`.conf`는 변수를 빠르게 설정하는 데 적합하여 파일 렌더링에 해
당 값을 즉시 사용할 수 있습니다. 생성 방법에 대한 샘플 파
일(`Data/sample.conf`)이 생성됩니다. **하나의 파일에는 하나
의 키:값 쌍만 포함되어야 합니다**.

`.sh`는 실제로 논리 조건에 의해 데이터를 제공하는 함수 정의
를 포함하는 셸 스크립트입니다. 이는 데이터 세트가 하나 이상
의 조건을 요구하여 출력을 다르게 렌더링해야 하는 경우(예:
`i18n_` 함수는 `$XUANQI_CONTENT_LANGUAGE` 플래그에 따라 언
어별 문자열을 반환함)에 가장 적합합니다. **주의: 동일한 이
름의 함수는 가져오기 중 재정의됩니다**. 참조용 샘플 파
일(`Data/i18n/title.sh`)이 생성됩니다.

마지막 옵션은 디렉토리 내 `.txt` 파일을 수동으로 읽는 것입
니다. XuanQi는 `.conf`와 `.sh`만 파싱하므로 안전하게 사용
할 수 있습니다. 이는 특정 데이터 세트 이름을 디렉토리 이름
으로 구성하고 파일 이름을 엄격하게매개변수 이름으로 유지하
여 수행됩니다. 단점은 이 방법이 더 많은 IO 읽기/쓰기트래픽
을 차지하여 생산 속도를 저하시킬 수 있다는 것입니다. 그러
나 *요구 사항 충족은항상 속도보다 우선*하므로 필요할 때마
다 사용을 고려할 수 있습니다. 텍스트 파일 기반 i18n 접
근 방식 예시:

```
[XUANQI_PATH_COMPONENTS]
└── [XUANQI_COMPONENT_NAME]
       ├── Data
       │    ├── names
       │    │     ├── de.txt
       │    │     ├── en.txt
       │    │     ├── es.txt
       │    │     └── ...
       │    └── ...
       └── ...

# 위 내용을 셸 스크립트에서 사용
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```



### 선택 방법

기본적으로 가능한 경우 항상 `.conf`를 사용하십시오. 논리 요
구 사항(예: 조건 등)이 있는 경우 `.sh`를 사용하십시오.




## 미디어 파일

기술적으로 미디어 파일(예: 사진, 오디오, 비디오 등)은 데이터
이지만,**여기에 배치하는 것은 피하십시오**. 이를 위해 전용 처
리 기능을 가진전용 `media` 컴포넌트가 있습니다. 대신 그것을 사
용하십시오.

데이터 컴포넌트는 항상 **데이터베이스 없음**(`noDB`)으로 취급해
야 합니다.




## 에필로그

데이터 컴포넌트 생성 도움말 섹션은 여기까지입니다.

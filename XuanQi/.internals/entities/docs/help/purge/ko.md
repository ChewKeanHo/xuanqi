# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
# Copyright 2023 "Holloway" Chew, Kean Ho <kean.ho.chew@zoralab.com>
# Copyright 2023 ZORALab Enterprise <tech@zoralab.com>
#
#
# Licensed under (Holloway) Chew, Kean Ho's Liberal License (the 'License').
# You must comply with the license to use the content. Get the License at:
#
# https://doi.org/10.5281/zenodo.13770769
#
# You MUST ensure any interaction with the content STRICTLY COMPLIES with
# the permissions and limitations set forth in the license.
#
# NOTE: The license notice and this comment will not be rendered. New line
#       begins with the first non-empty line below.




# Purge CLI

`Purge`명령줄 인터페이스(CLI)는 프로젝트 작업 공간을 완전히 정리하
기 위한 것입니다.

기본적으로 다음 경로들을 삭제합니다:

```
$XUANQI_PATH_LOGS       # 이전의 모든 빌드 로그
$XUANQI_PATH_PUBLIC     # 모든 출력물
$XUANQI_PATH_TEMPS      # 이전 빌드의 임시 파일들
```

자동 퍼지와 달리, 이 CLI는 실제 삭제 전 대상 존재 여부를 확인합니
다. 그렇지 않으면 이 CLI는 아무 작업도 수행하지 않습니다.




## 삭제 알림

XuanQi는 실제로 삭제한 대상만 보고합니다.




## 에필로그

이 CLI에 대한 설명은 여기까지입니다.

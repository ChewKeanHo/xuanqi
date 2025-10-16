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

`Purge` kommandolinjegrensesnitt (CLI) er for å renske opp i prosjektets
arbeidsområde helt.

Som standard sletter det følgende stier:

```
$XUANQI_PATH_LOGS       # alle tidligere byggelogger
$XUANQI_PATH_PUBLIC     # alle utdata
$XUANQI_PATH_TEMPS      # alle midlertidige filer fra tidligere bygg
```

I motsetning til stille sletting, utfører denne CLI en mål-eksistenskontroll
før faktisk sletting. Ellers gjør denne CLI ingenting.




## Varsling om Sletting

XuanQi vil kun rapportere de målene den faktisk sletter.




## Epilog

Det er alt for denne CLI.

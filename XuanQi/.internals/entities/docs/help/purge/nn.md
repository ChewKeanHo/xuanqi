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




# Purge CLI

`Purge` kommandolinjegrensesnitt (CLI) er for å reinska prosjektarbeidsområdet
ifullstendig.

Som standard slettar det følgjande stiane:

```
$XUANQI_PATH_LOGS       # alle tidlegare byggeloggar
$XUANQI_PATH_PUBLIC     # alle utdata
$XUANQI_PATH_TEMPS      # alle mellombels filer frå tidlegare bygg
```

I motsetning til stille sletting, utfører denne CLI ein mål-eksistenskontroll
før faktisk sletting. Viss ikkje, gjer denne CLI ingenting.




## Varsling om Sletting

XuanQi vil berre rapportera dei måla den faktisk slettar.




## Epilog

Det er alt for denne CLI.

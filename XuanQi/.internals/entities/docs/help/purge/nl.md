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

De `Purge` command-line interface (CLI) is voor het volledig opschonen
van de projectwerkruimte.

Van nature verwijdert het de volgende paden:

```
$XUANQI_PATH_LOGS       # alle eerdere build logs
$XUANQI_PATH_PUBLIC     # alle uitvoer
$XUANQI_PATH_TEMPS      # alle tijdelijke bestanden van eerdere builds
```

In tegenstelling tot stille purge, voert deze CLI een
doel-existentiecontrole uit vóór daadwerkelijke verwijdering. Anders
doet deze CLI niets.




## Verwijderingsmelding

XuanQi rapporteert alleen die doelen die het daadwerkelijk verwijdert.




## Epiloog

Dat is alles voor deze CLI.

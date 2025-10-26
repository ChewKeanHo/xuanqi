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

`Purge` kommandoradsgränssnitt (CLI) är för att rensa projektarbetsytan helt.

Som standard raderar det följande sökvägar:

```
$XUANQI_PATH_LOGS       # alla tidigare byggloggar
$XUANQI_PATH_PUBLIC     # alla utdata
$XUANQI_PATH_TEMPS      # alla temporära filer från tidigare byggen
```

Till skillnad från tyst rensning, utför denna CLI en mål-existenskontroll
före faktisk radering. Annars gör denna CLI ingenting.




## Avisering om Borttagning

iXuanQi rapporterar endast de mål den faktiskt raderar.




## Epilog

Det är allt för denna CLI.

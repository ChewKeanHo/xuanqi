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




# CLI för Att Skapa Konfigurationsfil

`create config` kommandoradsgränssnitt (CLI) är för att skapa
en enda post `.conf` datafil som kan användas i hela projektet.
Dess fullständiga kommando är som följer:

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **OBLIGATORISK**
  * Den relativa (från `$XUANQI_PATH_CONFIGS`) filsökvägen som
    slutar med `.conf` filtillägg.
  * Om `.conf` filtillägget inte anges kommer XuanQi att lägga
    till det internt.
  * Om `.conf` filen ligger utanför projektets konfigurationskatalog
    eller katalogen helt enkelt inte existerar, kommer ett fel att
    höjas.
  * Filnamnet är efter eget gottfinnande. Det påverkar inte XuanQi.
* `[KEY]`
  * **OBLIGATORISK**
  * `key` etiketten för `key:value` posten.
  * Använd understreck (`_`) eftersom nyckeln kommer att användas
    som miljövariabel.
  * Se till att värdet är unikt. Annars kan samma nyckel över flera
    konfigurationsfiler orsaka oförutsägbara konsekvenser (den senast
    tolkade filen skriver över sina föregångare).
* `[VALUE]`
  * **VALFRITT**
  * `value` etiketten för `key:value` posten.
  * När den lämnas tom, ersätts en exempeltext där du kan uppdatera
    filen senare.




## Sökvägsbegränsning

Av säkerhetsskäl tillåter XuanQi endast att skapa datafilen inom
`$PROJECT_PATH_ROOT`. Annars kommer ett fel att höjas och ingenting
att göras.

Endast för denna skapelse, är den **STRÄNGT** begränsad till
`$XUANQI_PATH_CONFIGS` katalogen (som också finns inom
`$PROJECT_PATH_ROOT`).




## Känd Dokumentation

Beroende på om `[KEY]` matchar den miljövariabel som stöds, kan den
genererade konfigurationsfilen ha sin egen dedikerade dokumentation.
Se:

```
$ [XUANQI] help variables
```

för listan över variabler som stöds.




## Epilog

Det var allt för denna CLI.

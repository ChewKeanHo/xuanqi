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




# Skapa Datafil CLI

`create data` kommandoradsgränssnitt (CLI) är för att skapa en enda
`.conf`-datafil som kan användas i hela projektet. Dess fullständiga
kommando är som följer:

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **OBLIGATORISK**
  * Den relativa (från `$PROJECT_PATH_ROOT`) filsökvägen som slutar
    med `.conf`-filtillägget.
  * Om `.conf`-filtillägget inte anges kommer XuanQi att lägga till
    det internt.
  * Filnamnet är efter eget gottfinnande. Det påverkar inte XuanQi.
* `[KEY]`
  * **OBLIGATORISK**
  * `key`-etiketten för `key:value`-posten.
  * Använd understreck (`_`) eftersom nyckeln kommer att användas som
    miljövariabel.
  * Se till att värdet är unikt. Annars kan samma nyckel över flera
    konfigurationsfiler orsaka oförutsägbara konsekvenser (den senast
    tolkade filen skriver över sina föregångare).
* `[VALUE]`
  * **VALFRITT**
  * `value`-etiketten för `key:value`-posten.
  * När den lämnas tom ersätts den med en exempeltext som du kan
    uppdatera i filen senare.




## Sökvägsbegränsning

Av säkerhetsskäl tillåter XuanQi endast att skapa datafilen inom
`$PROJECT_PATH_ROOT`. Annars kommer ett fel att uppstå och ingenting
att göras.




## Epilog

Det var allt för detta CLI.

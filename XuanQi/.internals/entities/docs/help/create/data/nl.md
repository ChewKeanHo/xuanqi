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




# Creëer Data Bestand CLI

De `create data` commandoregelinterface (CLI) is voor het maken van
een enkel `.conf`-gegevensbestand dat bruikbaar is in het hele
project. De volledige opdracht is als volgt:

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **VERPLICHT**
  * Het relatieve (vanaf `$PROJECT_PATH_ROOT`) bestandspad eindigend
    met de `.conf`-bestandsextensie.
  * Als de `.conf`-bestandsextensie niet is opgegeven, voegt XuanQi
    deze intern toe.
  * De bestandsnaam is naar eigen goeddunken. Het heeft geen invloed
    op XuanQi.
* `[KEY]`
  * **VERPLICHT**
  * Het `key`-label van de `key:value`-invoer.
  * Gebruik een underscore (`_`) omdat de sleutel wordt gebruikt als
    omgevingsvariabele.
  * Zorg ervoor dat de waarde uniek is. Anders kan dezelfde sleutel
    in meerdere configuratiebestanden onvoorspelbare gevolgen hebben
    (het laatst geparseerde bestand overschrijft zijn voorgangers).
* `[VALUE]`
  * **OPTIONEEL**
  * Het `value`-label van de `key:value`-invoer.
  * Wanneer leeg gelaten, wordt een voorbeeldtekst vervangen die u
    later in het bestand kunt bijwerken.




## Padbeperking

Om veiligheidsredenen staat XuanQi alleen toe het gegevensbestand
aan te maken binnen `$PROJECT_PATH_ROOT`. Anders wordt een fout
gegenereerd en wordt er niets gedaan.




## Epiloog

Dat is alles voor deze CLI.

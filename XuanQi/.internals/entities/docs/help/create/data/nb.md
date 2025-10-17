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




# Lag Datafil CLI

`create data` kommandolinjegrensesnitt (CLI) er for å opprette en
enkelt `.conf`-datafil som kan brukes på tvers av prosjektet. Den
fulle kommandoen er som følger:

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **OBLIGATORISK**
  * Den relative (fra `$PROJECT_PATH_ROOT`) filstien som slutter
    med `.conf`-filetternavn.
  * Hvis `.conf`-filetternavnet ikke er oppgitt, vil XuanQi legge
    det til internt.
  * Filnavnet er etter din skjønn. Det påvirker ikke XuanQi.
* `[KEY]`
  * **OBLIGATORISK**
  * `key`-etiketten for `key:value`-oppføringen.
  * Bruk understrek (`_`) siden nøkkelen vil bli brukt som
    miljøvariabel.
  * Sikre at verdien er unik. Ellers kan den samme nøkkelen på tvers
    av flere konfigurasjonsfiler føre til uforutsigbare konsekvenser
    (den sist analyserte filen overskriver sine forgjengere).
* `[VALUE]`
  * **VALGFRI**
  * `value`-etiketten for `key:value`-oppføringen.
  * Når den står tom, erstattes den med en eksempeltekst som du kan
    oppdatere i filen senere.




## Stibegrensning

Av sikkerhetsmessige grunner tillater XuanQi kun opprettelse av
datafiler innenfor `$PROJECT_PATH_ROOT`. Ellers vil den gi en feil
og ikke gjøre noe.




## Epilog

Det er alt for denne CLI-en.

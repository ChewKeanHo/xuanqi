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

`create data` kommandolinjegrensesnitt (CLI) er for å oppretta ei
enkelt `.conf`-datafil som kan brukast på tvers av prosjektet. Den
fulle kommandoen er som følgjer:

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **OBLIGATORISK**
  * Den relative (frå `$PROJECT_PATH_ROOT`) filstia som sluttar med
    `.conf`-filetternamn.
  * Viss `.conf`-filetternamnet ikkje er oppgjeve, vil XuanQi leggja
    det til internt.
  * Filnamnet er etter din skjønn. Det påverkar ikkje XuanQi.
* `[KEY]`
  * **OBLIGATORISK**
  * `key`-etikette for `key:value`-oppføringa.
  * Bruk understrek (`_`) sidan nøkkelen vil bli brukt som
    miljøvariabel.
  * Sikre at verdien er unik. Elles kan den same nøkkelen på tvers av
    fleire konfigurasjonsfilar føra til uforutsigbare konsekvensar
    (den sist analyserte fila overskriv forgjengarane sine).
* `[VALUE]`
  * **VALFRI**
  * `value`-etikette for `key:value`-oppføringa.
  * Når han står tom, blir han erstatta med ein eksempeltekst som du
    kan oppdatera i fila seinare.




## Stibegrensing

Av tryggingsomsyn tillèt XuanQi berre oppretting av datafilar
innenfor `$PROJECT_PATH_ROOT`. Elles vil han gje ein feil og ikkje
gjera noko.




## Epilog

Det er alt for denne CLI-en.

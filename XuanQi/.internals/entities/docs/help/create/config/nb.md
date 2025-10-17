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




# Kommandolinjegrensesnitt for Opprettelse av Konfigurasjonsfil

`create config` kommandolinjegrensesnitt (CLI) er for å opprette
en enkelt oppførings `.conf` datafil som kan brukes på tvers av
prosjektet. Den fullstendige kommandoen er som følger:

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **OBLIGATORISK**
  * Den relative (fra `$XUANQI_PATH_CONFIGS`) filstien som
    slutter med `.conf` filendelse.
  * Hvis `.conf` filendelsen ikke er oppgitt, vil XuanQi legge
    den til internt.
  * Hvis `.conf` filen er utenfor prosjektets konfigurasjonskatalog
    eller katalogen rett og slett ikke eksisterer, vil en feil bli
    utløst.
  * Filnavnet er etter din skjønn. Det påvirker ikke XuanQi.
* `[KEY]`
  * **OBLIGATORISK**
  * `key` etiketten for `key:value` oppføringen.
  * Bruk understrek (`_`) ettersom nøkkelen vil bli brukt som
    miljøvariabel.
  * Sørg for at verdien er unik. Ellers kan den samme nøkkelen på
    tvers av flere konfigurasjonsfiler forårsake uforutsigbare
    konsekvenser (den sist tolket filen overskriver sine forgjengere).
* `[VALUE]`
  * **VALGFRITT**
  * `value` etiketten for `key:value` oppføringen.
  * Når den står tom, blir en eksempeltekst erstattet der du kan
    oppdatere filen senere.




## Stibegrensning

Av sikkerhetsmessige årsaker tillater XuanQi kun opprettelse av
datafiler innenfor `$PROJECT_PATH_ROOT`. Ellers vil den utløse en
feil og ikke gjøre noe.

Kun for denne opprettelsen, er den **STRENG** begrenset til
`$XUANQI_PATH_CONFIGS` katalogen (som også er innenfor
`$PROJECT_PATH_ROOT`).




## Kjent Dokumentasjon

Avhengig av om `[KEY]` samsvarer med den støttede miljøvariabelen,
kan den genererte konfigurasjonsfilen ha sin egen dedikerte
dokumentasjon. Se:

```
$ [XUANQI] help variables
```

for listen over støttede variabler.




## Epilog

Det er alt for denne CLI.

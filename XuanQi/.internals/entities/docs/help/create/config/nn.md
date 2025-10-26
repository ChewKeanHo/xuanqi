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




# Kommandolinjegrensesnitt for Oppretting av Konfigurasjonsfil

`create config` kommandolinjegrensesnitt (CLI) er for å opprette
ei enkelt oppførings `.conf` datafil som kan brukast over heile
prosjektet. Den fulle kommandoen er som følgjer:

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **OBLIGATORISK**
  * Den relative (frå `$XUANQI_PATH_CONFIGS`) filstia som sluttar
    med `.conf` filending.
  * Viss `.conf` filendinga ikkje er oppgjeve, vil XuanQi leggja
    henne til internt.
  * Viss `.conf` fila er utanfor prosjektets konfigurasjonskatalog
    eller katalogen rett og slett ikkje eksisterer, vil ein feil
    verta utløyst.
  * Filnamnet er etter ditt skjønn. Det påverkar ikkje XuanQi.
* `[KEY]`
  * **OBLIGATORISK**
  * `key` etiketten for `key:value` oppføringa.
  * Bruk understrek (`_`) sidan nøkkelen vil verta brukt som
    miljøvariabel.
  * Sikra at verdien er unik. Elles kan den same nøkkelen over
    fleire konfigurasjonsfilar føra til uforutsigbare konsekvensar
    (den sist tolka fila overskriv forgjengarane sine).
* `[VALUE]`
  * **VALFRI**
  * `value` etiketten for `key:value` oppføringa.
  * Når ho står tom, vert ein eksempeltekst erstatta der du kan
    oppdatera fila seinare.




## Stibegrensing

Av tryggingsårsaker tillèt XuanQi berre oppretting av datafilar
innanfor `$PROJECT_PATH_ROOT`. Elles vil han utløysa ein feil og
ikkje gjera noko.

Berre for denne opprettinga, er han **STRENGT** avgrensa til
`$XUANQI_PATH_CONFIGS` katalogen (som og er innanfor
`$PROJECT_PATH_ROOT`).




## Kjend Dokumentasjon

Avhengig av om `[KEY]` samsvarar med den støtta miljøvariabelen,
kan den genererte konfigurasjonsfila ha si eiga dedikerte
dokumentasjon. Sjå:

```
$ [XUANQI] help variables
```

for lista over støtta variablar.




## Epilog

Det er alt for denne CLI.

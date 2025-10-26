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




# Velkommen!

Dette er en dokumentasjon med flere seksjoner. Den er spesifikt designet ved å
bruke "Business Need-To-Know"-policyen for å begrense omfanget av dette
omfattende lesematerialet.

Sjekk det ut nedenfor!




## Hurtigguide

For erfarne brukere som bare vil ha en rask oppfriskning:

* `[XUANQI] build` - bygg hele prosjektet.
* `[XUANQI] create [TYPE] [VERDI1] [VERDI2] ...`   - opprett noe.
* `[XUANQI] purge` - rydd opp i hele prosjektet.

Noen viktige kataloger som ikke skal slettes:

* `configs`
  * inneholder XuanQIs arbeidsområdekonfigurasjoner. Ikke slett noe her.
  * Hardkodet til katalognavnet `configs/`.
* `components`
  * inneholder alle eksterne modulære komponenter.
* `layouts`
  * inneholder alle XuanQIs arbeidsområdets sidelayouter for at routeren skal
    gjengi.
* `public`
  * inneholder alle XuanQIs utdatafiler i strukturene definert av `routers`.
* `routers`
  * kartlegger prosjektets filstrukturer og utdatagjengivelsesskript.
* `tests`
  * inneholder alle XuanQIs arbeidsområdets testskript for selvtester.




## Om Språk

XuanQI støtter følgende språk via miljøvariabelen `$XUANQI_LANGUAGE`
satt ved bruk av konfigurasjonsfilen `configs/xuanqi.conf` eller systemets
`$LANG` miljøvariabel.

* (de) Deutsch
* (en) English (standard og fallback)
* (es) Español
* (fr) Français
* (ja) 日本語
* (ko) 한국어
* (mn-Cyrl) Монгол
* (ms) Bahasa Melayu
* (nb) Norsk Bokmål
* (nl) Nederlands
* (nn) Norsk Nynorsk
* (ru) Pусский
* (sv) Svenska
* (uk) Yкраїнська
* (zh-Hans) 华语（简体）
* (zh-Hant) 華語（繁體）




## Build

```
$ [XUANQI] help build
```

Dette åpner hjelpeindeksseksjonen for `build`-kommandoen som dekker alle dens
spesifikasjoner.




## Create

```
$ [XUANQI] help create
```

Dette åpner hjelpeindeksseksjonen for `create`-kommandoen som dekker alle dens
spesifikasjoner.




## Purge

```
$ [XUANQI] help purge
```

Dette åpner hjelpeindeksseksjonen for `purge`-kommandoen som dekker alle dens
spesifikasjoner.




## Test

```
$ [XUANQI] help test
```

Dette åpner hjelpeindeksseksjonen for `test`-kommandoen som dekker alle dens
spesifikasjoner.

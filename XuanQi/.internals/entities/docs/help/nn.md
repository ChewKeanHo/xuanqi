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




# Velkommen!

Dette er ei dokumentasjon med fleire seksjonar. Ho er spesifikt designa ved å
nytta "Business Need-To-Know"-policyen for å avgrensa omfanget av dette
omfattande lesematerialet.

Sjekk det ut nedanfor!




## Snoggguide

For erfarne brukarar som berre vil ha ei rask oppfrisking:

* `[XUANQI] build` - bygg heile prosjektet.
* `[XUANQI] create [TYPE] [VERDI1] [VERDI2] ...`   - opprett noko.
* `[XUANQI] purge` - reinsa opp i heile prosjektet.

Nokre viktige katalogar som ikkje skal slettast:

* `configs`
  * inneheld XuanQi si arbeidsområdekonfigurasjonar. Ikkje slett noko her.
  * Hardkoda til katalognamnet `configs/`.
* `components`
  * inneheld alle eksterne modulære komponentar.
* `layouts`
  * inneheld alle XuanQi si arbeidsområde sine sidelayouter for at ruten skal
    gjengi.
* `public`
  * inneheld alle XuanQi sine utdatafiler i strukturene definert av `routers`.
* `routers`
  * kartlegg prosjektets filstrukturar og utdatagjengivingsskript.
* `tests`
  * inneheld alle XuanQi si arbeidsområde sine testskript for sjølvtestar.




## Om Språk

XuanQI støttar følgjande språk via miljøvariabelen `$XUANQI_LANGUAGE`
sett ved bruk av konfigurasjonsfila `configs/xuanqi.conf` eller systemets
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

Dette opnar hjelpeindeksseksjonen for `build`-kommandoen som dekkjer alle
spesifikasjonane hennar.




## Create

```
$ [XUANQI] help create
```

Dette opnar hjelpeindeksseksjonen for `create`-kommandoen som dekkjer alle
spesifikasjonane hennar.




## Purge

```
$ [XUANQI] help purge
```

Dette opnar hjelpeindeksseksjonen for `purge`-kommandoen som dekkjer alle
spesifikasjonane hennar.




## Test

```
$ [XUANQI] help test
```


Dette opnar hjelpeindeksseksjonen for `test`-kommandoen som dekkjer alle
spesifikasjonane hennar.

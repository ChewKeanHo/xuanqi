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




# Välkommen!

Detta är en dokumentation med flera sektioner. Den är specifikt utformad med
hjälp av policyn "Business Need-To-Know" för att begränsa omfattningen av detta
omfattande läsmaterial.

Kolla in det nedan!




## Snabbguide

För erfarna användare som bara vill ha en snabb uppfräschning:

* `[XUANQI] build` - bygg hela projektet.
* `[XUANQI] create [TYP] [VÄRDE1] [VÄRDE2] ...`   - skapa något.
* `[XUANQI] purge` - rensa upp hela projektet.

Några viktiga kataloger som inte ska raderas:

* `configs`
  * innehåller XuanQis arbetsytekonfigurationer. Radera INGET här.
  * Hårdkodat till katalognamnet `configs/`.
* `components`
  * innehåller alla externa modulära komponenter.
* `layouts`
  * innehåller alla XuanQis arbetsytes sidlayouter för router att rendera.
* `public`
  * innehåller alla XuanQis utdatafiler i strukturerna definierade av `routers`.
* `routers`
  * mappar projektets filstrukturer och utdatarenderskript.
* `tests`
  * innehåller alla XuanQis arbetsytes testskript för självtester.




## Om Språk

XuanQi stöder följande språk via miljövariabeln `$XUANQI_LANGUAGE`
som ställs in med konfigurationsfilen `configs/xuanqi.conf` eller systemets
`$LANG` miljövariabel.

* (de) Deutsch
* (en) English (standard och fallback)
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

Detta öppnar hjälpindexsektionen för `build`-kommandot som täcker alla dess
specifikationer.




## Create

```
$ [XUANQI] help create
```

Detta öppnar hjälpindexsektionen för `create`-kommandot som täcker alla dess
specifikationer.




## Purge

```
$ [XUANQI] help purge
```

Detta öppnar hjälpindexsektionen för `purge`-kommandot som täcker alla dess
specifikationer.




## Test

```
$ [XUANQI] help test
```

Detta öppnar hjälpindexsektionen för `test`-kommandot som täcker alla dess
specifikationer.

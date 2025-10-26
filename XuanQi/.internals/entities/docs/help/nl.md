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




# Welkom!

Dit is een documentatie met meerdere secties. Het is specifiek ontworpen met
behulp van het "Business Need-To-Know"-beleid om deze enorme leesstof
af te bakenen.

Bekijk het hieronder!




## Snelstartgids

Voor ervaren gebruikers die gewoon een snelle opfrissing willen:

* `[XUANQI] build` - bouw het hele project.
* `[XUANQI] create [TYPE] [WAARDE1] [WAARDE2] ...`   - maak iets aan.
* `[XUANQI] purge` - ruim het hele project op.

Enkele belangrijke mappen die niet verwijderd mogen worden:

* `configs`
  * bevat XuanQi's werkruimteconfiguraties. Verwijder hier NIETS.
  * Vastgezet op mapnaam `configs/`.
* `components`
  * bevat alle externe modulaire componenten.
* `layouts`
  * bevat alle paginalay-outs van XuanQi's werkruimte voor weergave door de
    router.
* `public`
  * bevat alle uitvoerbestanden van XuanQi in de door `routers` gedefinieerde
    structuren.
* `routers`
  * mapt de bestandsstructuren van het project en uitvoerweergavescripts.
* `tests`
  * bevat alle testscripts van XuanQi's werkruimte voor zelftests.




## Over Talen

XuanQi ondersteunt de volgende talen via de omgevingsvariabele
`$XUANQI_LANGUAGE` ingesteld met het configuratiebestand `configs/xuanqi.conf`
of de systeem `$LANG` omgevingsvariabele.

* (de) Deutsch
* (en) English (standaard en fallback)
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

Dit opent de helpindexsectie voor het `build`-commando die alle specificaties
dekt.




## Create

```
$ [XUANQI] help create
```

Dit opent de helpindexsectie voor het `create`-commando die alle specificaties
dekt.




## Purge

```
$ [XUANQI] help purge
```

Dit opent de helpindexsectie voor het `purge`-commando die alle specificaties
dekt.




## Test

```
$ [XUANQI] help test
```

Dit opent de helpindexsectie voor het `test`-commando die alle specificaties
dekt.

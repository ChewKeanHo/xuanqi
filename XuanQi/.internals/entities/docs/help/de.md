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




# Willkommen!

Dies ist eine mehrteilige Dokumentation. Sie wurde speziell nach der
Richtlinie "Business Need-To-Know" entworfen, um diesen umfangreichen
Lesestoff einzugrenzen.

Schauen Sie sich die folgenden Abschnitte an!




Für erfahrene Benutzer, die nur eine kurze Auffrischung benötigen:

* `[XUANQI] build` - das gesamte Projekt erstellen.
* `[XUANQI] create [TYPE] [WERT1] [WERT2] ...`   - etwas erstellen.
* `[XUANQI] purge` - das gesamte Projekt bereinigen.

Einige wichtige Verzeichnisse, die nicht gelöscht werden dürfen:

* `configs`
  * beherbergt XuanQis Arbeitsbereich-Konfigurationen. Löschen Sie hier nichts.
  * Fest codiert auf den Verzeichnisnamen `configs/`.
* `components`
  * beherbergt alle externen modularen Komponenten.
* `layouts`
  * beherbergt alle Seitenlayouts von XuanQis Arbeitsbereich für das Rendering
    durch den Router.
* `public`
  * beherbergt alle Ausgabedateien von XuanQi in den durch `routers`
    definierten Strukturen.
* `routers`
  * bildet die Dateistrukturen des Projekts und die Ausgabeskripte für das
    Rendering ab.
* `tests`
  * beherbergt alle Testskripte von XuanQis Arbeitsbereich für Selbsttests.




## Über Sprachen

XuanQi unterstützt die folgenden Sprachen über die Umgebungsvariable
`$XUANQI_LANGUAGE`, die entweder über die Konfigurationsdatei
`configs/xuanqi.conf` oder die systemweite Umgebungsvariable `$LANG` gesetzt
wird.

* (de) Deutsch
* (en) English (Standard und Fallback)
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

Dies öffnet den Hilfeseitenabschnitt für den Befehl `build`, der alle seine
Spezifikationen abdeckt.




## Create

```
$ [XUANQI] help create
```

Dies öffnet den Hilfeseitenabschnitt für den Befehl `create`, der alle seine
Spezifikationen abdeckt.




## Purge

```
$ [XUANQI] help purge
```

Dies öffnet den Hilfeseitenabschnitt für den Befehl `purge`, der alle seine
Spezifikationen abdeckt.




## Test

```
$ [XUANQI] help test
```

Dies öffnet den Hilfeseitenabschnitt für den Befehl `test`, der alle seine
Spezifikationen abdeckt.

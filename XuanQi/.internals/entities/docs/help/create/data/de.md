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




# Daten Datei CLI erstellen

Die `create data` Command Line Interface (CLI) dient zum Erstellen einer
einzelnen `.conf`-Datendatei, die im gesamten Projekt verwendet werden
kann. Der vollständige Befehl lautet wie folgt:

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **ERFORDERLICH**
  * Der relative (von `$PROJECT_PATH_ROOT` aus) Dateipfad, der mit der
    `.conf`-Dateierweiterung endet.
  * Wenn die `.conf`-Dateierweiterung nicht angegeben wird, fügt
    XuanQi sie intern hinzu.
  * Der Dateiname liegt in Ihrem Ermessen. Er hat keinen Einfluss auf
    XuanQi.
* `[KEY]`
  * **ERFORDERLICH**
  * Das `key`-Label des `key:value`-Eintrags.
  * Verwenden Sie einen Unterstrich (`_`), da der Schlüssel als
    Umgebungsvariable verwendet wird.
  * Stellen Sie sicher, dass der Wert eindeutig ist. Andernfalls kann
    derselbe Schlüssel in mehreren Konfigurationsdateien zu
    unvorhersehbaren Folgen führen (die zuletzt geparste Datei
    überschreibt ihre Vorgänger).
* `[VALUE]`
  * **OPTIONAL**
  * Das `value`-Label des `key:value`-Eintrags.
  * Wenn es leer gelassen wird, wird ein Beispieltext eingefügt, den
    Sie später in der Datei aktualisieren können.




## Pfadeinschränkungen

Aus Sicherheitsgründen erlaubt XuanQi das Erstellen der Datendatei nur
innerhalb von `$PROJECT_PATH_ROOT`. Andernfalls wird ein Fehler
ausgegeben und nichts unternommen.




## Epilog

Das ist alles für diese CLI.

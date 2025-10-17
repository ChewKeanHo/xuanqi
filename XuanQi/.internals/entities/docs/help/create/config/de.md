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




# CLI zum Erstellen von Konfigurationsdateien

Die `create config` Kommandozeilenschnittstelle (CLI) dient zum
Erstellen einer einzelnen `.conf`-Datendatei, die im gesamten
Projekt verwendet werden kann. Der vollständige Befehl lautet wie
folgt:

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **ERFORDERLICH**
  * Der relative Pfad (ab `$XUANQI_PATH_CONFIGS`) endet mit der
    Dateierweiterung `.conf`.
  * Wenn die `.conf`-Dateierweiterung nicht angegeben wird, fügt
    XuanQi sie intern hinzu.
  * Wenn die `.conf`-Datei außerhalb des
    Projektkonfigurationsverzeichnisses liegt oder das Verzeichnis
    nicht existiert, wird ein Fehler ausgegeben.
  * Der Dateiname liegt in Ihrem Ermessen. Er beeinflusst XuanQi nicht.
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
  * Wenn leer gelassen, wird ein Beispieltext ersetzt, den Sie später
    in der Datei aktualisieren können.




## Pfadeinschränkung

Aus Sicherheitsgründen erlaubt XuanQi das Erstellen der Datendatei
nur innerhalb von `$PROJECT_PATH_ROOT`. Andernfalls wird ein Fehler
ausgegeben und nichts unternommen.

Nur für diese Erstellung ist sie **STRENG** auf das
`$XUANQI_PATH_CONFIGS`-Verzeichnis beschränkt (das sich ebenfalls
innerhalb von `$PROJECT_PATH_ROOT` befindet).




## Bekannte Dokumentationen

Abhängig vom `[KEY]`, der mit der unterstützten Umgebungsvariablen
übereinstimmt, kann die generierte Konfigurationsdatei eine eigene
dedizierte Dokumentation haben. Siehe:

```
$ [XUANQI] help variables
```

für die Liste der unterstützten Variablen.




## Epilog

Das ist alles für diese CLI.

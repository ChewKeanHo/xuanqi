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




# Hilfebereich zum Erstellen einer Datenkomponente

Dies ist der Hilfebereich zum Erstellen einer Datenkomponente, entweder
unabhängig oder als Teil einer anderen größeren Komponente. Um den
Datenbereich einzubinden, füttere einfach `data` in den `[TYPES]`-Wert.
Beispiel:

```
# befehlsmuster
$ [XuanQi] create component [TYPES] [NAME]

# nur datenkomponente
$ [XuanQi] create component data [NAME]

# mit datenbereich innerhalb einer zusammengesetzten Komponente
$ [XuanQi] create component "...,data,..." [NAME]
```




## Zweck

Die Datenkomponente dient hauptsächlich dazu, dem Projekt und der
Komponente einen spezifischen Datensatz bereitzustellen. Dies ermöglicht
variable Rendering-Änderungen für dieselben Dateilayouts, wodurch
Auswahlmöglichkeiten robust werden, ohne die Wartbarkeit zu beeinträchtigen.
XuanQi verfügt über integrierte Funktionen zum nahtlosen Importieren
aller Konfigurationsdateien (`.conf`) und Shell-Skript-Funktionen (`.sh`).

Im Allgemeinen behandelt XuanQi die Datenkomponente als einen
**Datenbanklosen** (`noDB`) Datenspeicher.




## Dateistrukturen

Die Datenkomponente entspricht der folgenden standardmäßigen Dateistruktur:

```
[XUANQI_PATH_COMPONENTS]
└── [XUANQI_COMPONENT_NAME]
       ├── Data
       │    ├── i18n
       │    │     ├── title.sh
       │    │     └── ...
       │    ├── sample.conf
       │    └── ...
       └── XuanQi
            └── import.sh
```

* Das Komponentenverzeichnis ist `Data`.
* Das Shell-Skript des Komponentenoperators befindet sich direkt in
  `XuanQi/import.sh`. Es ist Teil der Komponenteninitialisierung.




## Hauptziel

Ihr **Hauptziel ist es, die variablen Datenquellen zu abstrahieren
und die Datenfunktionalität für Ihr Projekt oder Ihre Komponente(n)
zu erstellen**. Wie Sie dies tun, liegt ganz bei Ihnen.

Bei der Initialisierung jeder Komponente kann jede Komponente die
Datenkomponente von innerhalb oder über andere Komponenten hinweg
parsen. Daher **MÜSSEN** Sie das Datenverzeichnis jederzeit flexibel
und parsbar halten.

Sie können die `XuanQi/.internals/API` des Projekts für verfügbare
APIs konsultieren.




## Konfigurationsdatei oder Shell-Skript

XuanQi bietet 2 Hauptwege für das Datenmanagement:

* Konfigurationsdatei (`.conf`)
* Shell-Skript-Funktionsdatei (`.sh`)

`.conf` eignet sich für das schnelle Einrichten von Variablen, sodass
Sie deren Wert sofort für das Datei-Rendering verwenden können. Eine
Beispieldatei (`Data/sample.conf`) wird erstellt, um zu zeigen, wie
man eine erstellt. **Eine Datei sollte nur ein Schlüssel-Wert-Paar
enthalten**.

`.sh` ist eigentlich ein Shell-Skript, das eine Funktionsdefinition
enthält, um die Daten durch logische Bedingungen bereitzustellen.
Dies ist am besten geeignet, wenn Ihr Datensatz eine oder mehrere
Bedingungen erfordert, um eine Ausgabe unterschiedlich zu rendern
(z.B. hängen `i18n_`-Funktionen vom `$XUANQI_CONTENT_LANGUAGE`-Flag
ab, um einen sprachspezifischen String zurückzugeben). **ACHTUNG:
Funktionen mit demselben Namen werden während des Imports überschrieben**.
Eine Beispieldatei (`Data/i18n/title.sh`) wird als Referenz für
Sie erstellt.

Die letzte Option wäre das manuelle Lesen von `.txt`-Dateien in einem
Verzeichnis. XuanQi wird nur `.conf` und `.sh` parsen, sodass Sie sie
sicher verwenden können. Dies geschieht, indem ein spezifischer
Datensatzname als Verzeichnisname organisiert wird und der Dateiname
streng als Parametername belassen wird. Der Nachteil ist, dass diese
Methode mehr IO-Lese-/Schreibverkehr belegt, was die Produktion
verlangsamen kann. Allerdings steht **die Erfüllung der Anforderungen
immer vor der Geschwindigkeit**, sodass Sie sie bei Bedarf trotzdem
verwenden können. Beispiel für einen textbasierten i18n-Ansatz:

```
[XUANQI_PATH_COMPONENTS]
└── [XUANQI_COMPONENT_NAME]
       ├── Data
       │    ├── names
       │    │     ├── de.txt
       │    │     ├── en.txt
       │    │     ├── es.txt
       │    │     └── ...
       │    └── ...
       └── ...

# verwendung des obigen in shell-skript
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```



### Wie man wählt

Verwenden Sie standardmäßig und wann immer möglich `.conf`.
Wenn es eine logische Anforderung gibt (z.B. Bedingung, etc.),
dann verwenden Sie `.sh`.




## Mediendateien

Obwohl Mediendateien (z.B. Bilder, Audio, Video, etc.) technisch
gesehen Daten sind, **vermeiden Sie bitte, sie hier abzulegen**.
Es gibt eine dedizierte `media`-Komponente mit dedizierten
Verarbeitungsfunktionen dafür. Bitte verwenden Sie stattdessen diese.

Sie sollten die Datenkomponente immer als **Datenbanklos** (`noDB`)
behandeln.




## Epilog

Das ist alles für den Hilfebereich zum Erstellen einer Datenkomponente.

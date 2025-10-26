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




# CSS-Komponenten-Hilfebereich erstellen

Dies ist der Hilfebereich zum Erstellen einer CSS-Komponente, entweder
unabhängig oder als Teil einer anderen größeren Komponente. Um den
CSS-Teil einzubinden, füttere einfach `css` in den `[TYPES]`-Wert.
Beispiel:

```
# befehlsmuster
$ [XuanQi] create component [TYPES] [NAME]

# nur CSS-komponente
$ [XuanQi] create component css [NAME]

# mit CSS-teil in einer zusammengesetzten Komponente
$ [XuanQi] create component "...,css,..." [NAME]
```



## Zweck

Die CSS-Komponente dient hauptsächlich zum Erstellen der
CSS-Ausgabedatei (z.B. `page.css`). XuanQi verfügt über beide
eingebauten Einrichtungen in `Shell`-Funktionen oder kopiert eine
reguläre CSS-Datei.




## Dateistrukturen

Die CSS-Komponente entspricht der folgenden standardmäßigen
dateistruktur:

```
[XUANQI_PATH_COMPONENTS]
└── [XUANQI_COMPONENT_NAME]
       ├── CSS
       │    ├── sample.css
       │    ├── ...
       │    └── xuanqi.sh
       └── XuanQi
            └── import.sh
```

* das Komponentenverzeichnis ist `CSS`.
* das Komponenten-Betreiber-Shell-Skript ist `CSS/xuanqi.sh`.
* das Komponenten-Betreiber-Shell-Skript wird vom Hauptkomponenten-
  Import-Shell-Skript `XuanQi/import.sh` aufgerufen.




## `CSS/xuanqi.sh` Hauptskript

Ihr **ultimatives Ziel ist es, die CSS-Ausgabedatei auf Ihre Weise
in `$XUANQI_CONTENT_PATH` zu schreiben**. Wie Sie dies tun, liegt
vollständig bei Ihnen.

Mehrere Router-Skripte können dieselbe Komponente zum Rendern von
Dateien aufrufen (z.B. verschiedene Medienziele wie Mobilgeräte,
Druck, E-Mail für denselben Inhalt). Daher sollten Sie Ihre benötigten
Umgebungsvariablen strategisch so gestalten, dass Benutzer sie im
Router-Skript einrichten können.

Dann, während `CSS/xuanqi.sh` ausgeführt wird, parsen Sie diese
Umgebungs-variablen und reagieren entsprechend.

Sie können die `XuanQi/.internals/API` des Projekts für verfügbare
APIs konsultieren.




## Programmatisch oder Kopieren

XuanQi bietet sowohl programmierbare Funktionen als auch
Rohkopierfunktionen zum einfachen Rendern der CSS-Datei. Die
Entscheidung hängt von Ihrem Team ab.

Wenn Ihr Team mit Shell-Skripting nicht vertraut ist, ist letzteres
vorzuziehen, sodass das gesamte Team an der bereitgestellten `.css`
-Datei arbeiten kann, während XuanQi sie einfach in
`$XUANQI_CONTENT_PATH` kopiert. Dies ist ideal für diejenigen, die
den `Sass`-Compiler verwenden.

XuanQis Shell-Skripting-programmierbare Funktionen ermöglichen eine
größere interne Flexibilität beim Rendern (denken Sie an Makros über
CSS-Schreiben). Der Vorteil ist keine Abhängigkeit und extrem flexibel
mit Ihrem Inhalts-generator. Dies ist geeignet für erfahrene
CSS-Entwickler, die `Sass` als Behinderung ansehen.

In jedem Fall sind Sie in guten Händen. Probieren Sie es einfach aus
und passen Sie sich im Laufe der Zeit entsprechend an.




## Epilog

Das ist alles für den Hilfebereich zur Erstellung von CSS-Komponenten.

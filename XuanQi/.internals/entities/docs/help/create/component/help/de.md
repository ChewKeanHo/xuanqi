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




# Willkommen im Bereich zur Komponentenerstellung von XuanQi.

XuanQi arbeitet hauptsächlich mit dem Komponentenkonzept.
Alles besteht aus Komponenten. Hier ist der allgemeine Befehl
zum Erstellen einer Komponente:

```
$ [XuanQi] create component [TYPES] [NAME]
```

Hierbei gilt:

* `[TYPES]` ist die Liste der Komponententypen innerhalb der
  zu erstellenden Komponente.
* `[NAME]` der relative Pfad zum Komponentennamen
  (z.B. `pages/root` für die Root-Rendering-Seite).

Die Ausgabe wird im Verzeichnis `$XUANQI_PATH_COMPONENTS`
gespeichert (abgeleitet von `$XUANQI_DIRECTORY_COMPONENTS`).

## Komponententypen

Es gibt eine Reihe von Komponententypen, die jeweils ihre
spezifischen Dokumentationen haben. Mehr zu einem bestimmten
Typ erfahren Sie mit diesem Befehl:

```
[XUANQI] help create component [TYPE]
```

Unterstützte `[TYPE]`-Werte sind:

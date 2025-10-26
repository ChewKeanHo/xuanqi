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




# Välkommen till XuanQis hjälpavsnitt för att skapa komponenter.

XuanQi använder främst komponentkonceptet.
Allt är komponenter. Nedan är det övergripande kommandot för
att skapa en:

```
$ [XuanQi] create component [TYPES] [NAME]
```

där:

* `[TYPES]` är listan över komponenttyper inuti
  komponenten du försöker skapa.
* `[NAME]` den relativa sökvägen till komponentnamnet
  (t.ex. `pages/root` för root-renderingssidan).

Resultatet lagras i katalogen `$XUANQI_PATH_COMPONENTS`
(härledd från `$XUANQI_DIRECTORY_COMPONENTS`).




## Komponenttyper

Det finns ett antal komponenttyper att titta på och varje
en av dem har sin specifika dokumentation. Du kan lära dig mer
om din intresserade typ genom att köra följande kommando:

```
[XUANQI] help create component [TYPE]
```

De `[TYPE]`-värden som stöds är:

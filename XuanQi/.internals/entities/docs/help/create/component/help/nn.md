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




# Velkommen til XuanQi si hjelpeseksjon for komponentoppretting.

XuanQi opererer hovudsakleg med komponentkonseptet.
Alt er komponentar. Nedanfor er hovudkommandoen for
å opprette ein:

```
$ [XuanQi] create component [TYPES] [NAME]
```

der:

* `[TYPES]` er lista over komponenttypar inni
  komponenten du prøver å opprette.
* `[NAME]` den relative stia til komponentnamnet
  (t.d. `pages/root` for root-gjengivingssida).

Resultatet vert lagra i `$XUANQI_PATH_COMPONENTS`-katalogen
(avleidd frå `$XUANQI_DIRECTORY_COMPONENTS`).




## Komponenttypar

Det er ein del komponenttypar å sjå på og kvar
av dei har sine spesifikke dokumentasjonar. Du kan læra meir
om typen du er interessert i ved å køyra følgjande kommando:

```
[XUANQI] help create component [TYPE]
```

Støtta `[TYPE]`-verdiar er:

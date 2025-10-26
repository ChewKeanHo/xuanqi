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




# Velkommen til XuanQis hjelpeseksjon for oppretting av komponenter.

XuanQi opererer primært ved hjelp av komponentkonseptet.
Alt er komponenter. Nedenfor er kommandoen for
å opprette en:

```
$ [XuanQi] create component [TYPES] [NAME]
```

hvor:

* `[TYPES]` er listen over komponenttyper inne i
  komponenten du prøver å opprette.
* `[NAME]` den relative stien til komponentnavnet
  (f.eks. `pages/root` for root-gjengivelsessiden).

Resultatet lagres i `$XUANQI_PATH_COMPONENTS`-katalogen
(avledet fra `$XUANQI_DIRECTORY_COMPONENTS`).




## Komponenttyper

Det er en rekke komponenttyper å se på, og hver
av dem har sin spesifikke dokumentasjon. Du kan lære mer
om typen du er interessert i ved å kjøre følgende kommando:

```
[XUANQI] help create component [TYPE]
```

Støttede `[TYPE]`-verdier er:

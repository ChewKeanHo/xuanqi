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




# Welkom bij het Helpgedeelte voor het Maken van Componenten
# van XuanQi.

XuanQi werkt voornamelijk met het componentconcept.
Alles is componenten. Hieronder staat het algemene commando
om er een aan te maken:

```
$ [XuanQi] create component [TYPES] [NAME]
```

waarbij:

* `[TYPES]` de lijst is met componenttypen in de
  component die je probeert aan te maken.
* `[NAME]` het relatieve pad naar de componentnaam
  (bijv. `pages/root` voor de root-weergavepagina).

De uitvoer wordt opgeslagen in de map `$XUANQI_PATH_COMPONENTS`
(afgeleid van `$XUANQI_DIRECTORY_COMPONENTS`).




## Componenttypen

Er zijn een aantal componenttypen om te bekijken en elk
van hen heeft hun specifieke documentatie. Je kunt meer
te weten komen over het type dat je interesseert door het
volgende commando uit te voeren:

```
[XUANQI] help create component [TYPE]
```

Ondersteunde `[TYPE]`-waarden zijn:

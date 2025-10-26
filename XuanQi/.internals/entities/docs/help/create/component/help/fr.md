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




# Bienvenue dans la section d'aide à la création de composants de XuanQi.

XuanQi fonctionne principalement sur le concept de composants.
Tout est composants. Voici la commande générale pour
en créer un:

```
$ [XuanQi] create component [TYPES] [NAME]
```

où:

* `[TYPES]` sont les types de composants contenus dans le
  composant que vous essayez de créer.
* `[NAME]` le chemin relatif vers le nom du composant
  (par ex. `pages/root` pour la page racine de rendu).

Le résultat sera stocké dans le répertoire `$XUANQI_PATH_COMPONENTS`
(dérivé de `$XUANQI_DIRECTORY_COMPONENTS`).




## Types de composants

Il existe plusieurs types de composants, chacun ayant sa
documentation spécifique. Apprenez-en plus sur un type
particulier en exécutant la commande:

```
[XUANQI] help create component [TYPE]
```

Les valeurs de `[TYPE]` prises en charge sont:

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




# Bienvenue!

Il s'agit d'une documentation multi-sections. Elle est spécifiquement conçue en
utilisant la politique "Business Need-To-Know" pour réduire la portée de cet
important matériel de lecture.

Découvrez-le ci-dessous!




## Guide Rapide

Pour les utilisateurs expérimentés qui souhaitent juste un rafraîchissement
rapide:

* `[XUANQI] build` - construire l'ensemble du projet.
* `[XUANQI] create [TYPE] [VALEUR1] [VALEUR2] ...`   - créer quelque chose.
* `[XUANQI] purge` - nettoyer l'ensemble du projet.

Quelques répertoires importants à ne pas supprimer:

* `configs`
  * contient les configurations de l'espace de travail de XuanQi. NE supprimez
    RIEN ici.
  * Nom du répertoire codé en dur: `configs/`.
* `components`
  * contient tous les composants modulaires externes.
* `layouts`
  * contient toutes les mises en page de l'espace de travail de XuanQi pour
    le rendu par le routeur.
* `public`
  * contient tous les fichiers de sortie de XuanQi dans les structures définies
    par `routers`.
* `routers`
  * mappe les structures de fichiers du projet et les scripts de rendu de
    sortie.
* `tests`
  * contient tous les scripts de test de l'espace de travail de XuanQi pour
    les auto-tests.




## À propos des Langues

XuanQi prend en charge les langues suivantes via la variable d'environnement
`$XUANQI_LANGUAGE` définie en utilisant le fichier de configuration
`configs/xuanqi.conf` ou la variable d'environnement système `$LANG`.

* (de) Deutsch
* (en) English (par défaut et de secours)
* (es) Español
* (fr) Français
* (ja) 日本語
* (ko) 한국어
* (mn-Cyrl) Монгол
* (ms) Bahasa Melayu
* (nb) Norsk Bokmål
* (nl) Nederlands
* (nn) Norsk Nynorsk
* (ru) Pусский
* (sv) Svenska
* (uk) Yкраїнська
* (zh-Hans) 华语（简体）
* (zh-Hant) 華語（繁體）




## Build

```
$ [XUANQI] help build
```

Cela ouvre la section d'index d'aide de la commande `build` couvrant toutes ses
spécifications.




## Create

```
$ [XUANQI] help create
```

Cela ouvre la section d'index d'aide de la commande `create` couvrant toutes ses
spécifications.




## Purge

```
$ [XUANQI] help purge
```


Cela ouvre la section d'index d'aide de la commande `purge` couvrant toutes ses
spécifications.




## Test

```
$ [XUANQI] help test
```


Cela ouvre la section d'index d'aide de la commande `test` couvrant toutes ses
spécifications.

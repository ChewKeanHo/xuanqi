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




# Section d'Aide pour Créer un Composant de Données

Il s'agit de la section d'aide pour créer un composant de
données soit indépendamment, soit dans le cadre d'un autre
composant plus grand. Pour inclure la partie données, il suffit
de fournir `data` dans la valeur `[TYPES]`. Exemple:

```
# modèle de commande
$ [XuanQi] create component [TYPES] [NAME]

# seulement le composant de données
$ [XuanQi] create component data [NAME]

# vec la partie données dans un composant composite
$ [XuanQi] create component "...,data,..." [NAME]
```




## Objectif

Le composant de données vise principalement à faciliter le projet
et le composant avec un jeu de données spécifique. Cela permet des
changements de rendu variables pour les mêmes dispositions de fichiers,
rendant les choix de sortie robustes sans sacrifier la maintenabilité.
XuanQi dispose de fonctions intégrées pour importer de manière
transparente tous les fichiers de configuration (`.conf`) et les
fonctions de script shell (`.sh`).

En général, XuanQi traite le composant de données comme un stockage
de données **sans base de données** (`noDB`).




## Structures de Fichiers

Le composant de données se conforme à la structure de fichiers par
défaut suivante:

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

* le répertoire du composant est `Data`.
* le script shell de l'opérateur du composant se trouve
  directement dans `XuanQi/import.sh`. Il fait partie de
  l'initialisation du composant.




## Objectif Principal

Votre **objectif principal est d'abstraire les sources de
données variables et de créer l'installation de données pour
votre projet ou vos composants**. La manière de le faire dépend
entièrement de vous.

Lors de l'initialisation de chaque composant, tout composant
peut analyser le composant de données depuis l'intérieur ou à
travers d'autres composants. Par conséquent, vous **DEVEZ** garder
le répertoire de données flexible et analysable à tout moment.

Vous pouvez vous référer à `XuanQi/.internals/API` du projet pour
les API disponibles.




## Fichier de Configuration ou Script Shell

XuanQi fournit 2 méthodes principales pour gérer la gestion des
données:

* fichier de configuration (`.conf`)
* fichier de fonction de script shell (`.sh`)

`.conf` convient pour une configuration rapide des variables afin
que vous puissiez immédiatement utiliser sa valeur pour le rendu
des fichiers. Un exemple de fichier (`Data/sample.conf`) est créé
pour montrer comment en créer un. **Un fichier ne doit contenir
qu'une seule paire clé:valeur**.

`.sh` est en réalité un script shell contenant une définition de
fonction pour fournir les données par conditionnement logique.
Cela convient le mieux si votre jeu de données nécessite une ou
plusieurs conditions pour rendre une sortie différemment (par
exemple, les fonctions `i18n_` dépendent du drapeau
`$XUANQI_CONTENT_LANGUAGE` pour renvoyer une chaîne spécifique
à la langue). **ATTENTION: les fonctions portant le même nom seront
remplacées lors de l'importation**. Un exemple de fichier
(`Data/i18n/title.sh`) est créé pour votre référence.

La dernière option serait de lire manuellement les fichiers `.txt`
dans un répertoire. XuanQi n'analysera que `.conf` et `.sh`, vous
pouvez donc l'utiliser en toute sécurité. Cela se fait en organisant
un nom de jeu de données spécifique comme nom de répertoire et en
laissant le nom de fichier strictement comme nom de paramètre.
L'inconvénient est que cette méthode occupe plus de trafic de
lecture/écriture E/S qui peut ralentir la production. Cependant,
*la satisfaction des exigences passe toujours avant la vitesse*,
vous pouvez donc envisager de l'utiliser chaque fois que nécessaire.
Exemple d'approche i18n basée sur des fichiers texte:

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

# utilisation ci-dessus dans le script shell
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```



### Comment Choisir

Utilisez toujours `.conf` par défaut et chaque fois que possible.
S'il y a une exigence logique (par exemple, condition, etc.),
alors utilisez `.sh`.




## Fichiers Médias

Bien que techniquement, les fichiers multimédias (par exemple,
images, audio, vidéo, etc.) soient des données, **veuillez ÉVITER
de les placer ici**. Il existe un composant `media` dédié avec des
fonctions de traitement dédiées pour cela. Veuillez utiliser
celui-ci à la place.

Vous devez toujours traiter le composant de données comme
**sans base de données** (`noDB`).




## Épilogue

C'est tout pour la section d'aide de création de composant de données.

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




# Créer la Section d'Aide du Composant CSS

Ceci est la section d'aide pour créer un composant CSS soit
indépendamment soit dans le cadre d'un autre composant plus grand.
Pour inclure la partie CSS, il suffit de fournir `css` dans la
valeur `[TYPES]`. Exemple:

```
# motif de commande
$ [XuanQi] create component [TYPES] [NAME]

# juste le composant CSS
$ [XuanQi] create component css [NAME]

# avec la partie CSS dans un composant composite
$ [XuanQi] create component "...,css,..." [NAME]
```




## Objectif

Le composant CSS sert principalement à créer le fichier de
ressources CSS de sortie (ex. `page.css`). XuanQi dispose des
deux fonctionnalités intégrées dans les fonctions `Shell` ou copie
un fichier CSS régulier.




## Structures de Fichiers

Le composant CSS se conforme à la structure de fichiers par défaut
suivante:

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

* le répertoire du composant est `CSS`.
* le script shell opérateur du composant est `CSS/xuanqi.sh`.
* le script shell opérateur du composant est appelé par le script
  shell d'importation du composant principal `XuanQi/import.sh`.




## Script Principal `CSS/xuanqi.sh`

Votre **objectif ultime est d'écrire le fichier de sortie CSS
dans `$XUANQI_CONTENT_PATH` à votre manière**. Comment le faire
dépend entièrement de vous.

Plusieurs scripts routeur peuvent invoquer le même composant pour
le rendu de fichiers (ex. différentes cibles médias comme mobile,
impression, email pour le même contenu). Par conséquent, vous devez
concevoir stratégiquement vos variables d'environnement requises
pour que les utilisateurs les configurent dans le script routeur.

Ensuite, lors de l'exécution de `CSS/xuanqi.sh`, analysez ces variables
d'environnement et réagissez en conséquence.

Vous pouvez consulter les `XuanQi/.internals/API` du projet pour les
API disponibles.




## Programmatiquement ou Copier

XuanQi fournit à la fois des fonctions programmables et des fonctions
de copie brute pour rendre facilement le fichier CSS. La décision dépend
de votre équipe.

Si votre équipe n'est pas familière avec l'écriture de scripts shell,
la dernière option est préférée afin que toute l'équipe puisse
travailler sur le fichier `.css` fourni tandis que XuanQi le copie
simplement vers `$XUANQI_CONTENT_PATH`. C'est idéal pour ceux qui
utilisent le compilateur `Sass`.

Les fonctions programmables de script Shell de XuanQi facilitent une
plus grande flexibilité interne sur le rendu (pensez aux macros sur
l'écriture CSS). L'avantage est qu'il n'y a pas de dépendance et qu'il
est extrêmement flexible avec votre générateur de contenu. Ceci est
adapté aux développeurs CSS expérimentés qui considèrent `Sass` comme
une obstruction.

Dans tous les cas, vous êtes entre de bonnes mains. Essayez-le
simplement et adaptez-vous en conséquence au fil du temps.




## Épilogue

C'est tout pour la section d'aide de création de composant CSS.

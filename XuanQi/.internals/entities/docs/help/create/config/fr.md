# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
# Copyright 2023 "Holloway" Chew, Kean Ho <kean.ho.chew@zoralab.com>
# Copyright 2023 ZORALab Enterprise <tech@zoralab.com>
#
#
# Licensed under (Holloway) Chew, Kean Ho's Liberal License (the 'License').
# You must comply with the license to use the content. Get the License at:
#
# https://doi.org/10.5281/zenodo.13770769
#
# You MUST ensure any interaction with the content STRICTLY COMPLIES with
# the permissions and limitations set forth in the license.
#
# NOTE: The license notice and this comment will not be rendered. New line
#       begins with the first non-empty line below.




# CLI de Création de Fichier de Configuration

L'interface de ligne de commande (CLI) `create config` permet de
créer un unique fichier de données `.conf` utilisable dans l'ensemble
du projet. Sa commande complète est la suivante:

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **OBLIGATOIRE**
  * Le chemin relatif (depuis `$XUANQI_PATH_CONFIGS`) se terminant
    par l'extension de fichier `.conf`.
  * Si l'extension de fichier `.conf` n'est pas fournie, XuanQi
    l'ajoutera en interne.
  * Si le fichier `.conf` est en dehors du répertoire de
    configuration du projet ou si le répertoire n'existe simplement
    pas, une erreur sera levée.
  * Le nom du fichier est à votre discrétion. Il n'affecte pas XuanQi.
* `[KEY]`
  * **OBLIGATOIRE**
  * L'étiquette `key` de l'entrée `key:value`.
  * Utilisez le tiret bas (`_`) car la clé sera utilisée comme
    variable d'environnement.
  * Assurez-vous que la valeur est unique. Sinon, la même clé dans
    plusieurs fichiers de configuration peut entraîner des conséquences
    imprévisibles (le dernier fichier analysé écrase ses prédécesseurs).
* `[VALUE]`
  * **OPTIONNEL**
  * L'étiquette `value` de l'entrée `key:value`.
  * Lorsqu'elle est laissée vide, un texte d'exemple est remplacé que
    vous pourrez mettre à jour plus tard dans le fichier.




## Restriction de Chemin

Pour des raisons de sécurité, XuanQi ne permet de créer le fichier de
données que dans `$PROJECT_PATH_ROOT`. Sinon, il générera une erreur
et ne fera rien.

Uniquement pour cette création, il est **STRICTEMENT** limité au
répertoire `$XUANQI_PATH_CONFIGS` (qui se trouve également dans
`$PROJECT_PATH_ROOT`).




## Documentations Connues

En fonction de la correspondance de `[KEY]` avec la variable
d'environnement prise en charge, le fichier de configuration
généré peut avoir sa propre documentation dédiée. Voir :

```
$ [XUANQI] help variables
```

pour la liste des variables prises en charge.




## Épilogue

C'est tout pour cette CLI.

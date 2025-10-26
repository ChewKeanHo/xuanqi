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




# CLI de Création de Fichier de Données

L'interface de ligne de commande (CLI) `create data` permet de créer
un fichier de données `.conf` à entrée unique utilisable dans tout le
projet. Sa commande complète est la suivante:

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **OBLIGATOIRE**
  * Le chemin de fichier relatif (depuis `$PROJECT_PATH_ROOT`) se
    terminant par l'extension de fichier `.conf`.
  * Si l'extension de fichier `.conf` n'est pas fournie, XuanQi
    l'ajoutera en interne.
  * Le nom du fichier est à votre discrétion. Il n'affecte pas XuanQi.
* `[KEY]`
  * **OBLIGATOIRE**
  * L'étiquette `key` de l'entrée `key:value`.
  * Utilisez le trait de soulignement (`_`) car la clé sera utilisée
    comme variable d'environnement.
  * Assurez-vous que la valeur est unique. Sinon, la même clé dans
    plusieurs fichiers de configuration peut entraîner des conséquences
    imprévisibles (le dernier fichier analysé écrase ses prédécesseurs).
* `[VALUE]`
  * **OPTIONNEL**
  * L'étiquette `value` de l'entrée `key:value`.
  * Lorsqu'elle est laissée vide, un texte d'exemple est remplacé et
    vous pouvez mettre à jour le fichier plus tard.




## Restriction de chemin

Pour des raisons de sécurité, XuanQi ne permet de créer le fichier
de données qu'à l'intérieur de `$PROJECT_PATH_ROOT`. Sinon, il générera
une erreur et ne fera rien.




## Épilogue

C'est tout pour cette CLI.

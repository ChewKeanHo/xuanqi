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




# CLI de Purge

L'interface de ligne de commande (CLI) `Purge` sert à nettoyer complètement
l'espace de travail du projet.

Par nature, elle supprime les chemins suivants:

```
$XUANQI_PATH_LOGS       # tous les journaux de build précédents
$XUANQI_PATH_PUBLIC     # toutes les sorties
$XUANQI_PATH_TEMPS      # tous les fichiers temporaires des builds précédents
```

Contrairement au purge silencieuse, cette CLI effectue une vérification de
l'existence de la cible avant la suppression réelle. Sinon, cette CLI ne fait
rien.




## Notification de Suppression

XuanQi signalera uniquement les cibles qu'il supprime réellement.




## Épilogue

C'est tout pour cette CLI.

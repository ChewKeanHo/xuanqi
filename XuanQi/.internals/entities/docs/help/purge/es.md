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




# CLI de Purga

La interfaz de línea de comandos (CLI) `Purge` sirve para limpiar
completamente el espacio de trabajo del proyecto.


Por naturaleza, elimina las siguientes rutas:

```
$XUANQI_PATH_LOGS       # todos los registros de compilación anteriores
$XUANQI_PATH_PUBLIC     # todas las salidas
$XUANQI_PATH_TEMPS      # todos los archivos temporales de compilaciones
                        # anteriores
```

A diferencia de la purga silenciosa, esta CLI realiza una verificación de
existencia del objetivo antes de la eliminación real. De lo contrario,
esta CLI no hace nada.




## Notificar Eliminación

XuanQi reportará únicamente los objetivos que realmente elimine.




## Epílogo

Eso es todo para esta CLI.

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




# CLI de Creación de Archivo de Datos

La interfaz de línea de comandos (CLI) `create data` sirve para
crear un único archivo de datos `.conf` utilizable en todo el
proyecto. Su comando completo es el siguiente:

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **OBLIGATORIO**
  * La ruta de archivo relativa (desde `$PROJECT_PATH_ROOT`) que
    termina con la extensión de archivo `.conf`.
  * Si no se proporciona la extensión de archivo `.conf`, XuanQi
    la agregará internamente.
  * El nombre del archivo es a su discreción. No afecta a XuanQi.
* `[KEY]`
  * **OBLIGATORIO**
  * La etiqueta `key` de la entrada `key:value`.
  * Utilice guión bajo (`_`) ya que la clave se utilizará como
    variable de entorno.
  * Asegúrese de que el valor sea único. De lo contrario, la misma
    clave en múltiples archivos de configuración puede causar
    consecuencias impredecibles (el último archivo analizado
    sobrescribe a sus predecesores).
* `[VALUE]`
  * **OPCIONAL**
  * La etiqueta `value` de la entrada `key:value`.
  * Cuando se deja vacío, se reemplaza por un texto de ejemplo que
    puede actualizar en el archivo más tarde.




## Restricción de rutas

Por razones de seguridad, XuanQi solo permite crear el archivo de
datos dentro de `$PROJECT_PATH_ROOT`. De lo contrario, generará un
error y no hará nada.




## Epílogo

Eso es todo para esta CLI.

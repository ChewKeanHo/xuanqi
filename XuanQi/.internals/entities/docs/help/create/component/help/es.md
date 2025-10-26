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




# Bienvenido a la sección de ayuda para crear componentes de XuanQi.

XuanQi funciona principalmente mediante el concepto de componentes.
Todo son componentes. Aquí está el comando general para
crear uno:

```
$ [XuanQi] create component [TYPES] [NAME]
```

donde:

* `[TYPES]` es la lista de tipos de componentes dentro del
  componente que intentas crear.
* `[NAME]` la ruta relativa al nombre del componente
  (ej. `pages/root` para la página de renderizado raíz).

El resultado se almacenará en el directorio `$XUANQI_PATH_COMPONENTS`
(derivado de `$XUANQI_DIRECTORY_COMPONENTS`).




## Tipos de componentes

Existen varios tipos de componentes, cada uno con su
documentación específica. Puedes obtener más información
sobre un tipo ejecutando el siguiente comando:

```
[XUANQI] help create component [TYPE]
```

Los valores de `[TYPE]` admitidos son:

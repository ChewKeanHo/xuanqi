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




# ¡Bienvenido!

Esta es una documentación con múltiples secciones. Está diseñada específicamente
utilizando la política "Business Need-To-Know" para reducir el alcance de este
extenso material de lectura.

¡Échale un vistazo a continuación!




## Guía Rápida

Para usuarios experimentados que solo quieren un repaso rápido:

* `[XUANQI] build` - compilar todo el proyecto.
* `[XUANQI] create [TIPO] [VALOR1] [VALOR2] ...`   - crear algo.
* `[XUANQI] purge` - limpiar todo el proyecto.

Algunos directorios importantes que no se deben eliminar:

* `configs`
  * alberga las configuraciones del espacio de trabajo de XuanQi. NO elimines
    nada aquí.
  * Nombre de directorio codificado como `configs/`.
* `components`
  * alberga todos los componentes modulares externos.
* `layouts`
  * alberga todos los diseños de página del espacio de trabajo de XuanQi para
    que el router los renderice.
* `public`
  * alberga todos los archivos de salida de XuanQi en las estructuras definidas
    por `routers`.
* `routers`
  * mapea las estructuras de archivos del proyecto y los scripts de renderizado
    de salida.
* `tests`
  * alberga todos los scripts de prueba del espacio de trabajo de XuanQi para
    autocomprobaciones.




## Acerca de los Idiomas

XuanQi admite los siguientes idiomas a través de la variable de entorno
`$XUANQI_LANGUAGE` establecida usando el archivo de configuración
`configs/xuanqi.conf` o la variable de entorno del sistema `$LANG`.

* (de) Deutsch
* (en) English (predeterminado y reserva)
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

Esto abre la sección de índice de ayuda del comando `build` que cubre todas
sus especificaciones.




## Create

```
$ [XUANQI] help create
```

Esto abre la sección de índice de ayuda del comando `create` que cubre todas
sus especificaciones.




## Purge

```
$ [XUANQI] help purge
```

Esto abre la sección de índice de ayuda del comando `purge` que cubre todas
sus especificaciones.




## Test

```
$ [XUANQI] help test
```

Esto abre la sección de índice de ayuda del comando `test` que cubre todas
sus especificaciones.

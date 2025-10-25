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




# Crear Sección de Ayuda de Componente CSS

Esta es la sección de ayuda para crear un componente CSS ya sea
independientemente o como parte de otro componente más grande. Para
incluir la parte CSS, simplemente ingrese `css` en el valor `[TYPES]`.
Ejemplo:

```
# patrón de comando
$ [XuanQi] create component [TYPES] [NAME]

# solo componente CSS
$ [XuanQi] create component css [NAME]

# con parte CSS dentro de un componente compuesto
$ [XuanQi] create component "...,css,..." [NAME]
```



## Propósito

El componente CSS es principalmente para crear el archivo de salida de
recurso CSS (ej. `page.css`). XuanQi tiene ambas facilidades integradas
en funciones de `Shell` o copia un archivo CSS regular.




## File Structures

CSS component complies to the following default file structure:

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

* el directorio del componente es `CSS`.
* el script shell operador del componente es `CSS/xuanqi.sh`.
* el script shell operador del componente es llamado por el script shell
  importador del componente principal `XuanQi/import.sh`.




## Script Principal `CSS/xuanqi.sh`

Su **objetivo final es escribir el archivo de salida CSS
en `$XUANQI_CONTENT_PATH` a su manera**. Cómo hacerlo depende
completamente de usted.

Múltiples scripts de enrutador pueden invocar el mismo componente
para renderizar archivos (ej. diferentes objetivos de medios como
móvil, impresión, correo electrónico para el mismo contenido). Por
lo tanto, debe diseñar estratégicamente sus variables de entorno
requeridas para que los usuarios las configuren en el script de
enrutador.

Luego, mientras `CSS/xuanqi.sh` se ejecuta, analice estas variables
de entorno y reaccione en consecuencia.

Puede consultar la `XuanQi/.internals/API` del proyecto para las
API disponibles.




## Programáticamente o Copiar

XuanQi proporciona tanto funciones programables como funciones de
copia en bruto para renderizar fácilmente el archivo CSS. La decisión
depende de su equipo.

Si su equipo no está familiarizado con la escritura de scripts shell,
se prefiere este último para que todo el equipo pueda trabajar en el
archivo `.css` suministrado mientras XuanQi simplemente lo copia a
`$XUANQI_CONTENT_PATH`. Esto es ideal para quienes utilizan el
compilador `Sass`.

Las funciones programables de scripts Shell de XuanQi facilitan una
mayor flexibilidad interna sobre el renderizado (piense en macros sobre
escritura CSS). La ventaja es que no hay dependencia y es extremadamente
flexible con su generador de contenido. Esto es adecuado para
desarrolladores CSS experimentados que ven `Sass` como una obstrucción.

En cualquier caso, está en buenas manos. Simplemente pruébelo y adáptese
en consecuencia con el tiempo.




## Epílogo

Eso es todo para la sección de ayuda de creación de componentes CSS.

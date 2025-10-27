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




# Sección de Ayuda para Crear Componente de Datos

Esta es la sección de ayuda para crear un componente de datos
ya sea independientemente o como parte de otro componente más
grande. Para incluir la parte de datos, simplemente ingrese
`data` en el valor `[TYPES]`. Ejemplo:

```
# patrón de comando
$ [XuanQi] create component [TYPES] [NAME]

# solo componente de datos
$ [XuanQi] create component data [NAME]

# con parte de datos dentro de un componente compuesto
$ [XuanQi] create component "...,data,..." [NAME]
```




## Propósito

El componente de datos es principalmente para facilitar al
proyecto y al componente un conjunto de datos específico.
Esto permite cambios de renderizado variable para los mismos
diseños de archivo haciendo que las opciones de salida sean
robustas sin sacrificar la mantenibilidad. XuanQi tiene
facilidades integradas para importar todos los archivos de
configuración (`.conf`) y funciones de script de shell (`.sh`)
de manera seamless.

En general, XuanQi trata el componente de datos como un almacén
de datos **sin base de datos** (`noDB`).




## Estructuras de Archivos

El componente de datos cumple con la siguiente estructura de
archivos predeterminada:

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

* el directorio del componente es `Data`.
* el script de shell del operador del componente está directamente
  dentro de `XuanQi/import.sh`. Es parte de la inicialización del
  componente.




## Objetivo Principal

Su **objetivo principal es abstraer las fuentes de datos variables
y crear la facilidad de datos para su proyecto o sus componentes**.
Cómo hacerlo depende completamente de usted.

En la inicialización de cada componente, cualquier componente puede
analizar el componente de datos desde dentro o a través de otros
componentes. Por lo tanto, **DEBE** mantener el directorio de datos
flexible y analizable en todo momento.

Puede consultar la `XuanQi/.internals/API` del proyecto para las APIs
disponibles.




## Archivo de Configuración o Script de Shell

XuanQi proporciona 2 formas principales para manejar la gestión de
datos:

* archivo de configuración (`.conf`)
* archivo de función de script de shell (`.sh`)

`.conf` es adecuado para la configuración rápida de variables para
que pueda usar inmediatamente su valor para el renderizado de archivos.
Se crea un archivo de ejemplo (`Data/sample.conf`) para mostrar cómo
crear uno. **Un archivo solo debe contener un par clave:valor**.

`.sh` es en realidad un script de shell que contiene una definición
de función para proporcionar los datos mediante condicionamiento lógico.
Esto es más adecuado si su conjunto de datos requiere una o más
condiciones para renderizar una salida de manera diferente (por ejemplo,
las funciones `i18n_` dependen de la bandera `$XUANQI_CONTENT_LANGUAGE`
para devolver una cadena específica del idioma). **TENGA CUIDADO: las
funciones con el mismo nombre se anularán durante la importación**.
Se crea un archivo de ejemplo (`Data/i18n/title.sh`) para su referencia.

La última opción sería leer manualmente archivos `.txt` dentro de un
directorio. XuanQi solo analizará `.conf` y `.sh`, por lo que puede
usarlo de manera segura. Esto se hace organizando un nombre de conjunto
de datos específico como nombre de directorio y dejando el nombre de
archivo estrictamente como nombre de parámetro. La desventaja es que
este método ocupa más tráfico de lectura/escritura de E/S que puede
ralentizar la producción. Sin embargo, *el cumplimiento de los
requisitos siempre está antes de la velocidad*, por lo que aún puede
considerar usarlo cuando sea necesario. Ejemplo de enfoque i18n basado
en archivos de texto:

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

# usando lo anterior en script de shell
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```



### Cómo Elegir

Use siempre `.conf` por defecto y siempre que sea posible. Si hay un
requisito lógico (por ejemplo, condición, etc.), entonces use `.sh`.




## Archivos de Medios

Aunque técnicamente los archivos de medios (por ejemplo, imágenes,
audio, video, etc.) son datos, **evite colocarlos aquí**. Hay un
componente `media` dedicado con funciones de procesamiento dedicadas
para ello. Por favor, use ese en su lugar.

Siempre debe tratar el componente de datos como **sin base de
datos** (`noDB`).




## Epílogo

Eso es todo para la sección de ayuda de crear componente de datos.

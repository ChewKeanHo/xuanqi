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




# Create Data Component Help Section

This is the help section for creating a data component either
independently or as part of another bigger component. In order
to include the data part, simply feed `data` into the `[TYPES]`
value. Example:

```
# command pattern
$ [XuanQi] create component [TYPES] [NAME]

# just data component
$ [XuanQi] create component data [NAME]

# with data part inside a composite component
$ [XuanQi] create component "...,data,..." [NAME]
```




## Purpose

Data component is mainly to facilitate the project and the
component with a specific dataset. This allows variable rendering
changes for the same file layouts making output choices robust
without sacrificing maintainability. XuanQi has built-in facilities
to import all configuration files (`.conf`) and shell script (`.sh)
functions seamlessly.

In general, XuanQi treats data component as a **no database**
(`noDB`) datastore.




## File Structures

Data component complies to the following default file structure:

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

* the component directory is `Data`.
* the component operator shell script is directly inside
  `XuanQi/import.sh`. It is part of the component initialiation.




## Primary Objective

Your **primary objective is to abstract the variable data sources
and create the data facility for your project or your component(s)**.
How to do it is entirely up to you.

At each component's initialization, any component can parse the
data component from within or across other components. Therefore,
you **MUST** keep the data directory flexible and parsable at all
times.

You can refer the project's `XuanQi/.internals/API` for available
APIs.




## Configuration File or Shell Script

XuanQi provides 2 primary ways to deal with data management:

* configuration file (`.conf`)
* shell script function file (`.sh`)

`.conf` is suitable for quick variables setup so that you can
immediately use its value for the file rendering. A sample file
(`Data/sample.conf`) is created for how to create one.
**One file should only hold one key:value pair**.

`.sh` is actually a shell script containing a function definition
for providing the data by logic conditioning. This is most suitable
if your dataset requires one or more conditions to render an output
differently (e.g. `i18n_` functions depends on the
`$XUANQI_CONTENT_LANGUAGE` flag to return a language specific string).
**BE CAREFUL: functions with the same name will get overriden during
import**. A sample file (`Data/i18n/title.sh`) is created for your
reference.

The last option would be manually reading `.txt` files inside a
directory. XuanQi will only parse `.conf` and `.sh` so you're safe
to use it. This is done by organizing a specific dataset name
as directory name and leave the filename strictly as parameter's name.
The downside is this method occupies more IO read/write traffic which
may slowdown the production. However, *requirement fulfillment is always
before speed* so you can still consider using it whenever required.
Example text files based i18n approach:

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

# using the above in shell script
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```



### How to Choose

Always use `.conf` by default and whenever possible. If there is a
logic requirement (e.g. condition, etc), then use `.sh`.




## Media Files

Although technically media files (e.g. pictures, audio, video, etc)
are data, **please AVOID placing them in here**. There is a
dedicated `media` component with dedicated processing functions for
it. Please use that instead.

You should always treat the data component as a **no database**
(`noDB`).




## Epilogue

That's all for create data component help section.

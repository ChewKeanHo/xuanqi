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




# Create Configuration File CLI

`create config` command line interface (CLI) is for creating a
single entry `.conf` data file usable across the project. Its
full command is as follows:

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **COMPULSORY**
  * The relative (from `$XUANQI_PATH_CONFIGS`) filepath ending
    with `.conf` file extension.
  * If the `.conf` file extension is not provided, XuanQi will
    append it internally.
  * Filename is at your discretion. It does not affect XuanQi.
* `[KEY]`
  * **COMPULSORY**
  * The `key` label of the `key:value` entry.
  * Use underscore (`_`) as the key will be used as environment
    variable.
  * Ensure the value is unique. Otherwise, the same key across
    multiple configuration files can cause unpredicatable
    concequences (the last parsed file overrides it predecessors.
* `[VALUE]`
  * **OPTIONAL**
  * The `value` label of the `key:value` entry.
  * When left empty, a sample text is replaced where you can
    update the file later.




## Pathing Restriction

For security reason, XuanQi only allows creating the data file
inside `$PROJECT_PATH_ROOT` only. Otherwise, it will raise an
error and do nothing.

Only for this creation, it is **STRICTLY** restricted to
`$XUANQI_PATH_CONFIGS` directory (which is also inside
`$PROJECT_PATH_ROOT`).




## Known Documentations

Depending on the `[KEY]` matching the supported environment
variable, the generated configuration file can have its own
dedicated documentation. See:

```
$ [XUANQI] help variables
```

for the list of supported variables.




## Epilogue

That's all for this CLI.

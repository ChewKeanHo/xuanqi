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




# Create Data File CLI

`create data` command line interface (CLI) is for creating a single
entry `.conf` data file usable across the project. Its full command
is as follows:

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **COMPULSORY**
  * The relative (from `$PROJECT_PATH_ROOT`) filepath ending with
    `.conf` file extension.
  * If the `.conf` file extension is not provided, XuanQi will
    append it internally.
  * filename is at your discretion. It does not affect XuanQi.
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




## Epilogue

That's all for this CLI.

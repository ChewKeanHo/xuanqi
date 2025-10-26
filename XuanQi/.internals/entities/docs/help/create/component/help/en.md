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




# Welcome to XuanQi's Create Component Help Section.

XuanQi is primarily operating using component concept.
Everything is components. Below is the over command to
create one:

```
$ [XuanQi] create component [TYPES] [NAME]
```

where:

* `[TYPES]` are the list of component types inside the
  component you are trying to create.
* `[NAME]` the relative pathing to the component name
  (e.g. `pages/root` for root rendering page).

The output will be stored inside `$XUANQI_PATH_COMPONENTS`
directory (derived from `$XUANQI_DIRECTORY_COMPONENTS`).




## Component Types

There are a number of component types to look into and each
of them has their specific documentations. You can learn more
about your interested type by executing the following command:

```
[XUANQI] help create component [TYPE]
```

Supported `[TYPE]` are:

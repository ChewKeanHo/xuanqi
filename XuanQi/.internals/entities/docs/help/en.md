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




# Welcome!

This is a multi-sections documentation. It is specifically designed using
"Business Need-To-Know" policy for scoping down this huge reading materials.

Check it out below!




## Quick Guide

For seasoned users who just want a quick refresh:

* `[XUANQI] build` - build the entire project.
* `[XUANQI] create [TYPE] [VALUE1] [VALUE2] ...`   - create something.
* `[XUANQI] purge` - clean up the entire project.

Some important directories not to delete:

* `configs`
  * houses XuanQi's workspace configurations. DO NOT delete stuffs here.
  * Hardcoded to `configs/` directory name.
* `components`
  * houses all external modular components.
* `layouts`
  * houses all XuanQi's workspace's page layouts for router to render.
* `public`
  * houses all XuanQi's output files in the `routers` defined structures.
* `routers`
  * map the project's file structures and output rendering scripts.
* `tests`
  * houses all XuanQi's workspace test scripts for self-testing.




## About Languages

XuanQi supports the following languages via `$XUANQI_LANGUAGE` environment
variable set using `configs/xuanqi.conf` configuration file or system `$LANG`
environment variable.

* (de) Deutsch
* (en) English (default and fallback)
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

This opens `build` command help index section covering all its specifications.




## Create

```
$ [XUANQI] help create
```

This opens `create` command help index section covering all its specifications.




## Purge

```
$ [XUANQI] help purge
```

This opens `purge` command help index section covering all its specifications.




## Test

```
$ [XUANQI] help test
```

This opens `test` command help index section covering all its specifications.

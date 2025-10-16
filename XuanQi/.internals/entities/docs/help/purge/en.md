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




# Purge CLI

`Purge` command line interface (CLI) is for cleaning up the project
workspace entirely.

By its nature, it deletes the following paths:

```
$XUANQI_PATH_LOGS       # all previous build logs
$XUANQI_PATH_PUBLIC     # all outputs
$XUANQI_PATH_TEMPS      # all temporary files from previous build
```

Unlike silent purging, this CLI performs target existence checking
before actual deletion. Otherwise, this CLI does nothing.




## Notify Removal

XuanQi will report out only those targets it actually delete.




## Epilogue

That's all for this CLI.

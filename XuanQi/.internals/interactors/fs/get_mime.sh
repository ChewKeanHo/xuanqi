#!/bin/sh
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




# Specifications:
#       - https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/MIME_types
# Parameters:
#       ____path
#               - REQUIRED
#               - The target path for analysis.
# Outputs:
#       MIME string
#               - network-compatible MIME value.
#               - empty on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty any value.
#               - error on missing '$____path'.
#               - error on missing 'file' command.
#               - error on bad execution.
interactors_fs_get_mime() {
        #____path="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                printf -- ""
                return 1
        fi

        if [ ! -e "$1" ]; then
                printf -- ""
                return 1
        fi

        command -v file 2> /dev/null
        if [ $? -ne 0 ]; then
                printf -- ""
                return 1
        fi


        # execute
        entities_fs_get_mime "$1"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

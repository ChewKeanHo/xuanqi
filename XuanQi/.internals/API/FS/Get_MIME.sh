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
#       - Designed to analyze a given target path and obtain a network
#         compatible MIME type string value (e.g. 'text/plain').
#       - Used by a lot of applications such as but not limited to images,
#         videos, data files, and etc.
#       - The list is huge. Please refer to the following URL to learn more:
#         https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/MIME_types
# Parameters:
#       ____path
#               - REQUIRED
#               - The target path for analysis.
# Outputs:
#       MIME string
#               - Network-compatible MIME value (e.g. 'text/plain').
#               - Empty on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Error on empty any value (code: 1).
#               - Error on missing '$____path' (code: 2).
#               - Error on missing 'file' command (code: 3).
#               - Error on bad execution (code: 4).
XuanQi_FS_Get_MIME() {
        #____path="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                printf -- ""
                return 1
        fi

        if [ ! -e "$1" ]; then
                printf -- ""
                return 2
        fi

        command -v file 2> /dev/null
        if [ $? -ne 0 ]; then
                printf -- ""
                return 3
        fi


        # execute
        interactors_fs_get_mime "$1"
        if [ $? -ne 0 ]; then
                return 4
        fi


        # report status
        return 0
}




# report import status
return 0

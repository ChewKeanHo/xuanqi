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
#       - To export an object (e.g. file, directory, etc) from its
#         '.tmp' temporary file into its actual file.
#       - Will raise error if its '.tmp' source is missing.
# Parameters:
#       ____path
#               - REQUIRED
#               - The source path to export.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Error on empty value (code: 1).
#               - Error on missing '.tmp' source (code: 2).
#               - Error on missing housing directory (code: 3).
#               - Error on bad execution (code: 4).
XuanQi_FS_Export() {
        #____path="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ ! -e "${1%.tmp}.tmp" ]; then
                return 2
        fi

        if [ ! "${1%/*}" = "$1" ] && [ ! -d "${1%/*}" ]; then
                return 3
        fi


        # execute
        interactors_fs_export "$1"
        if [ $? -ne 0 ]; then
                return 4
        fi


        # report status
        return 0
}




# report import status
return 0

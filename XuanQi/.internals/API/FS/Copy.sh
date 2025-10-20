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
#       - To copy an object (e.g. file, directory, etc) from one path
#         into another.
#       - Will raise error if the destination exists by default.
#         Otherwise, set the '____overwrite' to 'true'.
# Parameters:
#       ____destination_path
#               - REQUIRED
#               - The destination path to move as.
#       ____source_path
#               - REQUIRED
#               - The source path to move from.
#       ____overwrite
#               - OPTIONAL
#               - The flag to overwrite existing ____destination_path.
#               - Only unset/empty ("") or "true" in lowercase. Anything
#                 else is invalid.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Error on empty any value (code: 1).
#               - Error on existing target (code: 2).
#               - Error on missing source (code: 3).
#               - Error on bad execution (code: 4).
XuanQi_FS_Copy() {
        #____destination_path="$1"
        #____source_path="$2"
        #____overwrite="$3"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ "$2" = "" ]; then
                return 1
        fi

        if [ -e "$1" ] && [ ! "$3" = "true" ]; then
                return 2
        fi

        if [ ! -e "$2" ]; then
                return 3
        fi


        # execute
        interactors_fs_copy "$1" "$2"
        if [ $? -ne 0 ]; then
                return 4
        fi


        # report status
        return 0
}




# report import status
return 0

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
#       - To delete an object (e.g. file, directory, etc).
#       - Sync housing directory upon removal for atomic
#         expectation.
# Parameters:
#       ____path
#               - REQUIRED
#               - The path to delete.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Error on empty value (code: 1).
#               - Error on bad execution (code: 2).
XuanQi_FS_Delete() {
        #____path="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ ! -e "$1" ]; then
                return 0
        fi


        # execute
        interactors_fs_delete "$1"
        if [ $? -ne 0 ]; then
                return 2
        fi


        # report status
        return 0
}




# report import status
return 0

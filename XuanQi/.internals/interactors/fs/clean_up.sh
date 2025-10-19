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




# Parameters:
#       ____path
#               - REQUIRED
#               - The destination path to clean up.
#               - Create housing directory ready for writing.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty any value.
#               - error on execution failure.
interactors_clean_up() {
        #____path="$1"


        # execute
        if [ ! "${1%/*}" = "$1" ]; then
                interactors_fs_create_directory "${1%/*}"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        fi

        interactors_fs_delete "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

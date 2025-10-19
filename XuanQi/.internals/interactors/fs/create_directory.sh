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
#               - The destination directory path to create.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty value.
#               - error on existing target but is not a directory.
#               - error on create failure.
interactors_fs_create_directory() {
        #____path="$1"


        # execute
        interactors_fs_create_directory "$1"
        if [ $? -ne 0 ]; then
                 return 1
        fi


        # report status
        return 0
}




# report import status
return 0

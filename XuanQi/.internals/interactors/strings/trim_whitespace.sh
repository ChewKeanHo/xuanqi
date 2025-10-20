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
#       ____content
#               - OPTIONAL
#               - The string for trimming.
# Outputs:
#       String
#               - The trimmed string.
#               - Empty when given empty.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - always 0.
interactors_strings_trim_whitespace() {
        #____content="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                printf -- ""
                return 0
        fi


        # execute
        entities_strings_trim_whitespace "$1"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

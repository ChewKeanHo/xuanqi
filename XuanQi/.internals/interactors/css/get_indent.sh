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
#       ____input
#               - OPTIONAL
#               - number type.
#               - 0 returns empty indent.
#               - empty means 0 indent.
#               - invalid (e.g. not a number) means 0 indent.
# Outputs:
#       String
#               - the rendered total indent count in string.
#               - empty on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on invalid input (not a round number or <0).
#               - error on bad execution.
interactors_css_get_indent() {
        #____count="$1"


        # validate inputs
        case "$1" in
        "")
                ;;
        *[!0-9]*)
                ;;
        *)
                ;;
        esac


        # execute
        views_css_get_indent "$1"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

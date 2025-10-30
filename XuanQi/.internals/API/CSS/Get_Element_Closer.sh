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
#       - Designed to create a closer (e.g. '}') reliably.
#       - Programmable nature enables continuous improvement.
#       - Rendered into memory so ensure the total payload cannot be too
#         big until run out of memory.
#       - Learn more at: https://www.w3.org/Style/CSS/specs.en.html
# Parameters:
#       ____indent_level
#               - OPTIONAL
#               - Indentation level in round numerical number.
#               - '0' or empty means no default indentation.
# Outputs:
#       String
#               - The rendered output string. Example: "}".
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Error on invalid '$____indent_level' (e.g. not a number).
#               - Error on bad execution.
XuanQi_CSS_Get_Element_Closer() {
        #____indent_level="$1"


        # validate inputs
        case "$1" in
        "")
                ;;
        *[!0-9]*)
                printf -- ""
                return 1
                ;;
        *)
                if [ $1 -lt 0 ]; then
                        printf -- ""
                        return 1
                fi
                ;;
        esac


        # execute
        interactors_css_get_element_closer "${1:-0}"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

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
#       - Designed to create an opener (e.g. 'media ... {' or 'body {')
#         reliably.
#       - Programmable nature enables continuous improvement.
#       - Rendered into memory so ensure the total payload cannot be too
#         big until run out of memory.
#       - Learn more at: https://www.w3.org/Style/CSS/specs.en.html
# Parameters:
#       ____selectors
#               - COMPULSORY
#               - List of selectors.
#               - Multi-line values where each line is a new entry.
#               - Each entry does not need to have tailing comma (,).
#       ____indent_level
#               - OPTIONAL
#               - Indentation level in round numerical number.
#               - '0' or empty means no default indentation.
# Outputs:
#       String
#               - The rendered output string. Example:
#                 "\
#                 [Selector1],
#                 [Selector2],
#                 ...
#                 [SelectorN] {
#                 "
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Error on empty '$____selectors'.
#               - Error on invalid '$____indent' (e.g. not a number).
#               - Error on bad execution.
XuanQi_CSS_Get_Element_Opener() {
        #____selectors="$1"
        #____indent_level="$2"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        case "$2" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                if [ $2 -lt 0 ]; then
                        return 1
                fi
                ;;
        esac


        # execute
        interactors_css_get_element_opener "$1" "$2"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

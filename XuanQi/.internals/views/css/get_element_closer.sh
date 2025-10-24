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
#       - https://www.w3.org/Style/CSS/specs.en.html
# Parameters:
#       ____indent_level
#               - OPTIONAL
#               - indentation level in round numerical number.
#               - '0' or empty means no default indentation.
# Outputs:
#       String
#               - the rendered output string. Example: "}".
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on invalid '$____indent_level' (e.g. not a number).
#               - error on bad execution.
views_css_get_element_closer() {
        #____indent_level="$1"


        # validate inputs
        case "$1" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                if [ $1 -lt 0 ]; then
                        return 1
                fi
                ;;
        esac


        # execute
        printf -- "%s" "\
$(views_css_get_indent "${1:-0}")}
"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

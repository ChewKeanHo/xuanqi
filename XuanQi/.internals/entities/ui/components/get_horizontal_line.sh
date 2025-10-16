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
#       Offset    - Number type.
#                 - OPTIONAL
#                 - Remove excessive length caused by indicator characters
#                   (e.g. 3 for 'I: ' prefix).
#       Character - String type.
#                 - OPTIONAL
#                 - To change the character into something else. Default
#                   is EM line ('—').
# Returns:
#       String
#               - '[NUMBER]' on x-axis (column sizes).
#               - default to 80 if no determiner is found.
#       Return Code
#               - '0' means ok; error otherwise.
#               - error when given offset is not a number.
#               - error on bad execution.
entities_ui_components_get_horizontal_line() {
        #____offset="$1"
        #____character="$2"


        # validate input
        case "$1" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                ;;
        esac


        # execute
        ____number="$(entities_ui_get_terminal_window_x_axis)"
        if [ ! "$1" = "" ]; then
                ____number=$(( $____number - $1 ))
        fi

        if [ $____number -le 0 ]; then
                unset ____number
                printf -- ""
                return 0
        fi

        ____output=""
        while [ $____number -gt 0 ]; do
                ____output="${____output}${2:-"—"}"
                ____number=$(( $____number - 1 ))
        done
        unset ____number

        printf -- "%s" "$____output"
        if [ $? -ne 0 ]; then
                unset ____output
                return 1
        fi
        unset ____output


        # report status
        return 0
}




# report import status
return 0

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
#       ____path_dest
#               - COMPULSORY
#               - the destination file to write into.
#       ____condition
#               - COMPULSORY
#               - the switch condition's content.
#               - When supplied with '*', it renders as '*' as default case.
#               - one-line case only condition. For multi conditions,
#                 use '|' to separate each.
#       ____indent
#               - OPTIONAL
#               - the base indent level in round number.
#               - when empty, the indent level will set to '0' (no indent).
#       ____entry_index
#               - OPTIONAL
#               - condition's positional index in round number.
#               - when set to '0' (first entry), the condition will not
#                 have ';;' prepend to the condition statement.
#               - otherwise, each change will have a prepend since it is a
#                 continuation of previous cases.
# Outputs:
#       Write to '$____path_dest' File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path_dest'.
#               - error on empty '$____condition'.
#               - error on invalid '$____indent' (e.g. not a number).
#               - error on bad execution.
interactors_shell_write_switch_change_condition() {
        #____path_dest="$1"
        #____condition="$2"
        #____indent="$3"
        #____entry_index="$4"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ ! "${1%/*}" = "$1" ]; then
                if [ -d "${1%/*}" ]; then
                        : # accepted
                elif [ -L "${1%/*}" ] &&
                [ -d "$(readlink --canonicalize "$1")" ]; then
                        : # accepted
                else
                        return 1
                fi
        fi

        if [ "$2" = "" ]; then
                return 1
        fi

        case "$3" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                ;;
        esac


        # execute
        views_shell_write_switch_change_condition "$1" "$2" "$3" "$4"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

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
entities_strings_trim_whitespace() {
        #____content="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                printf -- ""
                return 0
        fi


        # execute
        ____whitespace="$(printf -- " \t\n\r\v")"
        ____output="$1"
        ____done_left=false
        ____done_right=false
        while true; do
                if [ "$____output" = "" ]; then
                        break
                elif [ "$____done_left" = "true" ] &&
                [ "$____done_right" = "true" ]; then
                        break
                fi

                if [ ! "$____done_left" = "true" ]; then
                        case "${____output%%"${____output#?}"}" in
                        ["$____whitespace"])
                                ____output="${____output#?}"
                                ;;
                        *)
                                ____done_left=true
                                ;;
                        esac
                fi

                if [ ! "$____done_right" = "true" ]; then
                        case "${____output##"${____output%?}"}" in
                        ["$____whitespace"])
                                ____output="${____output%?}"
                                ;;
                        *)
                                ____done_right=true
                                ;;
                        esac
                fi
        done
        unset ____done_left ____done_right ____whitespace


        # output result
        printf -- "%s" "$____output"
        unset ____output


        # report status
        return 0
}




# report import status
return 0

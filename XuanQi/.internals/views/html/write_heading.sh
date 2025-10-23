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
#               - The destination file to write into.
#       ____header_level
#               - COMPULSORY
#               - The header level.
#               - Only accepts '1-6'. Anything else is error.
#       ____indent_level
#               - OPTIONAL
#               - indentation level in round numerical number.
#               - '0' or empty means no default indentation.
#       ____content
#               - OPTIONAL
#               - Content inside the header.
#               - Multi-line single entry.
#               - Render as it is.
#       ____properties
#               - OPTIONAL
#               - the "key='value'" properties (e.g. id='...').
#               - Multi-line values where each line is an entry.
#               - Each entry **MUST** comply to the following
#                 format:
#                                '[KEY]: [VALUE]'
#                 where:
#                       - ': ' is the separating delimiter.
#                       - [KEY] is the name of the property
#                               (e.g. 'id').
#                       - [VALUE] is the value of the property
#                               (e.g. 'my-target-1').
#               - You are responsible for the key:value's data
#                 validity as this function only renders the
#                 inputs.
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path_dest'.
#               - error on empty/invalid housing directory.
#               - error on empty/invalid heading number.
#               - error on invalid '$____indent_level' (e.g. not a number).
#               - error on bad execution.
views_html_write_heading() {
        #____path_dest="$1"
        #____header_level="$2"
        #____indent_level="$3"
        #____content="$4"
        #____properties="$5"


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

        case "$2" in
        1|2|3|4|5|6)
                ;;
        *)
                return 1
        esac

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
        printf -- "%s" "\
$(views_html_get_element_opener "h${2:-1}" "$3" "$5")
$(views_html_get_indent $(( ${3:-0} + 1 )))${4}
$(views_html_get_element_closer "h${2:-1}" "$3")
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

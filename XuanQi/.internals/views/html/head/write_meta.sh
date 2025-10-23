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
#       ____name
#               - COMPULSORY
#               - the name of the meta tag.
#       ____value
#               - COMPULSORY
#               - the value of the meta tag.
#       ____properties
#               - OPTIONAL
#               - the "key='value'" properties (e.g. id='...').
#               - multi-line values where each line is an entry.
#               - the "name='...'" and "content='...'" are already
#                 rendered automatically. Please exclude them.
#               - each entry **MUST** comply to the following format:
#                                 '[KEY]: [VALUE]'
#                 where:
#                       - ': ' is the separating delimiter.
#                       - [KEY] is the name of the property
#                               (e.g. 'id').
#                       - [VALUE] is the value of the property
#                               (e.g. 'my-target-1').
#               - you are responsible for the key:value's data
#                 validity as this function only renders the
#                 inputs.
#       ____indent_level
#               - OPTIONAL
#               - indentation level in round numerical number.
#               - empty means default '1' indentation for html tag
#                 and '0' indentation for webscript content.
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path_dest'.
#               - error on empty '$____name'.
#               - error on empty '$____value'.
#               - error on invalid '$____indent_level' (e.g. not a number).
#               - error on bad execution.
views_html_head_write_meta() {
        #____path_dest="$1"
        #____name="$2"
        #____value="$3"
        #____properties="$4"
        #____indent_level="$5"


        # validate input
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

        if [ "$3" = "" ]; then
                return 1
        fi

        case "$5" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                if [ "$5" -lt 0 ]; then
                        return 1
                fi
        esac


        # execute
        printf -- "%s" "\
$(\
        views_html_get_element_opener "meta" "${5:-1}" "\
name: ${2}
content: ${3}
${4}
")
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

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
#       ____execution_type
#               - COMPULSORY
#               - the '<script>' execution type. Can be:
#                       * 'defer'
#                       * 'async'
#                       * 'sync'
#               - anything else are invalid including their
#                 titlecase and uppercase counterparts.
#       ____source_url
#               - OPTIONAL
#               - for external url sourcing.
#               - when left empty, the opener will leave it
#                 open for subsequent webscript inlining
#                 (default).
#               - when set, the opener will perform src='...'
#                 with this value and close the <script> opener
#                 automatically.
#       ____indent_level
#               - OPTIONAL
#               - indentation level in round numerical number.
#               - '0' or empty means no default indentation.
#       ____properties
#               - OPTIONAL
#               - the "key='value'" properties (e.g. id='...').
#               - Multi-line values where each line is an entry.
#               - "src='...',"async", and "defer" are all already
#                 rendered automatically. Please exclude them.
#               - Each entry **MUST** comply to the following
#                 format:
#                               '[KEY]: [VALUE]'
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
#               - error on empty/invalid '$____execution_type'.
#               - error on invalid '$____indent_level' (e.g. not a number).
#               - error on bad execution.
views_html_write_webscript_opener() {
        #____path_dest="$1"
        #____execution_type="$2"
        #____source_url="$3"
        #____indent_level="$4"
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

        case "$4" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                if [ "$4" -lt 0 ]; then
                        return 1
                fi
        esac


        # execute
        ## process url sourcing type if available
        ____url=""
        if [ ! "$3" = "" ]; then
                ____url="src: ${3}"
        fi

        ## render opener without its newline
        case "$2" in
        defer)
                printf -- "%s" "\
$(\
        views_html_get_element_opener "script" "$4" "\
defer
${____url}
${5}
"
)" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        unset ____url
                        return 1
                fi
                ;;
        async)
                printf -- "%s" "\
$(\
        views_html_get_element_opener "script" "$4" "\
async
${____url}
${5}
"
)" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        unset ____url
                        return 1
                fi
                ;;
        sync)
                printf -- "%s" "\
$(\
        views_html_get_element_opener "script" "$4" "\
${____url}
${5}
"
)" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        unset ____url
                        return 1
                fi
                ;;
        *)
                unset ____url
                return 1
                ;;
        esac
        unset ____url

        ## print auto-closer for url sourcing. Otherwise, newline
        ## for default inline mode
        if [ ! "$____url" = "" ]; then
                printf -- "%s" "\
$(views_html_get_element_closer "script" "$4")
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        else
                printf -- "%s" "\
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        fi


        # report status
        return 0
}




# report import status
return 0

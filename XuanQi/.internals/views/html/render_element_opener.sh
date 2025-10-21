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
#       - https://html.spec.whatwg.org/multipage/syntax.html
# Parameters:
#       ____name
#               - COMPULSORY
#               - name of the node (e.g. 'h1').
#       ____indent_level
#               - OPTIONAL
#               - indentation level in round numerical number.
#               - '0' or empty means no default indentation.
#       ____properties
#               - OPTIONAL
#               - the "key='value'" properties (e.g. id='...').
#               - Multi-line values where each line is an entry.
#               - Each entry **MUST** comply to the following
#                 format:
#                             '[KEY]: [VALUE]'
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
#       String
#               - the rendered output string. Example:
#                       - "<h1 id='...' ...>"
#                       - "<input type='...' id='...' />"
#               - auto-closing for void elements (e.g. 'br').
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on '$___name' being a void element.
#               - error on invalid '$___indent_level'
#                 (e.g. not a number).
#               - error on bad execution.
views_html_render_element_opener() {
        #____name="$1"
        #____indent_level="$2"
        #____properties="$3"


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
        ____output="\
$(views_html_get_indent "$2")<${1}
"

        if [ ! "$3" = "" ]; then
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ "${____line%%": "*}" = "$____line" ] ||
                        [ "${____line##*": "}" = "" ]; then
                                ____output="\
${____output}
$(views_html_get_indent $(( ${2:-0} + 1 )))${____line%%": "*}'
"

                        else
                                ____output="\
${____output}
$(views_html_get_indent $(( ${2:-0} + 1 )))${____line%%": "*}='${____line#*": "}'
"
                        fi
                done<<EOF
${3}
EOF
                IFS="$____old_IFS"
                unset ____line ____old_IFS
        fi

        case "$1" in
        area|\
        base|\
        br|\
        col|\
        embed|\
        hr|\
        img|\
        input|\
        link|\
        meta|\
        source|\
        track|\
        wbr)
                ____output="\
$(views_html_get_indent "$2")/>
"
                ;;
        *)
                ____output="\
$(views_html_get_indent "$2")>
"
                ;;
        esac


        # all good - write now
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

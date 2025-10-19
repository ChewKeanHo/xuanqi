#!/bin/sh
# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
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
#       ____name
#               - COMPULSORY
#               - Function name.
#       ____params
#               - COMPULSORY
#               - List of parameters.
#               - Multiline values = each line is a parameter. Line position
#                 defines its parameter's positiong (e.g. '1' for '$1').
#               - No need to supply parameter index number. The renderer
#                 counts internally.
#       ____return_type
#               - OPTIONAL
#               - List of return values.
#               - Multiline values = each line is an entry. Line position
#                 matters.
#               - Only documentations.
#               - No need to pre-supply '#' comment syntax.
#               - Will re-process 1 space tab as '#       [LINE]'.
#       ____exposure
#               - OPTIONAL.
#               - The function's public or private exposure.
#               - Unused since Shell is always public.
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on invalid '$____path_dest' (e.g. 'empty').
#               - error on bad execution.
views_shell_write_function_opener() {
        #____path_dest="$1"
        #____name="$2"
        #____params="$3"
        #____return_type="$4"
        #____exposure="$5"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ "$2" = "" ]; then
                return 1
        fi

        if [ "$3" = "" ]; then
                return 1
        fi


        # execute
        ## Shell does not have any public/private categorization.
        ## Hence, it's better to leave the name as it is.


        # generate actual function parameters
        ____params=""
        if [ ! "$3" = "" ]; then
                ____index=1
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        ____params="${____params}\
        ${____line#"$"}=\"\$${____index}\"
"
                        ____index=$(( $____index + 1 ))
                done<<EOF
${3}
EOF
                IFS="$____old_IFS"
                unset ____index ____line ____old_IFS
        fi


        # generate return lists
        ____returns=""
        if [ ! "$4" = "" ]; then
                ____returns="\
# Outputs:
"
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ "${____line%%"${____line#?}"}" = "#" ]; then
                                ____line="${____line#"#"}"
                                ____line="${____line#"       "}"
                        fi

                        if [ ! "$____line" = "" ]; then
                                ____line="       ${____line}"
                        fi

                        ____returns="${____returns}\
#${____line}
"
                done<<EOF
${4}
EOF
                IFS="$____old_IFS"
                unset ____index ____line ____old_IFS
        fi
        ____returns="${____returns}\
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
"


        # all good - write now
        printf -- "%s" "\
${____returns}\
${2}() {
${____params}\
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                unset ____returns ____params
                return 1
        fi
        unset ____returns ____params


        # report status
        return 0
}




# report import status
return 0

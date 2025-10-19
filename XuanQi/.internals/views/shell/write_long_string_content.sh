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
#       ____contents
#               - OPTIONAL
#               - The string contents to be written as string type.
#               - Multi-line value is available.
#               - Do nothing if left empty.
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on invalid '$____path_dest' (e.g. 'empty').
#               - error on bad execution.
views_shell_write_long_string_content() {
        #____path_dest="$1"
        #____content="$2"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ "$2" = "" ]; then
                return 0
        fi


        # execute
        ____old_IFS="$IFS"
        while IFS= read -r ____line || [ -n "$____line" ]; do
                ____output=""
                while [ -n "$____line" ]; do
                        ____char="${____line%"${____line#?}"}"
                        ____line="${____line#?}"

                        ## escape functional characters
                        case "$____char" in
                        "\\")
                                ____output="${____output}\\\\"
                                ;;
                        "\"")
                                ____output="${____output}\\\""
                                ;;
                        *)
                                ____output="${____output}${____char}"
                                ;;
                        esac
                done

                ## all good - write now
                printf -- "%s" "\
${____output}
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____char ____output ____line  ____old_IFS
                        return 1
                fi
        done<<EOF
${2}
EOF
        IFS="$____old_IFS"
        unset ____char ____output ____line  ____old_IFS


        # report status
        return 0
}




# report import status
return 0

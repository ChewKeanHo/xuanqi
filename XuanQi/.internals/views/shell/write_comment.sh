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
#               - The content to be rendered as comments.
#               - Multi-line supported.
#       ____indent
#               - OPTIONAL
#               - The indent level to apply before the comment.
#               - 0, empty, or invalid (e.g. not a round number) will set
#                 indent level as 0 (no indentation).
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on invalid '$____path_dest' (e.g. 'empty').
#               - error on bad execution.
views_shell_write_comment() {
        #____path_dest="$1"
        #____contents="$2"
        #____indent="$3"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ "$2" = "" ]; then
                printf -- ""
                return 0
        fi


        # execute
        case "$3" in
        ""|*[!0-9]*)
                ____indent=0
                ;;
        *)
                ____indent="$3"
                ;;
        esac

        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                printf -- "%s" "\
$(views_shell_get_indent "$____indent")# ${____line}
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____line ____old_IFS ____indent
                        return 1
                fi
        done<<EOF
${2}
EOF
        IFS="$____old_IFS"
        unset ____line ____old_IFS ____indent


        # report status
        return 0
}




# report import status
return 0

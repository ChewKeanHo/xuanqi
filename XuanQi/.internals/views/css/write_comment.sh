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
#       ____contents
#               - OPTIONAL
#               - the content to be rendered as comments.
#               - multi-line single entry is supported.
#       ____indent
#               - OPTIONAL
#               - the indent level to apply before the comment.
#               - 0, empty, or invalid (e.g. not a round number) will
#                 set indent level as 0 (no indentation).
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on invalid '$____path_dest' (e.g. 'empty').
#               - error on invalid '$____indent' (e.g. not a number).
#               - error on bad execution.
views_css_write_comment() {
        #____path_dest="$1"
        #____contents="$2"
        #____indent="$3"


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
        if [ "$2" = "" ]; then
                printf -- ""
                return 0
        fi

        printf -- "%s" "\
$(views_css_get_indent "${3:-0}")/*
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                if [ ! "$____line" = "" ]; then
                        ____line=" ${____line}"
                fi

                printf -- "%s" "\
$(views_css_get_indent "${3:-0}")*${____line}
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____line ____old_IFS
                        return 1
                fi
        done<<EOF
${2}
EOF
        IFS="$____old_IFS"
        unset ____line ____old_IFS

        printf -- "%s" "\
$(views_css_get_indent "${3:-0}")*/
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

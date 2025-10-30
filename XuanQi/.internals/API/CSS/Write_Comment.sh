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
#       - To reliably render a given string block as CSS comment.
#       - Multi-line single entry value.
#       - Auto-render open and close syntaxes.
# Parameters:
#       ____path_dest
#               - COMPULSORY
#               - The destination file to write into.
#               - Resolve symlink.
#       ____contents
#               - OPTIONAL
#               - The content to be rendered as comments.
#               - Multi-line single entry is supported.
#               - Does nothing when left empty.
#       ____indent
#               - OPTIONAL
#               - The indent level to apply before the comment.
#               - 0, empty, or invalid (e.g. not a round number) will set
#                 indent level as 0 (no indentation).
# Outputs:
#       Write to '$____path_dest' File
#               - The rendered output written into file.
#               - No action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Error on invalid '$____path_dest' (e.g. 'empty').
#               - Error on invalid '$____indent' (e.g. not a number).
#               - Error on bad execution.
XuanQi_CSS_Write_Comment() {
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

        if [ "$2" = "" ]; then
                return 1
        fi


        # execute
        interactors_css_write_comment "$1" "$2" "$3"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

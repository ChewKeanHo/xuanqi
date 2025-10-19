#!/bin/sh
# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
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
#       ____indent
#               - OPTIONAL
#               - The base indent level in round number.
#               - When empty, the indent level will set to '0' (no indent).
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
views_shell_write_if_else_closer() {
        #____path_dest="$1"
        #____indent="$2"


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


        # execute
        case "$2" in
        "")
                ____indent=0
                ;;
        *[!0-9]*)
                unset ____indent
                return 1
                ;;
        *)
                ____indent="$2"
                ;;
        esac

        printf -- "%s" "\
$(views_shell_get_indent "$____indent")fi
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                unset ____indent
                return 1
        fi
        unset ____indent


        # report status
        return 0
}




# report import status
return 0

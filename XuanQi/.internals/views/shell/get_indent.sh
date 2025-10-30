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
#       ____input
#               - OPTIONAL
#               - number type.
#               - empty means 0.
#               - error means 0.
#               - 0 returns empty indent.
# Outputs:
#       String
#               - the rendered indent spacing in string.
#               - empty on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on invalid input (e.g. not a number).
#               - error on bad execution.
views_shell_get_indent() {
        #____count="$1"


        # execute
        case "$1" in
        ""|*[!0-9]*)
                printf -- ""
                return 1
                ;;
        *)
                ____indent=""
                ____count="$1"
                while [ $____count -gt 0 ]; do
                        ____indent="${____indent}        "
                        ____count=$(( $____count - 1 ))
                done
                unset ____count

                printf -- "%s" "$____indent"
                if [ $? -ne 0 ]; then
                        unset ____indent
                        return 1
                fi
                unset ____indent
                ;;
        esac


        # report status
        return 0
}




# report import status
return 0

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
#       ____source_path
#               - REQUIRED
#               - The source filepath to remove.
#               - Sync housing directory upon remove for atomic
#                 expectation.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty any value.
#               - error on removing item outside of user home
#                 directory or itself (e.g. '/' or '~').
#               - error on missing target's housing directory.
entities_fs_remove() {
        #____source_path="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ ! -e "$1" ]; then
                return 0
        fi

        if [ "${1%/}" = "${HOME%/}" ] ||
        [ "${1%/}" = "~" ] ||
        [ "${1#"${HOME}"}" = "$1" ]; then
                return 1
        fi


        # execute
        rm -rf "$1" 2> /dev/null
        if [ ! "${1%/*}" = "$1" ]; then
                sync "${1%/*}" 2> /dev/null
        else
                sync "$PWD" 2> /dev/null
        fi


        # report status
        return 0
}




# report import status
return 0

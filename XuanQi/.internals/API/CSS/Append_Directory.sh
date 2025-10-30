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
#       - Designed to append all CSS scripts in a directory into
#         a single CSS output file.
#       - Recursive scanning by directory depth first.
#       - Will only read '.css' file extension.
#       - Will not read '_test.css' suffix filename.
#       - Will not read '~' and '.' prefix filename.
# Parameters:
#       ____path_dest
#               - COMPULSORY
#               - The destination file to write into.
#               - Resolve symlink.
#       ____path_target
#               - COMPULSORY
#               - The target CSS directory to parse from.
#               - Resolve symlink.
# Outputs:
#       Write to '$____path_dest' File
#               - The rendered output written into file.
#               - No action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Error on empty/invalid '$____path_dest'.
#               - Error on empty/invalid '$____path_target'.
#               - Error on bad execution.
XuanQi_CSS_Append_Directory() {
        #____path_dest="$1"
        #____path_target="$2"


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

        if [ "$2" = "" ]; then
                return 1
        fi

        if [ -d "$2" ]; then
                : # accepted
        elif [ -L "$2" ] && [ -d "$(readlink --canonicalize "$2")" ]; then
                : # accepted
        else
                return 1
        fi


        # execute
        interactors_css_append_directory "$1" "$2"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

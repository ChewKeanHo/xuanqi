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
#       - To import all configuration files and library scripts
#         recursively from a given directory path.
#       - Configuration and libraries has overriding consequences.
#         Ensure all configurations and libraries **DO NOT** have
#         conflicting names.
#       - Configuration files **MUST** end with '.conf' and
#         library script **MUST** end with '.sh'. Anything else
#         will be ignored.
#       - Files start with '.' or '~' will be ignored.
#       - Files ends with '_test' (as in '_test.conf' and '_test.sh')
#         will be ignored.
# Parameters:
#       ____path
#               - REQUIRED
#               - The source path to import.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Error on empty '$____path' (code: 1).
#               - Error on missing '$____path' (code: 2).
#               - Error on invalid '$____path' (code: 3).
#               - Error on bad execution (code: 4).
XuanQi_Components_Import() {
        #____path="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ ! -e "$1" ]; then
                return 2
        fi

        if [ -d "$1" ]; then
                : # accepted
        elif [ -L "$1" ] && [ -d "$(readlink --canonicalize "$1")" ]; then
                : # accepted
        else
                return 3
        fi


        # execute
        interactors_data_read_directory "$1"
        if [ $? -ne 0 ]; then
                return 4
        fi

        interactors_libraries_read_directory "$1"
        if [ $? -ne 0 ]; then
                return 4
        fi


        # report status
        return 0
}




# report import status
return 0

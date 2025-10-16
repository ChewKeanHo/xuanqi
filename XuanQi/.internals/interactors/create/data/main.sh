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
#       ____filepath
#               - COMPULSORY
#               - The text file to write into.
#       ____key
#               - COMPULSORY
#               - The key of the key:value entry.
#               - Must be an environment variable name.
#       ____value
#               - OPTIONAL
#               - The value of the key:value entry.
#               - Can be empty.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____filepath'.
#               - error on existing file.
#               - error on empty '____key'.
#               - error on bad execution.
interactors_create_data() {
        #____filepath="$1"
        #____key="$2"
        #____value="$3"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ -e "$1" ]; then
                return 2
        fi

        if [ "$2" = "" ]; then
                return 3
        fi


        # execute
        # create housing directory
        if [ ! "${1%/*}" = "$1" ]; then
                mkdir -p "${1%/*}"
                if [ $? -ne 0 ]; then
                        return 4
                fi
        fi


        # create the data file
        interactors_data_write_file \
                "$1" \
                "$2" \
                "$3" \
                "$(interactors_print_license_notice)" \
                "$(interactors_print_configs_default)"
        if [ $? -ne 0 ]; then
                return 5
        fi


        # report status
        return 0
}




# report import status
return 0

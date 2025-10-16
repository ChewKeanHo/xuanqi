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
#       ____type
#               - OPTIONAL
#               - The configuration type.
#               - Determines the documentation contents.
#               - If unrecognized, the default will be used.
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
interactors_create_configs() {
        #____filepath="$1"
        #____type="$2"
        #____key="$3"
        #____value="$4"


        # execute
        case "$2" in
        *)
                interactors_data_write_file \
                        "$1" \
                        "$3" \
                        "$4" \
                        "$(interactors_print_license_notice)" \
                        "$(interactors_print_configs_default)"
                if [ $? -ne 0 ]; then
                        return 1
                fi
                ;;
        esac


        # report status
        return 0
}




# report import status
return 0

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
#       - To validate against a given string is actually an usable URL.
#       - Validates absolute URL, root relative URL (with slash '/' prefix),
#         and volatile relative URL (without slash '/' prefix).
#       - Will output 'true' or 'false' so one can use it directly with
#         if condition. Example:
#               if [ "$(XuanQi_Networks_Is_URL "$1")" = "false" ]; then
#                       ...
#               fi
#       - Bad execution can be checked via return code.
# Parameters:
#       ____url
#               - COMPULSORY.
#               - The url string to test.
# Outputs:
#       Boolean String
#               - Either 'false' or 'true'.
#               - 'false' on empty case.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Error on empty '$____url' (code: 1).
#               - Error on bad execution (code: 2).
XuanQi_Networks_Is_URL() {
        #____url="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                printf -- "false"
                return 1
        fi


        # execute
        if [ "$(interactors_networks_is_url "$1")" = "true" ]; then
                printf -- "true"
                return 0
        fi


        # report status
        printf -- "false"
        return 0
}




# report import status
return 0

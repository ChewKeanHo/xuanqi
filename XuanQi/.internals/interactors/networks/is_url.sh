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
#       ____url
#               - COMPULSORY
#               - the url to check against.
# Outputs:
#       Boolean String
#               - either 'true' or 'false'.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - empty '$____url'.
#               - error on bad execution.
interactors_networks_is_url() {
        #____url="$1"


        # validate input
        if [ "$1" = "" ]; then
                printf -- "false"
                return 1
        fi

        if [ ! "$(entities_networks_parse_url "$1")" = "" ]; then
                printf -- "true"
                return 0
        fi


        # report status
        printf -- "false"
        return 0
}




# report import status
return 0

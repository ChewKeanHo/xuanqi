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
#       ____current_url
#               - COMPULSORY
#               - the current page absolute url.
#       ____target_path
#               - COMPULSORY
#               - the pathing to join.
#               - can accept:
#                       - absolute url
#                               - return as it is.
#                       - relative url with starting slash ('/')
#                               - join pathing with '$XUANQI_URL_BASE'
#                       - relative url without starting slash ('/')
#                               - join pathing with '$____current_url'
# Outputs:
#       String
#               - the joined url.
#               - empty on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - empty/invalid '$____current_url'.
#               - empty/invalid '$____target_path'.
#               - empty/invalid '$XUANQI_URL_BASE' (internal error).
#               - error on bad execution.
interactors_networks_join_url() {
        #____current_url="$1"
        #____target_path="$2"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ "$2" = "" ]; then
                printf -- ""
                return 1
        fi

        if [ "$XUANQI_URL_BASE" = "" ]; then
                printf -- ""
                return 1
        fi


        # execute
        entities_networks_join_url "$XUANQI_URL_BASE" "$1" "$2"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

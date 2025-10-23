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
#       ____base_url
#               - COMPULSORY
#               - the site url a.k.a base url.
#       ____current_url
#               - COMPULSORY
#               - the current page url.
#       ____target_path
#               - COMPULSORY
#               - the pathing to join.
#               - can accept:
#                       - absolute url
#                               - return as it is.
#                       - relative url with starting slash ('/')
#                               - join pathing with '$____base_url'
#                       - relative url without starting slash ('/')
#                               - join pathing with '$____current_url'
# Outputs:
#       String
#               - the joined url.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on bad execution.
entities_networks_join_url() {
        #____base_url="$1"
        #____current_url="$2"
        #____target_path="$3"


        # validate inputs
        if [ "$1" = "" ]; then
                printf -- ""
                return 1
        fi

        if [ "$2" = "" ]; then
                printf -- ""
                return 1
        fi

        if [ "$3" = "" ]; then
                printf -- ""
                return 1
        fi

        if [ "$(entities_networks_parse_url "$1")" = "" ]; then
                printf -- ""
                return 1
        fi

        if [ "$(entities_networks_parse_url "$2")" = "" ]; then
                printf -- ""
                return 1
        fi


        # execute
        if [ ! "${3#*":"}" = "$3" ]; then
                # absolute url - return as it is
                printf -- "%s" "$3"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        elif [ ! "${3#"/"}" = "$3" ]; then
                # merge from base url
                printf -- "%s" "${1%/}/${3#/}"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        else
                # merge from current url
                printf -- "%s" "${2%/}/${3#/}"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        fi


        # report status
        return 0
}




# report import status
return 0

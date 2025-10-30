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
#       ____command
#               - COMPULSORY
#               - The command to check.
#       ____flatpak
#               - OPTIONAL
#               - The flatpak app ID to check.
#       ____snap
#               - OPTIONAL
#               - The snap app ID to check.
# Outputs:
#       Origin Source
#               - any of the following value:
#                       - ''            - not available or error
#                       - 'native'      - natively available
#                       - 'flatpak'     - via flatpak
#                       - 'snap'        - via snap
# Returns:
#       Return Code
#               - '0' means ok - native;
#                 '10' means ok - flatpak;
#                 '20' means ok -snap;
#                 '1' is error otherwise.
entities_os_is_command_available() {
        #____command="$1"
        #____flatpak="$2"
        #____snap="$3"


        # validate inputs
        if [ "$1" = "" ]; then
                printf -- ""
                return 1
        fi


        # execute
        command -v "$1" 2> /dev/null
        if [ $? -eq 0 ]; then
                printf -- "native"
                return 0
        fi

        command -v flatpak 2> /dev/null
        if [ $? -eq 0 ]; then
                if [ ! "$2" = "" ] &&
                [ ! "$(flatpak info "$2" 2> /dev/null)" = "" ]; then
                        printf -- "flatpak"
                        return 10
                fi
        fi

        command -v snap 2> /dev/null
        if [ $? -eq 0 ]; then
                if [ ! "$3" = "" ] &&
                [ ! "$(snap list "$3" 2> /dev/null)" = "" ]; then
                        printf -- "snap"
                        return 20
                fi
        fi


        # report status
        printf -- ""
        return 1
}




# report import status
return 0

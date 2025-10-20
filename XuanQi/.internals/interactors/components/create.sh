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
#       ____path
#               - COMPULSORY
#               - The absolute directory path to create.
#       ____type
#               - COMPULSORY
#               - The component type.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____filepath' (code: 1).
#               - error on existing file (code: 2).
#               - error on empty '____key' (code: 3).
#               - error on invalid '____key' (code: 4).
#               - error on bad execution (code: 5).
interactors_components_create() {
        #____path="$1"
        #____type="$2"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ -e "$1" ]; then
                return 2
        fi


        # execute
        case "$2" in
        "")
                return 3
                ;;
        data)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-css-copy)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-css-external)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-css-manual)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-css)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-script-copy)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-script-external)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-script-manual)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-script)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-page-copy)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-page-external)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-page-manual)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-page)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-page-redirect-copy)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-page-redirect-external)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-page-redirect-manual)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-page-redirect)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        web-site)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        manual)
                interactors_components_create_directories "$1"
                if [ $? -ne 0 ]; then
                        return 5
                fi
                ;;
        *)
                return 4
                ;;
        esac


        # report status
        return 0
}




# report import status
return 0

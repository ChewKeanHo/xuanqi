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
#               - error on empty '____type' (code: 3).
#               - error on invalid '____type' (code: 4).
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

        case "$2" in
        "")
                return 3
                ;;
        *)
                # accepted
                ;;
        esac


        # execute
        ____dest_shell_import="${1}/XuanQi/import.sh"


        # create XuanQi directory for importer script
        interactors_fs_create_directory "${____dest_shell_import%/*}"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi


        # write opening importer script
        interactors_shell_write_header "$____dest_shell_import"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi


        # handle data
        interactors_components_create_data "$1" "$2" "$____dest_shell_import"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi


        # all good - closing importer script
        interactors_shell_write_footer "$____dest_shell_import"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi


        # export importer script
        interactors_fs_export "$____dest_shell_import"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

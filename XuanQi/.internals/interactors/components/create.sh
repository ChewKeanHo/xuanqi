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

        interactors_shell_write_page_break "$____dest_shell_import"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi


        # write component data libraries for importer script
        interactors_shell_write_comment "$____dest_shell_import" "\
$(interactors_print_components_init_data)\
"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi

        interactors_shell_write_raw_content "$____dest_shell_import" "\
____old_IFS=\"\$IFS\"
while IFS=\"\" read -r ____line || [ -n \"\$____line\" ]; do
        ____line=\"\${____line%%#*}\"
        if [ \"\$____line\" = \"\" ]; then
                continue
        fi


        if [ -d \"\$____line\" ]; then
                : # ok
        elif [ -L \"\$____line\" ] &&
        [ -d \$(readlink --canonicalize \"\$____line\") ]; then
                : # ok
        else
                XuanQi_Responses_Errors_Invalid \"\$____line\"
                IFS=\"\$____old_IFS\"
                unset ____line ____old_IFS
                return 1
        fi

        XuanQi_Responses_Importing \"\$____line\"
        XuanQi_Components_Import \"\$____line\"
        if [ \$? -ne 0 ]; then
                XuanQi_Responses_Errors_Bad_Execution
                IFS=\"\$____old_IFS\"
                unset ____line ____old_IFS
                return 1
        fi
done<<EOF
# $( \
        interactors_print_components_add_library_path_here \
                "\${XUANQI_PATH_COMPONENTS}/[NAME]/Data" \
)
"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi


        # handle data directory
        if [ ! "${2%"data"*}" = "$2" ]; then
                interactors_fs_create_directory "${1}/Data"
                if [ $? -ne 0 ]; then
                        interactors_fs_delete "$1"
                        return 5
                fi

                ## add current data directory into importer script
                interactors_shell_write_raw_content "$____dest_shell_import" "\
\${XUANQI_COMPONENT_PATH}/Data
"
                if [ $? -ne 0 ]; then
                        interactors_fs_delete "$1"
                        return 5
                fi

                ## create an example configuration file
                interactors_data_create \
                        "${1}/Data/sample.conf" \
                        "EXAMPLE_VARIABLE"
                if [ $? -ne 0 ]; then
                        interactors_fs_delete "$1"
                        return 5
                fi

                ## create an example i18n library script as page title
                interactors_fs_create_directory "${1}/Data/i18n"
                interactors_fs_copy \
                        "${1}/Data/i18n/title.sh" \
                        "${XUANQI_PATH_ROOT}/entities/docs/components/i18n_title.sh"
                if [ $? -ne 0 ]; then
                        interactors_fs_delete "$1"
                        return 5
                fi
        fi


        # close data directory import for importer script
        interactors_shell_write_raw_content "$____dest_shell_import" "\
EOF
IFS=\"\$____old_IFS\"
unset ____line ____old_IFS
"
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

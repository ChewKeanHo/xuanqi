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
#       ____shell_path
#               - COMPULSORY
#               - The XuanQi import shell script filepath.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____path'.
#               - error on empty '____type'.
#               - error on empty '____shell_path'.
#               - error on bad execution.
interactors_components_create_css() {
        #____path="$1"
        #____type="$2"
        #____shell_path="$3"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi

        case "$2" in
        "")
                return 1
                ;;
        *)
                # accepted
                ;;
        esac

        if [ "$3" = "" ]; then
                return 1
        fi


        # execute
        ## write page break for clean code and clarity
        interactors_shell_write_page_break "$3"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi

        ## write component data libraries for importer script
        interactors_shell_write_comment "$3" "\
$(interactors_print_components_init_css)\
"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi

        interactors_shell_write_if_else_opener \
                "$3" \
                "\
[ -f \"\${XUANQI_COMPONENT_PATH}/CSS/xuanqi.sh\" ]
" \
                "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi

        interactors_shell_write_raw_content "$3" "\
$(interactors_shell_get_indent "1")XuanQi_Responses_Executing \"\${XUANQI_COMPONENT_PATH}/CSS/xuanqi.sh\"
$(interactors_shell_get_indent "1")XuanQi_Components_Import \"\${XUANQI_COMPONENT_PATH}/CSS/xuanqi.sh\"
$(interactors_shell_get_indent "1")if [ \$? -ne 0 ]; then
$(interactors_shell_get_indent "2")XuanQi_Responses_Errors_Bad_Execution
$(interactors_shell_get_indent "2")return 1
$(interactors_shell_get_indent "1")fi
"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi

        interactors_shell_write_if_else_closer "$3" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi


        # handle css directory
        if [ "${2%"css"*}" = "$2" ]; then
                return 0
        fi

        interactors_fs_create_directory "${1}/CSS"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi

        interactors_components_create_css_sample "${1}/CSS" "sample"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi

        interactors_components_create_css_xuanqi "${1}/CSS/xuanqi.sh"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                return 5
        fi


        # report status
        return 0
}




# report import status
return 0

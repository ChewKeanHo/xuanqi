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
#       ____path_dest
#               - COMPULSORY
#               - the destination file to write into.
# Outputs:
#       Write to '$____path_dest' File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path_dest'.
#               - error on bad execution.
interactors_components_create_css_xuanqi() {
        #____path_dest="$1"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ ! "${1%/*}" = "$1" ]; then
                if [ -d "${1%/*}" ]; then
                        : # accepted
                elif [ -L "${1%/*}" ] &&
                [ -d "$(readlink --canonicalize "$1")" ]; then
                        : # accepted
                else
                        return 1
                fi
        fi


        # execute
        interactors_shell_write_header "$1"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_page_break "$1" "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_comment \
                "$1" \
                "$(interactors_print_components_type_validation)" \
                "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_switch_opener \
                "$1" \
                "\$XUANQI_CONTENT_TYPE" \
                "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_switch_change_condition \
                "$1" \
                "\"text/css\"" \
                "0" \
                "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_comment "$1" "accepted" "1"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_switch_change_condition "$1" "*" "0" "1"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_raw_content "$1" "\
$(interactors_shell_get_indent "1")return 0
"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_switch_closer "$1" "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## make sure output path is not empty
        interactors_shell_write_page_break "$1" "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_comment \
                "$1" \
                "$(interactors_print_components_path_validation)" \
                "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        views_shell_write_if_else_opener \
                "$1" \
                "[ \"\$XUANQI_CONTENT_PATH\" = \"\" ]" \
                "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        views_shell_write_raw_content "$1" "\
$(interactors_shell_get_indent "1")XuanQi_Responses_Errors_Missing \"\$XUANQI_CONTENT_PATH\"
$(interactors_shell_get_indent "1")return 1
"
        if [ $? -ne 0 ]; then
                return 1
        fi

        views_shell_write_if_else_closer "$1" "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## make sure to react based on relative path
        interactors_shell_write_page_break "$1" "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_comment \
                "$1" \
                "$(interactors_print_components_react_by_relative_url)" \
                "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_switch_opener \
                "$1" \
                "\$XUANQI_CONTENT_RELATIVE_URL" \
                "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_switch_change_condition \
                "$1" \
                "\"/assets/css/sample.css\"" \
                "0" \
                "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_raw_content "$1" "\
$(interactors_shell_get_indent "1")XuanQi_Components_Import \\
$(interactors_shell_get_indent "2")\"\${XUANQI_COMPONENT_PATH}/CSS/sample.css.sh\"
$(interactors_shell_get_indent "1")if [ \$? -ne 0 ]; then
$(interactors_shell_get_indent "2")XuanQi_Responses_Errors_Bad_Execution
$(interactors_shell_get_indent "2")return 1
$(interactors_shell_get_indent "1")fi
"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_switch_change_condition "$1" "*" "0" "1"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_raw_content "$1" "\
$(interactors_shell_get_indent "1")return 0
"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_shell_write_switch_closer "$1" "0"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## all good - close now
        interactors_shell_write_footer "$1"
        if [ $? -ne 0 ]; then
                return 1
        fi

        interactors_fs_export "$1"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

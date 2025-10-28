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
        XuanQi_Responses_Executing \"\${XUANQI_COMPONENT_PATH}/CSS/xuanqi.sh\"
        XuanQi_Components_Import \"\${XUANQI_COMPONENT_PATH}/CSS/xuanqi.sh\"
        if [ \$? -ne 0 ]; then
                XuanQi_Responses_Errors_Bad_Execution
                return 1
        fi
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


        # create sample css
        ____dest_css="${1}/CSS/sample.css"
        interactors_css_write_header "$____dest_css"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_page_break "$____dest_css" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_opener "$____dest_css" ":root" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "--page-padding" \
                "8rem" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "--page-font" \
                "'Noto Sans', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_closer "$____dest_css" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_page_break "$____dest_css" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_opener "$____dest_css" "*" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "box-sizing" \
                "border-box" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "margin" \
                "0" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "padding" \
                "0" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "transition" \
                ".1s" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "scroll-behavior" \
                "smooth" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_closer "$____dest_css" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_page_break "$____dest_css" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_opener "$____dest_css" "html" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "width" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "width" \
                "calc(100vw - calc(100vw - 100%))" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "height" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "height" \
                "calc(100vh - calc(100vh - 100%))" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "font-size" \
                "62.5% /* 1.6rem = 16px */" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_closer "$____dest_css" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_page_break "$____dest_css" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_opener "$____dest_css" "body" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "min-width" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "width" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "max-width" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "min-height" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "height" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "max-height" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "font-family" \
                "var(--page-font)" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_closer "$____dest_css" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_page_break "$____dest_css" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_opener "$____dest_css" "body > *" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "padding" \
                "0 var(--page-padding)" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_closer "$____dest_css" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_page_break "$____dest_css" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_opener "$____dest_css" "body > *:first-child" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_property \
                "$____dest_css" \
                "padding-top" \
                "var(--page-padding)" \
                "1"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        interactors_css_write_closer "$____dest_css" "0"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi

        ## all good - export now
        interactors_fs_export "$____dest_css"
        if [ $? -ne 0 ]; then
                interactors_fs_delete "$1"
                unset ____dest_css
                return 5
        fi
        unset ____dest_css


        # report status
        return 0
}




# report import status
return 0

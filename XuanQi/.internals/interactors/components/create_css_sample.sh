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
#               - the absolute directory path for creating the samples.
#       ____filename
#               - COMPULSORY
#               - the filename with no extension.
#               - if any pathing ('/') or file extension (.*) is detected,
#                 error will be raised.
# Outputs:
#       Write to '${____path}/sample.css' File
#               - a baseline sample css file.
#       Write to '${____path}/sample.css.sh' File
#               - a XuanQi subroutine for handling the baseline css file.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path'.
#               - error on empty/invalid '$____filename'.
#               - error on bad execution.
interactors_components_create_css_sample() {
        #____path="$1"
        #____filename="$2"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ -d "$1" ]; then
                : # accepted
        elif [ -L "$1" ]; then
                if [ -d "$(readlink --canonicalize "$1")" ]; then
                        : # accepted
                else
                        return 1
                fi
        else
                return 1
        fi

        if [ "$2" = "" ]; then
                return 1
        fi

        if [ ! "${2%/*}" = "$2" ]; then
                return 1
        fi

        if [ ! "${2%.*}" = "$2" ]; then
                return 1
        fi


        # execute
        # write sample css
        ____dest="${1}/${2}.css"
        interactors_css_write_header "$____dest"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_page_break "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_opener "$____dest" ":root" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "--page-padding" \
                "8rem" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "--page-font" \
                "'Noto Sans', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_closer "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_page_break "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_opener "$____dest" "*" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "box-sizing" \
                "border-box" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "margin" \
                "0" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "padding" \
                "0" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "transition" \
                ".1s" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "scroll-behavior" \
                "smooth" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_closer "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_page_break "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_opener "$____dest" "html" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "width" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "width" \
                "calc(100vw - calc(100vw - 100%))" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "height" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "height" \
                "calc(100vh - calc(100vh - 100%))" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "font-size" \
                "62.5% /* 1.6rem = 16px */" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_closer "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_page_break "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_opener "$____dest" "body" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "min-width" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "width" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "max-width" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "min-height" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "height" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "max-height" \
                "100%" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "font-family" \
                "var(--page-font)" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_closer "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_page_break "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_opener "$____dest" "body > *" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "padding" \
                "0 var(--page-padding)" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_closer "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_page_break "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_opener \
                "$____dest" \
                "body > *:first-child" \
                "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_property \
                "$____dest" \
                "padding-top" \
                "var(--page-padding)" \
                "1"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_css_write_closer "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        ## all good - export now
        interactors_fs_export "$____dest"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi
        unset ____dest


        # write sample subroutine
        ____dest="${1}/${2}.css.sh"
        ## write opening header
        interactors_shell_write_header "$____dest"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        ## write output type validator
        interactors_shell_write_page_break \
                "$____dest" \
                "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_shell_write_comment \
                "$____dest" \
                "$(interactors_print_components_raw_append)" \
                "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        views_shell_write_raw_content \
                "$____dest" \
                "\
XuanQi_CSS_Append_File \\
        \"\$XUANQI_CONTENT_PATH\" \\
        \"\${XUANQI_COMPONENT_PATH}/CSS/sample.css\"
if [ \$? -ne 0 ]; then
        XuanQi_Responses_Errors_Bad_Execution
        return 1
fi
"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        ## demonstrate systematic scripting for CSS construction
        interactors_shell_write_page_break "$____dest" "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        interactors_shell_write_comment \
                "$____dest" \
                "$(interactors_print_components_programmable_rendering)" \
                "0"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        views_shell_write_raw_content \
                "$____dest" \
                "\
XuanQi_CSS_Write_Page_Break \"\$XUANQI_CONTENT_PATH\" \"0\"
if [ \$? -ne 0 ]; then
        XuanQi_Responses_Errors_Bad_Execution
        return 1
fi

XuanQi_CSS_Write_Opener \\
        \"\$XUANQI_CONTENT_PATH\" \\
        \"body > *:last-child\" \\
        \"0\"
if [ \$? -ne 0 ]; then
        XuanQi_Responses_Errors_Bad_Execution
        return 1
fi

XuanQi_CSS_Write_Property \\
        \"\$XUANQI_CONTENT_PATH\" \\
        \"padding-bottom\" \\
        \"var(--page-padding)\" \\
        \"0\"
if [ \$? -ne 0 ]; then
        XuanQi_Responses_Errors_Bad_Execution
        return 1
fi

XuanQi_CSS_Write_Closer \\
        \"\$XUANQI_CONTENT_PATH\" \\
        \"0\"
if [ \$? -ne 0 ]; then
        XuanQi_Responses_Errors_Bad_Execution
        return 1
fi
"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        ## write closing footer
        interactors_shell_write_footer "$____dest"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi

        ## all good - export now
        interactors_fs_export "$____dest"
        if [ $? -ne 0 ]; then
                unset ____dest
                return 1
        fi
        unset ____dest


        # report status
        return 0
}




# report import status
return 0

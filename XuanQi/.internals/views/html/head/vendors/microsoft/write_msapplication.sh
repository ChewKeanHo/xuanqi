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




# Specifications:
#       * https://learn.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/samples/dn455106(v=vs.85)
# Parameters:
#       ____path_dest
#               - COMPULSORY
#               - the destination file to write into.
#       ____theme_color
#               - COMPULSORY
#               - the entire site's foreground color.
#               - RGBA hexadecimal value (e.g. '#000000' for black).
#       ____background_color
#               - COMPULSORY
#               - the entire site's background color.
#               - RGBA hexadecimal value (e.g. '#FFFFFF' for white).
#       ____config_url
#               - COMPULSORY
#               - the msapplication config source url.
#       ____indent_level
#               - OPTIONAL
#               - indentation level in round numerical number.
#               - empty means default '1' indentation.
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path_dest'.
#               - error on empty '$____theme_color'.
#               - error on empty '$____background_color'.
#               - error on empty '$____config_url'.
#               - error on invalid '$____indent_level' (e.g. not a number).
#               - error on bad execution.
views_html_head_vendors_microsoft_write_msapplication() {
        #____path_dest="$1"
        #____theme_color="$2"
        #____background_color="$3"
        #____config_url="$4"
        #____indent_level="$5"


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

        if [ "${2#"#"}" = "" ]; then
                return 1
        fi

        if [ "${3#"#"}" = "" ]; then
                return 1
        fi

        if [ "$4" = "" ]; then
                return 1
        fi

        case "$5" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                if [ "$5" -lt 0 ]; then
                        return 1
                fi
        esac


        # execute
        views_html_write_raw_content "$1" "\
$(views_html_get_indent "${5:-1}")<meta property='theme-color' content='#${2#"#"}' />
$(views_html_get_indent "${5:-1}")<meta property='msapplication-TileColor' content='#${3#"#"}' />
$(views_html_get_indent "${5:-1}")<meta property='msapplication-config' content='${4}' />
"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

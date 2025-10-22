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
#       ____url
#               - COMPULSORY
#               - the image file url for the thumbnail.
#       ____mime
#               - COMPULSORY
#               - the image file mime type. Recommend 'image/*' type.
#       ____description
#               - COMPULSORY
#               - the alternate text description for the image thumbnail.
#       ____width
#               - COMPULSORY
#               - the image's width in round number pixel unit
#                 (e.g. '1200' for 1200px).
#               - DO NOT include unit.
#       ____height
#               - COMPULSORY
#               - the image's height in round number pixel unit
#                 (e.g. '1200' for 1200px).
#               - DO NOT include unit.
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
#               - error on empty '$____url'.
#               - error on empty '$____mime'.
#               - error on empty '$____description'.
#               - error on empty/invalid '$____width' (e.g. not a number).
#               - error on empty/invalid '$____height' (e.g. not a number).
#               - error on invalid '$____indent_level' (e.g. not a number).
#               - error on bad execution.
views_html_head_vendors_open_graph_write_thumbnail_image() {
        #____path_dest="$1"
        #____url="$2"
        #____mime="$3"
        #____description="$4"
        #____width="$5"
        #____height="$6"
        #____indet_level="$7"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ "$2" = "" ]; then
                return 1
        fi

        if [ "$3" = "" ]; then
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
                ;;
        esac

        case "$6" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                if [ "$6" -lt 0 ]; then
                        return 1
                fi
                ;;
        esac

        case "$7" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                if [ "$7" -lt 0 ]; then
                        return 1
                fi
                ;;
        esac


        # execute
        views_html_write_raw_content "$1" "\
$(views_html_get_indent "${7:-1}")<meta property='og:image' content='${2}' />
$(views_html_get_indent "${7:-1}")<meta property='og:image:type' content='${3}' />
$(views_html_get_indent "${7:-1}")<meta property='og:image:alt' content='${4}' />
$(views_html_get_indent "${7:-1}")<meta property='og:image:width' content='${5}' />
$(views_html_get_indent "${7:-1}")<meta property='og:image:height' content='${6}' />
"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

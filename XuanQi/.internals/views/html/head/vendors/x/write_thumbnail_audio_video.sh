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
#       * https://developer.x.com/en/docs/x-for-websites
# Parameters:
#       ____path_dest
#               - COMPULSORY
#               - the destination file to write into.
#       ____url
#               - COMPULSORY
#               - the video file url for the thumbnail.
#       ____description
#               - COMPULSORY
#               - the alternate text description for the video thumbnail.
#       ____image_url
#               - COMPULSORY
#               - the image file url for the fallback thumbnail.
#               - match the video exact frame size.
#               - Recommended format:
#                       * PNG, JPEG, WEBP, GIF
#       ____image_description
#               - COMPULSORY
#               - the alternate text description for the fallback image
#                 thumbnail.
#       ____width
#               - COMPULSORY
#               - the video's width in round number pixel unit
#                 (e.g. '1200' for 1200px).
#               - DO NOT include unit.
#       ____height
#               - COMPULSORY
#               - the video's height in round number pixel unit
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
#               - error on empty '$____description'.
#               - error on empty '$____image_url'.
#               - error on empty '$____image_description'.
#               - error on empty/invalid '$____width' (e.g. not a number).
#               - error on empty/invalid '$____height' (e.g. not a number).
#               - error on invalid '$____indent_level' (e.g. not a number).
#               - error on bad execution.
views_html_head_vendors_x_write_thumbnail_audio_video() {
        #____path_dest="$1"
        #____url="$2"
        #____description="$3"
        #____image_url="$4"
        #____image_description="$5"
        #____width="$6"
        #____height="$7"
        #____indet_level="$8"


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

        if [ "$5" = "" ]; then
                return 1
        fi

        case "${6%"px"}" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                if [ "${6%"px"}" -lt 0 ]; then
                        return 1
                fi
                ;;
        esac

        case "${7%"px"}" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                if [ "${7%"px"}" -lt 0 ]; then
                        return 1
                fi
                ;;
        esac

        case "$8" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                if [ "$8" -lt 0 ]; then
                        return 1
                fi
                ;;
        esac


        # execute
        views_html_write_raw_content "$1" "\
$(views_html_get_indent "${8:-1}")<meta property='twitter:card' content='player' />
$(views_html_get_indent "${8:-1}")<meta property='twitter:player' content='${2}' />
$(views_html_get_indent "${8:-1}")<meta property='twitter:player:alt' content='${3}' />
$(views_html_get_indent "${8:-1}")<meta property='twitter:image' content='${4}' />
$(views_html_get_indent "${8:-1}")<meta property='twitter:image:alt' content='${5}' />
$(views_html_get_indent "${8:-1}")<meta property='twitter:player:width' content='${6%"px"}' />
$(views_html_get_indent "${8:-1}")<meta property='twitter:player:height' content='${7%"px"}' />
"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

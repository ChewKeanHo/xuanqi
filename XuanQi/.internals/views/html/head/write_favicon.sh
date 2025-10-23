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
#       ____relationship
#               - COMPULSORY
#               - the favicon relationship. Only accepts the
#                 following values:
#                       * 'icon'
#                               - normal favicon type.
#                       * 'mask-icon'
#                               - monochrome (black & white)
#                                 for recoloration. Use '$____color'
#                                 to define the color.
#                       * 'apple-touch-icon'
#                               - like 'icon' but geared for Apple
#                                 iOS touches.
#       ____source_url
#               - COMPULSORY
#               - for external url sourcing.
#       ____mime
#               - COMPULSORY
#               - for defining the favicon MIME type. **ONLY** accepts
#                 the following:
#                       * 'image/*'
#               - recommend:
#                       * 'image/svg'  - lossless resizable image.
#                       * 'image/png'  - transparent background.
#                       * 'image/jpg'  - sophisicated non-transparent
#                                        image.
#                       * 'image/webp' - advanced smaller sized
#                                        image format with transparent
#                                        background.(WARNING: not all
#                                        browsers support it).
#                       * 'image/avif' - advanced even smaller sized
#                                        image format without size
#                                        restriction, and with
#                                        transparent background.(WARNING:
#                                        not all browsers support it).
#       ____width
#               - COMPULSORY
#               - the image's width in round number pixel unit
#                 (e.g. '1200' for 1200px).
#               - DO NOT include unit.
#               - depending on size ('${____width}x${____height}'),
#                 favicon may render associated HTML tags with it
#                 (e.g. '144x144' will render 'msapplication-TileImage'
#                 meta tag).
#               - for multi-sized images (e.g. '.favicon'), set to 'any'.
#       ____height
#               - COMPULSORY
#               - the image's height in round number pixel unit
#                 (e.g. '1200' for 1200px).
#               - DO NOT include unit.
#               - depending on size ('${____width}x${____height}'),
#                 favicon may render associated HTML tags with it
#                 (e.g. '144x144' will render 'msapplication-TileImage'
#                 meta tag).
#               - for multi-sized images (e.g. '.favicon'), set to 'any'.
#       ____color
#               - OPTIONAL
#               - the color for monochromatic image recoloration.
#               - RGBA hexadecimal format (e.g. '#FFFFFF' for white).
#               - ignored when left empty.
#               - error raised if '$____relationship' is 'mask-icon'
#                 but this is left empty.
#       ____properties
#               - OPTIONAL
#               - the "key='value'" properties (e.g. id='...').
#               - multi-line values where each line is an entry.
#               - the "rel='...'" and "href='...'" are already rendered
#                 automatically. Please exclude them.
#               - each entry **MUST** comply to the following format:
#                                   '[KEY]: [VALUE]'
#                 where:
#                       - ': ' is the separating delimiter.
#                       - [KEY] is the name of the property
#                               (e.g. 'id').
#                       - [VALUE] is the value of the property
#                               (e.g. 'my-target-1').
#               - you are responsible for the key:value's data
#                 validity as this function only renders the
#                 inputs.
#       ____indent_level
#               - OPTIONAL
#               - indentation level in round numerical number.
#               - empty means default '1' indentation for html tag
#                 and '0' indentation for webscript content.
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path_dest'.
#               - error on empty/invalid '$____relationship'.
#               - error on empty '$____url'.
#               - error on empty/invalid '$____mime' (e.g. not
#                 starting with 'image/').
#               - error on empty/invalid '$____width' (e.g. not a
#                 number).
#               - error on empty/invalid '$____height' (e.g. not a
#                 number).
#               - error on either '$____width' or '$___height' is
#                 'any' but not both.
#               - error on '$____relationship' is 'mask-icon' but
#                 '$____color' is empty.
#               - error on invalid '$____indent_level' (e.g. not a
#                 number).
#               - error on bad execution.
views_html_head_write_favicon() {
        #____path_dest="$1"
        #____relationship="$2"
        #____url="$3"
        #____mime="$4"
        #____width="$5"
        #____height="$6"
        #____color="$7"
        #____properties="$8"
        #____indent_level="$9"


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

        case "$2" in
        'icon')
                # accepted
                ;;
        'mask-icon')
                # accepted
                ;;
        'apple-touch-icon')
                # accepted
                ;;
        *)
                return 1
                ;;
        esac

        if [ "$3" = "" ]; then
                return 1
        fi

        if [ "$4" = "" ]; then
                return 1
        fi

        if [ "${4##"image/"}" = "$4" ]; then
                return 1
        fi

        case "${5%px}" in
        "any")
                # accepted
                ;;
        ""|*[!0-9]*)
                return 1
                ;;
        *)
                # accepted
                ;;
        esac

        case "${6%px}" in
        "any")
                # accepted
                ;;
        ""|*[!0-9]*)
                return 1
                ;;
        *)
                # accepted
                ;;
        esac

        if [ "$5" = "any" ] && [ "$6" = "any" ]; then
                : # accepted
        elif [ "$5" = "any" ] && [ ! "$6" = "any" ]; then
                return 1
        elif [ ! "$5" = "any" ] && [ "$6" = "any" ]; then
                return 1
        else
                : # accepted
        fi

        if [ "$2" = "mask-icon" ] && [ "$7" = "" ]; then
                return 1
        fi


        # execute
        ____properties="\
${8}
"
        if [ ! "$7" = "" ]; then
        ____properties="\
color: #${7#"#"}
${____properties}
"
        fi

        if [ ! "${5%px}" = "any" ] && [ ! "${6%px}" = "any" ]; then
                ____properties="\
sizes: ${5%"px"}x${6%"px"}
${____properties}
"
        fi

        views_html_head_write_link \
                "$1" \
                "$2" \
                "$3" \
                "$____properties" \
                "${9:-1}"
        if [ $? -ne 0 ]; then
                return 1
        fi

        case "${5%"px"}x${6%"px"}" in
        "144x144")
                views_html_head_write_meta \
                        "$1" \
                        "msapplication-TileImage" \
                        "$3" \
                        "" \
                        "${9:-1}"
                if [ $? -ne 0 ]; then
                        return 1
                fi
                ;;
        *)
                ;;
        esac


        # report status
        return 0
}




# report import status
return 0

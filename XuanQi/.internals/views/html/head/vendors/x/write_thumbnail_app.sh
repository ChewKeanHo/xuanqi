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
#       * https://en.wikipedia.org/wiki/ISO_3166-1
# Parameters:
#       ____path_dest
#               - COMPULSORY
#               - the destination file to write into.
#       ____iphone_app_id
#               - COMPULSORY
#               - the app ID in App Store (e.g. "307234931").
#       ____ipad_app_id
#               - COMPULSORY
#               - the app ID in App Store (e.g. "307234931").
#       ____googleplay_app_id
#               - COMPULSORY
#               - the app ID in Google Play (e.g. "com.android.app").
#       ____country
#               - OPTIONAL
#               - the app distribution geo-location outside US.
#               - comply to ISO_3166-1 Alpha 2 format (e.g. 'US').
#               - leaving it empty means all the apps are in US only.
#       ____url_iphone
#               - OPTIONAL
#               - the app custom URL scheme for iphone app.
#       ____url_ipad
#               - OPTIONAL
#               - the app custom URL scheme for ipad app.
#       ____url_googleplay
#               - OPTIONAL
#               - the app custom URL scheme for googleplay app.
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
#               - error on empty '$____iphone_app_id'.
#               - error on empty '$____ipad_app_id'.
#               - error on empty '$____googleplay_app_id'.
#               - error on invalid '$____indent_level' (e.g. not a number).
#               - error on bad execution.
views_html_head_vendors_x_write_thumbnail_app() {
        #____path_dest="$1"
        #____iphone_app_id="$2"
        #____ipad_app_id="$3"
        #____googleplay_app_id="$4"
        #____country"$5"
        #____url_iphone"$6"
        #____url_ipad"$7"
        #____url_googleplay"$8"
        #____indet_level="$9"


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

        if [ "$2" = "" ]; then
                return 1
        fi

        if [ "$3" = "" ]; then
                return 1
        fi

        if [ "$4" = "" ]; then
                return 1
        fi

        case "$9" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                if [ "$9" -lt 0 ]; then
                        return 1
                fi
                ;;
        esac


        # execute
        views_html_write_raw_content "$1" "\
$(views_html_get_indent "${9:-1}")<meta property='twitter:card' content='app' />
$(views_html_get_indent "${9:-1}")<meta property='twitter:app:id:iphone' content='${2}' />
$(views_html_get_indent "${9:-1}")<meta property='twitter:app:id:ipad' content='${3}' />
$(views_html_get_indent "${9:-1}")<meta property='twitter:app:id:googleplay' content='${4}' />
"
        if [ $? -ne 0 ]; then
                return 1
        fi

        if [ ! "$5" = "" ]; then
                views_html_write_raw_content "$1" "\
$(views_html_get_indent "${9:-1}")<meta property='twitter:app:country' content='${5}' />
"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        fi

        if [ ! "$6" = "" ]; then
                views_html_write_raw_content "$1" "\
$(views_html_get_indent "${9:-1}")<meta property='twitter:app:url:iphone' content='${6}' />
"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        fi

        if [ ! "$7" = "" ]; then
                views_html_write_raw_content "$1" "\
$(views_html_get_indent "${9:-1}")<meta property='twitter:app:url:ipad' content='${7}' />
"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        fi

        if [ ! "$8" = "" ]; then
                views_html_write_raw_content "$1" "\
$(views_html_get_indent "${9:-1}")<meta property='twitter:app:url:googleplay' content='${8}' />
"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        fi


        # report status
        return 0
}




# report import status
return 0

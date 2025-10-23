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
#       ____locale
#               - COMPULSORY
#               - the BCP 47 locale code complying to the following format:
#                               '[LANG]{-[SCRIPT]}{-[COUNTRY]}'
#                 where:
#                       [LANG]       - ISO639 language code.
#                       {-[SCRIPT]}  - optional ISO15924 language script
#                                      with a dash '-' prefix separator and
#                                      without the '{ }' braces.
#                       {-[COUNTRY]} - optional ISO3166 country code
#                                      with a dash '-' prefix separator and
#                                      without the '{ }' braces.
#               - Examples:
#                   * 'en'           - International English
#                   * 'zh-Hans'      - International Simplified Chinese
#                   * 'zh-Hant'      - International Traditional Chinese
#                   * 'zh-Hans-US'   - United States Simplified Chinese
#                   * 'zh-Hant-US'   - United States Traditional Chinese
#                   * 'zh-Hans-MY'   - Malaysia's Simplified Chinese
#                   * 'zh-Hant-MY'   - Malaysia's Traditional Chinese
#       ____locales_url
#               - COMPULSORY
#               - for redirecting to the locale's url page.
#               - multi-lines value where each line is a new entry.
#               - first entry will be the default and fallback entry.
#               - each entry complies to the following format:
#                                 '[LOCALE]: [URL]'
#                 where:
#                       * ': '          - is the separating delimiter.
#                       * '[LOCALE]'    - the BCP 47 locale tag.
#                       * '[URL]'       - the URL to redirect.
#       ____webscript_permission_tag
#               - COMPULSORY
#               - the webscript permission tag to check user's locale.
#               - the permission is stored in browser's LocalStorage system.
#               - recommended using no space an dash ('-') separator.
#               - values are aligned with browser's permission status:
#                 'granted', 'denied', 'prompt' or empty ''. Default is
#                 'prompt'.
#               - example: 'site-locale'
#       ____properties
#               - OPTIONAL
#               - the "key='value'" properties (e.g. id='...').
#               - multi-line values where each line is an entry.
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
#               - error on empty '$____locale'.
#               - error on empty '$____locales_url'.
#               - error on empty '$____webscript_permission_tag'.
#               - error on invalid '$____indent_level' (e.g. not a number).
#               - error on bad execution.
views_html_head_write_locales() {
        #____path_dest="$1"
        #____locale="$2"
        #____locales_url="$3"
        #____webscript_permission_tag="$4"
        #____properties="$5"
        #____indent_level="$6"


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
        esac


        # execute
        ## write script opener
        views_html_write_webscript_opener "$1" "sync" "" "${6:-1}" "$5"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## write load event listener and get into switch casing
        views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${6:-0}" ))")window.addEventListener('load', function() {
$(views_html_get_indent "$(( "${6:-0}" + 1 ))")let previous = localStorage.getItem('${4}');
$(views_html_get_indent "$(( "${6:-0}" + 1 ))")switch (previous) {
"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## process each language url entry
        ____default=""
        ____old_IFS="$IFS"
        while IFS= read -r ____line || [ -n "$____line" ]; do
                if [ "$____line" = "" ]; then
                        continue
                fi

                if [ "${____line#*": "}" = "$____line" ]; then
                        # error - invalid entry
                        IFS="$____old_IFS"
                        unset ____default ____line ____old_IFS
                        return 1
                fi

                if [ "$____default" = "" ]; then
                        ____default="$____line"
                fi

                views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${6:-0}" + 1 ))")case '${____line%%": "*}':
"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____default ____line ____old_IFS
                        return 1
                fi

                if [ ! "${____line%%": "*}" = "$2" ]; then
                        views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${6:-0}" + 2 ))")localStorage.setItem('${4}', '${____line%%": "*}';
$(views_html_get_indent "$(( "${6:-0}" + 2 ))")window.location.href = '${____line#*": "}';
"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____default ____line ____old_IFS
                                return 1
                        fi
                fi

                views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${6:-0}" + 2 ))")break;
"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____default ____line ____old_IFS
                        return 1
                fi
        done <<EOF
${3}
EOF
        IFS="$____old_IFS"
        unset ____line ____old_IFS

        ## process the default fallback entry
        views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${6:-0}" + 1 ))")default:
"

        if [ ! "${____default%%": "*}" = "$2" ]; then
                views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${6:-0}" + 2 ))")localStorage.setItem('${4}', '${____line%%": "*}';
$(views_html_get_indent "$(( "${6:-0}" + 2 ))")window.location.href = '${____line#*": "}';
"
                if [ $? -ne 0 ]; then
                        unset ____default
                        return 1
                fi
        fi

        views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${6:-0}" + 2 ))")break;
$(views_html_get_indent "$(( "${6:-0}" + 1 ))")}
$(views_html_get_indent "$(( "${6:-0}" ))"))};
"
        if [ $? -ne 0 ]; then
                unset ____default
                return 1
        fi
        unset ____default

        ## write script closer
        views_html_write_webscript_closer "$1" "${6:-1}"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # loop each language and print SEO alternate link tag
        ____default=true
        ____old_IFS="$IFS"
        while IFS= read -r ____line || [ -n "$____line" ]; do
                if [ "$____line" = "" ]; then
                        continue
                fi

                if [ "$____default" = "true" ]; then
                        views_html_head_write_link \
                                "$1" \
                                "alternate" \
                                "${____line#*": "}" \
                                "hreflang: x-default"
                                "${6:-1}"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS ____default
                                return 1
                        fi
                fi
                unset ____default

                views_html_head_write_link \
                        "$1" \
                        "alternate" \
                        "${____line#*": "}" \
                        "hreflang: ${____line%%": "*}"
                        "${6:-1}"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____line ____old_IFS ____default
                        return 1
                fi
        done <<EOF
${3}
EOF
        IFS="$____old_IFS"
        unset ____line ____old_IFS ____default


        # report status
        return 0
}




# report import status
return 0

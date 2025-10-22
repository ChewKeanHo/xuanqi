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
#       * https://ogp.me/
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
#       ____properties
#               - OPTIONAL
#               - the "key='value'" properties (e.g. id='...').
#               - multi-line values where each line is an entry.
#               - the "name='...'" and "content='...'" are already
#                 rendered automatically. Please exclude them.
#               - each entry **MUST** comply to the following format:
#                                  '[KEY]: [VALUE]'
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
#               - error on empty/invalid '$____locale'.
#               - error on empty/invalid '$____locales_url'.
#               - error on invalid '$____indent_level' (e.g. not a
#                 number).
#               - error on bad execution.
views_html_head_vendors_open_graph_write_locales() {
        #____path_dest="$1"
        #____locale="$2"
        #____locales_url="$3"
        #____properties="$4"
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

        if [ "$2" = "" ]; then
                return 1
        fi

        if [ "$3" = "" ]; then
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
        # loop each language and print OpenGraph alternate meta tag
        ____old_IFS="$IFS"
        while IFS= read -r ____line || [ -n "$____line" ]; do
                if [ "$____line" = "" ]; then
                        continue
                fi

                if [ "${____line%%": "*}" = "$2" ]; then
                        views_html_head_write_meta \
                                "$1" \
                                "og:locale" \
                                "${____line#*": "}" \
                                ""
                                "${5:-1}"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS
                                return 1
                        fi
                else
                        views_html_head_write_meta \
                                "$1" \
                                "og:locale:alternate" \
                                "${____line#*": "}" \
                                ""
                                "${5:-1}"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS
                                return 1
                        fi
                fi
        done <<EOF
${3}
EOF
        IFS="$____old_IFS"
        unset ____line ____old_IFS


        # report status
        return 0
}




# report import status
return 0

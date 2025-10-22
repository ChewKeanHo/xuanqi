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
#       ____properties
#               - OPTIONAL
#               - the "key='value'" properties (e.g. id='...').
#               - Multi-line values where each line is an entry.
#               - Each entry **MUST** comply to the following
#                 format:
#                             '[KEY]: [VALUE]'
#                 where:
#                       - ': ' is the separating delimiter.
#                       - [KEY] is the name of the property
#                               (e.g. 'id').
#                       - [VALUE] is the value of the property
#                               (e.g. 'my-target-1').
#               - You are responsible for the key:value's data
#                 validity as this function only renders the
#                 inputs.
#       ____indent_level
#               - OPTIONAL
#               - indentation level in round numerical number.
#               - empty means default '1' indentation for html
#                 tag and '0' indentation for webscript content.
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
views_html_head_write_locales() {
        #____path_dest="$1"
        #____locale="$2"
        #____locales_url="$3"
        #____properties="$4"
        #____indent_level="$5"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ "$2" = "" ]; then
                return 1
        fi

        if [ "$3" = "" ]; then
                return 0
        fi


        # execute
        # write the webscript block
        ____locale_tag="sites-user-language"

        ## write script opener
        views_html_write_webscript_opener "$1" "sync" "" "${5:-1}" "$4"
        if [ $? -ne 0 ]; then
                unset ____locale_tag
                return 1
        fi

        ## write load event listener and get into switch casing
        views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${5:-0}" ))")window.addEventListener('load', function() {
$(views_html_get_indent "$(( "${5:-0}" + 1 ))")let previous = localStorage.getItem('${____locale_tag}');
$(views_html_get_indent "$(( "${5:-0}" + 1 ))")switch (previous) {
"
        if [ $? -ne 0 ]; then
                unset ____locale_tag
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
                        unset ____default ____line ____old_IFS ____locale_tag
                        return 1
                fi

                if [ "$____default" = "" ]; then
                        ____default="$____line"
                fi

                views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${5:-0}" + 1 ))")case '${____line%%": "*}':
"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____default ____line ____old_IFS ____locale_tag
                        return 1
                fi

                if [ ! "${____line%%": "*}" = "$2" ]; then
                        views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")localStorage.setItem('${____locale_tag}', '${____line%%": "*}';
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")window.location.href = '${____line#*": "}';
"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____default \
                                        ____line \
                                        ____old_IFS \
                                        ____locale_tag
                                return 1
                        fi
                fi

                views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")break;
"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____default ____line ____old_IFS ____locale_tag
                        return 1
                fi
        done <<EOF
${3}
EOF
        IFS="$____old_IFS"
        unset ____line ____old_IFS

        ## process the default fallback entry
        views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${5:-0}" + 1 ))")default:
"

        if [ ! "${____default%%": "*}" = "$2" ]; then
                views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")localStorage.setItem('${____locale_tag}', '${____line%%": "*}';
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")window.location.href = '${____line#*": "}';
"
                if [ $? -ne 0 ]; then
                        unset ____default ____locale_tag
                        return 1
                fi
        fi

        views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")break;
$(views_html_get_indent "$(( "${5:-0}" + 1 ))")}
$(views_html_get_indent "$(( "${5:-0}" ))"))};
"
        if [ $? -ne 0 ]; then
                unset ____default ____locale_tag
                return 1
        fi
        unset ____default ____locale_tag

        ## write script closer
        views_html_write_webscript_opener "$1" "${5:-1}"
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
                        views_html_head_write_relational_link \
                                "$1" \
                                "alternate" \
                                "${____line#*": "}" \
                                "hreflang: x-default"
                                "${5:-1}"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS ____default
                                return 1
                        fi
                fi
                unset ____default

                views_html_head_write_relational_link \
                        "$1" \
                        "alternate" \
                        "${____line#*": "}" \
                        "hreflang: ${____line%%": "*}"
                        "${5:-1}"
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

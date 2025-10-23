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




# Specifications
#       * https://developer.mozilla.org/en-US/docs/Web/API/PermissionStatus
#       * https://support.google.com/analytics/answer/14562969?hl=en
# Parameters:
#       ____path_dest
#               - COMPULSORY
#               - the destination file to write into.
#       ____google_analytics4_tag
#               - COMPULSORY
#               - the Google Analytics 4 ID tag.
#       ____webscript_permission_tag
#               - COMPULSORY
#               - the webscript permission tag to check user permission
#                 for analytics.
#               - the permission is stored in browser's LocalStorage system.
#               - recommended using no space an dash ('-') separator.
#               - values are aligned with browser's permission status:
#                 'granted', 'denied', 'prompt' or empty ''. Default is
#                 'prompt'.
#               - example: 'site-permissions-analytics'
#       ____properties
#               - OPTIONAL
#               - the "key='value'" properties (e.g. id='...').
#               - multi-line values where each line is an entry.
#               - each entry **MUST** comply to the following
#                 format:
#                                 '[KEY]: [VALUE]'
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
#               - empty means default '1' indentation.
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path_dest'.
#               - error on empty '$____google_analytics4_tag'.
#               - error on empty '$____webscript_permission_tag'.
#               - error on invalid '$____indent_level' (e.g. not a number).
#               - error on bad execution.
views_html_head_vendors_google_write_analytics() {
        #____path_dest="$1"
        #____google_analytics4_tag="$2"
        #____webscript_permission_tag="$3"
        #____properties="$4"
        #____indent_level="$5"


        # validate inputs
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
        ## write script opener
        views_html_write_webscript_opener "$1" "sync" "" "${5:-1}" "$4"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## write load event listener and get into switch casing
        views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( "${5:-0}" ))")window.addEventListener('load', function() {
$(views_html_get_indent "$(( "${5:-0}" + 1 ))")let previous = localStorage.getItem('${3}');
$(views_html_get_indent "$(( "${5:-0}" + 1 ))")switch (previous) {
$(views_html_get_indent "$(( "${5:-0}" + 1 ))")case \"granted\":
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")localStorage.setItem('${3}', 'granted');
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")var script = document.createElement('script');
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")script.type = 'text/javascript';
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")script.src = 'https://www.googletagmanager.com/gtag/js?id=${2}';
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")script.async = true;
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")document.getElementsByTagName('head')[0].appendChild(script);
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")var script = document.createElement('script');
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")script.type = 'text/javascript';
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")script.textContent = 'window.dataLayer = window.dataLayer || [];' +
$(views_html_get_indent "$(( "${5:-0}" + 3 ))")'function gtag(){dataLayer.push(arguments);}' +
$(views_html_get_indent "$(( "${5:-0}" + 3 ))")\"gtag('js', new Date());\" +
$(views_html_get_indent "$(( "${5:-0}" + 3 ))")\"gtag('config', '${2}');\";
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")document.getElementsByTagName('head')[0].appendChild(script);
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")break;
$(views_html_get_indent "$(( "${5:-0}" + 1 ))")case \"denied\":
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")localStorage.setItem('${3}', 'denied');
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")break;
$(views_html_get_indent "$(( "${5:-0}" + 1 ))")case \"prompt\":
$(views_html_get_indent "$(( "${5:-0}" + 1 ))")default:
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")localStorage.setItem('${3}', 'prompt');
$(views_html_get_indent "$(( "${5:-0}" + 2 ))")break;
$(views_html_get_indent "$(( "${5:-0}" + 1 ))")}
$(views_html_get_indent "$(( "${5:-0}" ))"))};
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## write script closer
        views_html_write_webscript_closer "$1" "${5:-1}"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

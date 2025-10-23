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
#               - the service worker webscript source URL.
#       ____is_active_action_webscript
#               - OPTIONAL
#               - the webscript codes for execution once the service
#                 worker is active.
#               - can be left empty for quiet execution.
#       ____state_change_action_webscript
#               - OPTIONAL
#               - the webscript codes for execution on every state
#                 changes during registrations.
#               - a parameter 'event' is available for state processing.
#               - can be left empty for quiet execution.
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
#               - error on empty '$____url'.
#               - error on invalid '$____indent_level' (e.g. not a
#                 number).
#               - error on bad execution.
views_html_head_write_service_workers_registration() {
        #____path_dest="$1"
        #____url="$2"
        #____is_active_action_webscript="$3"
        #____state_change_action_webscript="$4"
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
        views_html_write_webscript_opener "$1" "async" "" "${6:-1}" "$4"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## write webscript body
        views_html_write_raw_content "$1" "\
$(views_html_get_indent "${6:-0}")window.addEventListener('load', function() {
$(views_html_get_indent "$(( ${6:-0} + 1 ))")if('serviceWorker' in navigator) {
$(views_html_get_indent "$(( ${6:-0} + 2 ))")navigator.serviceWorker
$(views_html_get_indent "$(( ${6:-0} + 2 ))").register('${2}')
$(views_html_get_indent "$(( ${6:-0} + 2 ))").then(registration => {
$(views_html_get_indent "$(( ${6:-0} + 3 ))")if (registration.active) {
"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( ${6:-0} + 4 ))")${____line}
"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____line ____old_IFS
                        return 1
                fi
        done<<EOF
${3}
EOF
        IFS="$____old_IFS"
        unset ____line ____old_IFS

        views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( ${6:-0} + 4 ))")return;
$(views_html_get_indent "$(( ${6:-0} + 3 ))")} else if (registration.installing) {
$(views_html_get_indent "$(( ${6:-0} + 4 ))")worker = registration.installing;
$(views_html_get_indent "$(( ${6:-0} + 3 ))")} else if (registration.waiting) {
$(views_html_get_indent "$(( ${6:-0} + 4 ))")worker = registration.waiting;
$(views_html_get_indent "$(( ${6:-0} + 3 ))")}

$(views_html_get_indent "$(( ${6:-0} + 3 ))")if (worker) {
$(views_html_get_indent "$(( ${6:-0} + 4 ))")worker.addEventListener('statechange', (event) => {
"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( ${6:-0} + 5 ))")${____line}
"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____line ____old_IFS
                        return 1
                fi
        done<<EOF
${4}
EOF
        IFS="$____old_IFS"
        unset ____line ____old_IFS

        views_html_write_raw_content "$1" "\
$(views_html_get_indent "$(( ${6:-0} + 4 ))")});
$(views_html_get_indent "$(( ${6:-0} + 3 ))")}
$(views_html_get_indent "$(( ${6:-0} + 2 ))")});
$(views_html_get_indent "$(( ${6:-0} + 1 ))")}
$(views_html_get_indent "${6:-0}")});
"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## write script closer
        views_html_write_webscript_closer "$1" "${6:-1}"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

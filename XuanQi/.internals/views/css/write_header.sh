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
#       ____license_holders
#               - COMPULSORY
#               - license copyright entries.
#               - multiline values where each line is an entry.
#               - no need to prefix '#' comment syntax.
#               - recommended entry format:
#                       'Copyright [YEAR] [AUTHOR] [CONTACT (email/url)]'
#       ____source_notice
#               - OPTIONAL
#               - license notice/body string content or filepath.
#               - no need to prefix '#' comment syntax when using string
#                 content.
#               - when empty, a '# [LICENSE_NOTICE_HERE]' will be rendered
#                 instead.
#               - if it is detected as file (filepath), then it will be
#                 parsed from that file instead of treating it as string
#                 body.
# Outputs:
#       Write to '$____path_dest' File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path_dest'.
#               - error on empty '$____license_holders'.
#               - error on bad execution.
views_css_write_header() {
        #____path_dest="$1"
        #____license_holders="$2"
        #____source_notice="$3"


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


        # execute
        ## write opener
        views_css_write_raw_content "$1" "\
/*
"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## write license copyright holder
        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                if [ ! "$____line" = "" ]; then
                        ____line="${____line#"#"}"
                        ____line=" ${____line#" "}"
                fi

                views_css_write_raw_content "$1" "\
 *${____line}
"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____line ____old_IFS
                        return 1
                fi
        done <<EOF
${2}
EOF
        IFS="$____old_IFS"
        unset ____line ____old_IFS

        ## write separator
        views_css_write_raw_content "$1" "\
 *
 *
"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## write notice
        if [ ! "$3" = "" ]; then
                if [ -f "$3" ] ||
                ([ -L "$3" ] && [ -f "$(readlink --canonicalize "$3")" ]); then
                        ____old_IFS="$IFS"
                        while IFS="" read -r ____line || [ -n "$____line" ]; do
                                if [ ! "$____line" = "" ]; then
                                        ____line="${____line#"#"}"
                                        ____line=" ${____line#" "}"
                                fi

                                views_css_write_raw_content "$1" "\
 *${____line}
"
                                if [ $? -ne 0 ]; then
                                        IFS="$____old_IFS"
                                        unset ____line ____old_IFS
                                        return 1
                                fi
                        done < "$3"
                        IFS="$____old_IFS"
                        unset ____line ____old_IFS
                else
                        ____old_IFS="$IFS"
                        while IFS="" read -r ____line || [ -n "$____line" ]; do
                                if [ ! "$____line" = "" ]; then
                                        ____line="${____line#"#"}"
                                        ____line=" ${____line#" "}"
                                fi

                                views_css_write_raw_content "$1" "\
 *${____line}
"
                                if [ $? -ne 0 ]; then
                                        IFS="$____old_IFS"
                                        unset ____line ____old_IFS
                                        return 1
                                fi
                        done <<EOF
${3}
EOF
                        IFS="$____old_IFS"
                        unset ____line ____old_IFS
                fi
        else
                views_css_write_raw_content "$1" "\
 * [LICENSE_NOTICE_HERE]
"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        fi

        ## write closer
        views_css_write_raw_content "$1" "\
 */
"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

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
#       ____unix_epoch
#               - COMPULSORY
#               - The unix epoch (uint32/uint64) timestamp.
#       ____timezone
#               - OPTIONAL
#               - The custom timezone adjustment.
#               - Strictly in "+HHMM" or "-HHMM" format (e.g.'-0800' or '+0200')
#               - When unset, '+0000' will be used as default UTC.
# Outputs:
#       String
#               - the month in number.
#               - Examples
#                       "1760742707" + "+0230" = "10"
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on bad execution.
entities_format_month() {
        #____unix_epoch="$1"
        #____timezone="$2"


        # validate inputs
        command -v date > /dev/null
        if [ $? -ne 0 ]; then
                printf -- ""
                return 1
        fi

        case "$1" in
        ""|*[!0-9]*)
                printf -- ""
                return 1
                ;;
        *)
                # accepted
                ;;
        esac

        case "$2" in
        "")
                ____timezone="+00:00"
                ;;
        [+-][0-9][0-9][0-9][0-9])
                ## get sign
                ____timezone="${2%%"${2#?}"}"

                ## check hour
                ____sample="${2#?}"
                ____sample="${____sample%??}"
                if [ "$____sample" -lt 0 ] || [ "$____sample" -gt 23 ]; then
                        unset ____sample ____timezone
                        printf -- ""
                        return 1
                fi
                ____timezone="${____timezone}${____sample}:"

                ## check minute
                ____sample="${2#???}"
                if [ "$____sample" -lt 0 ] || [ "$____sample" -gt 59 ]; then
                        unset ____sample ____timezone
                        printf -- ""
                        return 1
                fi
                ____timezone="${____timezone}${____sample}"
                ;;
        *)
                printf -- ""
                return 1
                ;;
        esac
        unset ____sample


        # execute
        if [ "$(echo "$(uname)" | tr '[:upper:]' '[:lower:]')" = "darwin" ]; then
                printf -- "%s" \
                        "$( \
                                TZ="UTC${____timezone}" \
                                date -j -f "%s" "${1}" +"%m" \
                        )"
        else
                printf -- "%s" \
                        "$( \
                                TZ="UTC${____timezone}" \
                                date --date="@${1}" +"%m" \
                        )"
        fi
        if [ $? -ne 0 ]; then
                unset ____timezone
                return 1
        fi
        unset ____timezone


        # report status
        return 0
}




# report import status
return 0

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
#       * https://www.rfc-editor.org/rfc/rfc1035
# Parameters:
#       ____domain_string
#               - COMPULSORY
#               - the domain string to be parsed.
#               - example: www.example.com
# Outputs:
#       String
#               - the sanitized domain string.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____domain_string'.
#               - error on bad execution.
entities_networks_parse_domain() {
        #____domain_string="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        ____sample="$1"
        ____output=""
        ____wildcard=false
        ____count=0
        ____label_count=0
        while [ -n "$____sample" ]; do
                ____char="${____sample%%"${____sample#?}"}"
                ____sample="${____sample#?}"

                case "$____char" in
                "-")
                        if [ "$____label_count" -le 0 ]; then
                                # invalid - label cannot start with dash
                                printf -- ""
                                unset ____char \
                                        ____sample \
                                        ____output \
                                        ____wildcard \
                                        ____count \
                                        ____label_count
                                return 1
                        elif [ "$____wildcard" = "true" ]; then
                                # invalid - wildcard can only be alone
                                printf -- ""
                                unset ____char \
                                        ____sample \
                                        ____output \
                                        ____wildcard \
                                        ____count \
                                        ____label_count
                                return 1
                        fi

                        ____label_count=$(( $____label_count + 1 ))
                        ;;
                ".")
                        if [ "$____label_count" -le 0 ]; then
                                # invalid - empty label
                                printf -- ""
                                unset ____char \
                                        ____sample \
                                        ____output \
                                        ____wildcard \
                                        ____count \
                                        ____label_count
                                return 1
                        fi

                        if [ "${____output##"${____output%?}"}" = "-" ]; then
                                # invalid - label cannot end with dash
                                printf -- ""
                                unset ____char \
                                        ____sample \
                                        ____output \
                                        ____wildcard \
                                        ____count \
                                        ____label_count
                                return 1
                        fi

                        # new label
                        ____wildcard=false
                        ____label_count=0
                        ;;
                "*")
                        if [ ! "$____output" = "" ]; then
                                # invalid - wildcard can only be on the
                                # most left of the domain name.
                                printf -- ""
                                unset ____char \
                                        ____sample \
                                        ____output \
                                        ____wildcard \
                                        ____count \
                                        ____label_count
                                return 1
                        fi

                        ____wildcard=true
                        ____label_count=$(( $____label_count + 1 ))
                        ;;
                *[!0-9a-zA-Z\.\-\*]*)
                        # invalid characters
                        printf -- ""
                        unset ____char \
                                ____sample \
                                ____output \
                                ____wildcard \
                                ____count \
                                ____label_count
                        return 1
                        ;;
                *)
                        # acceptable character
                        if [ "$____wildcard" = "true" ]; then
                                # invalid - wildcard can only be alone
                                printf -- ""
                                unset ____char \
                                        ____sample \
                                        ____output \
                                        ____wildcard \
                                        ____count \
                                        ____label_count
                                return 1
                        fi

                        ____label_count=$(( $____label_count + 1 ))
                        ;;
                esac

                # all good - save to output
                ____output="${____output}${____char}"
                ____count=$(( $____count + 1 ))
                if [ $____label_count -gt 63 ] || [ $____count -gt 255 ]; then
                        # max label count is 62 and overall length is 255
                        printf -- ""
                        unset ____char \
                                ____sample \
                                ____output \
                                ____wildcard \
                                ____count \
                                ____label_count
                        return 1
                fi
        done
        unset ____char \
                ____sample \
                ____wildcard \
                ____count \
                ____label_count

        if [ "${____output##"${____output%?}"}" = "-" ]; then
                # invalid - label cannot end with dash
                printf -- ""
                unset ____output
                return 1
        elif [ "$____output" = "*" ]; then
                # invalid - wildcard cannot be alone
                printf -- ""
                unset ____output
                return 1
        fi


        # all good - output now
        printf -- "%s" "$____output"
        if [ $? -ne 0 ]; then
                unset ____output
                return 1
        fi
        unset ____output


        # report status
        return 0
}




# report import status
return 0

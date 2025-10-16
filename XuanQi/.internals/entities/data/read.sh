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
#       ____filepath
#               - COMPULSORY
#               - The text file to read from.
#               - Capable of reading multi-line value.
#               - Capable of reading multi key:value entries
#                 when '____variable_name' is not set.
#       ____variable_name
#               - OPTIONAL
#               - The key of the value.
#               - When unavailable, the key specified in the
#                 configuration file will be used instead.
#               - Also for specifically read this key:value
#                 pair in a multi key-value pairs configuration
#                 file.
# Outputs:
#       Environment Variable
#               - Set against the key of the value.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____filepath'.
#               - error on bad execution.
entities_data_read() {
        #____filepath="$1"
        #____variable_name="$2"


        # validate target path
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ ! -f "$1" ]; then
                return 1
        fi


        # parse by reading line by line
        ____is_parsing=""
        ____key=""
        ____value=""
        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                # check for opening key
                if [ "$____is_parsing" = "" ]; then
                        ____line="${____line%%#*}"
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ "${____line#*=}" = "$____line" ]; then
                                # line is not key=value
                                continue
                        fi

                        if [ "$____key" = "" ]; then
                                ____key="$( \
                                        entities_strings_trim_whitespace \
                                                ${____line%%=*} \
                                )"

                                if [ ! "$2" = "" ] &&
                                [ ! "$____key" = "$2" ]; then
                                        # seeker key mismatched
                                        unset ____key
                                        continue
                                fi
                        fi

                        ____line="$( \
                                entities_strings_trim_whitespace_left \
                                        "${____line#*=}" \
                        )"
                        case "${____line%%"${____line#?}"}" in
                        "\"")
                                # double quote = single/multi line(s)
                                ____is_parsing="\""
                                ____line="${____line#?}"
                                ;;
                        "\'")
                                # single quote = single/multi line(s)
                                ____is_parsing="'"
                                ____line="${____line#?}"
                                ;;
                        *)
                                # no quote = single line value
                                ____is_parsing="end"
                                ____value="$____line"
                                ;;
                        esac
                fi

                # check ending in case of multi-line value
                case "$____is_parsing" in
                "\"")
                        if [ ! "${____line%"\""}" = "$____line" ] &&
                        [ "${____line%"\\\""}" = "$____line" ]; then
                                ____value="${____value}${____line%"\""}\n"
                                ____is_parsing="end"
                        fi
                        ;;
                "'")
                        if [ ! "${____line%"'"}" = "$____line" ] &&
                        [ "${____line%"\\'"}" = "$____line" ]; then
                                ____value="${____value}${____line%"\""}\n"
                                ____is_parsing="end"
                        fi
                        ;;
                *)
                        ;;
                esac

                # proceed to next step
                case "$____is_parsing" in
                end)
                        export "$____key"="$(printf -- "%b" "$____value")"
                        unset ____key ____value ____is_parsing
                        continue
                        ;;
                "\""|"'")
                        # still continue parsing multi-line values
                        ____value="${____value}${____line}\n"
                        ;;
                *)
                        ;;
                esac
        done < "$1"
        IFS="$____old_IFS"

        unset ____key ____value ____is_parsing ____line ____old_IFS


        # report status
        return 0
}




# report import status
return 0

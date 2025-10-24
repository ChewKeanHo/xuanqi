#!/bin/sh
# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
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
#       ____condition
#               - OPTIONAL
#               - the 'if', 'elif', and 'else' condition type.
#               - when supplied with '*', it renders as 'else' without using
#                 the value.
#               - otherwise, it will be rendered as:
#                       - 'if ${____condition}; then' ($____entry_index == 0)
#                       - 'elif ${____condition}; then'
#               - supply '[ ]' since it's possible to have multi conditions.
#               - multi-lines 1 entry value. (e.g.
#                       "\
#                               [ "$1" = "" ] &&
#                               [ "$2" = "..." ] &&
#                               ...
#                       "
#                 ).
#               - manage the indent on your side. Remember to subtract from
#                 '$____indent'.
#       ____indent
#               - OPTIONAL
#               - the base indent level in round number.
#               - when empty, the indent level will set to '0' (no indent).
#       ____entry_index
#               - OPTIONAL
#               - condition's positional index in round number.
#               - when set to '0' (first entry), set the '$____condition' to
#                 render 'if' instead of 'elif'.
#               - anything else including being empty will render the
#                 condition as 'elif' and 'else'.
# Outputs:
#       Write to '$____path_dest' File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path_dest'.
#               - error on invalid '$____indent' (e.g. not a number).
#               - error on '$____entry_index'='0' and '$____condition'='*'.
#               - error on bad execution.
views_shell_write_if_else_change_condition() {
        #____path_dest="$1"
        #____condition="$2"
        #____indent="$3"
        #____entry_index="$4"


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

        if [ "$2" = "*" ] && [ "$4" = "0" ]; then
                return 1
        fi

        case "$3" in
        "")
                ;;
        *[!0-9]*)
                return 1
                ;;
        *)
                ;;
        esac


        # execute
        case "$2" in
        "*")
                if [ "$4" = "0" ]; then
                        return 1
                fi

                printf -- "%s" "\
$(views_shell_get_indent "${3:-0}")else
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi
                ;;
        *)
                case "$4" in
                0)
                        printf -- "%s" "\
$(views_shell_get_indent "${3:-0}")if ${2}; then
" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                return 1
                        fi
                        ;;
                *)
                        printf -- "%s" "\
$(views_shell_get_indent "${3:-0}")elif ${2}; then
" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                return 1
                        fi
                        ;;
                esac
                ;;
        esac


        # report status
        return 0
}




# report import status
return 0

#!/bin/sh
# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
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
#               - The destination file to write into.
#       ____condition
#               - OPTIONAL
#               - The 'if', 'elif', and 'else' condition type.
#               - When supplied with '*', it renders as 'else' without using
#                 the value.
#               - Otherwise, it will be rendered as:
#                       - 'if ${____condition}; then' ($____entry_index == 0)
#                       - 'elif ${____condition}; then'
#               - Supply '[ ]' since it's possible to have multi conditions.
#               - Multi-lines 1 entry value. (e.g.
#                 "\
#                       [ "$1" = "" ] &&
#                       [ "$2" = "..." ] &&
#                       ...
#                 ").
#               - Manage the indent on your side. Remember to subtract from
#                 $____indent.
#       ____indent
#               - OPTIONAL
#               - The base indent level in round number.
#               - When empty, the indent level will set to '0' (no indent).
#       ____entry_index
#               - OPTIONAL
#               - Condition's positional index in round number.
#               - When set to '0' (first entry), set the $____condition to
#                 render 'if' instead of 'elif'.
#               - Anything else including being empty will render the
#                 condition as 'elif' and 'else'.
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on invalid '$____path_dest' (e.g. 'empty').
#               - error on invalid '$____indent' (e.g. not a number).
#               - error on $____entry_index is '0' and $____condition is '*'.
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


        # execute
        case "$2" in
        "*")
                if [ "$4" = "0" ]; then
                        return 1
                fi

                ____condition="else"
                ;;
        *)
                case "$4" in
                0)
                        ____condition="if ${2}; then"
                        ;;
                *)
                        ____condition="elif ${2}; then"
                        ;;
                esac
                ;;
        esac

        case "$3" in
        "")
                ____indent=0
                ;;
        *[!0-9]*)
                unset ____indent ____condition
                return 1
                ;;
        *)
                ____indent="$3"
                ;;
        esac

        printf -- "%s" "\
$(views_shell_get_indent "$____indent")${____condition}
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                unset ____indent ____condition
                return 1
        fi
        unset ____indent ____condition


        # report status
        return 0
}




# report import status
return 0

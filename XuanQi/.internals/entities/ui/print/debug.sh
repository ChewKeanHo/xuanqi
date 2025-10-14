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
#       ____string
#               - REQUIRED
#               - The string to print out.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - no error raised.
entities_ui_print_debug() {
        #____string="$1"


        # execute
        ____old_IFS="$IFS"
        while IFS="" read -r ____line_print_to_stderr || \
        [ -n "$____line_print_to_stderr" ]; do
                case "$TERM" in
                xterm-color|*-256color)
                        1>&2 printf -- "%b" "\
\\033[1;35mD:\\033[0m \\033[35m${____line_print_to_stderr}\\033[0m
"
                        ;;
                *)
                        # formatting terminal is unavailable
                        1>&2 printf -- "%b" "\
D: ${____line_print_to_stderr}
"
                        ;;
                esac
        done<<EOF
${1%"
"}
EOF
        IFS="$____old_IFS"
        unset ____line_print_to_stderr ____old_IFS


        # report status
        return 0
}




# report import status
return 0

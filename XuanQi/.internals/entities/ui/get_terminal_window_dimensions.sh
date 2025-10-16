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
# Returns:
#       String Array
#               - '[X] [Y] [Z]' on respective axies.
#               - default value (80) returns if no terminal program is
#                 available.
#       Return Code
#               - '0' means ok; error otherwise.
#               - no error raised.
entities_ui_get_terminal_window_dimensions() {
        # execute
        command -v stty 2> /dev/null
        if [ $? -eq 0 ]; then
                printf -- "%s" "$(stty size) 0"
                return 0
        fi

        command -v tput 2> /dev/null
        if [ $? -eq 0 ]; then
                printf -- "%s" "$(tput lines) $(tput cols) 0"
                return 0
        fi

        printf -- "%s" "80 80 80"


        # report status
        return 1
}




# report import status
return 0

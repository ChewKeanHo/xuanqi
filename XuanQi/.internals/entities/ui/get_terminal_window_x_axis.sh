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
#       String
#               - '[NUMBER]' on x-axis (column sizes).
#               - default to 80 if no determiner is found.
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on bad execution.
entities_ui_get_terminal_window_x_axis() {
        # execute
        ____number="$(entities_ui_get_terminal_window_dimensions)"
        printf -- "%s" "${____number%% *}"
        if [ $? -ne 0 ]; then
                unset ____number
                return 1
        fi
        unset ____number


        # report status
        return 0
}




# report import status
return 0

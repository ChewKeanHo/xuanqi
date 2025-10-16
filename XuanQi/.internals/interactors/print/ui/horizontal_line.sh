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
#       Offset    - Number type.
#                 - OPTIONAL
#                 - Remove excessive length caused by indicator characters
#                   (e.g. 3 for 'I: ' prefix).
#       Character - String type.
#                 - OPTIONAL
#                 - To change the character into something else. Default
#                   is EM line ('—').
# Returns:
#       String
#               - '[NUMBER]' on x-axis (column sizes).
#               - default to 80 if no determiner is found.
#       Return Code
#               - '0' means ok; error otherwise.
#               - error when given offset is not a number.
#               - error on bad execution.
interactors_print_ui_horizontal_line() {
        #____offset="$1"
        #____character="$2"


        # execute
        entities_ui_components_get_horizontal_line "$1" "$2"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

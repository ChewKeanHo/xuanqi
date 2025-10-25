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
#       - To report into the control user interface that a specific
#         target file is being executed.
#       - You must supply the formatted subject as the only single
#         parameter or otherwise, you get an error with no reporting.
#       - The print out is automatically translated with respect to
#         '$XUANQI_LANGUAGE'. Hence, make sure the provided subject
#         is translation independent. Otherwise, you need to translate
#         on your side.
# Parameters:
#       ____target
#               - OPTIONAL
#               - The subject being executed.
# Outputs:
#       Console STDERR Output
#               - Empty when given empty.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Error when '$____target' is empty.
XuanQi_Responses_Executing() {
        #____target="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        interactors_print_info "$(interactors_print_responses_executing "$1")"


        # report status
        return 0
}




# report import status
return 0

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
#       - To report into the control user interface that a recent
#         execution went bad.
#       - The print out is automatically translated with respect to
#         '$XUANQI_LANGUAGE'.
# Parameters:
# Outputs:
#       Console STDERR Output
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Always 0
XuanQi_Responses_Errors_Bad_Execution() {
        # execute
        interactors_print_error \
                "$(interactors_print_responses_errors_bad_execution)"


        # report status
        return 0
}




# report import status
return 0

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
#               - the brand's pitch content.
#               - empty on error.
#       Return Code
#               - '0' means ok; error otherwise.
#               - error when internal file is missing.
#               - error when internal file is unreadable.
interactors_print_responses_errors_parse_directory_configs() {
        # validate inputs
        ____path="\
${XUANQI_PATH_ROOT}/entities/docs/responses/errors/parse_directory_configs/${XUANQI_LANGUAGE}.txt\
"
        if [ ! -f "$____path" ]; then
                # fallback to english
                ____path="\
${XUANQI_PATH_ROOT}/entities/docs/responses/errors/parse_directory_configs/en.txt\
"
        fi


        # execute
        entities_fs_read_text_file "$____path"
        if [ $? -ne 0 ]; then
                unset ____path
                return 1
        fi
        unset ____path


        # report status
        return 0
}




# report import status
return 0

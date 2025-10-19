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




# define all directory paths if unset
XUANQI_DIRECTORY_LOGS="${XUANQI_DIRECTORY_LOGS:-"logs"}"
XUANQI_DIRECTORY_PUBLIC="${XUANQI_DIRECTORY_PUBLIC:-"public"}"
XUANQI_DIRECTORY_TEMPS="${XUANQI_DIRECTORY_TEMPS:-"tmp"}"




# locate all internal system paths
____old_IFS="$IFS"
while IFS="" read -r ____line || [ -n "$____line" ]; do
        if [ "$____line" = "" ]; then
                continue
        fi

        if [ ! -e "${PROJECT_PATH_ROOT}/${____line#*": "}" ]; then
                continue
        elif [ -d "${PROJECT_PATH_ROOT}/${____line#*": "}" ]; then
                interactors_print_info "\
$(interactors_print_responses_removing "\$${____line%%": "*}")
"
                interactors_fs_delete "${PROJECT_PATH_ROOT}/${____line#*": "}"
                continue
        fi
done<<EOF
XUANQI_PATH_LOGS: ${XUANQI_DIRECTORY_LOGS}
XUANQI_PATH_PUBLIC: ${XUANQI_DIRECTORY_PUBLIC}
XUANQI_PATH_TEMPS: ${XUANQI_DIRECTORY_TEMPS}
EOF




# report status
return 0

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




# Specification:
#   * https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps
#   * https://github.com/w3c/manifest/wiki/Platforms
#   * https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration
#   * https://developer.mozilla.org/en-US/docs/Web/API/Push_API
# Parameters:
#       ____path_dest
#               - REQUIRED
#               - The destination filepath to write into.
#       ____content
#               - OPTIONAL
#               - The actual raw content to be written verbatim into the
#                 targeted PWA configuration file.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
views_pwa_write_raw_content() {
        #____path_dest="$1"
        #____content="$2"


        # execute
        printf -- "%s" "$2" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

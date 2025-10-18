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
#       ____unix_epoch
#               - COMPULSORY
#               - The unix epoch (uint32/uint64) timestamp.
#       ____timezone
#               - OPTIONAL
#               - The custom timezone adjustment.
#               - Strictly in "+HHMM" or "-HHMM" format (e.g.'-0800' or '+0200')
#               - When unset, '+0000' will be used as default UTC.
# Outputs:
#       String
#               - the timestamp string in the following format:
#                   "WeekDay, Day Month Year Hour:Minute:Second Timezone"
#               - Examples
#                   "1760742707" + "+0230" = "Sat, 18 Oct 2025 01:41:47 +0230"
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on bad execution.
entities_time_format_RFC5322() {
        #____unix_epoch="$1"
        #____timezone="$2"


        # execute
        entities_time_format "%a, %d %b %Y %H:%M:%S %z" "$1" "$2"
        if [ $? -ne 0 ]; then
                printf -- ""
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

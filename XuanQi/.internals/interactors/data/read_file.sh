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
#       ____filepath
#               - COMPULSORY
#               - The text file to read from.
#               - Capable of reading multi-line value.
#               - Capable of reading multi key:value entries
#                 when '____variable_name' is not set.
#       ____variable_name
#               - OPTIONAL
#               - The key of the value.
#               - When unavailable, the key specified in the
#                 configuration file will be used instead.
#               - Also for specifically read this key:value
#                 pair in a multi key-value pairs configuration
#                 file.
# Outputs:
#       Environment Variable
#               - Set against the key of the value.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____filepath'.
#               - error on bad execution.
interactors_data_read_file() {
        #____filepath="$1"
        #____variable_name="$2"


        # execute
        entities_data_read "$1"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

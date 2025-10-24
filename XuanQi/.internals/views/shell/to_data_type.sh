#!/bin/sh
# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
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
#       ____data_type
#               - COMPULSORY
#               - the data type.
#               - will be rendered as comment.
#               - e.g. '# number'.
#       ____data_value
#               - OPTIONAL
#               - the data value.
#               - will be rendered as value then append with type comment.
#               - e.g. '5 # number'.
# Outputs:
#       String
#               - the rendered type statement string.
#               - empty on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____data_type'.
#               - error on bad execution.
views_shell_to_data_type() {
        #____data_type="$1"
        #____data_value="$2"


        # validate inputs
        if [ "$1" = "" ]; then
                printf -- ""
                return 1
        fi


        # execute
        if [ ! "$2" = "" ]; then
                printf -- "%s # %s" "$2" "$1"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        else
                printf -- "# %s" "$1"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        fi


        # report status
        return 0
}




# report import status
return 0

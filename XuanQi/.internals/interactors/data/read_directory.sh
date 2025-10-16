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
#       ____directory_path
#               - COMPULSORY
#               - The data directory to read form.
#               - Read recursively looking for ".conf" file extension
#                 text file.
#               - Resolve symlink.
# Outputs:
#       Environment Variable
#               - Set against the key of the value from the conf file.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____directory_path'.
#               - error on invalid '____directory_path'.
#               - error on bad execution.
interactors_data_read_directory() {
        #____directory_path="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ ! -d "$1" ]; then
                return 1
        elif [ -L "$1" ]; then
                if [ ! -d "$(readlink --canonicalize "$1")" ]; then
                        return 1
                fi
        fi


        # execute
        for ____item in "${1}/"*; do
                if [ -d "$____item" ]; then
                        interactors_data_read_directory "$____item"
                        continue
                elif [ ! -f "$____item" ]; then
                        continue
                fi

                if [ ${____item%".conf"} = "$____item" ]; then
                        continue
                fi

                if [ ! ${____item#"."} = "$____item" ]; then
                        continue # do not import hidden file
                fi

                if [ ! ${____item#"~"} = "$____item" ]; then
                        continue # do not import temporary file
                fi

                interactors_data_read_file "$____item"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        done


        # report status
        return 0
}




# report import status
return 0

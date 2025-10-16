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
#       ____path_source
#               - input directory path.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error when given path is empty.
#               - error when given path is invalid.
#               - error on bad execution.
unset interactors_libraries_parse_directory # remove persenter's early version
interactors_libraries_parse_directory() {
        #____path_source="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ ! -d "$1" ]; then
                return 1
        fi


        # execute
        for ____item in "${1}/"*; do
                if [ -d "$____item" ]; then
                        interactors_libraries_parse_directory "$____item"
                        continue
                elif [ ! -f "$____item" ]; then
                        continue
                fi

                if [ ${____item%".sh"} = "$____item" ]; then
                        continue
                fi

                if [ ${____item%"_test.sh"} = "$____item" ]; then
                        continue # do not include test file
                fi

                if [ ! ${____item#"."} = "$____item" ]; then
                        continue # do not import hidden file
                fi

                if [ ! ${____item#"~"} = "$____item" ]; then
                        continue # do not import temporary file
                fi

                . "$____item"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        done


        # report status
        return 0
}




# report import status
return 0

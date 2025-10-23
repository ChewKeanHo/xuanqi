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
#       ____name
#               - OPTIONAL
#               - the configuration name.
# Outputs:
#       String
#               - the content.
#               - default printout when empty.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on bad execution.
interactors_print_help_config_index() {
        #____name="$1"


        # validate inputs
        ____path="${XUANQI_PATH_ROOT}/entities/docs/configs"
        if [ -f "${____path}/${1}/${XUANQI_LANGUAGE}.txt" ]; then
                ____path="${____path}/${1}/${XUANQI_LANGUAGE}.txt"
        elif [ -f "${____path}/${1}/en.txt" ]; then
                ____path="${____path}/${1}/en.txt"
        elif [ ! -f "$____path" ]; then
                ____path="${____path}/help/en.txt"

                # print heading
                entities_fs_read_text_file "$____path"
                printf -- "\n\n"

                # loop through each variables and print out
                for ____line in "${XUANQI_PATH_ROOT}/entities/docs/configs/"*; do
                        if [ ! -d "$____line" ]; then
                                continue
                        fi

                        ____line="${____line%/}"
                        if [ ! "${____line%"default"}" = "$____line" ]; then
                                continue
                        elif [ ! "${____line%"help"}" = "$____line" ]; then
                                continue
                        fi

                        if [ ! -f "${____line}/${XUANQI_LANGUAGE}.txt" ] &&
                        [ ! -f "${____line}/en.txt" ]; then
                                continue
                        fi

                        printf -- "%s" "\
* ${____line##*/}
"
                done

                # report as error
                return 1
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

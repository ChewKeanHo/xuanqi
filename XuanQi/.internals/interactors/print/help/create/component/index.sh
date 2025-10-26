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
#               - the component type.
#               - open index page when left empty.
# Outputs:
#       String
#               - the content.
#               - default printout when empty.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on bad execution.
interactors_print_help_create_component_index() {
        #____name="$1"


        # validate inputs
        ____path="${XUANQI_PATH_ROOT}/entities/docs/help/create/component"
        if [ -f "${____path}/${1}/${XUANQI_LANGUAGE}.md" ]; then
                ____path="${____path}/${1}/${XUANQI_LANGUAGE}.md"
        elif [ -f "${____path}/${1}/en.md" ]; then
                ____path="${____path}/${1}/en.md"
        elif [ ! -f "$____path" ]; then
                ____path="${____path}/help/en.md"

                # print heading
                entities_fs_read_text_file "$____path"
                printf -- "\n\n"

                # loop through each type and print out
                for ____line in "${XUANQI_PATH_ROOT}/entities/docs/help/create/component/"*; do
                        if [ ! -d "$____line" ]; then
                                continue
                        fi

                        ____line="${____line%/}"
                        if [ ! "${____line%"default"}" = "$____line" ]; then
                                continue
                        elif [ ! "${____line%"help"}" = "$____line" ]; then
                                continue
                        fi

                        if [ ! -f "${____line}/${XUANQI_LANGUAGE}.md" ] &&
                        [ ! -f "${____line}/en.md" ]; then
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

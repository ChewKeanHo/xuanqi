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
#       ____path_dest
#               - COMPULSORY
#               - the destination file to write into.
#       ____data_line
#               - COMPULSORY
#               - the full raw data line to process empty line,
#                 comment line, and entry with tailing comment line.
#                 It reacts by the following:
#                       - ''          -> '\n' (new line)
#                       - '# ...'     -> '# ...' (commented line)
#                       - 'ENTRY # ...' -> 'OUTPUT # ...' (tailing comment)
#       ____data_key
#               - COMPULSORY
#               - the 'key' content of a 'key=value' entry.
#               - **MUST** be environment variable compatible name.
#       ____data_value
#               - OPTIONAL
#               - the 'value' content of a 'key=value' entry.
#               - can be left empty.
#       ____data_type
#               - OPTIONAL
#               - the data type of a 'key=value' entry.
#               - unused since Shell is not a strong type language.
#               - either leave it empty or define it for brevity.
#       ____data_prefix
#               - OPTIONAL
#               - the package or library name for prefixing before
#                 $____data_key.
#               - **MUST** be environment variable compatible name.
#               - leaving this empty will let $____data_key to dictate
#                 the entire key definition.
#               - if set, the final key output will be something as such:
#                           '${____data_prefix}_${____data_key}'
#                 where:
#                       1. Both are connected with an underscore.
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path_dest'.
#               - error on bad execution.
interactors_shell_write_enums_content() {
        #____path_dest="$1"
        #____data_line="$2"
        #____data_key="$3"
        #____data_value="$4"
        #____data_type="$5"
        #____data_prefix="$6"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ ! "${1%/*}" = "$1" ]; then
                if [ -d "${1%/*}" ]; then
                        : # accepted
                elif [ -L "${1%/*}" ] &&
                [ -d "$(readlink --canonicalize "$1")" ]; then
                        : # accepted
                else
                        return 1
                fi
        fi


        # execute
        views_shell_write_enums_content "$1" "$2" "$3" "$4" "$5" "$6"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

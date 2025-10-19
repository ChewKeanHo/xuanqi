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
#       ____path_dest
#               - COMPULSORY
#               - The destination file to write into.
#       ____data_line
#               - COMPULSORY
#               - The full raw data line to process empty line,
#                 comment line, and entry with tailing comment line.
#                 It reacts by the following:
#                       - ''          -> '\n' (new line)
#                       - '# ...'     -> '# ...' (commented line)
#                       - 'ENTRY # ...' -> 'OUTPUT # ...' (tailing comment)
#       ____data_key
#               - COMPULSORY
#               - The 'key' content of a 'key=value' entry.
#               - **MUST** be environment variable compatible name.
#       ____data_value
#               - OPTIONAL
#               - The 'value' content of a 'key=value' entry.
#               - Can be left empty.
#       ____data_type
#               - OPTIONAL
#               - The data type of a 'key=value' entry.
#               - Unused since Shell is not a strong type language.
#               - Either leave it empty or define it for brevity.
#       ____data_prefix
#               - OPTIONAL
#               - The package or library name for prefixing before
#                 $____data_key.
#               - **MUST** be environment variable compatible name.
#               - Leaving this empty will let $____data_key to dictate
#                 the entire key definition.
#               - If set, the final key output will be something as such:
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
#               - error on invalid '$____path_dest' (e.g. 'empty').
#               - error on bad execution.
views_shell_write_enums_content() {
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
        ____output=""
        if [ "$2" = "" ]; then
                # it's an empty line
                printf -- "\n" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi

                return 0
        elif [ "${2%%#*}" = "" ]; then
                # it's a comment line
                printf -- "%s\n" "# ${2#"# "}" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi

                return 0
        fi

        ## it's an actual content with optional tailing comment setup line
        ____output="\
${6}_$(printf -- "%s" "$3" | tr '[:lower:]' '[:upper:]')=${4}\
"

        ## setup comment
        if [ ! "${2#*"# "}" = "$2" ]; then
                ____output="${____output} # ${2#*"# "}"
        fi

        ## all right - write now
        printf -- "%s\n" "$____output" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                unset ____output
                return 1
        fi
        unset ____output


        # report status
        return 0
}




# report import status
return 0

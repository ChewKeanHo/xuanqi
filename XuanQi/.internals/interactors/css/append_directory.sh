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
#       ____path_target
#               - COMPULSORY
#               - the target CSS directory to parse from.
# Outputs:
#       Write to '$____path_dest' File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path_dest'.
#               - error on empty/invalid '$____path_target'.
#               - error on bad execution.
interactors_css_append_directory() {
        #____path_dest="$1"
        #____path_target="$2"


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

        if [ "$2" = "" ]; then
                return 1
        fi

        if [ -d "$2" ]; then
                : # accepted
        elif [ -L "$2" ] && [ -d "$(readlink --canonicalize "$2")" ]; then
                : # accepted
        else
                return 1
        fi


        # execute
        for ____item in "${2}/"*; do
                if [ -d "$____item" ]; then
                        interactors_css_append_directory "$____item"
                        continue
                elif [ -f "$____item" ]; then
                        : # accepted
                elif [ -L "$____item" ]; then
                        ____item="$(readlink --canonicalize "$____item")"
                        if [ -d "$____item" ]; then
                                interactors_css_append_directory "$____item"
                                continue
                        elif [ -f "$____item" ]; then
                                : # accepted
                        else
                                continue
                        fi
                else
                        continue
                fi

                if [ ${____item%".css"} = "$____item" ]; then
                        continue
                fi

                if [ ${____item%"_test.css"} = "$____item" ]; then
                        continue
                fi

                if [ ! ${____item#"."} = "$____item" ]; then
                        continue # do not import hidden file
                fi

                if [ ! ${____item#"~"} = "$____item" ]; then
                        continue # do not import temporary file
                fi

                interactors_css_append_file "$1" "$____item"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        done


        # report status
        return 0
}




# report import status
return 0

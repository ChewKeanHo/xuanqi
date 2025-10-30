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
#               - the target CSS file to parse from.
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
entities_fs_append_text_file() {
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

        if [ -f "$2" ]; then
                : # accepted
        elif [ -L "$2" ] && [ -f "$(readlink --canonicalize "$2")" ]; then
                : # accepted
        else
                return 1
        fi


        # execute
        ____state=0
        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                case "$____state" in
                0)
                        if [ "$____line" = "" ]; then
                                ____state=1
                                continue
                        elif [ "${____line%%"[//]: #"*}" = "" ]; then
                                # markdown comment
                                continue
                        elif [ "${____line%%"#"*}" = "" ]; then
                                # hash comment
                                continue
                        elif [ "${____line%%"//"*}" = "" ]; then
                                # c comment
                                continue
                        elif [ "${____line%%"/*"*}" = "" ] ||
                        [ "${____line%%" *"*}" = "" ] ||
                        [ "${____line%%"*/"*}" = "" ]; then
                                # css comment
                                continue
                        fi

                        ____state=1
                        ;;
                1)
                        if [ "$____line" = "" ]; then
                               continue
                        fi

                        ____state=2
                        ;;
                *)
                        ;;
                esac

                printf -- "%s" "\
${____line}
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____line ____state ____old_IFS
                        return 1
                fi
        done < "$2"
        IFS="$____old_IFS"
        unset ____line ____state ____old_IFS


        # report status
        return 0
}




# report import status
return 0

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
#       ____path
#               - REQUIRED
#               - The source filepath to read from.
# Returns:
#       Content
#               - string type.
#               - returns in a single bulk to STDOUT. Make sure not to read
#                 large file.
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty value.
#               - error on missing file.
#               - error on read failure.
entities_fs_read_text_file() {
        #____path="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ ! -f "$1" ]; then
                return 1
        fi


        # execute
        ____output=""
        ____state=0
        ____old_IFS="$IFS"
        while IFS= read -r ____line || [ -n "$____line" ]; do
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

                if [ ! "$____output" = "" ]; then
                        ____output="${____output}
"
                fi
                ____output="${____output}${____line}"
        done < "$1"
        IFS="$____old_IFS"
        unset ____line ____state ____old_IFS


        # print out
        printf -- "%s" "$____output"


        # report status
        return 0
}




# report import status
return 0

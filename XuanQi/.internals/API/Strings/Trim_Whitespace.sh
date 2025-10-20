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




# Specifications:
#       - To trim a given string's whitespaces most left and most right
#         until both sides are meeting with a non-whitespace characters.
#       - Whitespace refers to space (' '), tab ('\t'), newline ('\n'),
#         return carrier ('\r'), and vertical tab ('\v').
#       - When given an empty string, this function does nothing.
#       - This function generates output so you have to capture the
#         output back rather than checking its return code. Example:
#         1. ____my_fav_variable="$(\
#         2.         XuanQi_Strings_Trim_Whitespace "  Sample Text     " \
#         3. )"
#         4. # yields -> ____my_fav_variable="Sample Text"
# Parameters:
#       ____content
#               - OPTIONAL
#               - The string for trimming.
# Outputs:
#       String
#               - The trimmed string.
#               - Empty when given empty.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - always 0.
XuanQi_Strings_Trim_Whitespace() {
        #____content="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                printf -- ""
                return 0
        fi


        # execute
        interactors_strings_trim_whitespace "$1"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

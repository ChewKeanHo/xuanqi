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
#       ____filepath
#               - COMPULSORY
#               - The text file to read from.
#               - Capable of reading multi-line value.
#               - Capable of reading multi key:value entries
#                 when '____variable_name' is not set.
#       ____key
#               - COMPULSORY
#               - The key of the key:value entry.
#               - Must be an environment variable name.
#       ____value
#               - COMPULSORY
#               - The value of the key:value entry.
#               - Can be empty.
#       ____license_header
#               - OPTIONAL
#               - The license notice content without any comment
#                 symbol. This will be first written at the top
#                 of the file.
#       ____entry_comment_doc
#               - OPTIONAL
#               - The documentation of the key:value without any
#                 comment symbol.
#               - When available, it will be commented out and
#                 prefix on top of the key:value line.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____filepath'.
#               - error on existing file.
#               - error on empty '____key'.
#               - error on bad execution.
interactors_data_write_file() {
        #____filepath="$1"
        #____key="$2"
        #____value="$3"
        #____header_comment_license="$4"
        #____entry_comment_doc"$5"


        # execute
        entities_data_write "$1" "$2" "$3" "$4" "$5"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

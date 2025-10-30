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
#       - To reliably generate the source code's header (e.g. license head).
# Parameters:
#       ____path_dest
#               - COMPULSORY
#               - The destination file to write into.
#               - Resolve symlink.
#       ____license_holders
#               - OPTIONAL
#               - License copyright entries.
#               - Multiline values where each line is an entry.
#               - No need to prefix '#' comment syntax.
#               - Recommended entry format:
#                  'Copyright [YEAR] [AUTHOR] [CONTACT (email/url)]'
#               - When left empty, a copyright holder sample is used.
# Outputs:
#       Write to '$____path_dest' File
#               - The rendered output written into file.
#               - No action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - Error on empty/invalid '$____path_dest'.
#               - Error on bad execution.
XuanQi_CSS_Write_Header() {
        #____path_dest="$1"
        #____license_holders="$2"


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
        interactors_css_write_header \
                "$1" \
                "${2:-"$(interactors_print_license_sample_copyright_holder)"}" \
                "$(interactors_print_license_notice)"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

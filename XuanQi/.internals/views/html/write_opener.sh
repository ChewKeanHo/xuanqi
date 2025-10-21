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
#       ____charset
#               - COMPULSORY
#               - the charset being used in this HTML sheet.
#       ____language
#               - COMPULSORY
#               - the language of the HTML content.
#       ____base_url
#               - COMPULSORY
#               - the base URL for all relative URL resolution.
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on invalid '$____path_dest' (e.g. 'empty').
#               - error on invalid '$____charset' (e.g. 'empty').
#               - error on invalid '$____language' (e.g. 'empty').
#               - error on invalid '$____base_url' (e.g. 'empty').
#               - error on bad execution.
views_html_write_opener() {
        #____path_dest="$1"
        #____charset="$2"
        #____language="$3"
        #____base_url="$4"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ "$2" = "" ]; then
                return 1
        fi

        if [ "$3" = "" ]; then
                return 1
        fi

        if [ "$4" = "" ]; then
                return 1
        fi


        # execute
        printf -- "%s" "\
<!DOCTYPE html>
<html lang='${3}'>
<head>
$(views_html_get_indent 1)<meta charset='${2}' />
$(views_html_get_indent 1)<meta http-equiv='Content-Type'
$(views_html_get_indent 2)content='text/html; charset=${2}'
$(views_html_get_indent 1)/>
$(views_html_get_indent 1)<base href='${4}' />
$(views_html_get_indent 1)<meta name='viewport'
$(views_html_get_indent 2)content='width=device-width, initial-scale=1.0'
$(views_html_get_indent 1)/>
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

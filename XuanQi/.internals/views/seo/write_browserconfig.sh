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




# Specification:
#   * https://learn.microsoft.com/browserconfig.xml
# Parameters:
#       ____path_dest
#               - REQUIRED
#               - The destination filepath to write into.
#       ____contents
#               - REQUIRED
#               - All thumbnail entries.
#               - This is a multi-dimentional multi-line value where each line
#                 is a new entry.
#               - Each entry **MUST** comply to the following format:
#                                       '[SIZE], [URL]'
#                 where:
#                       ', '
#                               - the delimiter separator.
#                       [SIZE]
#                               - the size of the image. Must supply all the
#                                 following sizes:
#                                       * '70x70'
#                                       * '150x150'
#                                       * '310x150'
#                                       * '310x310'
#                       [URL]
#                               - the url to load the image.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
views_seo_write_browserconfig() {
        #____path_dest="$1"
        #____content="$2"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ "$2" = "" ]; then
                return 1
        fi


        # execute
        # write opener
        printf -- "%s" "\
<?xml version=\"1.0\" encoding=\"utf-8\"?>
<browserconfig>
	<msapplication>
		<tile>
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # process each entry
        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                if [ "$____line" = "" ]; then
                        continue
                fi

                case "${____line%%": "*}" in
                "70x70")
                        printf -- "%s" "\
			<square70x70logo src=\"${____line#*": "}\" />
" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS
                                return 1
                        fi
                        ;;
                "150x150")
                        printf -- "%s" "\
			<square150x150logo src=\"${____line#*": "}\" />
			<TileImage src=\"${____line#*": "}\" />
" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS
                                return 1
                        fi
                        ;;
                "310x150")
                        printf -- "%s" "\
			<wide310x150logo src=\"${____line#*": "}\" />
" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS
                                return 1
                        fi
                        ;;
                "310x310")
                        printf -- "%s" "\
			<square310x310logo src=\"${____line#*": "}\" />
" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS
                                return 1
                        fi
                        ;;
                *)
                        ;;
                esac
        done<<EOF
${2}
EOF
        IFS="$____old_IFS"
        unset ____line ____old_IFS


        # write closer
        printf -- "%s" "\
		</tile>
	</msapplication>
</browserconfig>
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

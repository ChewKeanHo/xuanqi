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
#   * https://www.sitemaps.org/protocol.html
# Parameters:
#       ____path_dest
#               - REQUIRED
#               - The destination filepath to write into.
#       ____contents
#               - REQUIRED
#               - Each sitemap url entry. This is a multi-dimentional
#                 multi-line value where each line is a new entry.
#               - Maximum entries are 50,000 units per sitemap.xml.
#               - Each entry **MUST** comply to the following format:
#                  '[CHANGE_FREQUENCY] |,| [PRIORITY] |,| [LAST_MOD] |,| [URL]'
#                 where:
#                       ' |,| '
#                               - the delimiter separator.
#                       [CHANGE_FREQUENCY]
#                               - the entry change frequency. Only accepts:
#                                       'always'  - change on every access.
#                                       'hourly'  - change every hour.
#                                       'daily'   - change daily.
#                                       'weekly'  - change weekly.
#                                       'monthly' - change monthly.
#                                       'yearly'  - change yearly.
#                                       'never'   - never change.
#                       [PRIORITY]
#                               - the priority value from '0.1' to '1.0'.
#                               - default is '0.5'.
#                               - value beyond 1.0 (e.g. 2.0) will auto-correct
#                                 back to 1.0 max value.
#                       [LAST_MOD]
#                               - the last modified timestamp using W3C datetime
#                                 format:
#                                       'YYYY-MM-DDTHH:MM:SS:+ZH:ZM'
#                                 like:
#                                       * '2005-01-01'
#                                       * '2004-10-01T18:23:17+00:00'
#                       [URL]
#                               - the url to crawl.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - If the total '____content' is beyond 50,000 entries, the
#                 function generates up until 50,000 entry and will return
#                 as error. Anything beyond are discarded.
views_seo_write_sitemap_content() {
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
<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>
<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\"
	xmlns:xhtml=\"http://www.w3.org/1999/xhtml\">
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # process each entry
        ____count=0
        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                if [ "$____line" = "" ]; then
                        continue
                fi

                ## parse values
                ____frequency="${____line%%" |,| "*}"
                ____line="${____line##*" |,| "}"

                ____priority="${____line%%" |,| "*}"
                ____line="${____line##*" |,| "}"

                ____last_mod="${____line%%" |,| "*}"
                ____line="${____line##*" |,| "}"

                ## ok - write now
                printf -- "%s" "\
	<url>
		<loc>${____line}</loc>
		<lastmod>${____last_mod}</lastmod>
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____last_mod \
                                ____priority \
                                ____frequency \
                                ____line \
                                ____count \
                                ____old_IFS
                        return 1
                fi

                ## write change frequency when available
                case "$____frequency" in
                always|hourly|daily|weekly|monthly|yearly|never)
                        printf -- "%s" "\
		<changefreq>${____frequency}</changefreq>
" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____last_mod \
                                        ____priority \
                                        ____frequency \
                                        ____line \
                                        ____count \
                                        ____old_IFS
                                return 1
                        fi
                        ;;
                *)
                        ;;
                esac

                ## write change frequency when available
                case "$____priority" in
                ""|*[!0-9\.])
                        ;;
                0|"0.0")
                        printf -- "%s" "\
		<priority>0.0</priority>
" >> "${1}.tmp"
                        ;;
                [!0].*)
                        printf -- "%s" "\
		<priority>1.0</priority>
" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____last_mod \
                                        ____priority \
                                        ____frequency \
                                        ____line \
                                        ____count \
                                        ____old_IFS
                                return 1
                        fi
                        ;;
                *)
                        printf -- "%s" "\
		<priority>${____priority}</priority>
" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____last_mod \
                                        ____priority \
                                        ____frequency \
                                        ____line \
                                        ____count \
                                        ____old_IFS
                                return 1
                        fi
                esac

                ## ok - write closer
                printf -- "%s" "\
	</url>
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____last_mod \
                                ____priority \
                                ____frequency \
                                ____line \
                                ____count \
                                ____old_IFS
                        return 1
                fi

                ## increase count
                ____count=$(( $____count + 1 ))

                ## check max count per sitemap - close the file and bail out
                ## as error it is going beyond.
                if [ $____count -ge 50000 ]; then
                        break
                fi
        done<<EOF
${2}
EOF
        IFS="$____old_IFS"
        unset ____last_mod \
                ____priority \
                ____frequency \
                ____line \
                ____old_IFS


        # write closer
        printf -- "%s" "\
</urlset>
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                unset ____count
                return 1
        fi


        # report status
        if [ $____count -ge 50000 ]; then
                unset ____count
                return 1
        fi
        unset ____count

        return 0
}




# report import status
return 0

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
#   * https://developer.mozilla.org/en-US/docs/Glossary/Robots.txt
#   * https://developer.mozilla.org/en-US/docs/Web/Security/Practical_implementation_guides/Robots_txt
# Parameters:
#       ____path_dest
#               - REQUIRED
#               - The destination filepath to write into.
#       ____sitemaps
#               - OPTIONAL
#               - The list of sitemaps relative URLs to instruct the robots
#                 to parse.
#               - This is a multi-line string where each line is a new entry.
#       ____robots
#               - REQUIRED
#               - The list of robots instructions.
#               - This is a multi-line string where each line is a new entry.
#               - Each entry **MUST** comply to the following format:
#                       '[TYPE]: [VALUE]'
#                 where:
#                       ': '    = the delimiter separator.
#                       [TYPE]  = instruction type. Only supports:
#                                       * 'User-agent'
#                                       * 'Allow'
#                                       * 'Disallow'
#                                       * 'Crawl-delay'
#                       [VALUE] = corresponding values. Only supports:
#                                       * 'User-agent'
#                                               - name of the robot. '*' for
#                                                 all.
#                                       * 'Allow'
#                                               - url pathing advices for robot
#                                                 to crawl.
#                                       * 'Disallow'
#                                               - url pathing advices for robot
#                                                 not to crawl.
#                                       * 'Crawl-delay'
#                                               - crawl delay in second.
#                 in the following structure:
#                       User-agent: *
#                       Allow: /
#                       Crawl-delay: 0
#
#                       User-agent: robotA
#                       Disallow: /admin
#                       Disallow: /private
#                       Crawl-delay: 10
#
#                       User-agent: robotB
#                       Allow: /hidden
#                       Allow: /stores
#                       Disallow: /admin
#                       Disallow: /private
#                       Crawl-delay: 10
#                       ...
#                 such that:
#                       * 'User-agent' defines the robot type.
#                       * 1 robot can have many 'Allow's and 'Disallow's after
#                         that.
#                       * each 'User-agent' will switch the robot context from
#                         one another.
#                       * 1 robot **MUST** only have 1 'Crawl-delay'.
#                       * Each robot **MUST** only appear once.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
views_seo_write_robots_txt() {
        #____path_dest="$1"
        #____sitemaps="$2"
        #____robots="$3"


        # execute
        ## process sitemaps
        if [ ! "$2" = "" ]; then
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        printf -- "%s" "\
Sitemap: ${____line}
" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS
                                return 1
                        fi
                done<<EOF
${2}
EOF
                IFS="$____old_IFS"
                unset ____line ____old_IFS
        fi


        ## process robot policies
        ____is_first=true
        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                if [ "$____line" = "" ]; then
                        continue
                elif [ ! "${____line#"Crawl-delay:"}" = "$____line" ]; then
                        case "${____line#*": "}" in
                        ""|*[!0-9]*)
                                IFS="$____old_IFS"
                                unset ____line ____is_first ____old_IFS
                                return 1
                                ;;
                        *)
                                ;;
                        esac
                elif [ ! "${____line#"User-agent:"}" = "$____line" ]; then
                        if [ ! "$____is_first" = "true" ]; then
                                printf -- "%s" "
" >> "${1}.tmp"
                                if [ $? -ne 0 ]; then
                                        IFS="$____old_IFS"
                                        unset ____line ____is_first ____old_IFS
                                        return 1
                                fi
                        fi
                        ____is_first=false

                        if [ "${____line#*": "}" = "" ]; then
                                IFS="$____old_IFS"
                                unset ____line ____is_first ____old_IFS
                                return 1
                        fi
                elif [ ! "${____line#"Allow:"}" = "$____line" ] ||
                [ ! "${____line#"Disallow:"}" = "$____line" ]; then
                        if [ "${____line#*": "}" = "" ]; then
                                IFS="$____old_IFS"
                                unset ____line ____is_first ____old_IFS
                                return 1
                        fi
                else
                        continue
                fi

                printf -- "%s" "\
${____line}
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____line ____is_first ____old_IFS
                        return 1
                fi
        done<<EOF
${3}
EOF
        IFS="$____old_IFS"
        unset ____line ____is_first ____old_IFS


        # report status
        return 0
}




# report import status
return 0

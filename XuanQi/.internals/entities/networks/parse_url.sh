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
#       * https://www.rfc-editor.org/rfc/rfc1035
#       * https://www.rfc-editor.org/rfc/rfc3986
# Parameters:
#       ____url_string
#               - COMPULSORY
#               - the url string to be parsed.
#               - example: 'https://www.example.com'
# Outputs:
#       String
#               - the sanitized url object in multiline string.
#               - the structure/format:
#                       Line 1: URL_SCHEME
#                               - the scheme
#                               - example:
#                                       * 'http'
#                                       * 'mailto'
#                       Line 2: URL_SEPARATOR
#                               - the slash separators format.
#                               - example:
#                                       * '//' for 'http://'
#                                       * '' for 'mailto:'
#                       Line 3: URL_USER
#                               - the username
#                               - example: 'myusername'
#                       Line 4: URL_PASSWORD
#                               - the password
#                               - example: 'mysecretpassword'
#                       Line 5: URL_DOMAIN
#                               - the domain
#                               - example: 'www.example.com'
#                       Line 6: URL_PORT
#                               - the port number
#                               - example: '12345'
#                       Line 7: URL_PATH
#                               - the url pathing
#                               - example: '/profile'
#                       Line 8: URL_QUERY
#                               - the url query segment
#                               - example: 'id=12345' for '?id=12345'
#                       Line 9: URL_FRAGMENT
#                               - the url fragment segment
#                               - example: 'introduction' for '#introduction'
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____url_string'.
#               - error on bad execution.
entities_networks_parse_url() {
        #____url_string="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        ____sample="$1"
        ____state="protocol"
        ____is_error=false
        ____is_ipv6=false
        ____scheme=""           # not applicable
        ____user=""             # separator ':' or ':'
        ____slash_separators="" # when detected '//'
        ____password=""         # separator ':'
        ____domain=""           # separator '@' from user|password
        ____port=""             # separator ':' from domain
        ____path=""             # separator '/'
        ____query=""            # separator '?'
        ____fragment=""         # separator '#'
        while [ -n "$____sample" ]; do
                ____char="${____sample%%"${____sample#?}"}"
                ____sample="${____sample#?}"
                case "$____char" in
                "[")
                        ____is_ipv6=true
                        ;;
                "]")
                        ____is_ipv6=false
                        ;;
                "@")
                        case "$____state" in
                        protocol)
                                if [ "$____scheme" = "" ]; then
                                        # invalid (@[domain]...)
                                        ____state="domain"
                                        continue
                                fi

                                # ([user]@...)
                                ____state="domain"
                                ____user="$____scheme"
                                unset ____scheme
                                continue
                                ;;
                        user)
                                # positive user without password
                                ____state="domain"
                                continue
                                ;;
                        password)
                                # positive password
                                ____state="domain"
                                continue
                                ;;
                        domain|port)
                                # invalid ([scheme]://[user]:[password]@[domain]@...)
                                ____is_error=true
                                break
                                ;;
                        query)
                                # invalid
                                # ([scheme]://[domain][path]?...@...)
                                ____is_error=true
                                break
                                ;;
                        fragment)
                                # invalid
                                # ([scheme]:[domain][path]#...@...)
                                ____is_error=true
                                break
                                ;;
                        *)
                                ;;
                        esac
                        ;;
                ":")
                        if [ ! "$____is_ipv6" = "true" ]; then
                                case "$____state" in
                                protocol)
                                        if [ "$____scheme" = "" ]; then
                                                # (://...)
                                                ____state="user"
                                                continue
                                        fi

                                        # ([scheme]:...)
                                        ____state="user"
                                        continue
                                        ;;
                                user)
                                        # ([scheme]://[user]:[password]@...)
                                        ____state="password"
                                        continue
                                        ;;
                                password)
                                        # ([scheme]://[domain]:[port])
                                        ____state="path"
                                        ____domain="${____user}"
                                        ____port="${____password}"
                                        unset ____user ____password
                                        continue
                                        ;;
                                domain)
                                        # ([scheme]://[domain]:[port])
                                        ____state="port"
                                        continue
                                        ;;
                                port)
                                        # invalid
                                        # ([scheme]://[domain]:[port]:)
                                        ____is_error=true
                                        break
                                        ;;
                                query)
                                        ;;
                                fragment)
                                        # invalid
                                        # ([scheme]:[domain][path]#...:...)
                                        ____is_error=true
                                        break
                                        ;;
                                *)
                                        ;;
                                esac
                        fi
                        ;;
                "/")
                        case "$____state" in
                        protocol)
                                if [ "$____protocol" = "" ]; then
                                        # relative path
                                        # (//aregaerg/aergaer...)
                                        # (/aregaerg/aergaer...)
                                        ____state="user"
                                        ____slash_separators="/"
                                        continue
                                else
                                        # invalid - no ':' scheme separator
                                        # ([scheme]/...)
                                        ____is_error=true
                                        break
                                fi
                                ;;
                        user)
                                if [ "$____user" = "" ]; then
                                        if [ "$____slash_separators" = "" ]; then
                                                # ([scheme]:/)
                                                ____slash_separators="/"
                                                continue
                                        elif [ "$____slash_separators" = "/" ]; then
                                                # ([scheme]://)
                                                ____slash_separators="//"
                                                continue
                                        else
                                                # ([scheme]:[//]/...)
                                                ____state="path"
                                                ____path="/"
                                        fi
                                fi


                                if [ "$____domain" = "" ] &&
                                [ ! "$____scheme" = "" ]; then
                                        # [domain]:[port]/...
                                        ____state="path"
                                        ____port="$____user"
                                        ____domain="$____scheme"
                                        ____path="/"
                                        unset ____scheme ____user
                                        continue
                                elif [ "$____scheme" = "" ] &&
                                [ ! "$____user" = "" ]; then
                                        ____state="path"
                                        ____port="$____user"
                                        unset ____user
                                        ____path="/"
                                        continue
                                fi

                                # local domain ([scheme]://[domain]/)
                                ____state="path"
                                ____domain="$____user"
                                ____path="/"
                                unset ____user

                                continue
                                ;;
                        password)
                                ____state="path"

                                # standard domain ([scheme]://[domain]:[port]/)
                                ____domain="$____user"
                                ____port="$____password"
                                ____user=""
                                ____password=""
                                ____path="/"

                                continue
                                ;;
                        domain)
                                ____state="path"

                                # standard domain without port
                                # ([scheme]://[domain]/)
                                ____path="/"
                                continue
                                ;;
                        port)
                                ____state="path"

                                # standard domain without port
                                # ([scheme]://[domain]:[port]/)
                                ____path="/"
                                continue
                                ;;
                        path)
                                if [ "$____scheme" = "" ] &&
                                [ "$____slash_separators" = "/" ]; then
                                        case "$____port" in
                                        "")
                                                ;;
                                        *[!0-9]*)
                                                # relative path
                                                # path/aegae/ageag...
                                                if [ ! "$____port" = "" ]; then
                                                        ____domain="${____domain}/${____port}"
                                                        unset ____port
                                                fi

                                                ____path="${____domain%/}/${____path#/}/"
                                                unset ____domain ____slash_separators
                                                continue
                                                ;;
                                        *)
                                                ;;
                                        esac
                                fi
                                ;;
                        query)
                                # invalid
                                # ([scheme]:[domain][path]?.../...)
                                ____is_error=true
                                break
                                ;;
                        fragment)
                                # invalid
                                # ([scheme]:[domain][path]#.../...)
                                ____is_error=true
                                break
                                ;;
                        esac
                        ;;
                "?")
                        case "$____state" in
                        protocol)
                                # (?...)
                                ____state=query

                                continue
                                ;;
                        user)
                                if [ "$____user" = "" ]; then
                                        ____state=query
                                        ____domain="$____scheme"
                                        unset ____scheme ____slash_separators
                                        continue
                                fi

                                # local domain with no port
                                # [scheme]:[domain]?...)
                                ____state="query"
                                ____domain="$____user"
                                unset ____user

                                continue
                                ;;
                        password)
                                if [ "$____user" = "" ]; then
                                        # invalid - url cannot have missing
                                        #           domain before query
                                        #           ([scheme]:?...)
                                        ____is_error=true
                                        break
                                fi

                                # common format
                                # [scheme]://[domain]:[port]?...
                                ____state="query"
                                ____domain="$____user"
                                if [ ! "$____password" = "" ]; then
                                        ____port="$____password"
                                fi
                                unset ____user ____password

                                continue
                                ;;
                        domain)
                                ____state="query"

                                # default 80|443 ports (not required)
                                # ([scheme]:[domain]?...)
                                continue
                                ;;
                        port)
                                ____state="query"

                                # ([scheme]:[domain]:[port]?...)
                                continue
                                ;;
                        path)
                                ____state="query"

                                # ([scheme]:[domain]:[port]/[path]?...)
                                continue
                                ;;
                        query)
                                # invalid - multiple queries
                                # ([scheme]:[domain]#[fragment]?[query]?...)
                                ____is_error=true
                                break
                                ;;
                        fragment)
                                # invalid - query is before fragment
                                # ([scheme]:[domain]#[fragment]?...)
                                ____is_error=true
                                break
                                ;;
                        esac
                        ;;
                "#")
                        case "$____state" in
                        protocol)
                                # (?...)
                                ____state=fragment
                                continue
                                ;;
                        user)
                                if [ "$____user" = "" ]; then
                                        # invalid - url cannot have missing
                                        #           domain before query
                                        #           ([scheme]:#...)
                                        break
                                fi

                                # local domain with no port
                                # [scheme]:[domain]#...)
                                ____state="fragment"
                                ____domain="$____user"
                                unset ____user

                                continue
                                ;;
                        password)
                                if [ "$____user" = "" ]; then
                                        # invalid - url cannot have missing
                                        #           domain before query
                                        #           ([scheme]:#...)
                                        break
                                fi

                                # common format
                                # [scheme]://[domain]:[port]#...
                                ____state="fragment"
                                ____domain="$____user"
                                if [ ! "$____password" = "" ]; then
                                        ____port="$____password"
                                fi
                                unset ____user ____password

                                continue
                                ;;
                        domain)
                                ____state="fragment"

                                # default 80|443 ports (not required)
                                # ([scheme]:[domain]#...)
                                continue
                                ;;
                        port)
                                ____state="fragment"

                                # ([scheme]:[domain]:[port]#...)
                                continue
                                ;;
                        path)
                                ____state="fragment"

                                # ([scheme]:[domain]:[port]/[path]#...)
                                continue
                                ;;
                        query)
                                ____state="fragment"

                                # ([scheme]:[domain]:[port]/[path]?[query]#...)
                                continue
                                ;;
                        fragment)
                                # invalid - multiple fragments
                                # ([scheme]:[domain]#[fragment]#...)
                                ____is_error=true
                                break
                                ;;
                        esac
                        ;;
                *)
                        ;;
                esac

                case "$____state" in
                protocol)
                        ____scheme="${____scheme}${____char}"
                        ;;
                user)
                        ____user="${____user}${____char}"
                        ;;
                password)
                        ____password="${____password}${____char}"
                        ;;
                domain)
                        ____domain="${____domain}${____char}"
                        ;;
                port)
                        ____port="${____port}${____char}"
                        ;;
                path)
                        ____path="${____path}${____char}"
                        ;;
                query)
                        ____query="${____query}${____char}"
                        ;;
                fragment)
                        ____fragment="${____fragment}${____char}"
                        ;;
                *)
                        # operating error
                        ____is_error=true
                        break
                        ;;
                esac
        done
        unset ____char ____sample ____state

        if [ "$____slash_separators" = "//" ]; then
                if [ "$____scheme" = "" ] &&
                [ "${____domain%%.*}" = "$____domain" ]; then
                        # it's a protocol accidentally moved to domain
                        ____scheme="$____domain"
                        unset ____domain
                elif [ ! "$____user" = "" ] &&
                [ "$____password" = "" ] &&
                [ "$____domain" = "" ] &&
                [ "$____port" = "" ] &&
                [ "$____path" = "" ]; then
                        # chrome://settings
                        ____domain="$____user"
                        unset ____user
                fi

                case "$____port" in
                ""|*[!0-9]*)
                        # 'gopher://server/path'
                        if [ "$____domain" = "" ]; then
                                ____domain="$____port"
                                unset ____port
                        fi
                        ;;
                *)
                        if [ "$____port" -lt 0 ]; then
                                # 'gopher://server/path'
                                if [ "$____domain" = "" ]; then
                                        ____domain="$____port"
                                        unset ____port
                                fi
                        fi
                        ;;
                esac
        elif [ "$____slash_separators" = "/" ]; then
                # perform single slash correction for successful parse
                ____slash_separators="//"
        fi

        if [ "$____slash_separators" = "" ]; then
                if [ ! "$____scheme" = "" ]; then
                        if [ "$____user" = "" ] &&
                        [ "$____password" = "" ] &&
                        [ "$____domain" = "" ] &&
                        [ "$____path" = "" ]; then
                                # domain-only: 'www.example.com'
                                ____domain="$____scheme"
                                unset ____scheme
                        elif [ ! "$____user" = "" ] &&
                        [ "$____password" = "" ] &&
                        [ "$____domain" = "" ] &&
                        [ "$____path" = "" ]; then
                                # protocol+domain: 'news:www.example.com'
                                ____domain="$____user"
                                unset ____user
                        fi
                elif [ "$____scheme" = "" ]; then
                        case "$____port" in
                        "")
                                ;;
                        *[!0-9]*)
                                # inline data type 'data:text/plain;base64,SGV...'
                                if [ "$____scheme" = "" ] &&
                                [ "$____user" = "" ] &&
                                [ "$____password" = "" ] &&
                                [ ! "$____domain" = "" ]; then
                                        ____scheme="$____domain"
                                        ____domain="${____port}${____path}"
                                        unset ____port ____path
                                fi
                                ;;
                        *)
                                ;;
                        esac
                fi

                case "$(entities_networks_parse_domain "$____domain")" in
                "")
                        # inline data type 'data:text/plain;base64,SGV...'
                        # no slash separators data type: 'tel:+1-555-123-456'
                        ____path="${____domain}${____path}"
                        unset ____domain
                        ;;
                *)
                        ;;
                esac
        fi

        ## exception cases
        if [ "$____domain" = "magnet" ] && [ "$____scheme" = "" ]; then
                # magnet:?xt=urn:btih:...
                ____scheme="magnet"
                unset ____domain
        fi

        ## all good - print now
        if [ ! "$____is_error" = "true" ]; then
                printf -- "%s" "\
URL_SCHEME=\"${____scheme}\"
URL_SEPARATOR=\"${____slash_separators}\"
URL_USER=\"${____user}\"
URL_PASSWORD=\"${____password}\"
URL_DOMAIN=\"${____domain}\"
URL_PORT=\"${____port}\"
URL_PATH=\"${____path}\"
URL_QUERY=\"${____query}\"
URL_FRAGMENT=\"${____fragment}\"
"
                ____process=$?
        fi

        unset ____is_ipv6 \
                ____scheme \
                ____slash_separators \
                ____user \
                ____password \
                ____domain \
                ____port \
                ____path \
                ____query \
                ____fragment

        if [ "$____is_error" = "true" ]; then
                return 1
        elif [ "$____process" -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

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
#   * https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps
#   * https://github.com/w3c/manifest/wiki/Platforms
# Parameters:
#       ____path_dest
#               - REQUIRED
#               - The destination filepath to write into.
#       ____id
#               - REQUIRED
#               - The app id identifiable across browser PWA stores
#                 (not conflicting other PWA app).
#       ____background_color
#               - REQUIRED
#               - The hexadecimal format RGB color for app background
#                 (e.g. '#FFFFFF' for white).
#       ____theme_color
#               - REQUIRED
#               - The hexadecimal format RGB color for app color
#                 (e.g. '#000000' for black).
#       ____start_url
#               - REQUIRED
#               - The base URL for PWA to operate on.
#       ____scope
#               - REQUIRED
#               - The scoping URL for PWA to set its page boundaries.
#                 Any URL outside this scope trigger a new browser tab launch.
#       ____orientation
#               - REQUIRED
#               - The app's launch screen orientation. It can only be any of
#                 the following values:
#                   * 'any'
#                       - use device's setting.
#                   * 'natural'
#                       - use device's most natural setting as determined by the
#                         browser and OS. On mobile is usually
#                         'portrait-primary' and on desktop or laptop is usually
#                         'landscape-primary'.
#                   * 'portrait'
#                       - device's upright position either in 0deg or 180deg
#                         rotations depending on the current holding state.
#                   * 'portrait-primary'
#                       - device's upright position in 0deg rotation.
#                   * 'portrait-secondary'
#                       - device's upright position but in 180deg rotation
#                         (reverse upright).
#                   * 'landscape'
#                       - device's horizontal position either in 0deg or
#                         180deg depending on the current holding state.
#                   * 'landscape-primary'
#                       - device's horizontal position in 0deg rotation.
#                   * 'landscape-secondary'
#                       - device's horizontal position in 180deg rotation.
#       ____prefer_related_applications
#               - REQUIRED
#               - The decision to let user install the native app from app store
#                 or use this PWA installation directly. Only accepts the
#                 following values:
#                       'true'  - always guide user to app store when install.
#                       'false' - allow PWA installation.
#       ____short_name
#               - REQUIRED
#               - The app's short name.
#       ____name
#               - REQUIRED
#               - The app's full name when display has sufficient space.
#       ____description
#               - REQUIRED
#               - app's short description like pitch.
#       ____categories
#               - REQUIRED
#               - App's keywords.
#               - Multiline value where each line is an entry.
#               - Each line is a string.
#       ____displays
#               - REQUIRED
#               - App's launch display settings.
#               - Multiline value where each line is an entry.
#               - First entry will be the primary choice.
#               - Value type is restricted to the following strings:
#                       * 'standalone'
#                       * 'minimal-ui'
#                       * 'browser'
#       ____protocols
#               - OPTIONAL
#               - App's external API functions.
#               - Multiline value where each line is an entry.
#               - Each value **MUST** comply to the following format:
#                       '[PROTOCOL], [URL]'
#                 where:
#                       ', '       = the delimiter separator.
#                       [PROTOCOL] = custom protocol without colon to trigger
#                                    the API call (e.g. 'mailto' and not
#                                    'mailto:')
#                       [URL]      = the url pathing to operate the API
#                                    (e.g. '/lookup?type=%s').
#       ____related app
#               - OPTIONAL
#               - App's external API functions. Multiline value where each line
#                 is an entry. Each value **MUST** comply to the following
#                 format:
#                       '[STORE_TYPE], [ID], [URL]'
#                 where:
#                       ', '         = the delimiter separator.
#                       [STORE_TYPE] = support store type. Available values:
#                                        * 'chrome_web_store'
#                                        * 'play'
#                                        * 'chromeos_play'
#                                        * 'webapp'
#                                        * 'windows'
#                                        * 'f-droid'
#                                        * 'amazon'
#                       [ID]         = the corresponding app ID in store.
#                       [URL]        = the corresponding app URL in store.
#       ____icons
#               - REQUIRED
#               - App's brand icon.
#               - Multiline value where each line is an entry.
#               - Each value **MUST** comply to the following format:
#                       '[SIZES], [PURPOSE], [MIME], [URL]'
#                 where:
#                       ', '      = the delimiter separator.
#                       [SIZES]   = the '[WIDTH]x[HEIGHT]' string in pixel
#                                   units.
#                       [PURPOSE] = rendering option. Available values are:
#                                       * 'monochrome' - black & white for solid
#                                                        fill.
#                                       * 'maskable'   - with 20% margin spacing
#                                                        safe zone.
#                                       * 'any'        - no restriction.
#                       [MIME]    = the mime type of the image.
#                       [URL]     = the image source URL. Strictly relative or
#                                   same origin URL.
#       ____screenshot
#               - OPTIONAL
#               - App's screenshots.
#               - Multiline value where each line is an entry.
#               - Each value **MUST** comply to the following format:
#                       '[PLATFORM], [DEVICE], [SIZES], [MIME], [URL], [LABEL]'
#                 where:
#                       ', '       = the delimiter separator.
#                       [PLATFORM] = screenshot appears on device. Available
#                                    are:
#                                       * 'any'
#                                       * 'android'
#                                       * 'chromeos'
#                                       * 'ios'
#                                       * 'ipados'
#                                       * 'kaios'
#                                       * 'macos'
#                                       * 'windows'
#                                       * 'xbox'
#                                       * 'chrome_web_store'
#                                       * 'itunes'
#                                       * 'microsoft-inbox'
#                                       * 'microsoft-store'
#                                       * 'play'
#                       [DEVICE]   = form-factor screenshot shape. Available
#                                    values:
#                                       * 'narrow' - mobile devices.
#                                       * 'wide'   - desktop/TV devices.
#                       [SIZES]    = the '[WIDTH]x[HEIGHT]' string in pixel.
#                       [MIME]     = the mime type of the image.
#                       [URL]      = the image source URL.
#                       [LABEL]    = the text label describing the PWA.
#       ____shortcuts
#               - OPTIONAL
#               - App's shortcuts menu items. This is a commont "right click"
#                 on app menu where each entry is a menu item.
#               - This is a multi-dimensional multiline values where each
#                  menu item.
#               - Each entry **MUST** comply to the following multi-lines format:
#                   Line-1  : 'Item: [SHORT_NAME], [NAME], [DESCRIPTION], [URL]'
#                   Line-2  : 'Icon: [ICON]'
#                   Line-3  : 'Icon: [ICON]'
#                   ...
#                   Line-a  : 'Icon: [ICON]'
#                   Line-a+1: 'Item: [SHORT_NAME], [NAME], [DESCRIPTION], [URL]'
#                   Line-a+2: 'Icon: [ICON]'
#                   Line-a+3: 'Icon: [ICON]'
#                   ...
#                   Line-b  : 'Icon: [ICON]'
#                   Line-b+1: 'Item: [SHORT_NAME], [NAME], [DESCRIPTION], [URL]'
#                   Line-b+2: 'Item: [SHORT_NAME], [NAME], [DESCRIPTION], [URL]'
#                   ...
#                   where:
#                       ', '          = the delimiter separator.
#                       'Item: '      = denotes line is shortcut menu entry.
#                                       Each new shortcut resets the icon entry
#                                       for as its inclusion.
#                       'Icon: '      = denotes a shortcut menu entry's icon
#                                       file. Can have multiple icon files for
#                                       different sizes, types, and resolutions.
#                       [SHORT_NAME]  = the short menu item name.
#                       [NAME]        = the slightly longer menu item name
#                                       (when display has sufficient space).
#                       [DESCRIPTION] = short description of the menu item.
#                       [URL]         = the relative URL to trigger.
#                       [ICON]        = the icon entry. Refer to '____icons'
#                                       above.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
views_pwa_write_manifest() {
        #____path_dest="$1"
        #____id="$2"
        #____background_color="$3"
        #____theme_color="$4"
        #____start_url="$5"
        #____scope="$6"
        #____orientation="$7"
        #____prefer_related_applications="$8"
        #____short_name="$9"
        #____name="${10}"
        #____description="${11}"
        #____categories="${12}"
        #____displays="${13}"
        #____protocols="${14}"
        #____related_applications="${15}"
        #____icons="${16}"
        #____screenshots="${17}"
        #____shortcuts="${18}"


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

        if [ "$5" = "" ]; then
                return 1
        fi

        if [ "$6" = "" ]; then
                return 1
        fi

        if [ "$7" = "" ]; then
                return 1
        fi

        if [ "$8" = "" ]; then
                return 1
        fi

        if [ "$9" = "" ]; then
                return 1
        fi

        if [ "${10}" = "" ]; then
                return 1
        fi

        if [ "${11}" = "" ]; then
                return 1
        fi

        if [ "${12}" = "" ]; then
                return 1
        fi

        if [ "${13}" = "" ]; then
                return 1
        fi

        if [ "${16}" = "" ]; then
                return 1
        fi


        # execute
        # print json opener
        printf "%s" "\
{
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # handle common metadatas
        printf "%s" "\
        \"id\": \"${2}\",
        \"background_color\": \"${3}\",
        \"theme_color\": \"${4}\",
        \"start_url\": \"${5}\",
        \"scope\": \"${6}\",
        \"orientation\": \"${7}\",
        \"prefer_related_applications\": ${8},
        \"short_name\": \"${9}\",
        \"name\": \"${10}\",
        \"description\": \"${11}\",
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # handle categories
        if [ ! "${12}" = "" ]; then
                ## print opener
                printf "%s" "\
        \"categories\": [
" >> "${1}.tmp"

                ## print list content
                ____is_first=true
                ____old_IFS="$IFS"
                while IFS= read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        ## make sure to comply with json comma listing format
                        if [ ! "$____is_first" = "true" ]; then
                                printf -- "%s" ",
" >> "${1}.tmp"

                        fi
                        ____is_first=false

                        ## print content without newline for json listing
                        ## specification
                        printf -- "%s" "\
                \"${____line}\"" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS ____is_first
                                return 1
                        fi
                done<<EOF
${12}
EOF
                IFS="$____old_IFS"
                unset ____line ____old_IFS ____is_first

                ## print closer
                printf "%s" "\
        ],
" >> "${1}.tmp"
        else
                printf "%s" "\
        \"categories\": [],
" >> "${1}.tmp"
        fi


        # handle displays
        if [ ! "${13}" = "" ]; then
                ## process list content
                ____is_first=true
                ____old_IFS="$IFS"
                while IFS= read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        ## make sure to comply with json comma listing format
                        if [ "$____is_first" = "true" ]; then
                                printf "%s" "\
        \"display\": \"${____line}\",
        \"display_override\": [
" >> "${1}.tmp"
                        else
                                printf -- "%s" ",
" >> "${1}.tmp"

                        fi
                        ____is_first=false

                        ## print content without newline for json listing
                        ## specification
                        printf -- "%s" "\
                \"${____line}\"" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS ____is_first
                                return 1
                        fi
                done<<EOF
${13}
EOF
                IFS="$____old_IFS"
                unset ____line ____old_IFS ____is_first

                ## print closer
                printf "%s" "\
        ],
" >> "${1}.tmp"
        else
                printf "%s" "\
        \"display\": \"standalone\",
        \"display_override\": [ \"standalone\", \"minimal-ui\", \"browser\" ],
" >> "${1}.tmp"
        fi


        # handle protocols
        if [ ! "${14}" = "" ]; then
                ## print opener
                printf "%s" "\
        \"protocol_handlers\": [
" >> "${1}.tmp"

                ## print list content
                ____is_first=true
                ____old_IFS="$IFS"
                while IFS= read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ "${____line##" = "}" = "$____line" ]; then
                                continue
                        fi

                        ## make sure to comply with json comma listing format
                        if [ "$____is_first" = "true" ]; then
                                printf -- "%s" "{
" >> "${1}.tmp"
                        else
                                printf -- "%s" ", {
" >> "${1}.tmp"

                        fi
                        ____is_first=false

                        ## extract values
                        ____protocol="${____line%%", "*}"
                        ____protocol="${____protocol%":"}"
                        ____line="${____line#*", "}"

                        ## print content without newline for json listing
                        ## specification
                        printf -- "%s" "\
                        \"protocol\": \"${____protocol}\",
                        \"url\": \"${____line}\"
                }" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____protocol \
                                        ____line \
                                        ____old_IFS \
                                        ____is_first
                                return 1
                        fi
                done<<EOF
${14}
EOF
                IFS="$____old_IFS"
                unset ____protocol ____line ____old_IFS ____is_first

                ## print closer
                printf "%s" "\
        ],
" >> "${1}.tmp"
        else
                printf "%s" "\
        \"protocol_handlers\": [],
" >> "${1}.tmp"
        fi


        # handle related applications
        if [ ! "${15}" = "" ]; then
                ## print opener
                printf "%s" "\
        \"related_applications\": [
" >> "${1}.tmp"

                ## print list content
                ____is_first=true
                ____old_IFS="$IFS"
                while IFS= read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ "${____line##", "}" = "$____line" ]; then
                                continue
                        fi

                        ## make sure to comply with json comma listing format
                        if [ "$____is_first" = "true" ]; then
                                printf -- "%s" "{
" >> "${1}.tmp"
                        else
                                printf -- "%s" ", {
" >> "${1}.tmp"

                        fi
                        ____is_first=false

                        ## extract values
                        ____platform="${____line%%", "*}"
                        ____line="${____line#*", "}"

                        ____id="${____line%%", "*}"
                        ____line="${____line#*", "}"

                        ## print content without newline for json listing
                        ## specification
                        printf -- "%s" "\
                        \"platform\": \"${____platform}\",
                        \"id\": \"${____id}\",
                        \"url\": \"${____line}\"
                }" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____platform \
                                        ____id \
                                        ____line \
                                        ____old_IFS \
                                        ____is_first
                                return 1
                        fi
                done<<EOF
${15}
EOF
                IFS="$____old_IFS"
                unset ____platform ____id ____line ____old_IFS ____is_first

                ## print closer
                printf "%s" "\
        ],
" >> "${1}.tmp"
        else
                printf "%s" "\
        \"related_applications\": [],
" >> "${1}.tmp"
        fi


        # handle icons
        if [ ! "${16}" = "" ]; then
                ## print opener
                printf "%s" "\
        \"icons\": [
" >> "${1}.tmp"

                ## print list content
                ____is_first=true
                ____old_IFS="$IFS"
                while IFS= read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ "${____line##", "}" = "$____line" ]; then
                                continue
                        fi

                        ## make sure to comply with json comma listing format
                        if [ "$____is_first" = "true" ]; then
                                printf -- "%s" "{
" >> "${1}.tmp"
                        else
                                printf -- "%s" ", {
" >> "${1}.tmp"

                        fi
                        ____is_first=false

                        ## extract values
                        ____sizes="${____line%%", "*}"
                        ____line="${____line#*", "}"

                        ____purpose="${____line%%", "*}"
                        ____line="${____line#*", "}"

                        ____mime="${____line%%", "*}"
                        ____line="${____line#*", "}"

                        ## print content without newline for json listing
                        ## specification
                        printf -- "%s" "\
                        \"src\": \"${____line}\",
                        \"sizes\": \"${____sizes}\",
                        \"type\": \"${____mime}\",
                        \"purpose\": \"${____purpose}\"
                }" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____sizes \
                                        ____purpose \
                                        ____mime \
                                        ____line \
                                        ____old_IFS \
                                        ____is_first
                                return 1
                        fi
                done<<EOF
${16}
EOF
                IFS="$____old_IFS"
                unset ____sizes \
                        ____purpose \
                        ____mime \
                        ____line \
                        ____old_IFS \
                        ____is_first

                ## print closer
                printf "%s" "\
        ],
" >> "${1}.tmp"
        else
                printf "%s" "\
        \"icons\": [],
" >> "${1}.tmp"
        fi


        # handle screenshot
        if [ ! "${17}" = "" ]; then
                ## print opener
                printf "%s" "\
        \"screenshots\": [
" >> "${1}.tmp"

                ## print list content
                ____is_first=true
                ____old_IFS="$IFS"
                while IFS= read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ "${____line##", "}" = "$____line" ]; then
                                continue
                        fi

                        ## make sure to comply with json comma listing format
                        if [ "$____is_first" = "true" ]; then
                                printf -- "%s" "{
" >> "${1}.tmp"
                        else
                                printf -- "%s" ", {
" >> "${1}.tmp"

                        fi
                        ____is_first=false

                        ## extract values
                        ____platform="${____line%%", "*}"
                        ____line="${____line#*", "}"

                        ____device="${____line%%", "*}"
                        ____line="${____line#*", "}"

                        ____sizes="${____line%%", "*}"
                        ____line="${____line#*", "}"

                        ____mime="${____line%%", "*}"
                        ____line="${____line#*", "}"

                        ____url="${____line%%", "*}"
                        ____line="${____line#*", "}"


                        ## print content without newline for json listing
                        ## specification
                        if [ ! "$____platform" = "any" ]; then
                                printf -- "%s" "\
                        \"platform\": \"${____platform}\",
" >> "${1}.tmp"
                                if [ $? -ne 0 ]; then
                                        IFS="$____old_IFS"
                                        unset ____platform \
                                                ____device \
                                                ____sizes \
                                                ____mime \
                                                ____url \
                                                ____line \
                                                ____old_IFS \
                                                ____is_first
                                        return 1
                                fi
                        fi

                        printf -- "%s" "\
                        \"src\": \"${____url}\",
                        \"sizes\": \"${____sizes}\",
                        \"type\": \"${____mime}\",
                        \"form_factor\": \"${____device}\",
                        \"label\": \"${____line}\"
                }" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____platform \
                                        ____device \
                                        ____sizes \
                                        ____mime \
                                        ____url \
                                        ____line \
                                        ____old_IFS \
                                        ____is_first
                                return 1
                        fi
                done<<EOF
${17}
EOF
                IFS="$____old_IFS"
                unset ____platform \
                        ____device \
                        ____sizes \
                        ____mime \
                        ____url \
                        ____line \
                        ____old_IFS \
                        ____is_first

                ## print closer
                printf "%s" "\
        ],
" >> "${1}.tmp"
        else
                printf "%s" "\
        \"screenshots\": [],
" >> "${1}.tmp"
        fi


        # handle icons
        if [ ! "${18}" = "" ]; then
                ## print opener
                printf "%s" "\
        \"shortcuts\": [" >> "${1}.tmp"

                ## print list content
                ____is_first_shortcut=true
                ____is_first_icon=true
                ____old_IFS="$IFS"
                while IFS= read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ "${____line##", "}" = "$____line" ]; then
                                continue
                        fi

                        ## handle based on line prefix
                        if [ ! "${____line#"Item: "}" = "$____line" ]; then
                                if [ "$____is_first_shortcut" = "true" ]; then
                                        printf -- "%s" "{
" >> "${1}.tmp"
                                else
                                        # seal previous icon entry and open
                                        # new shortcut item
                                        printf -- "%s" "]
                } , {
" >> "${1}.tmp"
                                fi
                                ____is_first_shortcut=false
                                ____is_first_icon=true

                                ## extract values
                                ____line="${____line#*": "}"

                                ____short_name="${____line%%", "*}"
                                ____line="${____line#*", "}"

                                ____name="${____line%%", "*}"
                                ____line="${____line#*", "}"

                                ____description="${____line%%", "*}"
                                ____line="${____line#*", "}"

                                ## print content without newline for json listing
                                ## specification
                                printf -- "%s" "\
                        \"short_name\": \"${____short_name}\",
                        \"name\": \"${____name}\",
                        \"url\": \"${____line}\",
                        \"description\": \"${____description}\",
                        \"icons\": [" >> "${1}.tmp"
                                if [ $? -ne 0 ]; then
                                        IFS="$____old_IFS"
                                        unset ____description \
                                                ____name \
                                                ____short_name \
                                                ____sizes \
                                                ____purpose \
                                                ____mime \
                                                ____line \
                                                ____old_IFS \
                                                ____is_first_icon \
                                                ____is_first_shortcut
                                        return 1
                                fi
                        elif [ ! "${____line#"Icon: "}" = "$____line" ]; then
                                if [ "$____is_first_icon" = "true" ]; then
                                        printf -- "%s" "{
" >> "${1}.tmp"
                                else
                                        printf -- "%s" ", {
" >> "${1}.tmp"
                                fi
                                ____is_first_icon=false

                                ## extract values
                                ____line="${____line#*": "}"

                                ____sizes="${____line%%", "*}"
                                ____line="${____line#*", "}"

                                ____purpose="${____line%%", "*}"
                                ____line="${____line#*", "}"

                                ____mime="${____line%%", "*}"
                                ____line="${____line#*", "}"

                                ## print content without newline for json listing
                                ## specification
                                printf -- "%s" "\
                                \"src\": \"${____line}\",
                                \"sizes\": \"${____sizes}\",
                                \"type\": \"${____mime}\",
                                \"purpose\": \"${____purpose}\"
                        }" >> "${1}.tmp"
                                if [ $? -ne 0 ]; then
                                        IFS="$____old_IFS"
                                        unset ____description \
                                                ____name \
                                                ____short_name \
                                                ____sizes \
                                                ____purpose \
                                                ____mime \
                                                ____line \
                                                ____old_IFS \
                                                ____is_first_icon \
                                                ____is_first_shortcut
                                        return 1
                                fi
                        fi
                done<<EOF
${18}
EOF
                IFS="$____old_IFS"
                unset ____description \
                        ____name \
                        ____short_name \
                        ____sizes \
                        ____purpose \
                        ____mime \
                        ____line \
                        ____old_IFS \
                        ____is_first_icon \
                        ____is_first_shortcut

                ## print closer
                printf "%s" "]}
        ]
" >> "${1}.tmp"
        else
                printf "%s" "\
        \"shortcuts\": []
" >> "${1}.tmp"
        fi

        ## print json closer
        printf "%s" "\
}
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

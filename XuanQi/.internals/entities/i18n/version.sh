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
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on bad execution.
entities_i18n_version() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "Version"
                ;;
        "es")
                printf -- "%s" "Versión"
                ;;
        "fr")
                printf -- "%s" "Version"
                ;;
        "ja")
                printf -- "%s" "バージョン"
                ;;
        "ko")
                printf -- "%s" "버전"
                ;;
        "mn-Cyrl")
                printf -- "%s" "Хувилбар"
                ;;
        "ms")
                printf -- "%s" "Versi"
                ;;
        "nb")
                printf -- "%s" "Versjon"
                ;;
        "nl")
                printf -- "%s" "Versie"
                ;;
        "nn")
                printf -- "%s" "Versjon"
                ;;
        "ru")
                printf -- "%s" "Версия"
                ;;
        "sv")
                printf -- "%s" "Version"
                ;;
        "uk")
                printf -- "%s" "Версія"
                ;;
        "zh-Hans")
                printf -- "%s" "版本"
                ;;
        "zh-Hant")
                printf -- "%s" "版本"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Version"
                ;;
        esac
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

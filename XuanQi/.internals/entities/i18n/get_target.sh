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
# Returns:
#       String
#               - the translated content.
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on bad execution.
entities_i18n_get_target() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "Ziel"
                ;;
        "es")
                printf -- "%s" "Objetivo"
                ;;
        "fr")
                printf -- "%s" "Cible"
                ;;
        "ja")
                printf -- "%s" "ターゲット"
                ;;
        "ko")
                printf -- "%s" "대상"
                ;;
        "mn-Cyrl")
                printf -- "%s" "Зорилго"
                ;;
        "ms")
                printf -- "%s" "Sasaran"
                ;;
        "nb")
                printf -- "%s" "Mål"
                ;;
        "nl")
                printf -- "%s" "Doel"
                ;;
        "nn")
                printf -- "%s" "Mål"
                ;;
        "ru")
                printf -- "%s" "Цель"
                ;;
        "sv")
                printf -- "%s" "Mål"
                ;;
        "uk")
                printf -- "%s" "Ціль"
                ;;
        "zh-Hans")
                printf -- "%s" "目标"
                ;;
        "zh-Hant")
                printf -- "%s" "目標"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Target"
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

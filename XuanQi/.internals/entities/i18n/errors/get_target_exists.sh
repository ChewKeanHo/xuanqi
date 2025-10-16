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
entities_i18n_errors_get_target_exists() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "Ziel existiert bereits!"
                ;;
        "es")
                printf -- "%s" "¡El objetivo ya existe!"
                ;;
        "fr")
                printf -- "%s" "La cible existe déjà !"
                ;;
        "ja")
                printf -- "%s" "ターゲットは既に存在します！"
                ;;
        "ko")
                printf -- "%s" "대상이 이미 존재합니다!"
                ;;
        "mn-Cyrl")
                printf -- "%s" "Зорилго аль хэдийн байна!"
                ;;
        "ms")
                printf -- "%s" "Sasaran sudah wujud!"
                ;;
        "nb")
                printf -- "%s" "Målet finnes allerede!"
                ;;
        "nl")
                printf -- "%s" "Doel bestaat al!"
                ;;
        "nn")
                printf -- "%s" "Målet finst allereie!"
                ;;
        "ru")
                printf -- "%s" "Цель уже существует!"
                ;;
        "sv")
                printf -- "%s" "Målet finns redan!"
                ;;
        "uk")
                printf -- "%s" "Ціль вже існує!"
                ;;
        "zh-Hans")
                printf -- "%s" "目标己经存在了！"
                ;;
        "zh-Hant")
                printf -- "%s" "目標已經存在了！"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Target already exists!"
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

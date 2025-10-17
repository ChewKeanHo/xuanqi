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
entities_i18n_get_given_path() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "Gegebener Pfad"
                ;;
        "es")
                printf -- "%s" "Ruta Dada"
                ;;
        "fr")
                printf -- "%s" "Chemin Donné"
                ;;
        "ja")
                printf -- "%s" "指定されたパス"
                ;;
        "ko")
                printf -- "%s" "주어진 경로"
                ;;
        "mn-Cyrl")
                printf -- "%s" "Өгсөн Зам"
                ;;
        "ms")
                printf -- "%s" "Laluan Yang Diberi"
                ;;
        "nb")
                printf -- "%s" "Gitt Bane"
                ;;
        "nl")
                printf -- "%s" "Opgegeven Pad"
                ;;
        "nn")
                printf -- "%s" "Gjeve Bane"
                ;;
        "ru")
                printf -- "%s" "Заданный Путь"
                ;;
        "sv")
                printf -- "%s" "Given Sökväg"
                ;;
        "uk")
                printf -- "%s" "Заданий Шлях"
                ;;
        "zh-Hans")
                printf -- "%s" "呈现路径"
                ;;
        "zh-Hant")
                printf -- "%s" "呈現路徑"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Given Path"
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

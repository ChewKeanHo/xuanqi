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
entities_i18n_errors_bad_execution() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "Ausführungsfehler!"
                ;;
        "es")
                printf -- "%s" "Error de ejecución!"
                ;;
        "fr")
                printf -- "%s" "Erreur d'exécution!"
                ;;
        "ja")
                printf -- "%s" "実行エラー！"
                ;;
        "ko")
                printf -- "%s" "실행 오류!"
                ;;
        "mn-Cyrl")
                printf -- "%s" "Гүйцэтгэлийн алдаа!"
                ;;
        "ms")
                printf -- "%s" "Masalah Dalam Pelaksanaan!"
                ;;
        "nb")
                printf -- "%s" "Kjøringsfeil!"
                ;;
        "nl")
                printf -- "%s" "Uitvoeringsfout!"
                ;;
        "nn")
                printf -- "%s" "Køyringsfeil!"
                ;;
        "ru")
                printf -- "%s" "Ошибка выполнения!"
                ;;
        "sv")
                printf -- "%s" "Körningsfel!"
                ;;
        "uk")
                printf -- "%s" "Помилка виконання!"
                ;;
        "zh-Hans")
                printf -- "%s" "执行出错！"
                ;;
        "zh-Hant")
                printf -- "%s" "執行出錯！"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Bad execution!"
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

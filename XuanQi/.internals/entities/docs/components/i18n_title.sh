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
#       ____site_title
#               - OPTIONAL
#               - entire site title or brand name.
# Outputs:
#       String
#               - the translated content.
#               - error on empty.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '$____site_title'.
#               - error on bad execution.
i18n_title() {
        #____site_title="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                printf -- ""
                return 1
        fi


        # execute
        case "$XUANQI_CONTENT_LANGUAGE" in
        "de")
                printf -- "%s" "Beispielseite | ${1}"
                ;;
        "es")
                printf -- "%s" "Página De Ejemplo | ${1}"
                ;;
        "fr")
                printf -- "%s" "Page D'Exemple | ${1}"
                ;;
        "ja")
                printf -- "%s" "サンプルページ | ${1}"
                ;;
        "ko")
                printf -- "%s" "샘플 페이지 | ${1}"
                ;;
        "mn-Cyrl")
                printf -- "%s" "Жишээ Хуудас | ${1}"
                ;;
        "ms")
                printf -- "%s" "Halaman Sampel | ${1}"
                ;;
        "nb")
                printf -- "%s" "Eksempelside | ${1}"
                ;;
        "nl")
                printf -- "%s" "Voorbeeldpagina | ${1}"
                ;;
        "nn")
                printf -- "%s" "Dømeside | ${1}"
                ;;
        "ru")
                printf -- "%s" "Пример Страницы | ${1}"
                ;;
        "sv")
                printf -- "%s" "Exempelsida | ${1}"
                ;;
        "uk")
                printf -- "%s" "Приклад Сторінки | ${1}"
                ;;
        "zh-Hans")
                printf -- "%s" "示例页面 | ${1}"
                ;;
        "zh-Hant")
                printf -- "%s" "範例頁面 | ${1}"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Sample Page | ${1}"
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

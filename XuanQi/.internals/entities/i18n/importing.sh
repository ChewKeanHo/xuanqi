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
#       ____target
#               - the target for import.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____target'.
#               - error on bad execution.
entities_i18n_importing() {
        #____target="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
Importiere '${1}'...
"
                ;;
        "es")
                printf -- "%s" "\
Importando '${1}'...
"
                ;;
        "fr")
                printf -- "%s" "\
Importation '${1}'...
"
                ;;
        "ja")
                printf -- "%s" "\
インポート中 '${1}'。。。
"
                ;;
        "ko")
                printf -- "%s" "\
가져오는 중 '${1}'...
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
Импорт Хийж Байна '${1}'...
"
                ;;
        "ms")
                printf -- "%s" "\
Mengimport '${1}'...
"
                ;;
        "nb")
                printf -- "%s" "\
Importerer '${1}'...
"
                ;;
        "nl")
                printf -- "%s" "\
Importeren '${1}'...
"
                ;;
        "nn")
                printf -- "%s" "\
Importerer '${1}'...
"
                ;;
        "ru")
                printf -- "%s" "\
Импортирование '${1}'...
"
                ;;
        "sv")
                printf -- "%s" "\
Importerar '${1}'...
"
                ;;
        "uk")
                printf -- "%s" "\
Імпортування '${1}'...
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
正在导入 '${1}'。。。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
正在導入 '${1}'。。。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
Importing '${1}'...
"
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

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
#               - the target to be executed.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____target'.
#               - error on bad execution.
entities_i18n_executing() {
        #____target="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
Führe '${1}' aus...
"
                ;;
        "es")
                printf -- "%s" "\
Ejecutando '${1}'...
"
                ;;
        "fr")
                printf -- "%s" "\
Exécution de '${1}'...
"
                ;;
        "ja")
                printf -- "%s" "\
「${1}」を実行中...
"
                ;;
        "ko")
                printf -- "%s" "\
'${1}' 실행 중...
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
'${1}' гүйцэтгэж байна...
"
                ;;
        "ms")
                printf -- "%s" "\
Melaksanakan '${1}'...
"
                ;;
        "nb")
                printf -- "%s" "\
Utfører '${1}'...
"
                ;;
        "nl")
                printf -- "%s" "\
Uitvoeren van '${1}'...
"
                ;;
        "nn")
                printf -- "%s" "\
Utfører '${1}'...
"
                ;;
        "ru")
                printf -- "%s" "\
Выполнение '${1}'...
"
                ;;
        "sv")
                printf -- "%s" "\
Utför '${1}'...
"
                ;;
        "uk")
                printf -- "%s" "\
Виконання '${1}'...
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
正在执行「${1}」...
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
正在執行「${1}」...
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
Executing '${1}'...
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

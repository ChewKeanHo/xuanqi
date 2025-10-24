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
#               - the created target.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____target'.
#               - error on bad execution.
entities_i18n_creating() {
        #____target="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
Erstelle '${1}'...
"
                ;;
        "es")
                printf -- "%s" "\
Creando '${1}'...
"
                ;;
        "fr")
                printf -- "%s" "\
Création de '${1}'...
"
                ;;
        "ja")
                printf -- "%s" "\
'${1}' を作成しています...
"
                ;;
        "ko")
                printf -- "%s" "\
'${1}' 생성 중...
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
'${1}' үүсгэж байна...
"
                ;;
        "ms")
                printf -- "%s" "\
Kini Mencipta '${1}'...
"
                ;;
        "nb")
                printf -- "%s" "\
Oppretter '${1}'...
"
                ;;
        "nl")
                printf -- "%s" "\
Aan het maken '${1}'...
"
                ;;
        "nn")
                printf -- "%s" "\
Opprettar '${1}'...
"
                ;;
        "ru")
                printf -- "%s" "\
Создание '${1}'...
"
                ;;
        "sv")
                printf -- "%s" "\
Skapar '${1}'...
"
                ;;
        "uk")
                printf -- "%s" "\
Створення '${1}'...
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
正在创造“${1}”...
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
正在創造「${1}」...
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
Creating '${1}'...
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

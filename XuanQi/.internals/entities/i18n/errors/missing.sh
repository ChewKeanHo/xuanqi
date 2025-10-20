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
#       ____subject
#               - the subject that is missing.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____subject'.
#               - error on bad execution.
entities_i18n_errors_missing() {
        #____subject="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
'${1}' Fehlt.
"
                ;;
        "es")
                printf -- "%s" "\
'${1}' No Encontrado.
"
                ;;
        "fr")
                printf -- "%s" "\
'${1}' Manquant.
"
                ;;
        "ja")
                printf -- "%s" "\
「${1}」が見つかりません。
"
                ;;
        "ko")
                printf -- "%s" "\
'${1}' 없음.
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
'${1}' Алга Байна.
"
                ;;
        "ms")
                printf -- "%s" "\
'${1}' Hilang.
"
                ;;
        "nb")
                printf -- "%s" "\
'${1}' Mangler.
"
                ;;
        "nl")
                printf -- "%s" "\
'${1}' Ontbreekt.
"
                ;;
        "nn")
                printf -- "%s" "\
'${1}' Manglar.
"
                ;;
        "ru")
                printf -- "%s" "\
'${1}' Отсутствует.
"
                ;;
        "sv")
                printf -- "%s" "\
'${1}' Saknas.
"
                ;;
        "uk")
                printf -- "%s" "\
'${1}' Відсутній.
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
「${1}」不在。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
「${1}」不在。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
'${1}' Is Missing.
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

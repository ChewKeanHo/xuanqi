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
#               - the subject that is invalid.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____subject'.
#               - error on bad execution.
entities_i18n_errors_invalid() {
        #____subject="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
'${1}' Ist Ungültig.
"
                ;;
        "es")
                printf -- "%s" "\
'${1}' Es Inválido.
"
                ;;
        "fr")
                printf -- "%s" "\
'${1}' Est Invalide.
"
                ;;
        "ja")
                printf -- "%s" "\
「${1}」は無効です。
"
                ;;
        "ko")
                printf -- "%s" "\
'${1}'이(가) 유효하지 않습니다.
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
'${1}' Буруу Байна.
"
                ;;
        "ms")
                printf -- "%s" "\
Salah Nilai '${1}'.
"
                ;;
        "nb")
                printf -- "%s" "\
'${1}' Er Ugyldig.
"
                ;;
        "nl")
                printf -- "%s" "\
'${1}' Is Ongeldig.
"
                ;;
        "nn")
                printf -- "%s" "\
'${1}' Er Ugyldig.
"
                ;;
        "ru")
                printf -- "%s" "\
'${1}' Недействителен.
"
                ;;
        "sv")
                printf -- "%s" "\
'${1}' Är Ogiltig.
"
                ;;
        "uk")
                printf -- "%s" "\
'${1}' Недійсний.
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
「${1}」价值错误。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
「${1}」價值錯誤。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
'${1}' Is Invalid.
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

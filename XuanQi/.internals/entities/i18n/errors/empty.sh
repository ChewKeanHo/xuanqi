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
#               - the subject that has empty value.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____subject'.
#               - error on bad execution.
entities_i18n_errors_empty() {
        #____subject="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
'${1}' Ist Leer.
"
                ;;
        "es")
                printf -- "%s" "\
'${1}' Está Vacío.
"
                ;;
        "fr")
                printf -- "%s" "\
'${1}' Est Vide.
"
                ;;
        "ja")
                printf -- "%s" "\
「${1}」は空です。
"
                ;;
        "ko")
                printf -- "%s" "\
'${1}'이(가) 비어 있습니다.
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
'${1}' Хоосон Байна.
"
                ;;
        "ms")
                printf -- "%s" "\
Kosong Nilai '${1}'.
"
                ;;
        "nb")
                printf -- "%s" "\
'${1}' Er Tom.
"
                ;;
        "nl")
                printf -- "%s" "\
'${1}' Is Leeg.
"
                ;;
        "nn")
                printf -- "%s" "\
'${1}' er tom.
"
                ;;
        "ru")
                printf -- "%s" "\
'${1}' Пуст.
"
                ;;
        "sv")
                printf -- "%s" "\
'${1}' Är Tom.
"
                ;;
        "uk")
                printf -- "%s" "\
'${1}' Порожній.
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
「${1}」空无价值。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
「${1}」空無價值。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
'${1}' Is Empty.
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

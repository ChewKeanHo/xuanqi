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
#               - the subject that exists.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____subject'.
#               - error on bad execution.
entities_i18n_errors_exists() {
        #____subject="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
'${1}' Existiert Bereits.
"
                ;;
        "es")
                printf -- "%s" "\
'${1}' Ya Existe.
"
                ;;
        "fr")
                printf -- "%s" "\
'${1}' Existe Déjà.
"
                ;;
        "ja")
                printf -- "%s" "\
「${1}」は既に存在します。
"
                ;;
        "ko")
                printf -- "%s" "\
'${1}'이(가) 이미 존재합니다.
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
'${1}' Аль Хэдийн Байна.
"
                ;;
        "ms")
                printf -- "%s" "\
'${1}'Sudah Wujud!
"
                ;;
        "nb")
                printf -- "%s" "\
'${1}' Finnes Allerede.
"
                ;;
        "nl")
                printf -- "%s" "\
'${1}' Bestaat Al.
"
                ;;
        "nn")
                printf -- "%s" "\
'${1}' Finnest Allereie.
"
                ;;
        "ru")
                printf -- "%s" "\
'${1}' Уже Существует.
"
                ;;
        "sv")
                printf -- "%s" "\
'${1}' Finns Redan.
"
                ;;
        "uk")
                printf -- "%s" "\
'${1}' Вже Існує.
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
「${1}」己经存在了。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
「${1}」已經存在了。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
'${1}' Already Exists.
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

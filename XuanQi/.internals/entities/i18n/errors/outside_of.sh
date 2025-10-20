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
#       ____context
#               - the context for locating the ____subject.
#       ____subject
#               - the subject that is located outside ____context.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____content'.
#               - error on empty '____subject'.
#               - error on bad execution.
entities_i18n_errors_outside_of() {
        #____context="$1"
        #____subject="$2"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ "$2" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
'${2}' Ist Außerhalb Von '${1}'.
"
                ;;
        "es")
                printf -- "%s" "\
'${2}' Está Fuera De '${1}'.
"
                ;;
        "fr")
                printf -- "%s" "\
'${2}' Est En Dehors De '${1}'.
"
                ;;
        "ja")
                printf -- "%s" "\
「${2}」は「${1}」の外側にあります。
"
                ;;
        "ko")
                printf -- "%s" "\
'${2}' 은(는) '${1}' 의 외부에 있습니다.
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
'${2}' Нь '${1}' -Ийн Гадна Байна.
"
                ;;
        "ms")
                printf -- "%s" "\
'${2}' Kini Di Luar '${1}'.
"
                ;;
        "nb")
                printf -- "%s" "\
'${2}' Er Utenfor '${1}'.
"
                ;;
        "nl")
                printf -- "%s" "\
'${2}' Is Buiten '${1}'.
"
                ;;
        "nn")
                printf -- "%s" "\
'${2}' Er Utanfor '${1}'.
"
                ;;
        "ru")
                printf -- "%s" "\
'${2}' Находится Вне '${1}'.
"
                ;;
        "sv")
                printf -- "%s" "\
'${2}' Är Utanför '${1}'.
"
                ;;
        "uk")
                printf -- "%s" "\
'${2}' Знаходиться Поза '${1}'.
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
「${2}」在「${1}」之外。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
「${2}」在「${1}」之外。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
'${2}' Is Outside Of '${1}'.
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

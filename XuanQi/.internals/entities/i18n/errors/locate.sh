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
#               - the subject that could not be located.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____subject'.
#               - error on bad execution.
entities_i18n_errors_locate() {
        #____subject="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
Konnte '${1}' Nicht Finden.
"
                ;;
        "es")
                printf -- "%s" "\
No Se Pudo Encontrar '${1}'.
"
                ;;
        "fr")
                printf -- "%s" "\
Échec De La Localisation De '${1}'.
"
                ;;
        "ja")
                printf -- "%s" "\
「${1}」を見つけられませんでした。
"
                ;;
        "ko")
                printf -- "%s" "\
'${1}'을(를) 찾을 수 없습니다.
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
'${1}'-Ийг Олсонгүй.
"
                ;;
        "ms")
                printf -- "%s" "\
Gagal Mencari '${1}'.
"
                ;;
        "nb")
                printf -- "%s" "\
Kunne Ikke Finne '${1}'.
"
                ;;
        "nl")
                printf -- "%s" "\
Kon '${1}' Niet Vinden.
"
                ;;
        "nn")
                printf -- "%s" "\
Kunne Ikkje Finne '${1}'.
"
                ;;
        "ru")
                printf -- "%s" "\
Не Удалось Найти '${1}'.
"
                ;;
        "sv")
                printf -- "%s" "\
Kunde Inte Hitta '${1}'.
"
                ;;
        "uk")
                printf -- "%s" "\
Не Вдалося Знайти '${1}'.
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
无法找到「${1}」。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
無法找到「${1}」。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
Failed To Locate '${1}'.
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

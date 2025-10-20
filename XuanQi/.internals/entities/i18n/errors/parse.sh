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
#               - the subject that could not be parsed.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____subject'.
#               - error on bad execution.
entities_i18n_errors_parse() {
        #____subject="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
Fehler Beim Parsen Von '${1}'.
"
                ;;
        "es")
                printf -- "%s" "\
Error Al Analizar '${1}'.
"
                ;;
        "fr")
                printf -- "%s" "\
Échec De L'Analyse De '${1}'.
"
                ;;
        "ja")
                printf -- "%s" "\
「${1}」の解析に失敗しました。
"
                ;;
        "ko")
                printf -- "%s" "\
'${1}'구문 분석 실패.
진행할 수 없습니다.
지금 종료합니다...
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
'${1}'-Ийг Задлан Шинжлэхэд Алдаа Гарлаа.
Үргэлжлүүлэх Боломжгүй.
Гарах...
"
                ;;
        "ms")
                printf -- "%s" "\
Gagal Menghuraikan '${1}'.
Tidak Dapat Sembung.
Keluar Sekarang...
"
                ;;
        "nb")
                printf -- "%s" "\
Kunne Ikke Parse '${1}'.
Kan Ikke Fortsette.
Avbryter Nå...
"
                ;;
        "nl")
                printf -- "%s" "\
Parseren Van '${1}' Mislukt.
Kan Niet Doorgaan.
Beëindigen...
"
                ;;
        "nn")
                printf -- "%s" "\
Kunne Ikkje Parse '${1}'.
Kan Ikkje Halda Fram.
Avbryt No...
"
                ;;
        "ru")
                printf -- "%s" "\
Ошибка При Разборе '${1}'.
Невозможно Продолжить.
Выхожу...
"
                ;;
        "sv")
                printf -- "%s" "\
Kunne Ikkje Parse '${1}'.
Kan Inte Fortsätta.
Avbryter...
"
                ;;
        "uk")
                printf -- "%s" "\
Не Вдалося Обробити '${1}'.
Неможливо Продовжити.
Виходимо...
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
无法解析「${1}」。
无法继续。
正在退出。。。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
無法解析「${1}」。
無法繼續。
正在退出。。。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
Failed to Parse '${1}'.
Unable to Proceed.
Bailing Out...
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

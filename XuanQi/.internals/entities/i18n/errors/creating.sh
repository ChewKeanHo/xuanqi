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
#               - the subject that could not be created.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '____subject'.
#               - error on bad execution.
entities_i18n_errors_creating() {
        #____subject="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
Fehler Beim Erstellen Von '${1}'.
"
                ;;
        "es")
                printf -- "%s" "\
Error Al Crear '${1}'.
"
                ;;
        "fr")
                printf -- "%s" "\
Erreur Lors De La Création De '${1}'.
"
                ;;
        "ja")
                printf -- "%s" "\
「${1}」の作成中にエラーが発生しました。
"
                ;;
        "ko")
                printf -- "%s" "\
'${1}' 생성 중 오류 발생.
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
'${1}' Үүсгэх Үед Алдаа Гарлаа.
"
                ;;
        "ms")
                printf -- "%s" "\
Ralat Semasa Penciptaan '${1}'!
"
                ;;
        "nb")
                printf -- "%s" "\
Feil Ved Opprettelse Av '${1}'.
"
                ;;
        "nl")
                printf -- "%s" "\
Fout Bij Het Maken Van '${1}'.
"
                ;;
        "nn")
                printf -- "%s" "\
Feil Ved Oppretting Av '${1}'.
"
                ;;
        "ru")
                printf -- "%s" "\
Ошибка При Создании '${1}'.
"
                ;;
        "sv")
                printf -- "%s" "\
Fel Vid Skapande Av '${1}'.
"
                ;;
        "uk")
                printf -- "%s" "\
Помилка Під Створення '${1}'.
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
创建「${1}」时出错！
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
創建「${1}」時出錯！
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
Error Creating '${1}'.
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

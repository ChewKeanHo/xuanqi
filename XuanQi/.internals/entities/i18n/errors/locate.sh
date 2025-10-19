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
# Returns:
#       String
#               - the translated content.
#       Return Code
#               - '0' means ok; error otherwise.
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
Konnte '${1}' nicht finden.
Kann nicht fortfahren.
Beende jetzt...
"
                ;;
        "es")
                printf -- "%s" "\
No se pudo encontrar '${1}'.
No se puede proceder.
Saliendo...
"
                ;;
        "fr")
                printf -- "%s" "\
Échec de la localisation de '${1}'.
Impossible de continuer.
Abandon...
"
                ;;
        "ja")
                printf -- "%s" "\
「${1}」を見つけられませんでした。
続行できません。
終了します...
"
                ;;
        "ko")
                printf -- "%s" "\
'${1}'을(를) 찾을 수 없습니다.
진행할 수 없습니다.
지금 종료합니다...
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
'${1}'-ийг олсонгүй.
Үргэлжлүүлэх боломжгүй.
Гарах...
"
                ;;
        "ms")
                printf -- "%s" "\
Gagal Mencari '${1}'.
Tidak Dapat Sembung.
Keluar Sekarang...
"
                ;;
        "nb")
                printf -- "%s" "\
Kunne ikke finne '${1}'.
Kan ikke fortsette.
Avbryter nå...
"
                ;;
        "nl")
                printf -- "%s" "\
Kon '${1}' niet vinden.
Kan niet doorgaan.
Beëindigen...
"
                ;;
        "nn")
                printf -- "%s" "\
Kunne ikkje finne '${1}'.
Kan ikkje halda fram.
Avbryt no...
"
                ;;
        "ru")
                printf -- "%s" "\
Не удалось найти '${1}'.
Невозможно продолжить.
Выхожу...
"
                ;;
        "sv")
                printf -- "%s" "\
Kunde inte hitta '${1}'.
Kan inte fortsätta.
Avbryter...
"
                ;;
        "uk")
                printf -- "%s" "\
Не вдалося знайти '${1}'.
Неможливо продовжити.
Виходимо...
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
无法找到「${1}」。
无法继续。
正在退出。。。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
無法找到「${1}」。
無法繼續。
正在退出。。。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
Failed to Locate '${1}'.
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

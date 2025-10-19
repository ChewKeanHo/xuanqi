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
Kann Nicht Fortfahren.
Beende Jetzt...
"
                ;;
        "es")
                printf -- "%s" "\
'${1}' Está Vacío.
No Se Puede Proceder.
Saliendo...
"
                ;;
        "fr")
                printf -- "%s" "\
'${1}' Est Vide.
Impossible De Continuer.
Abandon...
"
                ;;
        "ja")
                printf -- "%s" "\
「${1}」は空です。
続行できません。
終了します...
"
                ;;
        "ko")
                printf -- "%s" "\
'${1}'이(가) 비어 있습니다.
진행할 수 없습니다.
지금 종료합니다...
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
'${1}' Хоосон Байна.
Үргэлжлүүлэх Боломжгүй.
Гарах...
"
                ;;
        "ms")
                printf -- "%s" "\
Kosong Nilai '${1}'.
Tidak Dapat Sembung.
Keluar Sekarang...
"
                ;;
        "nb")
                printf -- "%s" "\
'${1}' Er Tom.
Kan Ikke Fortsette.
Avbryter Nå...
"
                ;;
        "nl")
                printf -- "%s" "\
'${1}' Is Leeg.
Kan Niet Doorgaan.
Beëindigen...
"
                ;;
        "nn")
                printf -- "%s" "\
'${1}' er tom.
Kan Ikkje Halda Fram.
Avbryt No...
"
                ;;
        "ru")
                printf -- "%s" "\
'${1}' Пуст.
Невозможно Продолжить.
Выхожу...
"
                ;;
        "sv")
                printf -- "%s" "\
'${1}' Är Tom.
Kan Inte Fortsätta.
Avbryter...
"
                ;;
        "uk")
                printf -- "%s" "\
'${1}' Порожній.
Неможливо Продовжити.
Виходимо...
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
「${1}」空无价值。
无法继续。
正在退出。。。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
「${1}」空無價值。
無法繼續。
正在退出。。。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
'${1}' Is Empty.
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

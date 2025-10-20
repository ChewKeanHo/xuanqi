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
# Returns:
#       String
#               - the translated content.
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on bad execution.
entities_i18n_errors_bad_execution() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
Kann Nicht Fortfahren.
Beende Jetzt...
"
                ;;
        "es")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
No Se Puede Proceder.
Saliendo...
"
                ;;
        "fr")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
Impossible De Continuer.
Abandon...
"
                ;;
        "ja")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
続行できません。
終了します...
"
                ;;
        "ko")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
진행할 수 없습니다.
지금 종료합니다...
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
Үргэлжлүүлэх Боломжгүй.
Гарах...
"
                ;;
        "ms")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
Tidak Dapat Sembung.
Keluar Sekarang...
"
                ;;
        "nb")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
Kan Ikke Fortsette.
Avbryter Nå...
"
                ;;
        "nl")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
Kan Niet Doorgaan.
Beëindigen...
"
                ;;
        "nn")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
Kan Ikkje Halda Fram.
Avbryt No...
"
                ;;
        "ru")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
Невозможно Продолжить.
Выхожу...
"
                ;;
        "sv")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
Kan Inte Fortsätta.
Avbryter...
"
                ;;
        "uk")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
Неможливо Продовжити.
Виходимо...
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
无法继续。
正在退出。。。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
無法繼續。
正在退出。。。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
$(entities_i18n_errors_get_bad_execution)
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

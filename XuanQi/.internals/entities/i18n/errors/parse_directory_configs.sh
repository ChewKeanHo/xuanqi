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
entities_i18n_errors_parse_directory_configs() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
Fehler Beim Parsen Von \$XUANQI_PATH_CONFIGS.
Kann Nicht Fortfahren.
Beende Jetzt...
"
                ;;
        "es")
                printf -- "%s" "\
Error Al Analizar \$XUANQI_PATH_CONFIGS.
No Se Puede Proceder.
Saliendo...
"
                ;;
        "fr")
                printf -- "%s" "\
Échec De L'analyse De \$XUANQI_PATH_CONFIGS.
Impossible De Continuer.
Abandon...
"
                ;;
        "ja")
                printf -- "%s" "\
\$XUANQI_PATH_CONFIGSの解析に失敗しました。
続行できません。
終了します...
"
                ;;
        "ko")
                printf -- "%s" "\
\$XUANQI_PATH_CONFIGS 구문 분석 실패.
진행할 수 없습니다.
지금 종료합니다...
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
\$XUANQI_PATH_CONFIGS-Ийг Задлан Шинжлэхэд Алдаа Гарлаа.
Үргэлжлүүлэх Боломжгүй.
Гарах...
"
                ;;
        "ms")
                printf -- "%s" "\
Gagal Menghuraikan \$XUANQI_PATH_CONFIGS.
Tidak Dapat Sembung.
Keluar Sekarang...
"
                ;;
        "nb")
                printf -- "%s" "\
Kunne Ikke Parse \$XUANQI_PATH_CONFIGS.
Kan Ikke Fortsette.
Avbryter Nå...
"
                ;;
        "nl")
                printf -- "%s" "\
Parseren Van \$XUANQI_PATH_CONFIGS Mislukt.
Kan Niet Doorgaan.
Beëindigen...
"
                ;;
        "nn")
                printf -- "%s" "\
Kunne Ikkje Parse \$XUANQI_PATH_CONFIGS.
Kan Ikkje Halda Fram.
Avbryt No...
"
                ;;
        "ru")
                printf -- "%s" "\
Ошибка При Разборе \$XUANQI_PATH_CONFIGS.
Невозможно Продолжить.
Выхожу...
"
                ;;
        "sv")
                printf -- "%s" "\
Kunne Ikkje Parse \$XUANQI_PATH_CONFIGS.
Kan Inte Fortsätta.
Avbryter...
"
                ;;
        "uk")
                printf -- "%s" "\
Не Вдалося Обробити \$XUANQI_PATH_CONFIGS.
Неможливо Продовжити.
Виходимо...
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
无法解析\$XUANQI_PATH_CONFIGS。
无法继续。
正在退出。。。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
無法解析\$XUANQI_PATH_CONFIGS。
無法繼續。
正在退出。。。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
Failed to Parse \$XUANQI_PATH_CONFIGS.
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

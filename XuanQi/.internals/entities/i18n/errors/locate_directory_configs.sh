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
entities_i18n_errors_locate_directory_configs() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
Konnte \$XUANQI_DIRECTORY_CONFIGS (configs/) nicht finden.
Kann nicht fortfahren.
Beende jetzt...
"
                ;;
        "es")
                printf -- "%s" "\
No se pudo encontrar \$XUANQI_DIRECTORY_CONFIGS (configs/).
No se puede proceder.
Saliendo...
"
                ;;
        "fr")
                printf -- "%s" "\
Échec de la localisation de \$XUANQI_DIRECTORY_CONFIGS (configs/).
Impossible de continuer.
Abandon...
"
                ;;
        "ja")
                printf -- "%s" "\
\$XUANQI_DIRECTORY_CONFIGS (configs/) を見つけられませんでした。
続行できません。
終了します...
"
                ;;
        "ko")
                printf -- "%s" "\
\$XUANQI_DIRECTORY_CONFIGS (configs/)을(를) 찾을 수 없습니다.
진행할 수 없습니다.
지금 종료합니다...
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
\$XUANQI_DIRECTORY_CONFIGS (configs/)-ийг олсонгүй.
Үргэлжлүүлэх боломжгүй.
Гарах...
"
                ;;
        "ms")
                printf -- "%s" "\
Gagal Mencari \$XUANQI_DIRECTORY_CONFIGS (configs/).
Tidak Dapat Sembung.
Keluar Sekarang...
"
                ;;
        "nb")
                printf -- "%s" "\
Kunne ikke finne \$XUANQI_DIRECTORY_CONFIGS (configs/).
Kan ikke fortsette.
Avbryter nå...
"
                ;;
        "nl")
                printf -- "%s" "\
Kon \$XUANQI_DIRECTORY_CONFIGS (configs/) niet vinden.
Kan niet doorgaan.
Beëindigen...
"
                ;;
        "nn")
                printf -- "%s" "\
Kunne ikkje finne \$XUANQI_DIRECTORY_CONFIGS (configs/).
Kan ikkje halda fram.
Avbryt no...
"
                ;;
        "ru")
                printf -- "%s" "\
Не удалось найти \$XUANQI_DIRECTORY_CONFIGS (configs/).
Невозможно продолжить.
Выхожу...
"
                ;;
        "sv")
                printf -- "%s" "\
Kunde inte hitta \$XUANQI_DIRECTORY_CONFIGS (configs/).
Kan inte fortsätta.
Avbryter...
"
                ;;
        "uk")
                printf -- "%s" "\
Не вдалося знайти \$XUANQI_DIRECTORY_CONFIGS (configs/).
Неможливо продовжити.
Виходимо...
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
无法找到\$XUANQI_DIRECTORY_CONFIGS (configs/)。
无法继续。
正在退出。。。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
無法找到\$XUANQI_DIRECTORY_CONFIGS (configs/)。
無法繼續。
正在退出。。。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
Failed to Locate \$XUANQI_DIRECTORY_CONFIGS (configs/).
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

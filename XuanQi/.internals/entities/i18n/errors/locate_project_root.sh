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
entities_i18n_errors_locate_project_root() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
Konnte \$PROJECT_PATH_ROOT nicht finden.
Ist Ihr Repository unter Git-Versionskontrolle (.git/)?
Kann nicht fortfahren.
Beende jetzt...
"
                ;;
        "es")
                printf -- "%s" "\
No se pudo encontrar \$PROJECT_PATH_ROOT.
¿Su repositorio está controlado por Git (.git/)?
No se puede proceder.
Saliendo...
"
                ;;
        "fr")
                printf -- "%s" "\
Échec de la localisation de \$PROJECT_PATH_ROOT.
Votre dépôt est-il sous contrôle de version Git (.git/) ?
Impossible de continuer.
Abandon...
"
                ;;
        "ja")
                printf -- "%s" "\
\$PROJECT_PATH_ROOT を見つけられませんでした。
リポジトリは Git のバージョン管理下 (.git/) にありますか？
続行できません。
終了します...
"
                ;;
        "ko")
                printf -- "%s" "\
\$PROJECT_PATH_ROOT을(를) 찾을 수 없습니다.
저장소가 Git 버전 관리(.git/)를 받고 있습니까?
진행할 수 없습니다.
지금 종료합니다...
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
\$PROJECT_PATH_ROOT-ийг олсонгүй.
Таны хадгалах газар Git-ийн хувилбарын хяналтад (.git/) байна уу?
Үргэлжлүүлэх боломжгүй.
Гарах...
"
                ;;
        "ms")
                printf -- "%s" "\
Gagal Mencari \$PROJECT_PATH_ROOT.
Adakah Repositori Anda Dikawal Versi Git (.git/)?
Tidak Dapat Sembung.
Keluar Sekarang...
"
                ;;
        "nb")
                printf -- "%s" "\
Kunne ikke finne \$PROJECT_PATH_ROOT.
Er repositoriet ditt under Git-versjonskontroll (.git/)?
Kan ikke fortsette.
Avbryter nå...
"
                ;;
        "nl")
                printf -- "%s" "\
Kon \$PROJECT_PATH_ROOT niet vinden.
Staat uw repository onder Git-versiebeheer (.git/)?
Kan niet doorgaan.
Beëindigen...
"
                ;;
        "nn")
                printf -- "%s" "\
Kunne ikkje finne \$PROJECT_PATH_ROOT.
Er repositoriet ditt under Git-versjonskontroll (.git/)?
Kan ikkje halda fram.
Avbryt no...
"
                ;;
        "ru")
                printf -- "%s" "\
Не удалось найти \$PROJECT_PATH_ROOT.
Находится ли ваш репозиторий под контролем версий Git (.git/)?
Невозможно продолжить.
Выхожу...
"
                ;;
        "sv")
                printf -- "%s" "\
Kunde inte hitta \$PROJECT_PATH_ROOT.
Är ditt förråd under Git-versionshantering (.git/)?
Kan inte fortsätta.
Avbryter...
"
                ;;
        "uk")
                printf -- "%s" "\
Не вдалося знайти \$PROJECT_PATH_ROOT.
Чи знаходиться ваше сховище під контролем версій Git (.git/)?
Неможливо продовжити.
Виходимо...
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
无法找到 \$PROJECT_PATH_ROOT。
您的代码库是否受 Git 版本控制 (.git/)？
无法继续。
正在退出。。。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
無法找到 \$PROJECT_PATH_ROOT。
您的儲存庫是否受 Git 版本控制 (.git/)？
無法繼續。
正在退出。。。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
Failed to Locate \$PROJECT_PATH_ROOT.
Is Your Repository Git Version Controlled (.git/)?
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

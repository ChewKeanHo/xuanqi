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
entities_i18n_errors_inside_internals_directory() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "\
Sie befinden sich aktuell im '.internals/' Engine-Verzeichnis!
Gehen Sie heraus und versuchen Sie es erneut.
Kann nicht fortfahren.
Beende jetzt...
"
                ;;
        "es")
                printf -- "%s" "\
¡Actualmente estás dentro del directorio '.internals/' del motor!
Sal y vuelve a intentarlo.
No se puede proceder.
Saliendo...
"
                ;;
        "fr")
                printf -- "%s" "\
Vous êtes actuellement dans le répertoire moteur '.internals/'!
Sortez et réessayez.
Impossible de continuer.
Abandon...
"
                ;;
        "ja")
                printf -- "%s" "\
あなたは現在「.internals/」エンジンディレクトリ内にいます！
出てからもう一度お試しください。
続行できません。
終了します...
"
                ;;
        "ko")
                printf -- "%s" "\
현재 '.internals/' 엔진 디렉토리 안에 있습니다!
나와서 다시 시도하십시오.
진행할 수 없습니다.
지금 종료합니다...
"
                ;;
        "mn-Cyrl")
                printf -- "%s" "\
Та одоо '.internals/' хөдөлгүүрийн хавтас дотор байна!
Гарч дахин оролдоно уу.
Үргэлжлүүлэх боломжгүй.
Гарах...
"
                ;;
        "ms")
                printf -- "%s" "\
Anda Sekarang Di Dalam '.internals/' Direktori Engin.
Sila Keluar Lalu Cuba Semula.
Tidak Dapat Sembung.
Keluar Sekarang...
"
                ;;
        "nb")
                printf -- "%s" "\
Du er for tiden inne i '.internals/' Engine-katalogen!
Gå ut og prøv på nytt.
Kan ikke fortsette.
Avbryter nå...
"
                ;;
        "nl")
                printf -- "%s" "\
U bevindt zich momenteel in de '.internals/' Engine-map!
Ga naar buiten en probeer het opnieuw.
Kan niet doorgaan.
Beëindigen...
"
                ;;
        "nn")
                printf -- "%s" "\
Du er for tida inne i '.internals/' Engine-mappa!
Gå ut og prøv igjen.
Kan ikkje halda fram.
Avbryt no...
"
                ;;
        "ru")
                printf -- "%s" "\
Вы сейчас находитесь в каталоге движка '.internals/'!
Выйдите и попробуйте снова.
Невозможно продолжить.
Выхожу...
"
                ;;
        "sv")
                printf -- "%s" "\
Du befinner dig för närvarande i '.internals/' Engine-katalogen!
Gå ut och försök igen.
Kan inte fortsätta.
Avbryter...
"
                ;;
        "uk")
                printf -- "%s" "\
Ви зараз перебуваєте в каталозі двигуна '.internals/'!
Вийдіть і спробуйте ще раз.
Неможливо продовжити.
Виходимо...
"
                ;;
        "zh-Hans")
                printf -- "%s" "\
您现在”.internals/”引擎文件夹内！
请出去然后再重新开始。
无法继续。
正在退出。。。
"
                ;;
        "zh-Hant")
                printf -- "%s" "\
您現在「.internals/」引擎文件夾內！
請出去然後再重新開始。
無法繼續。
正在退出。。。
"
                ;;
        *)
                # fallback to english
                printf -- "%s" "\
You Are Currently Inside '.internals/' Engine Directory!
Get Out And Try Again.
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

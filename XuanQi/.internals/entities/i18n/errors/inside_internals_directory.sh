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
Sie Befinden Sich Aktuell Im '.internals/' Engine-Verzeichnis!
Gehen Sie Heraus Und Versuchen Sie Es Erneut.
Kann Nicht Fortfahren.
Beende Jetzt...
"
                ;;
        "es")
                printf -- "%s" "\
¡Actualmente Estás Dentro Del Directorio '.internals/' Del Motor!
Sal Y Vuelve A Intentarlo.
No Se Puede Proceder.
Saliendo...
"
                ;;
        "fr")
                printf -- "%s" "\
Vous Êtes Actuellement Dans Le Répertoire Moteur '.internals/'!
Sortez Et Réessayez.
Impossible De Continuer.
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
Та Одоо '.internals/' Хөдөлгүүрийн Хавтас Дотор Байна!
Гарч Дахин Оролдоно Уу.
Үргэлжлүүлэх Боломжгүй.
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
Du Er For Tiden Inne I '.internals/' Engine-Katalogen!
Gå Ut Og Prøv På Nytt.
Kan Ikke Fortsette.
Avbryter Nå...
"
                ;;
        "nl")
                printf -- "%s" "\
U Bevindt Zich Momenteel In De '.internals/' Engine-Map!
Ga Naar Buiten En Probeer Het Opnieuw.
Kan Niet Doorgaan.
Beëindigen...
"
                ;;
        "nn")
                printf -- "%s" "\
Du Er For Tida Inne I '.internals/' Engine-Mappa!
Gå Ut Og Prøv Igjen.
Kan Ikkje Halda Fram.
Avbryt No...
"
                ;;
        "ru")
                printf -- "%s" "\
Вы Сейчас Находитесь В Каталоге Движка '.internals/'!
Выйдите И Попробуйте Снова.
Невозможно Продолжить.
Выхожу...
"
                ;;
        "sv")
                printf -- "%s" "\
Du Befinner Dig För Närvarande I '.internals/' Engine-Katalogen!
Gå Ut Och Försök Igen.
Kan Inte Fortsätta.
Avbryter...
"
                ;;
        "uk")
                printf -- "%s" "\
Ви Зараз Перебуваєте В Каталозі Двигуна '.internals/'!
Вийдьте І Спробуйте Ще Раз.
Неможливо Продовжити.
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
Unable To Proceed.
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

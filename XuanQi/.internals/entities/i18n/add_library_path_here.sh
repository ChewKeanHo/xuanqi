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
#       ____target
#               - the example target.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '$____target'.
#               - error on bad execution.
entities_i18n_add_library_path_here() {
        #____target="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- \
                        "%s" \
                        "Fügen Sie Hier Ihren Bibliothekspfad Hinzu (Z.B. '${1}')."
                ;;
        "es")
                printf -- \
                        "%s" \
                        "Agregue Su Ruta De Biblioteca Aquí (P.Ej. '${1}')."
                ;;
        "fr")
                printf -- \
                        "%s" \
                        "Ajoutez Votre Chemin De Bibliothèque Ici (Par Ex. '${1}')."
                ;;
        "ja")
                printf -- \
                        "%s" \
                        "ここにライブラリパスを追加してください（例：'${1}'）。"
                ;;
        "ko")
                printf -- \
                        "%s" \
                        "여기에 라이브러리 경로를 추가하십시오 (예: '${1}')."
                ;;
        "mn-Cyrl")
                printf -- \
                        "%s" \
                        "Энд Номын Сангийн Замаа Оруулна Уу (Жишээ Нь: '${1}')."
                ;;
        "ms")
                printf -- \
                        "%s" \
                        "Tambah Laluan Direktori Data Anda Di Sini (Cth. '${1}')."
                ;;
        "nb")
                printf -- \
                        "%s" \
                        "Legg Til Din Biblioteksti Her (F.Eks. '${1}')."
                ;;
        "nl")
                printf -- \
                        "%s" \
                        "Voeg Hier Uw Bibliotheekpad Toe (Bijv. '${1}')."
                ;;
        "nn")
                printf -- \
                        "%s" \
                        "Legg Til Din Biblioteksti Her (T.D. '${1}')."
                ;;
        "ru")
                printf -- \
                        "%s" \
                        "Добавьте Свой Путь К Библиотеке Здесь (Напр. '${1}')."
                ;;
        "sv")
                printf -- \
                        "%s" \
                        "Lägg Till Din Bibliotekssökväg Här (T.Ex. '${1}')."
                ;;
        "uk")
                printf -- \
                        "%s" \
                        "Додайте Свій Шлях До Бібліотеки Тут (Напр. '${1}')."
                ;;
        "zh-Hans")
                printf -- \
                        "%s" \
                        "在此添加您的库路径（例如：'${1}'）。"
                ;;
        "zh-Hant")
                printf -- \
                        "%s" \
                        "在此添加您的庫路徑（例如：'${1}'）。"
                ;;
        *)
                # fallback to english
                printf -- \
                        "%s" \
                        "Add Your Library Path Here (e.g. '${1}')."
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

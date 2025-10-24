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
#               - the target for addition.
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty '$____target'.
#               - error on bad execution.
entities_i18n_adding_library_path() {
        #____target="$1"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "Bibliothekspfad '${1}' wird hinzugefügt..."
                ;;
        "es")
                printf -- "%s" "Añadiendo ruta de biblioteca '${1}'..."
                ;;
        "fr")
                printf -- "%s" "Ajout du chemin de bibliothèque '${1}'..."
                ;;
        "ja")
                printf -- "%s" "ライブラリパス「${1}」を追加中..."
                ;;
        "ko")
                printf -- "%s" "라이브러리 경로 '${1}' 추가 중..."
                ;;
        "mn-Cyrl")
                printf -- "%s" "Номын сангийн замыг '${1}' нэмж байна..."
                ;;
        "ms")
                printf -- "%s" "Menambah laluan perpustakaan '${1}'..."
                ;;
        "nb")
                printf -- "%s" "Legger til biblioteksti '${1}'..."
                ;;
        "nl")
                printf -- "%s" "Bibliotheekpad '${1}' toevoegen..."
                ;;
        "nn")
                printf -- "%s" "Legg til bibliotekstien '${1}'..."
                ;;
        "ru")
                printf -- "%s" "Добавление пути к библиотеке '${1}'..."
                ;;
        "sv")
                printf -- "%s" "Lägger till bibliotekssökväg '${1}'..."
                ;;
        "uk")
                printf -- "%s" "Додавання шляху до бібліотеки '${1}'..."
                ;;
        "zh-Hans")
                printf -- "%s" "正在添加库路径 '${1}'..."
                ;;
        "zh-Hant")
                printf -- "%s" "正在添加庫路徑 '${1}'..."
                ;;
        *)
                # fallback to english
                printf -- "%s" "Adding Library Path '${1}'..."
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

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
entities_i18n_errors_create_housing_directory() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" \
                        "Fehler beim Erstellen des Verzeichnisses für die Unterbringung!"
                ;;
        "es")
                printf -- "%s" "¡Error al crear el directorio de alojamiento!"
                ;;
        "fr")
                printf -- "%s" \
                        "Erreur lors de la création du répertoire de logement!"
                ;;
        "ja")
                printf -- "%s" \
                        "ホウジングディレクトリの作成中にエラーが発生しました！"
                ;;
        "ko")
                printf -- "%s" "하우징 디렉토리 생성 오류!"
                ;;
        "mn-Cyrl")
                printf -- "%s" "Хаусын директори үүсгэхэд алдаа гарлаа!"
                ;;
        "ms")
                printf -- "%s" "Ralat semasa mencipta direktori perumahan!"
                ;;
        "nb")
                printf -- "%s" "Feil ved oppretting av huskatalog!"
                ;;
        "nl")
                printf -- "%s" "Fout bij het aanmaken van de huisvestingsmap!"
                ;;
        "nn")
                printf -- "%s" "Feil ved oppretting av huskatalog!"
                ;;
        "ru")
                printf -- "%s" "Ошибка при создании директории для размещения!"
                ;;
        "sv")
                printf -- "%s" "Fel vid skapande av husskatalog!"
                ;;
        "uk")
                printf -- "%s" "Помилка при створенні директорії для розміщення!"
                ;;
        "zh-Hans")
                printf -- "%s" "创建储存储目录时出错！"
                ;;
        "zh-Hant")
                printf -- "%s" "創建儲存儲目錄時出錯！"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Error creating housing directory!"
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

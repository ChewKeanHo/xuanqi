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
entities_i18n_errors_get_empty_filepath() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "Dateipfad darf nicht leer sein!"
                ;;
        "es")
                printf -- "%s" "¡Ruta de archivo no puede estar vacía!"
                ;;
        "fr")
                printf -- "%s" "Chemin de fichier ne peut pas être vide !"
                ;;
        "ja")
                printf -- "%s" "ファイルパスは空にできません！"
                ;;
        "ko")
                printf -- "%s" "파일 경로는 비어 있을 수 없습니다!"
                ;;
        "mn-Cyrl")
                printf -- "%s" "Файлын зам хоосон байж болохгүй!"
                ;;
        "ms")
                printf -- "%s" "Laluan fail tidak boleh jadi kosong!"
                ;;
        "nb")
                printf -- "%s" "Filsti kan ikke være tom!"
                ;;
        "nl")
                printf -- "%s" "Bestandspad mag niet leeg zijn!"
                ;;
        "nn")
                printf -- "%s" "Filsti kan ikkje vera tom!"
                ;;
        "ru")
                printf -- "%s" "Путь к файлу не может быть пустым!"
                ;;
        "sv")
                printf -- "%s" "Filsökvägen kan inte vara tom!"
                ;;
        "uk")
                printf -- "%s" "Шлях до файлу не може бути порожнім!"
                ;;
        "zh-Hans")
                printf -- "%s" "文件路径不可空档！"
                ;;
        "zh-Hant")
                printf -- "%s" "檔案路徑不可空檔！"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Filepath Cannot Be Empty!"
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

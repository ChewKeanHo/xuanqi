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
entities_i18n_errors_outside_project_path() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" \
                        "Der angegebene Pfad liegt außerhalb von \$PROJECT_PATH_ROOT!"
                ;;
        "es")
                printf -- "%s" \
                        "La ruta proporcionada está fuera de \$PROJECT_PATH_ROOT!"
                ;;
        "fr")
                printf -- "%s" \
                        "Le chemin donné est en dehors de \$PROJECT_PATH_ROOT!"
                ;;
        "ja")
                printf -- "%s" \
                        "指定されたパスは \$PROJECT_PATH_ROOT の外側にあります！"
                ;;
        "ko")
                printf -- "%s" \
                        "지정된 경로는 \$PROJECT_PATH_ROOT 외부에 있습니다!"
                ;;
        "mn-Cyrl")
                printf -- "%s" \
                        "Өгсөн Зам нь \$PROJECT_PATH_ROOT-ийн гадна байна!"
                ;;
        "ms")
                printf -- "%s" \
                        "Laluan Diberi Adalah Di Luar \$PROJECT_PATH_ROOT!"
                ;;
        "nb")
                printf -- "%s" \
                        "Den oppgitte banen er utenfor \$PROJECT_PATH_ROOT!"
                ;;
        "nl")
                printf -- "%s" \
                        "Het opgegeven pad ligt buiten \$PROJECT_PATH_ROOT!"
                ;;
        "nn")
                printf -- "%s" \
                        "Den oppgitte stien er utanfor \$PROJECT_PATH_ROOT!"
                ;;
        "ru")
                printf -- "%s" \
                        "Указанный путь находится вне \$PROJECT_PATH_ROOT!"
                ;;
        "sv")
                printf -- "%s" \
                        "Den angivna sökvägen är utanför \$PROJECT_PATH_ROOT!"
                ;;
        "uk")
                printf -- "%s" \
                        "Вказаний шлях знаходиться поза \$PROJECT_PATH_ROOT!"
                ;;
        "zh-Hans")
                printf -- "%s" "呈现的路径是在\$PROJECT_PATH_ROOT之外！"
                ;;
        "zh-Hant")
                printf -- "%s" "呈現的路徑是在\$PROJECT_PATH_ROOT之外！"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Given Path is Outside of \$PROJECT_PATH_ROOT!"
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

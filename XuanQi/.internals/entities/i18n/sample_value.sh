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
# Outputs:
#       String
#               - the translated content.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on bad execution.
entities_i18n_sample_value() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "Beispielwert"
                ;;
        "es")
                printf -- "%s" "Valor de Ejemplo"
                ;;
        "fr")
                printf -- "%s" "Valeur d'Exemple"
                ;;
        "ja")
                printf -- "%s" "サンプル値"
                ;;
        "ko")
                printf -- "%s" "샘플 값"
                ;;
        "mn-Cyrl")
                printf -- "%s" "Жишээ Үнэ"
                ;;
        "ms")
                printf -- "%s" "Contoh Nilai"
                ;;
        "nb")
                printf -- "%s" "Eksempelverdi"
                ;;
        "nl")
                printf -- "%s" "Voorbeeldwaarde"
                ;;
        "nn")
                printf -- "%s" "Dømeverdi"
                ;;
        "ru")
                printf -- "%s" "Пример Значения"
                ;;
        "sv")
                printf -- "%s" "Exempelvärde"
                ;;
        "uk")
                printf -- "%s" "Приклад Значення"
                ;;
        "zh-Hans")
                printf -- "%s" "比如样本值"
                ;;
        "zh-Hant")
                printf -- "%s" "比如樣本值"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Example Value"
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

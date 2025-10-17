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
entities_i18n_get_type() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "Typ"
                ;;
        "es")
                printf -- "%s" "Tipo"
                ;;
        "fr")
                printf -- "%s" "Type"
                ;;
        "ja")
                printf -- "%s" "タイプ"
                ;;
        "ko")
                printf -- "%s" "유형"
                ;;
        "mn-Cyrl")
                printf -- "%s" "Төрөл"
                ;;
        "ms")
                printf -- "%s" "Jenis"
                ;;
        "nb")
                printf -- "%s" "Type"
                ;;
        "nl")
                printf -- "%s" "Type"
                ;;
        "nn")
                printf -- "%s" "Type"
                ;;
        "ru")
                printf -- "%s" "Тип"
                ;;
        "sv")
                printf -- "%s" "Typ"
                ;;
        "uk")
                printf -- "%s" "Тип"
                ;;
        "zh-Hans")
                printf -- "%s" "类型"
                ;;
        "zh-Hant")
                printf -- "%s" "類型"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Type"
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

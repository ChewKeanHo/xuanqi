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
entities_i18n_get_operation_successful() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "Operation erfolgreich!"
                ;;
        "es")
                printf -- "%s" "¡Operación exitosa!"
                ;;
        "fr")
                printf -- "%s" "Opération réussie!"
                ;;
        "ja")
                printf -- "%s" "操作が成功しました！"
                ;;
        "ko")
                printf -- "%s" "작업 성공!"
                ;;
        "mn-Cyrl")
                printf -- "%s" "Үйлдэл амжилттай!"
                ;;
        "ms")
                printf -- "%s" "Operasi Berjaya!"
                ;;
        "nb")
                printf -- "%s" "Operasjon vellykket!"
                ;;
        "nl")
                printf -- "%s" "Operatie geslaagd!"
                ;;
        "nn")
                printf -- "%s" "Operasjon vellykka!"
                ;;
        "ru")
                printf -- "%s" "Операция успешна!"
                ;;
        "sv")
                printf -- "%s" "Åtgärd lyckades!"
                ;;
        "uk")
                printf -- "%s" "Операція успішна!"
                ;;
        "zh-Hans")
                printf -- "%s" "执行成功！"
                ;;
        "zh-Hant")
                printf -- "%s" "執行成功！"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Operation Success!"
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

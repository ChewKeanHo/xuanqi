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
entities_i18n_errors_get_empty_key() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "Schlüssel darf nicht leer sein!"
                ;;
        "es")
                printf -- "%s" "¡Clave no puede estar vacía!"
                ;;
        "fr")
                printf -- "%s" "Clé ne peut pas être vide!"
                ;;
        "ja")
                printf -- "%s" "キーを空にすることはできません！"
                ;;
        "ko")
                printf -- "%s" "키는 비어 있을 수 없습니다!"
                ;;
        "mn-Cyrl")
                printf -- "%s" "Түлхүүр хоосон байж болохгүй!"
                ;;
        "ms")
                printf -- "%s" "Kekunci tidak boleh jadi kosong!"
                ;;
        "nb")
                printf -- "%s" "Nøkkel kan ikke være tom!"
                ;;
        "nl")
                printf -- "%s" "Sleutel mag niet leeg zijn!"
                ;;
        "nn")
                printf -- "%s" "Nøkkel kan ikkje vera tom!"
                ;;
        "ru")
                printf -- "%s" "Ключ не может быть пустым!"
                ;;
        "sv")
                printf -- "%s" "Nyckeln kan inte vara tom!"
                ;;
        "uk")
                printf -- "%s" "Ключ не може бути порожнім!"
                ;;
        "zh-Hans")
                printf -- "%s" "键不可空档！"
                ;;
        "zh-Hant")
                printf -- "%s" "鍵不可空檔！"
                ;;
        *)
                # fallback to english
                printf -- "%s" "Key cannot be empty!"
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

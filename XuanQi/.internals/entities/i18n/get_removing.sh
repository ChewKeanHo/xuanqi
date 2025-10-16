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
entities_i18n_get_removing() {
        #____target="$1"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi


        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- "%s" "Entferne '${1}'..."
                ;;
        "es")
                printf -- "%s" "Eliminando '${1}'..."
                ;;
        "fr")
                printf -- "%s" "Suppression de '${1}'..."
                ;;
        "ja")
                printf -- "%s" "'${1}' を削除しています..."
                ;;
        "ko")
                printf -- "%s" "'${1}' 삭제 중..."
                ;;
        "mn-Cyrl")
                printf -- "%s" "'${1}' устгаж байна..."
                ;;
        "ms")
                printf -- "%s" "Menghampuskan '${1}'..."
                ;;
        "nb")
                printf -- "%s" "Fjerner '${1}'..."
                ;;
        "nl")
                printf -- "%s" "'${1}' wordt verwijderd..."
                ;;
        "nn")
                printf -- "%s" "Fjernar '${1}'..."
                ;;
        "ru")
                printf -- "%s" "Удаление '${1}'..."
                ;;
        "sv")
                printf -- "%s" "Tar bort '${1}'..."
                ;;
        "uk")
                printf -- "%s" "Видалення '${1}'..."
                ;;
        "zh-Hans")
                printf -- "%s" "正在删除“${1}”..."
                ;;
        "zh-Hant")
                printf -- "%s" "正在刪除「${1}」..."
                ;;
        *)
                # fallback to english
                printf -- "%s" "Removing '${1}'..."
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

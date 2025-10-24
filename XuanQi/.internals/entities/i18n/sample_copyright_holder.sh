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
entities_i18n_sample_copyright_holder() {
        # execute
        case "$XUANQI_LANGUAGE" in
        "de")
                printf -- \
                        "%s" \
                        "(C) Urheberrecht [VOLLSTÄNDIGER RECHTSNAME HIER] <KONTAKT-EMAIL>"
                ;;
        "es")
                printf -- \
                        "%s" \
                        "(C) Derechos de Autor [NOMBRE LEGAL COMPLETO AQUÍ] <CORREO DE CONTACTO>"
                ;;
        "fr")
                printf -- \
                        "%s" \
                        "(C) Copyright [NOM LÉGAL COMPLET ICI] <COURRIEL DE CONTACT>"
                ;;
        "ja")
                printf -- \
                        "%s" \
                        "(C) 著作権 [正式な法人名をここに] <連絡先メールアドレス>"
                ;;
        "ko")
                printf -- \
                        "%s" \
                        "(C) 저작권 [전체 법적 명칭을 여기에] <연락처 이메일>"
                ;;
        "mn-Cyrl")
                printf -- \
                        "%s" \
                        "(C) Зохиогчийн эрх [БҮРЭН ЭРХ ЗҮЙН НЭРИЙГ ЭНД] <ХОЛБОО БАРИХ ИМЭЙЛ>"
                ;;
        "ms")
                printf -- \
                        "%s" \
                        "(C) Hak Cipta [NAMA PENUH ENTITI SAH DI SINI] <E-MEL KONTAK>"
                ;;
        "nb")
                printf -- \
                        "%s" \
                         "(C) Opphavsrett [FULLT JURIDISK NAVN HER] <KONTAKT E-POST>"
                ;;
        "nl")
                printf -- \
                        "%s" \
                         "(C) Auteursrecht [VOLLEDIGE JURIDISCHE NAAM HIER] <CONTACT E-MAIL>"
                ;;
        "nn")
                printf -- \
                        "%s" \
                        "(C) Opphavsrett [FULLT JURIDISK NAMN HER] <KONTAKT E-POST>"
                ;;
        "ru")
                printf -- \
                        "%s" \
                        "(C) Авторское право [ПОЛНОЕ ЮРИДИЧЕСКОЕ НАЗВАНИЕ ЗДЕСЬ] <КОНТАКТНЫЙ EMAIL>"
                ;;
        "sv")
                printf -- \
                        "%s" \
                        "(C) Upphovsrätt [FULLT JURIDISKT NAMN HÄR] <KONTAKT E-POST>"
                ;;
        "uk")
                printf -- \
                        "%s" \
                        "(C) Авторське право [ПОВНА ЮРИДИЧНА НАЗВА ТУТ] <КОНТАКТНА ЕЛЕКТРОННА ПОШТА>"
                ;;
        "zh-Hans")
                printf -- \
                        "%s" \
                        "(C) 版权 [此处填写完整法律全名] <联系邮箱>"
                ;;
        "zh-Hant")
                printf -- \
                        "%s" \
                        "(C) 版權 [此處填寫完整法律全名] <聯繫郵箱>"
                ;;
        *)
                # fallback to english
                printf -- \
                        "%s" \
                        "(C) Copyright [FULL LEGAL NAME HERE] <CONTACT EMAIL>"
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

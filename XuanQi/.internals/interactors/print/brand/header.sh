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
#               - the brand's header content.
#               - empty on error.
#       Return Code
#               - '0' means ok; error otherwise.
#               - error when bad executions.
interactors_print_brand_header() {
        # execute
        printf -- "%s" "\
$(interactors_print_brand_logo)
$(interactors_print_brand_pitch)
SKU
$(interactors_print_sku)

$(entities_i18n_get_version)
$(interactors_print_version)

$(entities_i18n_get_license)
$(interactors_print_license_name)
$(interactors_print_license_url)
"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

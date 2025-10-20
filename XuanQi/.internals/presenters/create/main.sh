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




# print trademark as header
interactors_print_info "\
$(interactors_print_brand_header)
"
interactors_print_info "$(interactors_print_ui_horizontal_line 3)"




# execute by type
case "$2" in
component)
        . "${XUANQI_PATH_ROOT}/presenters/create/component/main.sh"
        if [ $? -ne 0 ]; then
                return 1
        fi
        ;;
config)
        . "${XUANQI_PATH_ROOT}/presenters/create/config/main.sh"
        if [ $? -ne 0 ]; then
                return 1
        fi
        ;;
data)
        . "${XUANQI_PATH_ROOT}/presenters/create/data/main.sh"
        if [ $? -ne 0 ]; then
                return 1
        fi
        ;;
*)
        interactors_print_error "\
Unknown Output Type. Please Re-Try With:
        $ [XUANQI] create [TYPE] [VALUE1] [VALUE2] ...
Unable to Proceed.
Bailing Out...
"
        return 1
        ;;
esac




# print footer
interactors_print_info "$(interactors_print_ui_horizontal_line 3)"




# report status
return 0

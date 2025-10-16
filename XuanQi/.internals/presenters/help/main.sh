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




# run through each specific section
case "$2" in
purge)
        interactors_print_info "$(interactors_print_help_purge_index)"
        ;;
*)
        interactors_print_info "$(interactors_print_help_index)"
        ;;
esac




# print footer
interactors_print_info "$(interactors_print_ui_horizontal_line 3)"




# report status
return 0

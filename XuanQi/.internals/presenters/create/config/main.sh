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




# validate inputs
____path="${3##"${PROJECT_PATH_ROOT}"}"
____path="${____path##"${XUANQI_DIRECTORY_CONFIGS}"}"
____path="${____path#/}"
____path="${XUANQI_PATH_CONFIGS:-"???"}/${____path%.conf}.conf"
interactors_print_info "\
$(interactors_print_responses_type)
${2:-"???"}

PROJECT_PATH_ROOT
${PROJECT_PATH_ROOT:-"???"}

PROJECT_DIRECTORY_CONFIGS
${XUANQI_DIRECTORY_CONFIGS:-"???"}

PROJECT_PATH_CONFIGS
${XUANQI_PATH_CONFIGS:-"???"}

$(interactors_print_responses_given_path)
${3:-"???"}

$(interactors_print_responses_target)
${____path:-"???"}
"


if [ "$PROJECT_PATH_ROOT" = "" ] ||
[ "${____path##"${PROJECT_PATH_ROOT}/"}" = "$____path" ]; then
        interactors_print_error "\
$(interactors_print_responses_errors_outside_project_path)
"
        return 1
fi

if [ ! -d "$XUANQI_PATH_CONFIGS" ]; then
        interactors_print_error "\
$(\
        interactors_print_responses_errors_locate \
                "\$XUANQI_DIRECTORY_CONFIGS (configs/)"
)
"
        return 1
fi

if [ "$3" = "" ]; then
        interactors_print_error "\
$(interactors_print_responses_errors_empty_filepath)
"
        return 1
fi




# execute
interactors_print_info "\


$(interactors_print_responses_creating "$____path")
"
interactors_data_create \
        "$____path" \
        "$4" \
        "${5:-"$(interactors_print_responses_sample_value)"}"
case $? in
0)
        # ok
        ;;
1)
        # empty filepath
        interactors_print_error "\
$(interactors_print_responses_errors_empty_filepath)
"
        return 1
        ;;
2)
        # target already exists
        interactors_print_error "\
$(interactors_print_responses_errors_target_exists)
"
        return 1
        ;;
3)
        # empty key
        interactors_print_error "\
$(interactors_print_responses_errors_empty_key)
"
        return 1
        ;;
4)
        # error creating housing directory
        interactors_print_error "\
$(interactors_print_responses_errors_create_housing_directory)
"
        return 1
        ;;
5)
        # error execution
        interactors_print_error "\
$(interactors_print_responses_errors_bad_execution)
"
        return 1
        ;;
*)
        ;;
esac




# report status
        interactors_print_success "\
$(interactors_print_responses_operation_successful)
"
return 0

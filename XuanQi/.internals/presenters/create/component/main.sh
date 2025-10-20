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
XUANQI_DIRECTORY_COMPONENTS="${XUANQI_DIRECTORY_COMPONENTS:-"???"}"
XUANQI_PATH_COMPONENTS="${PROJECT_PATH_ROOT%/}/${XUANQI_DIRECTORY_COMPONENTS#/}"

____path="${4##"${PROJECT_PATH_ROOT}"}"
____path="${____path##"${XUANQI_DIRECTORY_COMPONENTS}"}"
____path="${____path#/}"
____path="${XUANQI_PATH_COMPONENTS:-"???"}/${____path}"
interactors_print_info "\
$(interactors_print_responses_type)
${2:-"???"}

PROJECT_PATH_ROOT
${PROJECT_PATH_ROOT:-"???"}

PROJECT_DIRECTORY_COMPONENTS
${XUANQI_DIRECTORY_COMPONENTS:-"???"}

PROJECT_PATH_COMPONENTS
${XUANQI_PATH_COMPONENTS:-"???"}

$(interactors_print_responses_given_path)
${4:-"???"}

$(interactors_print_responses_target)
${____path:-"???"}
"


if [ "$PROJECT_PATH_ROOT" = "" ] ||
[ "${____path##"${PROJECT_PATH_ROOT}/"}" = "$____path" ]; then
        interactors_print_error "\
$(\
        interactors_print_responses_errors_outside_of \
                "\$PROJECT_PATH_ROOT" \
                "[RELATIVE_PATH]" \
)
"
        return 1
fi

if [ ! -d "$XUANQI_PATH_COMPONENTS" ]; then
        interactors_print_error "\
$(\
        interactors_print_responses_errors_locate \
                "\$XUANQI_DIRECTORY_COMPONENTS (components/)"
)
"
        return 1
fi

if [ "$4" = "" ]; then
        interactors_print_error "\
$(interactors_print_responses_errors_empty "[RELATIVE_PATH]")
"
        return 1
fi




# execute
interactors_print_info "\


$(interactors_print_responses_creating "$____path")
"
interactors_components_create "$____path" "$3"
case $? in
0)
        # ok
        ;;
1)
        # empty filepath
        interactors_print_error "\
$(interactors_print_responses_errors_empty "[RELATIVE_PATH]")
"
        return 1
        ;;
2)
        # target already exists
        interactors_print_error "\
$(interactors_print_responses_errors_exists "[RELATIVE_PATH]")
"
        return 1
        ;;
3)
        # empty type
        interactors_print_error "\
$(interactors_print_responses_errors_empty "[TYPE]")
"
        return 1
        ;;
4)
        # invalid type
        interactors_print_error "\
$(interactors_print_responses_errors_invalid "[TYPE]")
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

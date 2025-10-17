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




# initialize $XUANQI_PATH_ROOT
XUANQI_PATH_CURRENT="$PWD"
if [ -f "${PWD}/presenters/start.sh" ]; then
        XUANQI_PATH_ROOT="$PWD"
elif [ -f "${PWD}/.internals/presenters/start.sh" ]; then
        XUANQI_PATH_ROOT="${PWD}/.internals"
elif [ -f "start.sh" ]; then
        XUANQI_PATH_ROOT="${PWD%/*}" # get out of 'presenters/'
elif [ "${0##*/}" = "$XUANQI_SCRIPT_START" ] ||
[ "${0##*/}" = "${XUANQI_SCRIPT_START}.ps1" ]; then
        # the first parameter can be used to determine the project path
        XUANQI_PATH_ROOT="${0%/*}"
        if [ "${XUANQI_PATH_ROOT##*/}" = "$XUANQI_PATH_INIT" ]; then
                # one more level in
                XUANQI_PATH_ROOT="${XUANQI_PATH_ROOT%/*}"
        fi
else
        ____pathing="$PWD"
        ____previous=""
        XUANQI_PATH_ROOT=""
        while [ "$____pathing" != "" ]; do
                if [ "$____pathing" = "$____previous" ]; then
                        if [ -f "/usr/local/lib/chewkeanho/xuanqi/presenters/start.sh" ]; then
                                # system installed app
                                XUANQI_PATH_ROOT="/usr/local/lib/chewkeanho/xuanqi"
                                break
                        else
                                1>&2 printf -- "%s" "\
E: \$XUANQI_PATH_ROOT -> ??? <- XuanQi Dev!!!
"
                                return 1
                        fi
                fi

                XUANQI_PATH_ROOT="${XUANQI_PATH_ROOT%/}/${____pathing%%/*}"
                ____pathing="${____pathing#*/}"
                if [ -f ".internals/presenters/start.sh" ]; then
                        break
                fi
        done
        unset ____pathing ____previous
fi




# Parameters:
#       ____path_source
#               - input directory path.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error when given path is empty.
#               - error when given path is invalid.
#               - error on bad execution.
interactors_libraries_read_directory() {
        #____path="$1"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ -d "$1" ]; then
                : # accepted
        elif [ -L "$1" ]; then
                if [ ! -d "$(readlink --canonicalize "$1")" ]; then
                        return 1
                fi
                : # accepted
        else
                return 1
        fi


        # execute
        for ____item in "${1}/"*; do
                if [ -d "$____item" ]; then
                        interactors_libraries_read_directory "$____item"
                        continue
                elif [ ! -f "$____item" ]; then
                        continue
                fi

                if [ "${____item%".sh"}" = "$____item" ]; then
                        continue # not a shell script
                fi

                if [ ! "${____item%"_test.sh"}" = "$____item" ]; then
                        continue # do not import test script
                fi

                if [ ! "${____item#"."}" = "$____item" ]; then
                        continue # do not import hidden file
                fi

                if [ ! "${____item#"~"}" = "$____item" ]; then
                        continue # do not import temporary file
                fi

                . "$____item"
                if [ $? -ne 0 ]; then
                        unset ____item
                        return 1
                fi
        done
        unset ____item


        # report status
        return 0
}




# import XuanQi's libraries
interactors_libraries_read_directory "${XUANQI_PATH_ROOT}/entities"
if [ $? -ne 0 ]; then
        1>&2 printf -- "%s" "\
E: '${XUANQI_PATH_ROOT}/entities' -> ?!?!  <- XuanQi Dev!!!

"
        return 1
fi


interactors_libraries_read_directory "${XUANQI_PATH_ROOT}/views"
if [ $? -ne 0 ]; then
        1>&2 printf -- "%s" "\
E: '${XUANQI_PATH_ROOT}/views' -> ?!?!  <- XuanQi Dev!!!

"
        return 1
fi


interactors_libraries_read_directory "${XUANQI_PATH_ROOT}/interactors"
if [ $? -ne 0 ]; then
        1>&2 printf -- "%s" "\
E: '${XUANQI_PATH_ROOT}/interactors' -> ?!?!  <- XuanQi Dev!!!

"
        return 1
fi




# locate PROJECT_PATH_ROOT
____pathing="$XUANQI_PATH_ROOT"
____previous=""
PROJECT_PATH_ROOT=""
while [ "$____pathing" != "" ]; do
        if [ "$____pathing" = "$____previous" ]; then
                interactors_print_error "\
$(interactors_print_responses_errors_locate_project_root)
"
                return 1
        fi

        PROJECT_PATH_ROOT="${PROJECT_PATH_ROOT%/}/${____pathing%%/*}"
        ____pathing="${____pathing#*/}"
        if [ -f "${PROJECT_PATH_ROOT}/.git/config" ]; then
                break
        fi
done
unset ____pathing ____previous




# ensure safe operation outside local .internals directory
if [ ! "${XUANQI_PATH_ROOT%".internals"}" = "$XUANQI_PATH_ROOT" ] &&
[ "$PWD" = "$XUANQI_PATH_ROOT" ]; then
        interactors_print_error "\
$(interactors_print_responses_errors_inside_internals_directory)
"
        return 1
fi




# define all directory names
XUANQI_DIRECTORY_CONFIGS="configs"
XUANQI_DIRECTORY_COMPONENTS="components"
XUANQI_DIRECTORY_LAYOUTS="layouts"
XUANQI_DIRECTORY_LOGS="logs"
XUANQI_DIRECTORY_PUBLIC="public"
XUANQI_DIRECTORY_ROUTERS="routers"
XUANQI_DIRECTORY_TEMPS="tmp"
XUANQI_DIRECTORY_TESTS="tests"




# handles $XUANQI_PATH_CONFIGS configs
case "$1" in
-h|help|Help|HELP|--help|--Help|--HELP)
        # exempted
        ;;
*)
        # locate XUANQI_PATH_CONFIGS
        XUANQI_PATH_CONFIGS="${PROJECT_PATH_ROOT}/${XUANQI_DIRECTORY_CONFIGS}"
        if [ ! -d "$XUANQI_PATH_CONFIGS" ]; then
                # try current directory
                XUANQI_PATH_CONFIGS="${PWD}/${XUANQI_DIRECTORY_CONFIGS}"
        fi


        if [ ! -d "$XUANQI_PATH_CONFIGS" ]; then
                # try XUANQI_PATH_ROOT workspace path
                if [ "${XUANQI_PATH_ROOT#"/usr/"}" = "$XUANQI_PATH_ROOT" ]; then
                        XUANQI_PATH_CONFIGS="\
${XUANQI_PATH_ROOT%/*}/${XUANQI_DIRECTORY_CONFIGS}\
"
                fi
        fi


        if [ ! -d "$XUANQI_PATH_CONFIGS" ]; then
                if [ "$1" = "create" ] && [ "$2" = "workspace" ]; then
                        : # exempted
                else
                        interactors_print_error "\
$(interactors_print_responses_errors_locate_directory_configs)
"
                        return 1
                fi
        fi
esac




# save early language settings if set
____lang="$XUANQI_LANGUAGE"




# parse config directory whenever available
if [ ! "$XUANQI_PATH_CONFIGS" = "" ] && [ -d "$XUANQI_PATH_CONFIGS" ]; then
        interactors_data_read_directory "$XUANQI_PATH_CONFIGS"
        if [ $? -ne 0 ]; then
                        interactors_print_error "\
\$XUANQI_PATH_CONFIGS
${XUANQI_PATH_CONFIGS}

$(interactors_print_responses_errors_parse_directory_configs)
"
                return 1
        fi
fi




# configure $XUANQI_LANGUAGE
if [ ! "$____lang" = "" ]; then
        XUANQI_LANGUAGE="$____lang" # user performs environment overrides
elif [ "$XUANQI_LANGUAGE" = "" ] && [ "$____lang" = "" ]; then
        if [ ! "${LANG%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LANG%.*}"
        elif [ ! "${LC_ALL%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_ALL%.*}"
        elif [ ! "${LC_CTYPE%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_CTYPE%.*}"
        elif [ ! "${LC_NUMERIC%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_NUMERIC%.*}"
        elif [ ! "${LC_TIME%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_TIME%.*}"
        elif [ ! "${LC_COLLATE%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_COLLATE%.*}"
        elif [ ! "${LC_MONETARY%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_MONETARY%.*}"
        elif [ ! "${LC_MESSAGES%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_MESSAGES%.*}"
        elif [ ! "${LC_PAPER%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_PAPER%.*}"
        elif [ ! "${LC_NAME%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_NAME%.*}"
        elif [ ! "${LC_ADDRESS%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_ADDRESS%.*}"
        elif [ ! "${LC_TELEPHONE%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_TELEPHONE%.*}"
        elif [ ! "${LC_MEASUREMENT%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_MEASUREMENT%.*}"
        elif [ ! "${LC_IDENTIFICATION%.*}" = "" ]; then
                XUANQI_LANGUAGE="${LC_IDENTIFICATION%.*}"
        else
                XUANQI_LANGUAGE="en"
        fi
fi
unset ____lang
XUANQI_LANGUAGE="${XUANQI_LANGUAGE%%_*}"




# execute by first parameter
case "$1" in
create)
        . "${XUANQI_PATH_ROOT}/presenters/create/main.sh"
        if [ $? -ne 0 ]; then
                return 1
        fi
        ;;
-h|help|Help|HELP|--help|--Help|--HELP)
        . "${XUANQI_PATH_ROOT}/presenters/help/main.sh"
        if [ $? -ne 0 ]; then
                return 1
        fi
        ;;
purge)
        . "${XUANQI_PATH_ROOT}/presenters/purge/main.sh"
        if [ $? -ne 0 ]; then
                return 1
        fi
        ;;
*)
        . "${XUANQI_PATH_ROOT}/presenters/help/main.sh"
        return 1
        ;;
esac




# report status
return 0

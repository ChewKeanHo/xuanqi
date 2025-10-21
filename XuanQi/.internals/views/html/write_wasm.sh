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
#       ____path_dest
#               - COMPULSORY
#               - the destination file to write into.
#       ____wasm_url_or_filepath
#               - COMPULSORY
#               - the compiled wasm content source location.
#               - when '____embed_wasm' is 'true', it **MUST** be a
#                 filepath.
#               - otherwise, it's a fetchable URL.
#       ____firmware_scripts_filepaths
#               - OPTIONAL
#               - the wasm firmware webscript libraries. Some WASM needs
#                 these firmware to be loaded in order to function
#                 properly.
#               - this field is optional depending on the WASM compiler.
#       ____embed_wasm
#               - OPTIONAL
#               - decision to embed WASM into the HTML document.
#               - either empty (no) or 'true' (yes).
#       ____import_statement_script
#               - OPTIONAL
#               - the import webscript statements when WebAssembly is
#                 instantiateStreaming alongside the source.
#               - this field is optional depending on the WASM compiler.
#       ____init_statement_script
#               - OPTIONAL
#               - the init webscript statements when WebAssembly has
#                 completed its initialization. It is a
#                 'then(result => {})' content.
#               - this field is optional depending on the WASM compiler.
# Outputs:
#       Write to $____path_dest File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on invalid '$____path_dest' (e.g. 'empty').
#               - error on invalid '$____wasm_url_or_filepath'
#                 (e.g. empty).
#               - error when 'od' program is unavailable and
#                 '$____embed_wasm' is 'true'.
#               - error when '$____wasm_url_or_filepath' is not a
#                 file when '$____embed_wasm' is 'true'.
#               - error on bad execution.
views_html_write_wasm() {
        #____path_dest="$1"
        #____wasm_url_or_filepath="$2"
        #____firmware_scripts_filepaths="$3"
        #____embed_wasm="$4"
        #____import_statement_script="$5"
        #____init_statement_script="$6"


        # validate input
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ "$2" = "" ]; then
                return 1
        fi

        if [ "$4" = "true" ]; then
                command -v od 2> /dev/null
                if [ $? -ne 0 ]; then
                        return 1
                fi

                if [ ! -f "$2" ]; then
                        return 1
                fi
        fi


        # execute
        ## link wasm firmware libraries when requested
        if [ ! "$4" = "true" ]; then
                ____old_IFS="$IFS"
                while IFS="" read -r ____library || [ -n "$____library" ]; do
                        if [ "$____library" = "" ]; then
                                continue
                        fi

                        if [ ! -f "$____library" ]; then
                                IFS="$____old_IFS"
                                unset ____library ____old_IFS
                                return 1
                        fi

                        # link firmware library
                        printf -- "%s" "\
$(views_html_get_indent 1)<script defer type='module'
$(views_html_get_indent 2)src='${____library}'>
$(views_html_get_indent 1)</script>
" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                return 1
                        fi
                done<<EOF
${3}
EOF
                IFS="$____old_IFS"
                unset ____library ____old_IFS
        fi

        ## write wasm initialization script opener
        printf -- "%s" "\
$(views_html_get_indent 1)<script defer type='module'>
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## embed wasm firmware libraries when requested
        if [ "$4" = "true" ]; then
                ____old_IFS="$IFS"
                while IFS="" read -r ____library || [ -n "$____library" ]; do
                        if [ "$____library" = "" ]; then
                                continue
                        fi

                        if [ ! -f "$____library" ]; then
                                IFS="$____old_IFS"
                                unset ____line ____library ____old_IFS
                                return 1
                        fi

                        # inline firmware codes
                        while IFS="" read -r ____line || [ -n "$____line" ]; do
                                printf -- "%s" "\
${____line}
" >> "${1}.tmp"
                                if [ ! -f "$____library" ]; then
                                        IFS="$____old_IFS"
                                        unset ____line ____library ____old_IFS
                                        return 1
                                fi
                        done<<EOF
${____library}
EOF
                done<<EOF
${3}
EOF
                IFS="$____old_IFS"
                unset ____line ____library ____old_IFS
        fi

        ## process wasm binary
        if [ "$4" = "true" ]; then
                printf -- "%s" "\
$(views_html_get_indent 2)var source = new Response(
$(views_html_get_indent 3)Uint8Array.from('" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi

                ____read_count=0
                ____read_block_size=4096
                while true; do
                        ____read_chunk="$(od --address-radix=n \
                                --format=x1 \
                                --skip-bytes=$(( \
                                        $____read_count * $____read_block_size
                                )) \
                                --read-bytes="$____read_block_size" \
                                "$2" \
                                2> /dev/null \
                                | tr -d ' \n' \
                        )"
                        if [ $? -ne 0 ]; then
                                break
                        fi

                        if [ "$____read_chunk" = "" ]; then
                                break
                        fi

                        printf -- "%s" "$____read_chunk" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                unset ____read_chunk \
                                        ____read_block_size \
                                        ____read_count
                                return 1
                        fi

                        ____read_count=$(( $____read_count + 1 ))
                done
                unset ____read_chunk ____read_count ____read_block_size

                printf -- "%s" "\
'
$(views_html_get_indent 3).match(/.{1,2}/g)
$(views_html_get_indent 3).map((byte) => {
$(views_html_get_indent 4)return parseInt(byte, 16);
$(views_html_get_indent 3)})),
$(views_html_get_indent 3){ headers: { 'Content-Type': 'application/wasm' }}
$(views_html_get_indent 2));
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        else
                printf -- "%s" "\
$(views_HTML_get_indent 2)var source = fetch('${2}');
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        fi

        ## process wasm initializer setup
        printf -- "%s" "\
$(views_html_get_indent 2)// initialize wasm
$(views_html_get_indent 2)if (!WebAssembly.instantiateStreaming) { // polyfill
$(views_html_get_indent 3)WebAssembly.instantiateStreaming = async (resp, importObject) => {
$(views_html_get_indent 4)const source = await (await resp).arrayBuffer();
$(views_html_get_indent 4)return await WebAssembly.instantiate(source, importObject);
$(views_html_get_indent 3)};
$(views_html_get_indent 2)}
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## process wasm initializer
        if [ ! "$5" = "" ]; then
                printf -- "%s" "\
$(views_html_get_indent 2)WebAssembly.instantiateStreaming(source,
${5}
$(views_html_get_indent 2))
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        else
                printf -- "%s" "\
$(views_html_get_indent 2)WebAssembly.instantiateStreaming(source)
" >> "${1}.tmp"
        fi

        if [ ! "$6" = "" ]; then
                printf -- "%s" "\
$(views_html_get_indent 2).then(result => {
${6}
$(views_html_get_indent 2)});
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        else
                printf -- "%s" "\
$(views_html_get_indent 2).then(result => {});
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        fi

        ## all good - close now
        printf -- "%s" "\
$(views_html_get_indent 1)</script>
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

#!/usr/bin/env bash

substitute_vars() {
    TEMPLATE_FILE=${1:?"You have to specify a source file as first parameter!"}
    eval echo "\"$(cat <<EOF
$( < $TEMPLATE_FILE)
EOF
)\""
}

append_to_file() {
    local SOURCE_FILE=${1:?"You have to specify a source file as first parameter!"}
    local TARGET_FILE=${2:?"You have to specify a targt file as second parameter!"}

    local APPEND_STR="$(substitute_vars "${SOURCE_FILE}")"

    # Append if either the target file does not exists or if target file does not
    # already contain the text to append.
    if [ ! -f "$TARGET_FILE" ] || ! grep -Fqx "$APPEND_STR" "$TARGET_FILE"; then
        echo ${APPEND_STR} >> ${TARGET_FILE}
        echo "${TARGET_FILE} modified."
    else
        echo "${TARGET_FILE} already modified. Nothing to do."
    fi
}

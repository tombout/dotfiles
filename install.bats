#!/usr/bin/env bats

source utilities.sh

DOTFILES_DIR="${BATS_TEST_DIRNAME}"
TEST_TARGET_FILE="${DOTFILES_DIR}/.vimrc"

setup() {
    echo "in setup"
    rm -f "${TEST_TARGET_FILE}" >&2
}

teardown() {
    echo "in teardown"
    rm -f "${TEST_TARGET_FILE}" >&2
}

@test "append to none existent file" {
    result="$(append_to_file ${DOTFILES_DIR}/vim/source.template ${TEST_TARGET_FILE})"
    [ "$result" = "${TEST_TARGET_FILE} modified." ]

    numoflines=$(wc -l < "$TEST_TARGET_FILE")
    [ $numoflines -eq 1 ]
}

@test "append to file where not already appended" {
    echo "some text...blub..." > "${TEST_TARGET_FILE}"
    result="$(append_to_file ${DOTFILES_DIR}/vim/source.template ${TEST_TARGET_FILE})"
    [ "$result" = "${TEST_TARGET_FILE} modified." ]

    numoflines=$(wc -l < "$TEST_TARGET_FILE")
    [ $numoflines -eq 2 ]
}

@test "append only once" {
    result="$(append_to_file ${DOTFILES_DIR}/vim/source.template ${TEST_TARGET_FILE})"
    [ "$result" == "${TEST_TARGET_FILE} modified." ]

    result="$(append_to_file ${DOTFILES_DIR}/vim/source.template ${TEST_TARGET_FILE})"
    [[ "$result" == *"${TEST_TARGET_FILE} already modified. Nothing to do."* ]]

    numoflines=$(wc -l < "$TEST_TARGET_FILE")
    [ $numoflines -eq 1 ]
}
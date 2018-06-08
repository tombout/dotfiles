#!/usr/bin/env bats

load test_helper

install_script="${dotfiles_dir}/vim/install.sh"

expected_result=$(cat << EOFVIMRC_RESULT
" Do not edit under this line
source ${dotfiles_dir}/vim/vimrc

EOFVIMRC_RESULT
)

@test "Vim dotfiles: show installation details" {
    expected_output=$(cat << EOFVIMRC_OUTPUT
Installing vim dotfiles ...
Appended following to ${test_target_file}:
${expected_result}
EOFVIMRC_OUTPUT
)
    run $install_script $test_target_file
    assert_equal "$output" "$expected_output"
}

@test "Vim dotfiles: install to target file" {
    run $install_script $test_target_file
    assert_equal "$(cat "$test_target_file")" "$expected_result"
}

@test "Vim dotfiles: do not install if already installed" {
    expected_output="Vim dotfiles already installed. Nothing to do."

    run $install_script $test_target_file
    run $install_script $test_target_file

    assert_equal "$(cat "$test_target_file")" "$expected_result"
    assert_equal "$output" "$expected_output"
}

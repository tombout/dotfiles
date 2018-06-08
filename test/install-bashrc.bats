#!/usr/bin/env bats

load test_helper

install_script="${dotfiles_dir}/bash/install.sh"

expected_result=$(cat << EOFVIMRC_RESULT
# Do not edit under this line
test -f "${dotfiles_dir}/bash/bashrc.bash" && source "${dotfiles_dir}/bash/bashrc.bash"

EOFVIMRC_RESULT
)

@test "Bash dotfiles: show installation details" {
    expected_output=$(cat << EOFVIMRC_OUTPUT
Installing bash dotfiles ...
Appended following to ${test_target_file}:
${expected_result}
EOFVIMRC_OUTPUT
)
    run $install_script $test_target_file
    assert_equal "$output" "$expected_output"
}

@test "Bash dotfiles: install to target file" {
    run $install_script $test_target_file
    assert_equal "$(cat "$test_target_file")" "$expected_result"
}

@test "Bash dotfiles: do not install if already installed" {
    expected_output="Bash dotfiles already installed. Nothing to do."

    run $install_script $test_target_file
    run $install_script $test_target_file

    assert_equal "$(cat "$test_target_file")" "$expected_result"
    assert_equal "$output" "$expected_output"
}

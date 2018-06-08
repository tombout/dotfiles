#@IgnoreInspection BashAddShebang
bats_libs_dir="${BATS_TEST_DIRNAME}/../libs/test"
dotfiles_dir="$(cd "${BATS_TEST_DIRNAME}/.." && pwd -P)"
test_target_file=""

setup() {
    echo "in test_helper setup"

    test_target_file=".target_test_${RANDOM}"

    # Load dependencies.
    load "${bats_libs_dir}/bats-support/load.bash"
    load "${bats_libs_dir}/bats-assert/load.bash"
}

teardown() {
    rm -f "$test_target_file" >&2
}

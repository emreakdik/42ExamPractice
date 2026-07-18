#!/usr/bin/env bats
#
# Regression guard for .resources/main/colors.sh — it must source cleanly on a
# terminal with no color capability (bats runs under TERM=dumb, as does a bare
# CI shell). Before the tc() wrapper, `set -e` scripts aborted here.

setup() {
    REPO_ROOT="$(cd "$BATS_TEST_DIRNAME/.." && pwd)"
}

@test "colors.sh sources cleanly under TERM=dumb with set -e" {
    run bash -c "set -e; TERM=dumb source '$REPO_ROOT/.resources/main/colors.sh'"
    [ "$status" -eq 0 ]
}

@test "colors.sh sources cleanly with TERM unset" {
    run env -u TERM bash -c "set -e; source '$REPO_ROOT/.resources/main/colors.sh'"
    [ "$status" -eq 0 ]
}

@test "colors.sh defines every expected variable" {
    run bash -c "
        source '$REPO_ROOT/.resources/main/colors.sh'
        for v in BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE \
                 BG_GREEN BG_CYAN BOLD RESET; do
            declare -p \"\$v\" >/dev/null 2>&1 || { echo \"missing: \$v\"; exit 1; }
        done
    "
    [ "$status" -eq 0 ]
}

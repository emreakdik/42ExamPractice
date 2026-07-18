#!/usr/bin/env bats
#
# Tests for .resources/main/test_utils.sh — the shared Rank 03 tester helpers.
# Written with the bats-testing-patterns skill as a starting point for CI.

setup() {
    REPO_ROOT="$(cd "$BATS_TEST_DIRNAME/.." && pwd)"
    # colors.sh is expected to be sourced first by the real testers. It must
    # source cleanly even under bats' TERM=dumb (no color) — a regression
    # guard for the tc() wrapper added to colors.sh.
    source "$REPO_ROOT/.resources/main/colors.sh"
    source "$REPO_ROOT/.resources/main/test_utils.sh"
    WORK="$(mktemp -d)"
}

teardown() {
    rm -rf "$WORK"
}

@test "strict_compile succeeds on clean code" {
    cat > "$WORK/good.c" <<'EOF'
int main(void) { return 0; }
EOF
    run strict_compile "$WORK/good" "$WORK/good.c"
    [ "$status" -eq 0 ]
    [ -x "$WORK/good" ]
}

@test "strict_compile fails on an unused variable (-Werror)" {
    cat > "$WORK/warn.c" <<'EOF'
int main(void) { int unused = 5; return 0; }
EOF
    # Run in-process (not via `run`) so STRICT_COMPILE_LOG is visible, but
    # guard the non-zero return so bats does not abort the test early.
    if strict_compile "$WORK/warn" "$WORK/warn.c"; then status=0; else status=$?; fi
    [ "$status" -ne 0 ]
    [[ "$STRICT_COMPILE_LOG" == *"unused"* ]]
}

@test "strict_compile fails on a real syntax error" {
    cat > "$WORK/broken.c" <<'EOF'
int main(void) { return }
EOF
    run strict_compile "$WORK/broken" "$WORK/broken.c"
    [ "$status" -ne 0 ]
}

@test "compile_ref tolerates warnings (known-good reference)" {
    cat > "$WORK/ref.c" <<'EOF'
int main(void) { int unused = 5; return 0; }
EOF
    run compile_ref "$WORK/ref" "$WORK/ref.c"
    [ "$status" -eq 0 ]
    [ -x "$WORK/ref" ]
}

@test "leak_check returns 0 when valgrind is missing" {
    if command -v valgrind >/dev/null 2>&1; then
        skip "valgrind is installed; this case only asserts the no-valgrind path"
    fi
    run leak_check /bin/true
    [ "$status" -eq 0 ]
}

@test "leak_check passes a clean program" {
    if ! command -v valgrind >/dev/null 2>&1; then
        skip "valgrind not installed"
    fi
    cat > "$WORK/clean.c" <<'EOF'
int main(void) { return 0; }
EOF
    gcc -o "$WORK/clean" "$WORK/clean.c"
    run leak_check "$WORK/clean"
    [ "$status" -eq 0 ]
}

@test "leak_check flags a definite leak" {
    if ! command -v valgrind >/dev/null 2>&1; then
        skip "valgrind not installed"
    fi
    cat > "$WORK/leak.c" <<'EOF'
#include <stdlib.h>
int main(void) { malloc(64); return 0; }
EOF
    gcc -o "$WORK/leak" "$WORK/leak.c"
    run leak_check "$WORK/leak"
    [ "$status" -ne 0 ]
}

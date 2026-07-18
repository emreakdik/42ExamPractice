#!/bin/bash
# Shared helpers for Rank 03 testers. Source AFTER colors.sh.
# Goal: make the practice testers closer to the real exam moulinette by
# enforcing clean compilation and (when available) memory-leak freedom.

# Detect valgrind once.
HAS_VALGRIND=0
if command -v valgrind >/dev/null 2>&1; then
    HAS_VALGRIND=1
fi

# strict_compile <output> <gcc args...>
# Compiles with -Wall -Wextra -Werror. Warnings are treated as failures,
# exactly like the exam. Returns non-zero and leaves the compiler message
# in $STRICT_COMPILE_LOG on failure.
STRICT_COMPILE_LOG=""
strict_compile() {
    local out="$1"
    shift
    STRICT_COMPILE_LOG="$(gcc -Wall -Wextra -Werror -o "$out" "$@" 2>&1)"
    return $?
}

# compile_ref <output> <gcc args...>
# Compiles the reference solution tolerantly (it is known-good).
compile_ref() {
    local out="$1"
    shift
    gcc -w -o "$out" "$@" 2>/dev/null
    return $?
}

# leak_check <cmd> [args...]
# Runs the command under valgrind (if installed) and returns non-zero ONLY
# when valgrind reports a definite leak or a memory error (our exit code 42).
# If valgrind is missing, or fails for tooling reasons, it returns 0 so the
# tester still works everywhere. Redirect stdin at the call site as needed.
leak_check() {
    [ "$HAS_VALGRIND" -eq 1 ] || return 0
    valgrind -q --leak-check=full --errors-for-leak-kinds=definite \
        --error-exitcode=42 "$@" >/dev/null 2>&1
    [ "$?" -eq 42 ] && return 1
    return 0
}

# print_fail_compile: standard message when student code does not compile
# cleanly. Prints the captured compiler output (trimmed).
print_fail_compile() {
    echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0): does not compile cleanly with -Wall -Wextra -Werror"
    printf '%s\n' "$STRICT_COMPILE_LOG" | head -n 6 | sed 's/^/    /'
}

# print_fail_leak <label>
print_fail_leak() {
    echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0): memory leak or invalid memory access detected ($1)"
    echo "    Run locally with: valgrind --leak-check=full ./your_program"
}

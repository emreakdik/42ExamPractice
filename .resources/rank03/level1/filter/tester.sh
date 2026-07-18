#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
file1=filter.c
file2=../../../../rendu/filter/filter.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/filter/filter.c was not found.${RESET}"
    exit 1
fi

cleanup() { rm -f out1 out2 out1.txt out2.txt; }
trap cleanup EXIT

if ! strict_compile out2 "$file2"; then
    print_fail_compile
    exit 1
fi
compile_ref out1 "$file1" || \
    { echo "${RED}Reference did not compile.${RESET}"; exit 1; }

check_out() { # $1 = arg, $2 = stdin text, $3 = label
    printf '%s' "$2" | ./out1 "$1" > out1.txt 2>/dev/null
    printf '%s' "$2" | ./out2 "$1" > out2.txt 2>/dev/null
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) ($3)"
        echo "${GREEN}Expected:${RESET} $(cat out1.txt | cat -e)"
        echo "${RED}Yours:   ${RESET} $(cat out2.txt | cat -e)"
        exit 1
    fi
}

check_out "abc" "abcdefgaaaabcdefabc"          "basic"
check_out "bonjour" "bonjour le monde, bonjour!" "word replace"
check_out "aa" "aaaa"                            "consecutive matches"
check_out "aa" "aaaaa"                           "odd overlap"
check_out "xyz" "no match here"                  "no match"
check_out "l" $'multi\nline\ninput\n'            "multiline"
check_out "abc" ""                               "empty stdin"
check_out "abcdef" "abc"                         "pattern longer than input"
check_out "hello" "hello"                        "whole input matches"
check_out "end" "at the end"                     "match at end"
check_out "a" "aaaaaaaaaaaaaaaaaaaa"             "long single-char run"
check_out "42" "the answer is 42 or 4242 maybe"  "digits pattern"

# error handling: exit status must match with wrong/empty argument count
check_status() { # $1 label; remaining args passed to program
    label="$1"; shift
    echo "" | ./out1 "$@" >/dev/null 2>&1; s1=$?
    echo "" | ./out2 "$@" >/dev/null 2>&1; s2=$?
    if [ "$s1" -ne "$s2" ]; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) ($label): reference exit $s1, yours $s2"
        exit 1
    fi
}

check_status "no argument"
check_status "empty argument" ""
check_status "two arguments" "a" "b"
check_status "three arguments" "a" "b" "c"

# Memory-leak check (skipped automatically if valgrind is not installed).
if ! printf 'abcdefgaaaabcdefabc' | leak_check ./out2 abc; then
    print_fail_leak "filter abc"
    exit 1
fi

echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

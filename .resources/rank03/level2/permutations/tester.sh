#!/bin/bash
# Output MUST be in alphabetical order, so comparison is exact (no sorting).
source ../../../main/colors.sh
source ../../../main/test_utils.sh
file1=permutations.c
file2=../../../../rendu/permutations/permutations.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/permutations/permutations.c was not found.${RESET}"
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

for arg in "a" "ab" "abc" "abcd" "dcba" "abcde" "edcba" "42z" "z9a" "wxyz"; do
    ./out1 "$arg" 2>/dev/null > out1.txt
    ./out2 "$arg" 2>/dev/null > out2.txt
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) (arg=\"$arg\")"
        echo "${GREEN}Expected:${RESET}"; head -n 8 out1.txt
        echo "${RED}Yours:${RESET}";     head -n 8 out2.txt
        exit 1
    fi
done

# Memory-leak check (skipped automatically if valgrind is not installed).
if ! leak_check ./out2 abcd; then
    print_fail_leak "permutations abcd"
    exit 1
fi

echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

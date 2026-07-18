#!/bin/bash
# Solution order is NOT important for rip, so outputs are sorted before
# comparison.
source ../../../main/colors.sh
source ../../../main/test_utils.sh
file1=rip.c
file2=../../../../rendu/rip/rip.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/rip/rip.c was not found.${RESET}"
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

args_list=(
    "( ( )"
    "( ( ( ) ( ) ( ) ) ( ) )"
    "( ) ( ) ) ( )"
    "( ( ) ( ( ) ("
    ") ("
    "( ) ( )"
    "("
    ")"
    "( ( ("
    ") ) )"
    "( ) )"
    "( ( ) )"
    ") ( ) ("
)

for a in "${args_list[@]}"; do
    ./out1 "$a" 2>/dev/null | sort > out1.txt
    ./out2 "$a" 2>/dev/null | sort > out2.txt
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) (arg: \"$a\")"
        echo "${GREEN}Expected:${RESET}"; cat out1.txt | cat -e
        echo "${RED}Yours:${RESET}";     cat out2.txt | cat -e
        exit 1
    fi
done

# Memory-leak check (skipped automatically if valgrind is not installed).
if ! leak_check ./out2 "( ) ( ) ) ( )"; then
    print_fail_leak "rip"
    exit 1
fi

echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

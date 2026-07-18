#!/bin/bash
# Line order is NOT important (only element order within a subset), so
# outputs are sorted before comparison.
source ../../../main/colors.sh
file1=powerset.c
file2=../../../../rendu/powerset/powerset.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/powerset/powerset.c was not found.${RESET}"
    exit 1
fi

gcc -w -o out1 "$file1" 2>/dev/null || \
    { echo "${RED}Reference did not compile.${RESET}"; exit 1; }
gcc -w -o out2 "$file2" 2>/dev/null || \
    { echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0): your code did not compile."; exit 1; }

args_list=(
    "3 1 0 2 4 5 3"
    "12 5 2 1 8 4 3 7 11"
    "7 3 8 2"
    "0 1 -1"
    "5 1 2 3 4 5"
)

for a in "${args_list[@]}"; do
    # shellcheck disable=SC2086
    ./out1 $a 2>/dev/null | sort > out1.txt
    # shellcheck disable=SC2086
    ./out2 $a 2>/dev/null | sort > out2.txt
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) (args: $a)"
        echo "${GREEN}Expected:${RESET}"
        cat out1.txt
        echo "${RED}Yours:${RESET}"
        cat out2.txt
        rm -f out1 out2 out1.txt out2.txt
        exit 1
    fi
done

rm -f out1 out2 out1.txt out2.txt
echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

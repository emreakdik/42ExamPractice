#!/bin/bash
# Output MUST be in alphabetical order, so comparison is exact (no sorting).
source ../../../main/colors.sh
file1=permutations.c
file2=../../../../rendu/permutations/permutations.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/permutations/permutations.c was not found.${RESET}"
    exit 1
fi

gcc -w -o out1 "$file1" 2>/dev/null || \
    { echo "${RED}Reference did not compile.${RESET}"; exit 1; }
gcc -w -o out2 "$file2" 2>/dev/null || \
    { echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0): your code did not compile."; exit 1; }

for arg in "a" "ab" "abc" "abcd" "dcba" "42z"; do
    ./out1 "$arg" 2>/dev/null > out1.txt
    ./out2 "$arg" 2>/dev/null > out2.txt
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) (arg=\"$arg\")"
        echo "${GREEN}Expected:${RESET}"
        head -n 8 out1.txt
        echo "${RED}Yours:${RESET}"
        head -n 8 out2.txt
        rm -f out1 out2 out1.txt out2.txt
        exit 1
    fi
done

rm -f out1 out2 out1.txt out2.txt
echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

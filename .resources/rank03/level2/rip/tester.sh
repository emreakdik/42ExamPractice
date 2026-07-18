#!/bin/bash
# Solution order is NOT important for rip, so outputs are sorted before
# comparison.
source ../../../main/colors.sh
file1=rip.c
file2=../../../../rendu/rip/rip.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/rip/rip.c was not found.${RESET}"
    exit 1
fi

gcc -w -o out1 "$file1" 2>/dev/null || \
    { echo "${RED}Reference did not compile.${RESET}"; exit 1; }
gcc -w -o out2 "$file2" 2>/dev/null || \
    { echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0): your code did not compile."; exit 1; }

args_list=(
    "( ( )"
    "( ( ( ) ( ) ( ) ) ( ) )"
    "( ) ( ) ) ( )"
    "( ( ) ( ( ) ("
    ") ("
    "( ) ( )"
)

for a in "${args_list[@]}"; do
    ./out1 "$a" 2>/dev/null | sort > out1.txt
    ./out2 "$a" 2>/dev/null | sort > out2.txt
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) (arg: \"$a\")"
        echo "${GREEN}Expected:${RESET}"
        cat out1.txt | cat -e
        echo "${RED}Yours:${RESET}"
        cat out2.txt | cat -e
        rm -f out1 out2 out1.txt out2.txt
        exit 1
    fi
done

rm -f out1 out2 out1.txt out2.txt
echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

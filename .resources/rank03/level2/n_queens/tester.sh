#!/bin/bash
# Solution order is NOT important for n_queens, so outputs are sorted
# before comparison.
source ../../../main/colors.sh
file1=n_queens.c
file2=../../../../rendu/n_queens/n_queens.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/n_queens/n_queens.c was not found.${RESET}"
    exit 1
fi

gcc -w -o out1 "$file1" 2>/dev/null || \
    { echo "${RED}Reference did not compile.${RESET}"; exit 1; }
gcc -w -o out2 "$file2" 2>/dev/null || \
    { echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0): your code did not compile."; exit 1; }

for n in 1 4 5 6 8; do
    ./out1 "$n" 2>/dev/null | sort > out1.txt
    ./out2 "$n" 2>/dev/null | sort > out2.txt
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) (n=$n)"
        echo "${GREEN}Expected ($(wc -l < out1.txt) solutions):${RESET}"
        head -n 5 out1.txt
        echo "${RED}Yours ($(wc -l < out2.txt) solutions):${RESET}"
        head -n 5 out2.txt
        rm -f out1 out2 out1.txt out2.txt
        exit 1
    fi
done

rm -f out1 out2 out1.txt out2.txt
echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

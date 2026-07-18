#!/bin/bash
# tsp reads coordinates from stdin and prints the shortest closed tour length
# as "%.2f". Output is exact; the program is compiled with -lm (sqrtf).
source ../../../main/colors.sh
file1=tsp.c
file2=../../../../rendu/tsp/tsp.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/tsp/tsp.c was not found.${RESET}"
    exit 1
fi

gcc -w -o out1 "$file1" -lm 2>/dev/null || \
    { echo "${RED}Reference did not compile.${RESET}"; exit 1; }
gcc -w -o out2 "$file2" -lm 2>/dev/null || \
    { echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0): your code did not compile."; exit 1; }

for f in square.txt grid8.txt triangle.txt six.txt; do
    ./out1 < "$f" > out1.txt 2>/dev/null
    ./out2 < "$f" > out2.txt 2>/dev/null
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) (input: $f)"
        echo "${GREEN}Expected Output:${RESET} $(cat out1.txt)"
        echo "${RED}Your Output:${RESET}     $(cat out2.txt)"
        rm -f out1 out2 out1.txt out2.txt
        exit 1
    fi
done

rm -f out1 out2 out1.txt out2.txt
echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

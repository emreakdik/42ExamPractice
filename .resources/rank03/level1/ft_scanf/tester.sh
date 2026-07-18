#!/bin/bash
source ../../../main/colors.sh
file1=ft_scanf.c
file2=../../../../rendu/ft_scanf/ft_scanf.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/ft_scanf/ft_scanf.c was not found.${RESET}"
    exit 1
fi

gcc -w -o out1 "$file1" main.c 2>/dev/null || \
    { echo "${RED}Reference did not compile.${RESET}"; exit 1; }
gcc -w -o out2 "$file2" main.c 2>/dev/null || \
    { echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0): your code did not compile."; exit 1; }

inputs=(
    "42 X hello"
    "-7 Z world extra"
    "   100  q  test"
    "abc"
    "5b c"
)

for in in "${inputs[@]}"; do
    printf '%s' "$in" | ./out1 > out1.txt 2>/dev/null
    printf '%s' "$in" | ./out2 > out2.txt 2>/dev/null
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) (input: \"$in\")"
        echo "${GREEN}Expected Output:${RESET} $(cat out1.txt)"
        echo "${RED}Your Output:${RESET}     $(cat out2.txt)"
        rm -f out1 out2 out1.txt out2.txt
        exit 1
    fi
done

rm -f out1 out2 out1.txt out2.txt
echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

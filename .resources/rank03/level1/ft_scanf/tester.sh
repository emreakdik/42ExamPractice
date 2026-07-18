#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
file1=ft_scanf.c
file2=../../../../rendu/ft_scanf/ft_scanf.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/ft_scanf/ft_scanf.c was not found.${RESET}"
    exit 1
fi

cleanup() { rm -f out1 out2 out1.txt out2.txt; }
trap cleanup EXIT

if ! strict_compile out2 "$file2" main.c; then
    print_fail_compile
    exit 1
fi
compile_ref out1 "$file1" main.c || \
    { echo "${RED}Reference did not compile.${RESET}"; exit 1; }

# Each case: "<driver-id>|<stdin>" — the driver picks the format from the id.
cases=(
    "0|42 X hello"
    "0|-7 Z world extra"
    "0|   100  q  test"
    "0|abc"
    "0|5b c"
    "1|   -123abc"
    "1|+45"
    "1|nope"
    "2|A"
    "2| B"
    "3|   hello world"
    "3|word"
    "4|12 34"
    "4|56  78 rest"
    "5|3,4"
    "5|10, 20"
    "6|abc"
    "6| xy"
    "7|abc99"
    "7|abZ"
    "9|foo bar baz"
    "9|  one   two"
)

for cse in "${cases[@]}"; do
    id="${cse%%|*}"
    input="${cse#*|}"
    printf '%s' "$input" | ./out1 "$id" > out1.txt 2>/dev/null
    printf '%s' "$input" | ./out2 "$id" > out2.txt 2>/dev/null
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) (format-id=$id, input: \"$input\")"
        echo "${GREEN}Expected (real-scanf behaviour):${RESET} $(cat out1.txt)"
        echo "${RED}Your Output:${RESET}                    $(cat out2.txt)"
        exit 1
    fi
done

# Memory-leak check (skipped automatically if valgrind is not installed).
if ! printf '42 X hello' | leak_check ./out2 0; then
    print_fail_leak "%d %c %s"
    exit 1
fi

echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

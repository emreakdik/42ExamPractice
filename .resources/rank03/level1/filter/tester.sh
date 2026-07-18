#!/bin/bash
source ../../../main/colors.sh
file1=filter.c
file2=../../../../rendu/filter/filter.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/filter/filter.c was not found.${RESET}"
    exit 1
fi

gcc -w -o out1 "$file1" 2>/dev/null || \
    { echo "${RED}Reference did not compile.${RESET}"; exit 1; }
gcc -w -o out2 "$file2" 2>/dev/null || \
    { echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0): your code did not compile."; exit 1; }

check_out() { # $1 = arg, $2 = stdin text, $3 = label
    printf '%s' "$2" | ./out1 "$1" > out1.txt 2>/dev/null
    printf '%s' "$2" | ./out2 "$1" > out2.txt 2>/dev/null
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) ($3)"
        echo "${GREEN}Expected:${RESET} $(cat out1.txt | cat -e)"
        echo "${RED}Yours:   ${RESET} $(cat out2.txt | cat -e)"
        rm -f out1 out2 out1.txt out2.txt
        exit 1
    fi
}

check_out "abc" "abcdefgaaaabcdefabc" "basic overlap-ish"
check_out "bonjour" "bonjour le monde, bonjour!" "word replace"
check_out "aa" "aaaa" "consecutive matches"
check_out "xyz" "no match here" "no match"
check_out "l" $'multi\nline\ninput\n' "multiline"

# error handling: exit status must be 1 with wrong number/empty arguments
check_status() { # $1 label; remaining args passed to program
    label="$1"; shift
    echo "" | ./out1 "$@" >/dev/null 2>&1; s1=$?
    echo "" | ./out2 "$@" >/dev/null 2>&1; s2=$?
    if [ "$s1" -ne "$s2" ]; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) ($label): expected exit $s1, got $s2"
        rm -f out1 out2 out1.txt out2.txt
        exit 1
    fi
}

check_status "no argument"
check_status "empty argument" ""
check_status "two arguments" "a" "b"

rm -f out1 out2 out1.txt out2.txt
echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

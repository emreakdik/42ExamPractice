#!/bin/bash
source ../../../main/colors.sh
file1=get_next_line.c
file2=../../../../rendu/get_next_line/get_next_line.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/get_next_line/get_next_line.c was not found.${RESET}"
    exit 1
fi

fail() {
    echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) (BUFFER_SIZE=$1)"
    echo "${GREEN}Expected Output:${RESET}"
    cat out1.txt
    echo "${RED}Your Output:${RESET}"
    cat out2.txt
    rm -f out1 out2 out1.txt out2.txt
    exit 1
}

# Feed the same input to both binaries across several BUFFER_SIZE values.
for bs in 1 5 42 9999; do
    gcc -w -D BUFFER_SIZE="$bs" -o out1 "$file1" main.c 2>/dev/null || \
        { echo "${RED}Reference did not compile.${RESET}"; exit 1; }
    gcc -w -D BUFFER_SIZE="$bs" -o out2 "$file2" main.c 2>/dev/null || \
        { echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0): your code did not compile."; exit 1; }

    # 1. read from a file argument
    ./out1 test_gnl.txt > out1.txt 2>/dev/null
    ./out2 test_gnl.txt > out2.txt 2>/dev/null
    diff -q out1.txt out2.txt >/dev/null || fail "$bs"

    # 2. read from stdin redirection
    ./out1 < test_gnl.txt > out1.txt 2>/dev/null
    ./out2 < test_gnl.txt > out2.txt 2>/dev/null
    diff -q out1.txt out2.txt >/dev/null || fail "$bs"

    # 3. empty input
    : > empty.txt
    ./out1 empty.txt > out1.txt 2>/dev/null
    ./out2 empty.txt > out2.txt 2>/dev/null
    diff -q out1.txt out2.txt >/dev/null || fail "$bs"
done

rm -f out1 out2 out1.txt out2.txt empty.txt
echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

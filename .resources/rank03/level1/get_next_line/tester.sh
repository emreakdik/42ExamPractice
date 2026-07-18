#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
file1=get_next_line.c
file2=../../../../rendu/get_next_line/get_next_line.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/get_next_line/get_next_line.c was not found.${RESET}"
    exit 1
fi

cleanup() { rm -f out1 out2 out1.txt out2.txt empty.txt only_nl.txt longline.txt nonl.txt; }
trap cleanup EXIT

# Build the harder inputs on the fly.
: > empty.txt
printf '\n\n\n' > only_nl.txt
printf 'no newline at all' > nonl.txt
{ head -c 5000 /dev/zero | tr '\0' 'x'; } > longline.txt   # 5000 chars, no '\n'

inputs=(test_gnl.txt empty.txt only_nl.txt nonl.txt longline.txt)

fail() {
    echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) (BUFFER_SIZE=$1, input=$2)"
    echo "${GREEN}Expected Output:${RESET}"; head -c 400 out1.txt; echo
    echo "${RED}Your Output:${RESET}";      head -c 400 out2.txt; echo
    exit 1
}

for bs in 1 2 3 7 42 1000 9999; do
    if ! strict_compile out2 -D BUFFER_SIZE="$bs" "$file2" main.c; then
        print_fail_compile
        exit 1
    fi
    compile_ref out1 -D BUFFER_SIZE="$bs" "$file1" main.c || \
        { echo "${RED}Reference did not compile.${RESET}"; exit 1; }

    for in in "${inputs[@]}"; do
        # read from file argument
        ./out1 "$in" > out1.txt 2>/dev/null
        ./out2 "$in" > out2.txt 2>/dev/null
        diff -q out1.txt out2.txt >/dev/null || fail "$bs" "$in (file)"
        # read from stdin redirection
        ./out1 < "$in" > out1.txt 2>/dev/null
        ./out2 < "$in" > out2.txt 2>/dev/null
        diff -q out1.txt out2.txt >/dev/null || fail "$bs" "$in (stdin)"
    done
done

# Memory-leak check (skipped automatically if valgrind is not installed).
if ! leak_check ./out2 test_gnl.txt; then
    print_fail_leak "reading test_gnl.txt"
    exit 1
fi

echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

#!/bin/bash
# tsp reads coordinates from stdin and prints the shortest closed tour length
# as "%.2f". Output is exact; the program is compiled with -lm (sqrtf).
source ../../../main/colors.sh
source ../../../main/test_utils.sh
file1=tsp.c
file2=../../../../rendu/tsp/tsp.c

if [ ! -f "$file2" ]; then
    echo "${RED}${BOLD}Your file rendu/tsp/tsp.c was not found.${RESET}"
    exit 1
fi

cleanup() { rm -f out1 out2 out1.txt out2.txt case.txt; }
trap cleanup EXIT

if ! strict_compile out2 "$file2" -lm; then
    print_fail_compile
    exit 1
fi
compile_ref out1 "$file1" -lm || \
    { echo "${RED}Reference did not compile.${RESET}"; exit 1; }

run_case() { # $1 = label, stdin content on $2
    printf '%s' "$2" > case.txt
    ./out1 < case.txt > out1.txt 2>/dev/null
    ./out2 < case.txt > out2.txt 2>/dev/null
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) ($1)"
        echo "${GREEN}Expected Output:${RESET} $(cat out1.txt)"
        echo "${RED}Your Output:${RESET}     $(cat out2.txt)"
        exit 1
    fi
}

# committed example files
for f in square.txt grid8.txt triangle.txt six.txt; do
    ./out1 < "$f" > out1.txt 2>/dev/null
    ./out2 < "$f" > out2.txt 2>/dev/null
    if ! diff -q out1.txt out2.txt >/dev/null; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) (input: $f)"
        echo "${GREEN}Expected Output:${RESET} $(cat out1.txt)"
        echo "${RED}Your Output:${RESET}     $(cat out2.txt)"
        exit 1
    fi
done

# edge cases
run_case "single city"      $'0, 0\n'
run_case "two cities"       $'0, 0\n3, 4\n'
run_case "collinear three"  $'0, 0\n1, 0\n2, 0\n'
run_case "negative coords"  $'-1, -1\n1, 1\n-1, 1\n1, -1\n'
run_case "eleven cities"    $'0, 0\n1, 0\n2, 0\n3, 0\n3, 1\n3, 2\n2, 2\n1, 2\n0, 2\n0, 1\n1, 1\n'

# Memory-leak check (skipped automatically if valgrind is not installed).
if ! leak_check ./out2 < grid8.txt; then
    print_fail_leak "tsp < grid8.txt"
    exit 1
fi

echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
exit 0

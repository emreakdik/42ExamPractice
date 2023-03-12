#!/bin/bash

file1=inter.c
file2=../../../../rendu/inter/inter.c


# 1. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "padinton" "paqefwtdjetyiytjneytjoeyjnejeyj" > out1.txt
    ./out2 "padinton" "paqefwtdjetyiytjneytjoeyjnejeyj" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi

# 2. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "ddf6vewg64f" "gtwthgdwthdwfteewhrtag6h4ffdhsd" > out1.txt
    ./out2 "ddf6vewg64f" "gtwthgdwthdwfteewhrtag6h4ffdhsd" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "rien" "cette phrase ne cache rien" > out1.txt
    ./out2 "rien" "cette phrase ne cache rien" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi

# 4. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "Oupsi" "Oups" > out1.txt
    ./out2 "Oupsi" "Oups" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi

# 5. test 
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "Manger pour vivre" "Vivre pour manger" > out1.txt
    ./out2 "Manger pour vivre" "Vivre pour manger" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi

# 6. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 > out1.txt
    ./out2 > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi

# 7. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "Too" "Many" "Arguments" > out1.txt
    ./out2 "Too" "Many" "Arguments" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi
    

    rm out1 out2 out1.txt out2.txt
    clear
    echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
    exit 1

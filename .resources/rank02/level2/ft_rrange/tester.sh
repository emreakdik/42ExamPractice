#!/bin/bash

file1=ft_rrange.c
file2=../../../../rendu/ft_rrange/ft_rrange.c


# 1. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "1" "2" > out1.txt
    ./out2 "1" "2" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi

# 2. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "3" "8" > out1.txt
    ./out2 "3" "8" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "-1" "2932" > out1.txt
    ./out2 "-1" "2932" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi

# 4. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "-13" "2932" > out1.txt
    ./out2 "-13" "2932" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi

# 5. test 
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "0" "2932" > out1.txt
    ./out2 "0" "2932" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi


    rm out1 out2 out1.txt out2.txt
    clear
    echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
    exit 1
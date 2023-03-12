#!/bin/bash

file1=camel_to_snake.c
file2=../../../../rendu/camel_to_snake/camel_to_snake.c


# 1. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 > out1.txt
    ./out2 > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi


# 2. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "" > out1.txt
    ./out2 "" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "hereIsACamelCaseString" > out1.txt
    ./out2 "hereIsACamelCaseString" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi

# 4. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "helloWorld" > out1.txt
    ./out2 "helloWorld" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi


# 5. test 
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "testWith" "multipleArguments" "aAaAaAaAaAaAa" > out1.txt
    ./out2 "testWith" "multipleArguments" "aAaAaAaAaAaAa" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi


    rm out1 out2 out1.txt out2.txt
    clear
    echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
    exit 1
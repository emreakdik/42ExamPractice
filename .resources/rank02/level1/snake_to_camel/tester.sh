#!/bin/bash

file1=snake_to_camel.c
file2=../../../../rendu/snake_to_camel/snake_to_camel.c


# 1. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "here_is_a_snake_case_string" > out1.txt
    ./out2 "here_is_a_snake_case_string" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi


# 2. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "hello_world" > out1.txt
    ./out2 "hello_world" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "test_with" "multiple_arguments" "aAa" > out1.txt
    ./out2 "test_with" "multiple_arguments" "aAa" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi


    rm out1 out2 out1.txt out2.txt
    clear
    echo "Success"
    exit 1
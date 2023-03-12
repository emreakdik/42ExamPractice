#!/bin/bash

file1=add_prime_sum.c
file2=../../../../rendu/add_prime_sum/add_prime_sum.c

# 1. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 > out1.txt
    ./out2 > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "Fail"
        flag=0
    fi

# 2. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "5" > out1.txt
    ./out2 "5" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "Fail"
        flag=0
    fi

# 3. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "Too" "Many" "Arguments" > out1.txt
    ./out2 "Too" "Many" "Arguments" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "Fail"
        flag=0
    fi

# 4. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "7" > out1.txt
    ./out2 "7" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "Fail"
        flag=0
    fi


    rm out1 out2 out1.txt out2.txt
    echo $flag


    if [ $flag -eq 1]; then
        clear
        echo "Success"
    else
        clear
        echo "Fail"
    fi

    exit 1
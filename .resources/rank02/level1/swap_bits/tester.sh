#!/bin/bash

file1=swap_bits.c
file2=../../../../rendu/swap_bits/swap_bits.c


# 1. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "a" > out1.txt
    ./out2 "a" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 2. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "0" > out1.txt
    ./out2 "0" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "P" > out1.txt
    ./out2 "P" > out2.txt

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

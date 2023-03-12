#!/bin/bash

file1=rev_wstr.c
file2=../../../../rendu/rev_wstr/rev_wstr.c


# 1. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "order in us put" > out1.txt
    ./out2 "order in us put" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi


# 2. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "done! well it, did You" > out1.txt
    ./out2 "done! well it, did You" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "You hate people! But I love gatherings. Isn't it ironic?" > out1.txt
    ./out2 "You hate people! But I love gatherings. Isn't it ironic?" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 4. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "abcdefghijklm" > out1.txt
    ./out2 "abcdefghijklm" > out2.txt

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
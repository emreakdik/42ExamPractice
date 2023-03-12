#!/bin/bash

file1=ft_strcspn.c
file2=../../../../rendu/ft_strcspn/ft_strcspn.c


# 1. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "hello World" "hello world" > out1.txt
    ./out2 "hello World" "hello world" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 2. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "test" "es" > out1.txt
    ./out2 "test" "es" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "test" "f" > out1.txt
    ./out2 "test" "f" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 4. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 > out1.txt
    ./out2 > out2.txt

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

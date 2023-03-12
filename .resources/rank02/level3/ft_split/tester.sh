#!/bin/bash

file1=ft_split.c
file2=../../../../rendu/ft_split/ft_split.c


# 1. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "three words apart" > out1.txt
    ./out2 "three words apart" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 2. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "  starting and ending   " > out1.txt
    ./out2 "  starting and ending   " > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "t a b c " > out1.txt
    ./out2 "t a b c " > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 4. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "    " > out1.txt
    ./out2 "    " > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 5. test 
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "    a  " > out1.txt
    ./out2 "    a  " > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 6. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "    b" > out1.txt
    ./out2 "    b" > out2.txt

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

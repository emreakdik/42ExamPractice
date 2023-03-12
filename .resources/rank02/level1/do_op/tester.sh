#!/bin/bash

file1=do_op.c
file2=../../../../rendu/do_op/do_op.c


# 1. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "123" "*" "456" > out1.txt
    ./out2 "123" "*" "456" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi


# 2. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "9828" "/" "234" > out1.txt
    ./out2 "9828" "/" "234" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "9828" "%" "234" > out1.txt
    ./out2 "9828" "%" "234" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 4. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "9828" "/" "2" > out1.txt
    ./out2 "9828" "/" "2" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi


# 5. test 
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "1" "+" "-43" > out1.txt
    ./out2 "1" "+" "-43" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

    rm out1 out2 out1.txt out2.txt
# 6. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

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
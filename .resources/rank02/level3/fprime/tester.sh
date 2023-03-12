#!/bin/bash

file1=fprime.c
file2=../../../../rendu/fprime/fprime.c


# 1. test
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


# 2. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "225225" > out1.txt
    ./out2 "225225" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "8333325" > out1.txt
    ./out2 "8333325" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 4. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "9539" "btarc" > out1.txt
    ./out2 "9539" "btarc" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi


# 5. test 
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "42" > out1.txt
    ./out2 "42" > out2.txt

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

    ./out1 "mais non!" "mais non!" > out1.txt
    ./out2 "mais non!" "mais non!" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 7. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "-52" > out1.txt
    ./out2 "-52" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 8. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "0" > out1.txt
    ./out2 "0" > out2.txt

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
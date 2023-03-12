#!/bin/bash

file1=rstr_capitalizer.c
file2=../../../../rendu/rstr_capitalizer/rstr_capitalizer.c


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

    ./out1 "a FiRSt LiTTlE TESt" > out1.txt
    ./out2 "a FiRSt LiTTlE TESt" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "SecONd teST A LITtle BiT   Moar comPLEX" "   But... This iS not THAT COMPLEX" "     Okay, this is the last 1239809147801 but not    the least    t" > out1.txt
    ./out2 "SecONd teST A LITtle BiT   Moar comPLEX" "   But... This iS not THAT COMPLEX" "     Okay, this is the last 1239809147801 but not    the least    t" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 4. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "Okay i thing you got it!!! " > out1.txt
    ./out2 "Okay i thing you got it!!! " > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 5. test 
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "10" > out1.txt
    ./out2 "10" > out2.txt

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
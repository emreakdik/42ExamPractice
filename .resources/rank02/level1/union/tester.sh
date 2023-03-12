#!/bin/bash

file1=union.c
file2=../../../../rendu/union/union.c


# 1. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 zpadinton "paqefwtdjetyiytjneytjoeyjnejeyj" > out1.txt
    ./out2 zpadinton "paqefwtdjetyiytjneytjoeyjnejeyj" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi


# 2. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 ddf6vewg64f gtwthgdwthdwfteewhrtag6h4ffdhsd > out1.txt
    ./out2 ddf6vewg64f gtwthgdwthdwfteewhrtag6h4ffdhsd > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "rien" "cette phrase ne cache rien" > out1.txt
    ./out2 "rien" "cette phrase ne cache rien" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 4. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "rien" > out1.txt
    ./out2 "rien" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi


# 5. test 
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "a" "b" > out1.txt
    ./out2 "a" "b" > out2.txt

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

    ./out1 "  lorem,ipsum  " "oooo"> out1.txt
    ./out2 "  lorem,ipsum  " "oooo" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 7. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "this        ...       is sparta, then again, maybe    not" "lol" > out1.txt
    ./out2 "this        ...       is sparta, then again, maybe    not" "lol" > out2.txt

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
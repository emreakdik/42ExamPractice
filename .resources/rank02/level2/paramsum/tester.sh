#!/bin/bash

file1=paramsum.c
file2=../../../../rendu/paramsum/paramsum.c


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

    ./out1 "fgex.;" > out1.txt
    ./out2 "fgex.;" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 3. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "abc" "2altrb53c.sse" > out1.txt
    ./out2 "abc" "2altrb53c.sse" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 4. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "abc" "btarc" > out1.txt
    ./out2 "abc" "btarc" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

# 5. test 
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "fgex.;" "1" "2 " "3" "4" "5" "6" " 7" "8" "9" "10" > out1.txt
    ./out2 "fgex.;" "1" "2 " "3" "4" "5" "6" " 7" "8" "9" "10" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo ""
    else
        echo "Fail"
        exit 1
    fi

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


    rm out1 out2 out1.txt out2.txt
    clear
    echo "Success"
    exit 1
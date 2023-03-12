#!/bin/bash

file1=ft_atoi_base.c
file2=../../../../rendu/ft_atoi_base/ft_atoi_base.c


# 1. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 > out1.txt
    ./out2 > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "Fail"
        exit 1
    fi

# 2. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "See? It's easy to print the same thing" > out1.txt
    ./out2 "See? It's easy to print the same thing" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "Fail"
        exit 1
    fi


# 3. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 " this        time it      will     be    more complex  . " > out1.txt
    ./out2 " this        time it      will     be    more complex  . " > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "Fail"
        exit 1
    fi

# 4. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "No S*** Sherlock..." "nAw S*** ShErLaWQ..." > out1.txt
    ./out2 "No S*** Sherlock..." "nAw S*** ShErLaWQ..." > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "Fail"
        exit 1
    fi


# 5. test 
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "comme c'est cocasse" "vous avez entendu, Mathilde ?" > out1.txt
    ./out2 "comme c'est cocasse" "vous avez entendu, Mathilde ?" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "Fail"
        exit 1
    fi

# 6. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "5" > out1.txt
    ./out2 "5" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "Fail"
        exit 1
    fi

# 7. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 "Too" "Many" "Arguments" > out1.txt
    ./out2 "Too" "Many" "Arguments" > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "Fail"
        exit 1
    fi

# 8. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "Fail"
        exit 1
    fi

    
    rm out1 out2 out1.txt out2.txt
    clear
    echo "Success"
    exit 1
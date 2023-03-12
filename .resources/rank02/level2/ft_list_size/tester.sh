#!/bin/bash

file1=ft_list_size.c
file2=../../../../rendu/ft_list_size/ft_list_size.c


# 1. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 > out1.txt
    ./out2 > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi
    
    
    rm out1 out2 out1.txt out2.txt
    clear
    echo "Success"
    exit 1
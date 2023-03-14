#!/bin/bash

file1=ft_list_foreach.c
file2=../../../../rendu/ft_list_foreach/ft_list_foreach.c


# 1. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 > out1.txt
    ./out2 > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi


    rm out1 out2 out1.txt out2.txt
    echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
    exit 1
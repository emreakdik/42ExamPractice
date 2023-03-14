#!/bin/bash
source ../../../main/colors.sh
file1=ft_swap.c
file2=../../../../rendu/ft_swap/ft_swap.c


# 1. test
    gcc -o out1 "$file1" main.c
    gcc -o out2 "$file2" main.c

    ./out1 > out1.txt
    ./out2 > out2.txt

    if ! diff -q out1.txt out2.txt >/dev/null ; then
        out1=$(cat out1.txt)
        out2=$(cat out2.txt)
        echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0)"
        echo "${GREEN}Expected Output:${RESET} \"$out1\""
        echo "${RED}Your Output:${RESET}     \"$out2\""
        rm out1 out2 out1.txt out2.txt
        exit 1
    fi


    rm out1 out2 out1.txt out2.txt
    clear
    echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
    exit 1
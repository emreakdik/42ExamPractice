#!/bin/bash

clear
bash label.sh
cat << rank02

Select the level you want to practice.
==========================
1. level0
2. level1
3. level2 
4. level3 
0. Back to main menu
==========================
rank02
read -p "Enter your option (1-4): " opt

case $opt in
    0)
        bash menu.sh
        ;;
    1)
        mkdir ../../rendu
        clear
        echo "level0 setting up..."
        sleep 1
        clear
        bash sub_and_test.sh rank02 level0
        ;;
    2)  
        mkdir ../../rendu
        clear
        echo "level1 setting up..."
        sleep 1
        clear
        bash sub_and_test.sh rank02 level1
        ;;
    3) 
        mkdir ../../rendu
        clear
        echo "level2 setting up..."
        sleep 1
        clear
        bash sub_and_test.sh rank02 level2
        ;;
    4)
        mkdir ../../rendu
        clear
        echo "level3 setting up..."
        sleep 1
        clear
        bash sub_and_test.sh rank02 level3
        ;;
esac

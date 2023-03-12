#!/bin/bash

clear
bash label.sh
echo "$(tput setaf 2)$(tput bold)Please choose the level you want to practice.$(tput sgr0)"
cat << rank02
==========================
$(tput setaf 7)
1. level0
2. level1
3. level2 
4. level3
$(tput sgr0)
==========================
rank02
read -p "Enter your option (1-4): " opt

case $opt in
    menu)
        bash menu.sh
        ;;
    1)
        mkdir ../../rendu
        clear
        echo "$(tput setaf 2)$(tput bold)level0 is being prepared...$(tput sgr0)"
        sleep 1
        clear
        bash sub_and_test.sh rank02 level0
        ;;
    2)  
        mkdir ../../rendu
        clear
        echo "$(tput setaf 2)$(tput bold)level1 is being prepared...$(tput sgr0)"
        sleep 1
        clear
        bash sub_and_test.sh rank02 level1
        ;;
    3) 
        mkdir ../../rendu
        clear
        echo "$(tput setaf 2)$(tput bold)level2 is being prepared...$(tput sgr0)"
        sleep 1
        clear
        bash sub_and_test.sh rank02 level2
        ;;
    4)
        mkdir ../../rendu
        clear
        echo "$(tput setaf 2)$(tput bold)level3 is being prepared...$(tput sgr0)"
        sleep 1
        clear
        bash sub_and_test.sh rank02 level3
        ;;
    *)
        echo "$(tput setaf 1)Wrong input$(tput sgr0)"
        sleep 1
        bash rank02.sh
esac

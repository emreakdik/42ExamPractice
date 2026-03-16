#!/bin/bash
source functions.sh
source colors.sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
RENDU_DIR="$REPO_ROOT/rendu"
clear
bash label.sh
printf "%-50s\n" "=================================================="
echo "$(tput setaf 2)$(tput bold)Please choose the level you want to practice.$(tput sgr0)"
printf "%-50s\n" "=================================================="
printf "${YELLOW}${BOLD}%s${RESET}\n" "1. Level0"
printf "${YELLOW}${BOLD}%s${RESET}\n" "2. Level1"
printf "${YELLOW}${BOLD}%s${RESET}\n" "3. Level2"
printf "${YELLOW}${BOLD}%s${RESET}\n" "4. Level3"
printf "%-50s\n" "=================================================="
printf "${GREEN}${BOLD}Enter your choice (1-4): ${RESET}"
read opt

case $opt in
    menu)
        bash menu.sh
        ;;
    1)
        clear
        echo "$(tput setaf 2)$(tput bold)level0 is being prepared $(tput sgr0)"
        display_animation
        clear
        bash sub_and_test.sh rank02 level0
        ;;
    2)  
        mkdir -p "$RENDU_DIR"
        clear
        echo "$(tput setaf 2)$(tput bold)level1 is being prepared...$(tput sgr0)"
        display_animation
        clear
        bash sub_and_test.sh rank02 level1
        ;;
    3) 
        mkdir -p "$RENDU_DIR"
        clear
        echo "$(tput setaf 2)$(tput bold)level2 is being prepared...$(tput sgr0)"
        display_animation
        clear
        bash sub_and_test.sh rank02 level2
        ;;
    4)
        mkdir -p "$RENDU_DIR"
        clear
        echo "$(tput setaf 2)$(tput bold)level3 is being prepared...$(tput sgr0)"
        display_animation
        clear
        bash sub_and_test.sh rank02 level3
        ;;
    exit)
        rm -rf "$RENDU_DIR"
        clear
        exit
        ;;
    *)
        echo "$(tput setaf 1)Wrong input$(tput sgr0)"
        sleep 1
        bash rank02.sh
esac

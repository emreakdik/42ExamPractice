#!/bin/bash
source functions.sh
source colors.sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
RENDU_DIR="$REPO_ROOT/rendu"

menu_options=(
    "Level 0"
    "Level 1"
    "Level 2"
    "Level 3"
    "Back to Main Menu"
    "Exit"
)

arrow_menu "Choose a level to practice." "${menu_options[@]}"
selection="$ARROW_MENU_SELECTED"

case "$selection" in
    0)
        clear
        echo "$(tput setaf 2)$(tput bold)Level 0 is being prepared...$(tput sgr0)"
        display_animation
        clear
        bash sub_and_test.sh rank02 level0
        ;;
    1)
        mkdir -p "$RENDU_DIR"
        clear
        echo "$(tput setaf 2)$(tput bold)Level 1 is being prepared...$(tput sgr0)"
        display_animation
        clear
        bash sub_and_test.sh rank02 level1
        ;;
    2)
        mkdir -p "$RENDU_DIR"
        clear
        echo "$(tput setaf 2)$(tput bold)Level 2 is being prepared...$(tput sgr0)"
        display_animation
        clear
        bash sub_and_test.sh rank02 level2
        ;;
    3)
        mkdir -p "$RENDU_DIR"
        clear
        echo "$(tput setaf 2)$(tput bold)Level 3 is being prepared...$(tput sgr0)"
        display_animation
        clear
        bash sub_and_test.sh rank02 level3
        ;;
    4)
        bash menu.sh
        ;;
    5)
        rm -rf "$RENDU_DIR"
        clear
        exit
        ;;
    *)
        echo "$(tput setaf 1)Invalid selection$(tput sgr0)"
        sleep 1
        bash rank02.sh
        ;;
esac

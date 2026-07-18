#!/bin/bash
source functions.sh
source colors.sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
RENDU_DIR="$REPO_ROOT/rendu"

menu_options=(
    "Level 1"
    "Level 2"
    "Back to Main Menu"
    "Exit"
)

arrow_menu "Choose a level to practice." "${menu_options[@]}"
selection="$ARROW_MENU_SELECTED"

case "$selection" in
    0)
        mkdir -p "$RENDU_DIR"
        clear
        echo "$(tput setaf 2)$(tput bold)Level 1 is being prepared...$(tput sgr0)"
        display_animation
        clear
        bash sub_and_test.sh rank03 level1
        ;;
    1)
        mkdir -p "$RENDU_DIR"
        clear
        echo "$(tput setaf 2)$(tput bold)Level 2 is being prepared...$(tput sgr0)"
        display_animation
        clear
        bash sub_and_test.sh rank03 level2
        ;;
    2)
        bash menu.sh
        ;;
    3)
        rm -rf "$RENDU_DIR"
        clear
        exit
        ;;
    *)
        echo "$(tput setaf 1)Invalid selection$(tput sgr0)"
        sleep 1
        bash rank03.sh
        ;;
esac

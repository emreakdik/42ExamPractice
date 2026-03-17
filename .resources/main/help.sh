#!/bin/bash
source colors.sh
source functions.sh

show_command_details() {
    local command_name="$1"
    local command_description="$2"
    local command_usage="$3"

    clear
    bash label.sh
    printf "%-50s\n" "=================================================="
    printf "${BG_CYAN}${BLACK}%-50s${RESET}\n" "COMMAND DETAILS"
    printf "%-50s\n" "=================================================="
    printf "${YELLOW}${BOLD}Command:${RESET} %s\n" "$command_name"
    printf "${YELLOW}${BOLD}Description:${RESET} %s\n" "$command_description"
    printf "${YELLOW}${BOLD}Usage:${RESET} %s\n" "$command_usage"
    printf "%-50s\n" "=================================================="
    printf "${GREEN}${BOLD}Press Enter to return to Command Reference.${RESET}"
    read -r _
}

while true; do
    menu_options=(
        "exit - Quit Exam Practice"
        "next - Move to the next subject"
        "test - Run the current tester"
        "menu - Main Menu command (in practice)"
        "Back to Main Menu"
    )

    ARROW_MENU_PRIMARY_HINT="Use ↑/↓ to move. Enter to view details or select."
    arrow_menu "COMMAND REFERENCE" "${menu_options[@]}"
    selection="$ARROW_MENU_SELECTED"

    case "$selection" in
        0)
            show_command_details "exit" "Closes Exam Practice and exits the shell." "exit"
            ;;
        1)
            show_command_details "next" "Skips the current question and opens the next one." "next"
            ;;
        2)
            show_command_details "test" "Runs tester.sh for the current question." "test"
            ;;
        3)
            show_command_details "menu" "Returns to the main menu and clears rendu files." "menu"
            ;;
        4)
            bash menu.sh
            exit 0
            ;;
        *)
            bash menu.sh
            exit 0
            ;;
    esac
done

source colors.sh

clear
bash label.sh
printf "%-50s\n" "=================================================="
printf "${BG_CYAN}${BLACK}%-50s${RESET}\n" "MAIN MENU"
printf "%-50s\n" "=================================================="
printf "${YELLOW}${BOLD}%s${RESET}\n" "1. Exam Rank 02"
printf "${YELLOW}${BOLD}%s${RESET}\n" "2. Exam Rank 03 (in process)"
printf "${YELLOW}${BOLD}%s${RESET}\n" "3. Commands"
printf "%-50s\n" "=================================================="
printf "${GREEN}${BOLD}Enter your choice (1-3): ${RESET}"
read opt

case $opt in
    1)
        bash rank02.sh
        ;;
    2) 
        echo "Exam Rank 03 is currently in process"
        sleep 2
        bash menu.sh
        ;;
    3)
        bash help.sh
        ;;
    exit)
        cd ../../../../
        rm -rf rendu
        exit 1
        ;;
    *)
        echo "Invalid choice. Please enter a number from 1 to 3."
        sleep 1
        clear
        bash menu.sh
esac
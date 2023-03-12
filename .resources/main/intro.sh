echo "$(tput setaf 2)$(tput bold)MAIN MENU$(tput sgr0)"

cat << intro
==========================
$(tput setaf 7)
1. Exam Rank 02
2. Exam Rank 03 (in process)
3. Commands
$(tput sgr0)
==========================
intro
read -p "Enter your option (1-3): " opt

case $opt in
    1)
        bash rank02.sh
        ;;
    2) 
        echo "Exam Rank 03 is not ready for practice."
        sleep 2
        bash menu.sh
        ;;
    3)
        bash help.sh
        ;;
    exit)
        exit 1
        ;;
    *)
        echo "Wrong input"
        sleep 1
        clear
        bash menu.sh
esac
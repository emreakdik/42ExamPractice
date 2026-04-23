source colors.sh
source functions.sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
RENDU_DIR="$REPO_ROOT/rendu"

mkdir -p "$RENDU_DIR"

menu_options=(
    "Exam Rank 02"
    "Exam Rank 03 (Coming Soon)"
    "Command Reference"
    "Update Script"
    "Open Rendu Folder"
    "Exit Without Deleting Rendu"
    "Exit"
)

arrow_menu "MAIN MENU" "${menu_options[@]}"
selection="$ARROW_MENU_SELECTED"

case "$selection" in
    0)
        bash rank02.sh
        ;;
    1)
        echo "Exam Rank 03 is coming soon."
        sleep 2
        bash menu.sh
        ;;
    2)
        bash help.sh
        ;;
    3)
        bash "$REPO_ROOT/update.sh"
        ;;
    4)
        cd "$RENDU_DIR" || exit 1
        open .
        cd "$SCRIPT_DIR" || exit 1
        bash menu.sh
        exit 1
        ;;
    5)
        ARCHIVE_NAME="rendu_$(date +%d-%b-%H:%M)"
        mv "$RENDU_DIR" "$REPO_ROOT/$ARCHIVE_NAME"
        clear
        echo "Rendu folder archived as: $ARCHIVE_NAME"
        exit 1
        ;;
    6)
        rm -rf "$RENDU_DIR"
        clear
        exit 1
        ;;
    *)
        echo "Invalid choice. Please enter a valid option."
        sleep 1
        clear
        bash menu.sh
        ;;
esac

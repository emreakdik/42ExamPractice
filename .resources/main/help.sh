clear
bash label.sh
echo "$(tput setaf 2)$(tput bold)Commands$(tput sgr0)"
echo =============================
echo "Type $(tput setaf 4)'exit'$(tput sgr 0) to exit the exam practice."
echo "Type $(tput setaf 4)'next'$(tput sgr 0) to move on to the next subject."
echo "Type $(tput setaf 4)'test'$(tput sgr 0) to test your code."
echo "Type $(tput setaf 4)'menu'$(tput sgr 0) to return to the menu."
echo =============================
read -rp "Pres enter to return to the menu: " opt
bash menu.sh


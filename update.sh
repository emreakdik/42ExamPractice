source colors.sh
clear

echo "${GREEN}${BOLD}CLEANING...${RESET}"
echo ""
rm -rf rendu
rm -rf .resources
rm exampractice.sh
rm README.md
rm tr.md
echo ""

git clone https://github.com/emreakdik/42ExamPractice
echo "${GREEN}${BOLD}UPDATING...${RESET}"
echo ""
echo "${GREEN}${BOLD}Please wait...${RESET}"
cd 42ExamPractice
mv exampractice.sh ..
mv README.md ..
mv tr.md ..
mv .resources ..
cd ..
rm -rf 42ExamPractice
echo "${GREEN}${BOLD}DONE!${RESET}"
bash exampractice.sh
exit
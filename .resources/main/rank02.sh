clear
sh label.sh
cat << rank02

Select the level you want to practice.
==========================
1. level0
2. level1 (in process)
3. level2 (in process)
4. level3 (in process)
0. Back to main menu
==========================
rank02
read -p "Enter your option (1-4): " opt

case $opt in
    0)
        sh menu.sh
        ;;
    1)
        mkdir ../../rendu
        clear
        echo "level0 setting up..."
        sleep 3
        clear
        sh sub_and_test.sh
        # folder_location="../rank02/level0"

        # for file_location in $(find "$folder_location" -type f -name "sub.txt" | shuf | uniq); do
        # cat "$file_location"
        # echo "\n"
        # read -rp $'' key
        # clear
        # done
        ;;
    2) 
        echo "level1 is not ready for practice."
        sleep 3
        sh rank02.sh
        ;;
    3) 
        echo "level2 sis not ready for practice."
        sleep 3
        sh rank02.sh
        ;;
    4)
        echo "level3 sis not ready for practice."
        sleep 3
        sh rank02.sh
        ;;
esac

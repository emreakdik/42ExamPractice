#!/bin/bash

folder_path="../rank02/level0"

folders=("first_word" "fizzbuzz" "ft_putstr" "ft_strcpy" "ft_strlen" "ft_swap" "repeat_alpha" "rev_print" "rot_13" "rotone" "search_and_replace" "ulstr")

shuf_folders=($(shuf -e "${folders[@]}"))

for folder in "${shuf_folders[@]}"
do
    echo "------------------------------"
    echo "Klasör: $folder"
    echo "------------------------------"
    
    while read -r line; do
        echo "$line"
        read -p "Çalıştırmak için 'test', sonraki için 'next', çıkmak için 'exit' yazın: " input
        case $input in
            test)
                cd "$folder_path/$folder"
                ./tester.sh
                cd -
                ;;
            next)
                break
                ;;
            exit)
                exit
                ;;
            *)
                echo "Geçersiz girdi, tekrar deneyin."
                ;;
        esac
    done < "$folder_path/$folder/sub.txt"
done

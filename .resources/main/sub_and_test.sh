source colors.sh

rank=$1
level=$2

if [[ "$level" == *"level0"* ]]; then
    qsub=("first_word" "fizzbuzz" "ft_putstr" "ft_strcpy" "ft_strlen" "ft_swap" "repeat_alpha" "rev_print" "rot_13" "rotone" "search_and_replace" "ulstr")
elif [[ "$level" == *"level1"* ]]; then
    qsub=("alpha_mirror" "camel_to_snake" "print_bits" "do_op" "ft_atoi" "ft_strcmp" "reverse_bits" "ft_strrev" "ft_strcspn" "ft_strdup" "inter" "is_power_of_2" "last_word" "max" "snake_to_camel" "swap_bits" "union" "wdmatch")
elif [[ "$level" == *"level2"* ]]; then
    qsub=("add_prime_sum" "epur_str" "expand_str" "ft_list_size" "ft_atoi_base" "ft_range" "ft_rrange" "hidenp" "lcm" "paramsum" "pgcd" "print_hex" "rstr_capitalizer" "str_capitalizer" "tab_mult")
elif [[ "$level" == *"level3"* ]]; then
    qsub=("fprime" "ft_itoa" "ft_split" "rev_wstr" "rostring" "ft_list_foreach" "sort_int_tab" "sort_list" "ft_list_remove_if" )
fi

#set -x

i=0
cd "../$rank/$level/${qsub[$i]}"
num=${#qsub[@]}
while true; do
    cd "../${qsub[$i]}"
    subject=$(cat sub.txt)
    if [ $i -eq $(($num)) ]; then
    clear
        echo "These questions at $level are completed."
        echo "=============================================="
        read -rp "${GREEN}${BOLD}Please press enter for return to the menu.${RESET}" enterx
        sleep 2
        cd ../../main
        bash menu.sh
        exit
    fi
    while true; do
        clear
        echo "$subject"
        read -rp "/>" input
        case $input in
            next)
                i=$((i+1))
                break
                ;;
            test)
                clear
                ./tester.sh &
                pid=$!
                slept=0

                while [ $slept -lt 10 ] && kill -0 $pid 2>/dev/null; do
                sleep 1
                slept=$((slept+1))
                done

                if kill -0 $pid 2>/dev/null; then
                echo "$(tput setaf 1)$(tput bold)TIMEOUT$(tput sgr 0)"
                echo "It can be because of infinite loop ∞"
                echo "Please check your code or just try again."
                kill $pid 2>/dev/null
                fi
                echo "=============================================="
                read -rp "${GREEN}${BOLD}Please press enter to continue your practice.${RESET}" enter
                break
                ;;
            menu)
                cd ../../../../
                rm -rf rendu
                cd .resources/main
                bash menu.sh
                exit
                ;;
            exit)
                cd ../../../../
                rm -rf rendu
                exit 1
                ;;
        esac
    done   
done
rank=$1
level=$2

if [[ "$level" == *"level0"* ]]; then
    qsub=("first_word" "fizzbuzz" "ft_putstr" "ft_strcpy" "ft_strlen" "ft_swap" "repeat_alpha" "rev_print" "rot_13" "rotone" "search_and_replace" "ulstr")
elif [[ "$level" == *"level1"* ]]; then
    qsub=("alpha_mirror" "camel_to_snake" "do_op" "ft_atoi" "ft_strcmp" "ft_strcsnp" "ft_strdup" "inter" "is_power_of_2" "last_word" "max" "snake_to_camel" "swap_bits" "union")
elif [[ "$level" == *"level2"* ]]; then
    qsub=("add_prime_sum" "epur_str" "expand_str" "ft_list_size" "ft_atoi_base" "ft_range" "ft_rrange" "hidenp" "lcm" "paramsum" "pgcd" "print_hex" "rstr_capitalizer" "str_capitalizer" "tab_mult")
elif [[ "$level" == *"level3"* ]]; then
    qsub=("fprime" "ft_itoa" "ft_split" "rev_wstr" "rostring" "sort_int_tab" "sort_list" "ft_list_remove_if" )
fi

#set -x

i=0
cd "../$rank/$level/${qsub[$i]}"
ls
while true; do

cd "../${qsub[$i]}"
subject=$(cat sub.txt)
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
        bash tester.sh
        sleep 2
        break
        ;;
    menu)
        cd ../../../main
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
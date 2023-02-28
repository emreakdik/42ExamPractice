#include <unistd.h>

int ft_atoi(char *str){

    int i = 0;
    int sign = 1;
    int result = 0;

    while(str[i] == ' ' || (str[i] >= 9 && str[i] <= 13))
        i++;
    if(str[i] == '-')
        sign *= -1;
    while(str[i] == '-' || str[i] == '+')
        i++;
    while(str[i] >= '0' && str[i] <= '9'){
        result = result * 10 + str[i] - '0';
        i++;
    }
    return sign * result;
}


void	print_hex(int num){
    
    if (num >= 16)
        print_hex(num / 16);
    write(1, &"0123456789abcdef"[num % 16], 1);
}

int main (int ac, char **av){

    if (ac == 2 )
        print_hex(ft_atoi(av[1]));
    write(1, "\n", 1);
}
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

void ft_putchar(char c){

    if(!c)
        return 0;
    else
        write(1, &c, 1);
}

void	ft_putnbr(int n)
{
	if (n == -2147483648)
		write(1, "-2147483648", 12);
	if (n < 0)
	{
		n *= -1;
		ft_putchar('-');
	}
	if (n > 9)
		ft_putnbr(n / 10);
	ft_putchar(n % 10 + '0');
}

int is_prime(int num){

    int i;

    i = 3;
    if(num <= 1)
        return 0;
    if(num % 2 == 0 && num > 2)
        return 0;
    while(i < (num / 2)){
        if(num % i == 0)
            return 0;
        i += 2;
    }
    return 1;
}

int main(int ac, char **av){

    int num = ft_atoi(av[1]);
    int res = 0;

    if(ac == 2){

        while(num > 0){
            if(is_prime(num--))
                res += (num + 1);
            ft_putnbr(res);
        }
    }
    if(ac != 2)
        ft_putnbr(0);
    write(1, "\n", 1);
}
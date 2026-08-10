#include <unistd.h>

int	ft_atoi(char *str)
{
	int	i;
	int	sign;
	int	res;

	i = 0;
	sign = 1;
	res = 0;
	while (str[i] == ' ' || (str[i] >= 9 && str[i] <= 13))
		i++;
	while (str[i] == '+' || str[i] == '-')
	{
		if (str[i] == '-')
			sign = -sign;
		i++;
	}
	while (str[i] >= '0' && str[i] <= '9')
	{
		res = res * 10 + (str[i] - '0');
		i++;
	}
	return (res * sign);
}

void	ft_putnbr(int n)
{
	char	c;

	if (n < 0)
	{
		write(1, "-", 1);
		if (n == -2147483648)
		{
			write(1, "2", 1);
			n = -147483648;
		}
		n = -n;
	}
	if (n >= 10)
		ft_putnbr(n / 10);
	c = n % 10 + '0';
	write(1, &c, 1);
}

void	print_range(int a, int b)
{
	int	step;

	step = 1;
	if (a > b)
		step = -1;
	while (1)
	{
		ft_putnbr(a);
		write(1, "\n", 1);
		if (a == b)
			break ;
		a += step;
	}
}

int	main(int argc, char **argv)
{
	if (argc == 3)
		print_range(ft_atoi(argv[1]), ft_atoi(argv[2]));
	return (0);
}

#include <unistd.h>

void	ft_putnbr(int n)
{
	char	c;

	if (n >= 10)
		ft_putnbr(n / 10);
	c = n % 10 + '0';
	write(1, &c, 1);
}

void	print_line(int n)
{
	if (n % 15 == 0)
		write(1, "buzzfizz", 8);
	else if (n % 3 == 0)
		write(1, "buzz", 4);
	else if (n % 5 == 0)
		write(1, "fizz", 4);
	else
		ft_putnbr(n);
	write(1, "\n", 1);
}

int	main(void)
{
	int	i;

	i = 1;
	while (i <= 100)
	{
		print_line(i);
		i++;
	}
	return (0);
}

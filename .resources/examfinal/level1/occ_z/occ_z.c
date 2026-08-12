#include <unistd.h>

void	ft_putnbr(int n)
{
	char	c;

	if (n >= 10)
		ft_putnbr(n / 10);
	c = n % 10 + '0';
	write(1, &c, 1);
}

int	count_char(char *str, char target)
{
	int	i;
	int	count;

	i = 0;
	count = 0;
	while (str[i])
	{
		if (str[i] == target)
			count++;
		i++;
	}
	return (count);
}

int	main(int argc, char **argv)
{
	int	count;

	count = 0;
	if (argc == 2)
		count = count_char(argv[1], 'z');
	ft_putnbr(count);
	write(1, "\n", 1);
	return (0);
}

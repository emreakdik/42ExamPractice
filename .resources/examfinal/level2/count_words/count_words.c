#include <unistd.h>

void	ft_putnbr(int n)
{
	char	c;

	if (n >= 10)
		ft_putnbr(n / 10);
	c = n % 10 + '0';
	write(1, &c, 1);
}

int	is_sep(char c)
{
	return (c == ' ' || c == '\t');
}

int	count_words(char *str)
{
	int	i;
	int	count;

	i = 0;
	count = 0;
	while (str[i])
	{
		if (!is_sep(str[i]) && (i == 0 || is_sep(str[i - 1])))
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
		count = count_words(argv[1]);
	ft_putnbr(count);
	write(1, "\n", 1);
	return (0);
}

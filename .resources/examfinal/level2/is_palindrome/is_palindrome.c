#include <unistd.h>

int	ft_strlen(char *str)
{
	int	i;

	i = 0;
	while (str[i])
		i++;
	return (i);
}

int	is_palindrome(char *str)
{
	int	i;
	int	j;

	i = 0;
	j = ft_strlen(str) - 1;
	while (i < j)
	{
		if (str[i] != str[j])
			return (0);
		i++;
		j--;
	}
	return (1);
}

int	main(int argc, char **argv)
{
	if (argc != 2)
	{
		write(1, "\n", 1);
		return (0);
	}
	if (is_palindrome(argv[1]))
		write(1, "1\n", 2);
	else
		write(1, "0\n", 2);
	return (0);
}

#include <unistd.h>

int	is_sep(char c)
{
	return (c == ' ' || c == '\t');
}

char	to_upper(char c)
{
	if (c >= 'a' && c <= 'z')
		return (c - 32);
	return (c);
}

char	to_lower(char c)
{
	if (c >= 'A' && c <= 'Z')
		return (c + 32);
	return (c);
}

void	print_title(char *str)
{
	int		i;
	int		start;
	char	c;

	i = 0;
	start = 1;
	while (str[i])
	{
		if (is_sep(str[i]))
			start = 1;
		if (start && !is_sep(str[i]))
		{
			c = to_upper(str[i]);
			start = 0;
		}
		else
			c = to_lower(str[i]);
		write(1, &c, 1);
		i++;
	}
}

int	main(int argc, char **argv)
{
	if (argc == 2)
		print_title(argv[1]);
	write(1, "\n", 1);
	return (0);
}

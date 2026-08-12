#include <stdio.h>

int	to_lower(int c)
{
	if (c >= 'A' && c <= 'Z')
		return (c + 32);
	return (c);
}

int	is_alpha(int c)
{
	c = to_lower(c);
	return (c >= 'a' && c <= 'z');
}

void	fill_counts(char *str, int *count)
{
	int	i;

	i = 0;
	while (str[i])
	{
		if (is_alpha(str[i]))
			count[to_lower(str[i]) - 'a']++;
		i++;
	}
}

void	print_counts(char *str, int *count)
{
	int	i;
	int	c;
	int	first;

	i = 0;
	first = 1;
	while (str[i])
	{
		c = to_lower(str[i]);
		if (is_alpha(str[i]) && count[c - 'a'] > 0)
		{
			if (!first)
				printf(", ");
			printf("%d%c", count[c - 'a'], c);
			count[c - 'a'] = 0;
			first = 0;
		}
		i++;
	}
}

int	main(int argc, char **argv)
{
	int	count[26];
	int	i;

	i = 0;
	while (i < 26)
	{
		count[i] = 0;
		i++;
	}
	if (argc == 2)
	{
		fill_counts(argv[1], count);
		print_counts(argv[1], count);
	}
	printf("\n");
	return (0);
}

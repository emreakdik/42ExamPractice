#include <unistd.h>

int	match_at(char *hay, char *needle, int len)
{
	int	i;

	i = 0;
	while (i < len)
	{
		if (hay[i] != needle[i])
			return (0);
		i++;
	}
	return (1);
}

int	contains(char *hay, char *needle, int len)
{
	int	i;

	if (len == 0)
		return (1);
	i = 0;
	while (hay[i])
	{
		if (match_at(&hay[i], needle, len))
			return (1);
		i++;
	}
	return (0);
}

int	in_all(int argc, char **argv, char *needle, int len)
{
	int	i;

	i = 2;
	while (i < argc)
	{
		if (!contains(argv[i], needle, len))
			return (0);
		i++;
	}
	return (1);
}

int	best_span(int argc, char **argv, int *best_i, int slen)
{
	int	i;
	int	len;
	int	best_len;

	best_len = 0;
	*best_i = 0;
	i = 0;
	while (i < slen)
	{
		len = best_len + 1;
		while (i + len <= slen)
		{
			if (in_all(argc, argv, &argv[1][i], len))
			{
				best_len = len;
				*best_i = i;
			}
			len++;
		}
		i++;
	}
	return (best_len);
}

int	main(int argc, char **argv)
{
	int	best_i;
	int	best_len;
	int	slen;

	best_i = 0;
	best_len = 0;
	slen = 0;
	if (argc >= 2)
	{
		while (argv[1][slen])
			slen++;
		best_len = best_span(argc, argv, &best_i, slen);
		write(1, &argv[1][best_i], best_len);
	}
	write(1, "\n", 1);
	return (0);
}

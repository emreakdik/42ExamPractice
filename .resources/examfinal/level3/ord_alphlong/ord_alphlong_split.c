#include "ord_alphlong.h"

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

void	fill_words(char *str, t_word *words)
{
	int	i;
	int	n;

	i = 0;
	n = 0;
	while (str[i])
	{
		if (!is_sep(str[i]) && (i == 0 || is_sep(str[i - 1])))
		{
			words[n].start = &str[i];
			words[n].len = 0;
			while (str[i + words[n].len] && !is_sep(str[i + words[n].len]))
				words[n].len++;
			n++;
		}
		i++;
	}
}

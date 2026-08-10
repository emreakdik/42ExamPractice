#include "ord_alphlong.h"

static char	fold(char c)
{
	if (c >= 'A' && c <= 'Z')
		return (c + 32);
	return (c);
}

static int	word_cmp(t_word a, t_word b)
{
	int	i;

	if (a.len != b.len)
		return (a.len - b.len);
	i = 0;
	while (i < a.len)
	{
		if (fold(a.start[i]) != fold(b.start[i]))
			return (fold(a.start[i]) - fold(b.start[i]));
		i++;
	}
	return (0);
}

void	sort_words(t_word *words, int n)
{
	int		i;
	int		j;
	t_word	tmp;

	i = 1;
	while (i < n)
	{
		tmp = words[i];
		j = i - 1;
		while (j >= 0 && word_cmp(words[j], tmp) > 0)
		{
			words[j + 1] = words[j];
			j--;
		}
		words[j + 1] = tmp;
		i++;
	}
}

#include <unistd.h>
#include <stdlib.h>
#include "ord_alphlong.h"

static void	print_words(t_word *words, int n)
{
	int	i;

	i = 0;
	while (i < n)
	{
		if (i > 0 && words[i].len != words[i - 1].len)
			write(1, "\n", 1);
		else if (i > 0)
			write(1, " ", 1);
		write(1, words[i].start, words[i].len);
		i++;
	}
	write(1, "\n", 1);
}

int	main(int argc, char **argv)
{
	t_word	*words;
	int		n;

	if (argc != 2)
	{
		write(1, "\n", 1);
		return (0);
	}
	n = count_words(argv[1]);
	words = malloc(sizeof(t_word) * (n + 1));
	if (!words)
		return (1);
	fill_words(argv[1], words);
	sort_words(words, n);
	print_words(words, n);
	free(words);
	return (0);
}

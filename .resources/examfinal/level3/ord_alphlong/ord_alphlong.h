#ifndef ORD_ALPHLONG_H
# define ORD_ALPHLONG_H

typedef struct s_word
{
	char	*start;
	int		len;
}	t_word;

int		is_sep(char c);
int		count_words(char *str);
void	fill_words(char *str, t_word *words);
void	sort_words(t_word *words, int n);

#endif

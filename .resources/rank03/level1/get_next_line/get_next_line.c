#include "get_next_line.h"

static int	has_newline(char *s)
{
	int	i;

	i = 0;
	while (s && s[i])
	{
		if (s[i] == '\n')
			return (1);
		i++;
	}
	return (0);
}

static char	*join_free(char *a, char *b, int nb)
{
	int		i;
	int		j;
	int		la;
	char	*res;

	la = 0;
	while (a && a[la])
		la++;
	res = malloc(la + nb + 1);
	if (!res)
	{
		free(a);
		return (NULL);
	}
	i = 0;
	while (i < la)
	{
		res[i] = a[i];
		i++;
	}
	j = 0;
	while (j < nb)
		res[i++] = b[j++];
	res[i] = '\0';
	free(a);
	return (res);
}

static char	*extract_line(char **rem)
{
	int		i;
	int		len;
	char	*line;
	char	*newrem;

	i = 0;
	while ((*rem)[i] && (*rem)[i] != '\n')
		i++;
	if ((*rem)[i] == '\n')
		i++;
	line = malloc(i + 1);
	if (!line)
		return (NULL);
	len = 0;
	while (len < i)
	{
		line[len] = (*rem)[len];
		len++;
	}
	line[i] = '\0';
	len = 0;
	while ((*rem)[i + len])
		len++;
	newrem = NULL;
	if (len > 0)
	{
		newrem = malloc(len + 1);
		if (!newrem)
		{
			free(line);
			return (NULL);
		}
		len = 0;
		while ((*rem)[i + len])
		{
			newrem[len] = (*rem)[i + len];
			len++;
		}
		newrem[len] = '\0';
	}
	free(*rem);
	*rem = newrem;
	return (line);
}

char	*get_next_line(int fd)
{
	static char	*rem;
	char		*buf;
	int			nb;

	if (fd < 0 || BUFFER_SIZE <= 0)
		return (NULL);
	buf = malloc(BUFFER_SIZE);
	if (!buf)
		return (NULL);
	nb = 1;
	while (!has_newline(rem) && nb > 0)
	{
		nb = read(fd, buf, BUFFER_SIZE);
		if (nb < 0)
		{
			free(buf);
			free(rem);
			rem = NULL;
			return (NULL);
		}
		if (nb > 0)
			rem = join_free(rem, buf, nb);
		if (nb > 0 && !rem)
		{
			free(buf);
			return (NULL);
		}
	}
	free(buf);
	if (!rem || !rem[0])
	{
		free(rem);
		rem = NULL;
		return (NULL);
	}
	return (extract_line(&rem));
}

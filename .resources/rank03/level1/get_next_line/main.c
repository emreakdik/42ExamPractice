/* Test driver for get_next_line. NOT part of the assignment. */
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

char	*get_next_line(int fd);

int	main(int argc, char **argv)
{
	int		fd;
	char	*line;
	int		i;

	fd = 0;
	if (argc > 1)
		fd = open(argv[1], O_RDONLY);
	if (fd < 0)
		return (1);
	while ((line = get_next_line(fd)) != NULL)
	{
		i = 0;
		while (line[i])
			i++;
		write(1, line, i);
		free(line);
	}
	if (fd > 0)
		close(fd);
	return (0);
}

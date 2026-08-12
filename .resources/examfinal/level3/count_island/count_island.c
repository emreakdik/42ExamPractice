#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include "count_island.h"

char	*read_file(char *path, int *size)
{
	char	*buf;
	int		fd;
	int		ret;

	fd = open(path, O_RDONLY);
	if (fd < 0)
		return (0);
	buf = malloc(MAX_FILE);
	if (!buf)
	{
		close(fd);
		return (0);
	}
	*size = 0;
	ret = read(fd, buf, MAX_FILE);
	while (ret > 0)
	{
		*size += ret;
		ret = read(fd, buf + *size, MAX_FILE - *size);
	}
	close(fd);
	if (ret < 0)
		return (free(buf), (char *)0);
	return (buf);
}

int	grid_dims(char *buf, int size, t_grid *grid)
{
	int	i;
	int	line;

	i = 0;
	line = 0;
	grid->w = 0;
	grid->h = 0;
	while (i < size)
	{
		line++;
		if (buf[i] == '\n')
		{
			if (grid->w == 0)
				grid->w = line;
			if (line != grid->w)
				return (0);
			grid->h++;
			line = 0;
		}
		i++;
	}
	return (line == 0 && grid->h > 0);
}

void	flood(t_grid *grid, int x, int y, char mark)
{
	if (x < 0 || y < 0 || x >= grid->w - 1 || y >= grid->h)
		return ;
	if (grid->buf[y * grid->w + x] != 'X')
		return ;
	grid->buf[y * grid->w + x] = mark;
	flood(grid, x + 1, y, mark);
	flood(grid, x - 1, y, mark);
	flood(grid, x, y + 1, mark);
	flood(grid, x, y - 1, mark);
}

void	solve(t_grid *grid)
{
	int		x;
	int		y;
	char	mark;

	mark = '0';
	y = 0;
	while (y < grid->h)
	{
		x = 0;
		while (x < grid->w - 1)
		{
			if (grid->buf[y * grid->w + x] == 'X')
			{
				flood(grid, x, y, mark);
				mark++;
			}
			x++;
		}
		y++;
	}
}

int	main(int argc, char **argv)
{
	t_grid	grid;
	char	*buf;
	int		size;

	size = 0;
	buf = 0;
	if (argc == 2)
		buf = read_file(argv[1], &size);
	if (!buf || !grid_dims(buf, size, &grid))
	{
		free(buf);
		write(1, "\n", 1);
		return (0);
	}
	grid.buf = buf;
	solve(&grid);
	write(1, buf, size);
	free(buf);
	return (0);
}

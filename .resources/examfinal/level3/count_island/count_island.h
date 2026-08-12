#ifndef COUNT_ISLAND_H
# define COUNT_ISLAND_H

/* ponytail: the map is slurped into one fixed 1 MiB buffer instead of a
   growing one. Raise MAX_FILE, or switch to a copy-and-grow read, if maps
   ever get bigger than that. */
# define MAX_FILE 1048576

typedef struct s_grid
{
	char	*buf;
	int		w;
	int		h;
}	t_grid;

char	*read_file(char *path, int *size);
int		grid_dims(char *buf, int size, t_grid *grid);
void	flood(t_grid *grid, int x, int y, char mark);
void	solve(t_grid *grid);

#endif

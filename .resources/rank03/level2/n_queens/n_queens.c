#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int	*g_board;
int	g_size;

static void	print_solution(void)
{
	int	i;

	for (i = 0; i < g_size; i++)
	{
		fprintf(stdout, "%d", g_board[i]);
		if (i < g_size - 1)
			fprintf(stdout, " ");
	}
	fprintf(stdout, "\n");
}

static int	ft_abs(int n)
{
	if (n < 0)
		return (-n);
	return (n);
}

static int	is_safe(int row, int col)
{
	int	i;

	for (i = 0; i < col; i++)
	{
		if (g_board[i] == row)
			return (0);
		if (ft_abs(g_board[i] - row) == ft_abs(i - col))
			return (0);
	}
	return (1);
}

static void	solve(int col)
{
	int	row;

	if (col == g_size)
	{
		print_solution();
		return ;
	}
	for (row = 0; row < g_size; row++)
	{
		if (is_safe(row, col))
		{
			g_board[col] = row;
			solve(col + 1);
		}
	}
}

int	main(int ac, char **av)
{
	int	n;

	if (ac != 2)
		return (0);
	n = atoi(av[1]);
	if (n < 1)
		return (0);
	g_size = n;
	g_board = malloc(sizeof(int) * g_size);
	if (!g_board)
		return (1);
	solve(0);
	free(g_board);
	return (0);
}

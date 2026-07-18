/* Test driver for ft_scanf. NOT part of the assignment.
   Dispatches on argv[1] so each format string can be fed a fresh stdin. */
#include <stdio.h>
#include <stdlib.h>

int	ft_scanf(const char *format, ...);

int	main(int ac, char **av)
{
	int		id;
	int		d;
	int		d2;
	char	c;
	char	c2;
	char	c3;
	char	s[4096];
	char	s2[4096];
	int		r;

	id = (ac > 1) ? atoi(av[1]) : 0;
	d = 0;
	d2 = 0;
	c = 0;
	c2 = 0;
	c3 = 0;
	s[0] = '\0';
	s2[0] = '\0';
	if (id == 0)
	{
		r = ft_scanf("%d %c %s", &d, &c, s);
		printf("r=%d|d=%d|c=%d|s=%s\n", r, d, (int)c, s);
	}
	else if (id == 1)
	{
		r = ft_scanf("%d", &d);
		printf("r=%d|d=%d\n", r, d);
	}
	else if (id == 2)
	{
		r = ft_scanf("%c", &c);
		printf("r=%d|c=%d\n", r, (int)c);
	}
	else if (id == 3)
	{
		r = ft_scanf("%s", s);
		printf("r=%d|s=%s\n", r, s);
	}
	else if (id == 4)
	{
		r = ft_scanf("%d%d", &d, &d2);
		printf("r=%d|d=%d|d2=%d\n", r, d, d2);
	}
	else if (id == 5)
	{
		r = ft_scanf("%d,%d", &d, &d2);
		printf("r=%d|d=%d|d2=%d\n", r, d, d2);
	}
	else if (id == 6)
	{
		r = ft_scanf("%c%c%c", &c, &c2, &c3);
		printf("r=%d|c=%d|c2=%d|c3=%d\n", r, (int)c, (int)c2, (int)c3);
	}
	else if (id == 7)
	{
		r = ft_scanf("abc%d", &d);
		printf("r=%d|d=%d\n", r, d);
	}
	else
	{
		r = ft_scanf("%s %s", s, s2);
		printf("r=%d|s=%s|s2=%s\n", r, s, s2);
	}
	return (0);
}

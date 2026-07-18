/* Test driver for ft_scanf. NOT part of the assignment. */
#include <stdio.h>

int	ft_scanf(const char *format, ...);

int	main(void)
{
	int		d;
	char	c;
	char	s[4096];
	int		r;

	d = 0;
	c = 0;
	s[0] = '\0';
	r = ft_scanf("%d %c %s", &d, &c, s);
	printf("ret=%d|d=%d|c=%d|s=%s\n", r, d, (int)c, s);
	return (0);
}

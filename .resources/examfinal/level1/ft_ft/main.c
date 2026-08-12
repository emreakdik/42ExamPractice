#include <stdio.h>

void	ft_ft(int *nbr);

int	main(void)
{
	int	nbr;

	nbr = 0;
	ft_ft(&nbr);
	printf("%d\n", nbr);
	nbr = -1;
	ft_ft(&nbr);
	printf("%d\n", nbr);
	return (0);
}

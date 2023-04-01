#include <stdio.h>
#include <stdlib.h>

unsigned int lcm(unsigned int a, unsigned int b);

int main(int ac, char **av){
	if (ac == 3)
		printf("%d", lcm(atoi(av[1]), atoi(av[2])));
	return (0);
}
#include <stdio.h>

unsigned char	reverse_bits(unsigned char octet);

int main(int ac, char **av)
{
    if (ac == 2)
        printf("%d", reverse_bits(av[1][0]));
    return (0);
}
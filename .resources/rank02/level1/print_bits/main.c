#include <unistd.h>
void print_bits(unsigned char octet);

int main(int ac, char **av)
{
    if (ac == 2)
        print_bits(av[1][0]);
    write(1, "\n", 1);
    return (0);
}
#include <unistd.h>

int main(int ac, char **av){

    int len = 0;

    if(ac == 2){
        while(av[1][len])
            len++;
        while(av[1][len - 1] == ' ' || av[1][len - 1] == '\t')
            len--;
        while(len > 0 && av[1][len - 1] != ' ' && av[1][len - 1] != '\t')
            len--;
        while(av[1][len] && av[1][len] != ' ' && av[1][len] != '\t')
            write(1, &av[1][len++], 1);
    }
    write(1, "\n", 1);
}
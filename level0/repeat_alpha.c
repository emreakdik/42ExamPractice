#include <unistd.h>

int main(int ac, char **av){

    int i;
    int j;

    if(ac == 2){

        i = 0;
        while(av[1][i]){
            if((av[1][i] >= 'a' && av[1][i] <= 'z') || (av[1][i] >= 'A' && av[1][i] <= 'Z')){
                j = 0;
                while(j < (av[1][i] - 96)){
                    write(1, &av[1][i], 1);
                    j++;
                }
            }
            else
                write(1, &av[1][i], 1);
            i++;
        }
    }
    write(1, "\n", 1);
}
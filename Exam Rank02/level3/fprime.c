#include <stdio.h>
#include <stdlib.h>

int main(int ac, char **av){

    int i;
    int number;

    if (ac == 2){
        i = 1;
        number = atoi(av[1]);
        if (number == 1)
            printf("1");
        while (number >= i++){

            if (number % i == 0){
                printf("%d", i);
                if (number == i)
                    break;
                printf("*");
                number /= i;
                i = 1;
            }
        }
    }
    printf("\n");
    return 0;
}
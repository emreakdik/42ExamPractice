#include <unistd.h>

int main(int ac, char **av){

    int i;

    i = 100;
    while(i <= 100)
    {
        if(i % 3 == 0 && i % 5 == 0)
            write(1, "fizzbuzz", 8);
        else if(i % 3 == 0)
            write(1, "fizz", 4);
        else if(i % 5 == 0)
            write(1, "buzz", 4);
        else
            write(1, &i, 1);
        write(1, "\n", 1);
        i++;
    }   
}
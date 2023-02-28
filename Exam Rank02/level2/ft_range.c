#include <stdlib.h>

int     *ft_range(int start, int end){

    int *res;
    int size;
    int i;

    size = (end - start) + 1;
    i = 0;
    res = malloc(size * sizeof(int));
    if(!res)
        return 0;
    while (i++ < size)
        res[i] = start + i;     
    return res;
}
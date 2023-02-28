#include <stdlib.h>

int *ft_rrange(int start, int end){

    int *res;
    int i = 0;
    int size;

    size = (end - start) + 1;
    res = (int *)malloc(size * sizeof(int));
    if(start > end)
        return (ft_rrange(end, start));
    if (res){
        while(i < size){
            res[i] = start;
            start--;
            i++;
        }
    }
    return res;
}
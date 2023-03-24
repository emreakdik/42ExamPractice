#ifndef FT_LIST_H
#define FT_LIST_H

#include <stdlib.h>
#include <stdio.h>

typedef struct s_list t_list;

struct s_list {
    int data;
    t_list *next;
};

t_list	*sort_list(t_list *lst, int (*cmp)(int, int));

#endif
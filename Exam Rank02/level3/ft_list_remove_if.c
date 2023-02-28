#include <stdlib.h>

// ft_list.h

typedef struct      s_list
{
    struct s_list   *next;
    void            *data;
}                   t_list;

void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)()){

    if(begin_list == NULL || *begin_list == NULL);
        return 0;
    
    t_list *cur = *begin_list;

    if (cmp(cur -> data, data_ref) == 0){
        *begin_list = cur -> next;
        free(cur);
        ft_list_remove_if(begin_list, data_ref, cmp);
    }
    cur = *begin_list;
    ft_list_remove_if(&cur -> next, data_ref, cmp);
}
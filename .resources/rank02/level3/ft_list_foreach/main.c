#include <stdlib.h>
#include <stdio.h>
#include "ft_list.h"

void ft_putnbr(void *data)
{
	int *i;

	i = data;
	printf("%d", *i);
}

int main()
{
	t_list *list;
	t_list *list_ptr;
	int i;

	i = 0;
	list = malloc(sizeof(t_list));
	list_ptr = list;
	while (i < 10)
	{
		list_ptr->data = &i;
		list_ptr->next = malloc(sizeof(t_list));
		list_ptr = list_ptr->next;
		i++;
	}
	list_ptr->next = NULL;
	ft_list_foreach(list, &ft_putnbr);
	return (0);
}
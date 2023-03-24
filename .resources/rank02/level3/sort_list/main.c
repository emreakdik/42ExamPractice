#include "ft_list.h"


int		croissant(int a, int b) // cmp fonksiyonnu
{
	if (a <= b) //1 < 2 = 1
		return (1);
	else // 2 > 1 = 0
		return (0);
}

int main(void)
{
	t_list *lst;
	
	lst = (t_list*)malloc(sizeof(t_list));
	lst->data = 20;
	lst->next = (t_list*)malloc(sizeof(t_list));
	lst->next->data = 10;
	lst->next->next = (t_list*)malloc(sizeof(t_list));
	lst->next->next->data = 0;
	lst->next->next->next = NULL;

	lst = sort_list(lst, croissant);

	while (lst != NULL)
	{
		printf("%d\n", lst->data);
	    lst = lst->next;
	}

	return (0);
}

#include <stdio.h>

void	sort_int_tab(int *tab, unsigned int size);

int main(){
	int tab[5] = {5, 4, 3, 2, 1};
	sort_int_tab(tab, 5);
	for (int i = 0; i < 5; i++)
		printf("%d ", tab[i]);
	return 0;
}
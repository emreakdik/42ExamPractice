// TO DO: NEEDS TO HANDLE MALLOC FAILURES AND FREE MEMORY
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

/* basic logic of the program: 
- use factorial function to calculate how many permutations there are 
for a given number of unique characters (i.e. the size of the given string)
- use malloc to create a matrix (char **all_perms) to hold all permutations.
- the number of rows in the matrix equals the total number of permutations possible,
and the number of columns in each row equals the size of the original string given, plus nul-terminator.
- use recursion to generate permutations and copy them into the matrix one at a time.
- sort the permutations in the matrix using strcmp function and bubble sort algorithm.
- print out the sorted matrix.
*/


int ft_strlen(char *s)
{
	int i = 0;
	while (s[i])
		i++;
	return i;
}

// calculate the total number of permutations possible
int ft_factorial(int size)
{
	if (size <= 1)
		return 1;
	return (size * ft_factorial(size - 1));
}

void	ft_strcpy(char *dest, char *s)
{
	int i;
	for (i = 0; s[i]; i++)
		dest[i] = s[i];
	dest[i] = '\0';
}

// recursive function to generate all permutations and store them in the matrix
void generate_all_perms(int current_index, int size, char *s, char **all_perms, int *perms_row_index)
{
	// base case: reaching end of the string
	if (current_index == size)
	{
		ft_strcpy(all_perms[(*perms_row_index)], s);
		(*perms_row_index)++; // Increment the index for the next permutation
		return ;
	}
	/* Start from the given current index in the string: 
	1) keep the character at the current index in its current position,
	which is implicit in the below loop logic 
	when the iterator i is equal to the current index (swapping 
	the character with itself -> nothing happens); OR 
	2) swap the character at the current index with each character to the right
	of itself (when iterator i is larger than the current index and smaller than size)
	If the current index is equal to size, print the permutation, else 
	keep operating similarly for all valid index positions. 
	Thereafter, swap back the values to original values to initiate backtracking.*/
	for (int i = current_index; i < size; i++)
	{
		char temp = s[i]; 
		s[i] = s[current_index];
		s[current_index] = temp;
		// recursive call to move to the next index position
		generate_all_perms(current_index + 1, size, s, all_perms, perms_row_index);
		// backtracking: swap the charaters again
		temp = s[i]; 
		s[i] = s[current_index];
		s[current_index] = temp;
	}
}

// simplified strcmp function that compares two strings with equal lengths
int ft_strcmp(char *s1, char *s2)
{
	int i = 0;
	while (s1[i] && s2[i])
	{
		if (s1[i] != s2[i])
			return (s1[i] - s2[i]);
		i++;
	}
	return 0;
}

// sorting permutations in the matrix based on alphabetic order
void sort_perms(char **all_perms, int total_perms)
{
	int i, j;
	for (i = 0; i < total_perms; i++)
	{
		for (j = i + 1; j < total_perms; j++)
		{
			if (ft_strcmp(all_perms[i], all_perms[j]) > 0)
			{
				char *tmp = all_perms[i];
				all_perms[i] = all_perms[j];
				all_perms[j] = tmp;
			}
		}
	}
}

void	print_perms(char **all_perms, int total_perms)
{
	for (int i = 0; i < total_perms; i++)
		puts(all_perms[i]);
}

// TO DO: NEEDS TO HANDLE MALLOC FAILURES AND FREE MEMORY
int main(int ac, char **av)
{
	// error handling
	if (ac != 2)
	{
		write(1, "\n", 1);
		return 0;
	}
	char *s = av[1];
	int size = ft_strlen(s); // number of unique (alphabetic) characters in the string 
	if (size == 0) 
	{
 		write(1, "\n", 1);
		return 0;
    }
	// Calculate the total number of permutations 
	int total_perms = ft_factorial(size);

	// Allocate memory for an array of char pointers.
    // Each pointer will point to a dynamically allocated string representing a permutation.
	char **all_perms = malloc(sizeof(char *) * total_perms);

	// Allocate memory for each individual permutation string.
    // Each string needs 'size + 1' bytes (for characters + null terminator)
	for (int i = 0; i < total_perms; i++)
		all_perms[i] = calloc(size + 1, sizeof(char));

	int perms_row_index = 0;
	int current_index = 0;
	generate_all_perms(current_index, size, s, all_perms, &perms_row_index);
	sort_perms(all_perms, total_perms);
	print_perms(all_perms, total_perms);
	return 0;
}

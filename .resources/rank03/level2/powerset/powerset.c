#include <stdio.h>
#include <stdlib.h>

// define global variables to avoid having to pass variables around
int required_sum; // integer n
int size; // the size of the set of integers
int *nums; // the set of integers

// print the subset, taking its size as parameter
// (we need to manually keep track of the size of an integer array)
void	print_subset(int subsize, int *subset)
{
	for(int i = 0; i < subsize; i++)
	{
		printf("%d", subset[i]);
		if(i < subsize -1 ) // trailing space only if it's not the last integer
			printf(" ");
	}
	printf("\n");
}

// calculate the actual sum of a given subset
int calcul_subset_sum(int subsize, int *subset)
{
	int actual_sum = 0;
	for (int i = 0; i < subsize; i++)
		actual_sum += subset[i];
	return actual_sum;
}

// recursive function to generate all subsets that sum to the required sum
void solve(int subsize, int current_index, int *subset)
{
	// Base case: if we've processed all numbers in the given set
	if (current_index == size)
	{
		// if the actual sum of subset meets the requirement 
		// and the subset is not an empty set
		if (calcul_subset_sum(subsize, subset) == required_sum && subsize != 0)
			print_subset(subsize, subset);
		return ;
	}

	// option 1: don't include current number
	// simply moves to next index position
	solve(subsize, current_index + 1, subset);

	// option 2: include current number
	// add current number into the subset, increment subset size
	subset[subsize] = nums[current_index]; 
	solve(subsize + 1, current_index + 1, subset);
}

// NOTE: The actual error handling requirements in the exam may be different!!!!!!!
// may need to check for duplicates in the given set of integers before calling solve() function
int main(int ac, char **av)
{
	// error handling: no arguments; just the required sum and no integer set
	if (ac <= 2)
	{
		printf("\n");
        return 0;
	}
	// parse required sum
	required_sum = atoi(av[1]);
	// calculate size of the integer set
	size = ac - 2;
	nums = malloc(sizeof(int) * size);
	if (!nums)
		return 1;
	int *subset = calloc(size, sizeof(int));
	if (!subset)
	{
		free(nums);
		return 1;
	}
	// parse integer set
	for (int i = 0; i < size; i++)
		nums[i] = atoi(av[i + 2]); // starting from the third argv
	// initialise subset size to 0
	int subsize = 0;
	int current_index = 0;
	solve(subsize, current_index, subset);
	free(nums);
	free(subset);
}

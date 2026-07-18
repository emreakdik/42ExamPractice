#include <unistd.h>
#include <stdio.h>

int ft_strlen(char *s)
{
	int i = 0;
	while (s[i])
		i++;
	return i;
}

// returns 0 if balanced already
int min_to_remove(char *s)
{
	int open = 0, close = 0;
	for (int i = 0; s[i]; i++)
	{
		if (s[i] == '(')
			open++;
		else if (s[i] == ')')
		{
			if (open > 0)
				open--; // try to set off the closed bracket by matching with an open bracket
			else
				close++; // only increment closed bracket count if it cannot be set off
		}
	}
	return (open + close);
}

void solve(int current_index, int total_to_remove, int num_removed, char *s)
{
	// base case check: string is balanced after removing the minimum number of parenthesis
	if (current_index == ft_strlen(s))
	{
		if (num_removed == total_to_remove && !min_to_remove(s))
			puts(s);
		return ;
	}
	 // Early termination: if we've already removed too many
	if (num_removed > total_to_remove)
		return ;
	if (s[current_index] == '(' || s[current_index] == ')')
	{
		// option 1: remove it
		char temp = s[current_index];
		s[current_index] = ' ';
		solve(current_index + 1, total_to_remove, num_removed + 1, s);
		s[current_index] = temp;
		// option 2: keep it
		solve(current_index + 1, total_to_remove, num_removed, s);
	}
	else // For spaces or other characters, just continue
		solve(current_index + 1, total_to_remove, num_removed, s);
}

int main(int argc, char **argv)
{
	// error handling for incorrect argc
	if (argc != 2)
	{
		write(1, "\n", 1);
		return 0;
	}
	char *s = argv[1];
	// checking if already balanced
	if (!min_to_remove(s))
	{
		puts(s);
		return 0;
	}
	// recursive solve
	solve(0, min_to_remove(s), 0, s);
	return 0;
}


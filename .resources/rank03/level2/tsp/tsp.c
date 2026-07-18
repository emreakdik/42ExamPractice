#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <stdbool.h>
#include <sys/types.h>
#include <float.h> // add this library for FLT_MAX
// Remember to compile with the -lm flag!

/* This approach to solving the Traveling Salesman Problem 
leverages a brute-force permutation generation strategy,
which works quite well with a small size (N <= 11).
The recursive backtracking function used here (generate_perms()) is structured similarly 
to the one used in my solution to another Rank 03 exam question "permutations" 
(also in my repo). I would recommend studying them side by side.

You first initialize an array with city indices (0 to N-1). 
Then, you use a recursive backtracking function (Heap's algorithm variant) 
to systematically generate every possible ordering (permutation) of these city indices. 
For each complete permutation, you calculate the total tour length 
by summing the distances between consecutive cities and 
adding the distance from the last city back to the first, 
updating a best_distance variable if a shorter path is found.*/

// compute the distance between two points
float    distance(float a[2], float b[2])
{
    return sqrtf((b[0] - a[0]) * (b[0] - a[0]) + (b[1] - a[1]) * (b[1] - a[1]));
}


/* YOUR FUNCTIONS START HERE */


// Calculates the total distance of a given path (permutation of city indices).
// array: The main array of city coordinates.
// perm: An array representing the order of city indices for the current path.
// size: The total number of cities.
// Returns the total distance as a float.
float calc_total_distance(float (*array)[2], int *perm, int size)
{
	int city_index_current;
	int city_index_next;
	int i;
	float actual_distance = 0.0f;
	// Sum distances between consecutive cities in the permutation.
	for (i = 0; i < size - 1; i++)
	{
		city_index_current = perm[i];
		city_index_next = perm[i + 1];
		actual_distance += distance(array[city_index_current], array[city_index_next]);
	}
	// Add distance from the last city back to the first city to close the loop.
	city_index_current = perm[i]; // i is now (size - 1) from the loop
	city_index_next = perm[0]; // First city in the permutation
	actual_distance += distance(array[city_index_current], array[city_index_next]);
	return (actual_distance);
}	

// Main function: uses standard backtracking method to generate permutations
// Generates all permutations of 'mutable_array' and calculates their path lengths.
// array: The main array of city coordinates.
// mutable_array: The array whose elements are being permuted (its content changes during recursion).
// size: The number of elements in the array/permutation.
// mutable_index_current: The starting index for the current permutation generation step (current depth).
// best_distance: A pointer to a float variable that stores the minimum distance found so far.
void generate_perms(float (*array)[2], int *mutable_array, int size,
					int mutable_index_current, float *best_distance)
{
	// Base case: If mutable_index_current reaches size, 
	// a complete permutation has been formed.
	if (mutable_index_current == size)
	{
		float actual_distance = calc_total_distance(array, mutable_array, size);
		if (actual_distance < *best_distance)
			*best_distance = actual_distance;
		return ;
	}
	// Recursive step: Iterate from mutable_index_current to size-1 
	// to choose the element for current_index.
	for (int i = mutable_index_current; i < size; i++)
	{
		// Swap elements to create a new arrangement for the current level.
		int temp = mutable_array[mutable_index_current];
		mutable_array[mutable_index_current] = mutable_array[i];
		mutable_array[i] = temp;
		// Recurse to generate permutations for the rest of the array (next level)
		generate_perms(array, mutable_array, size, mutable_index_current + 1,
						best_distance);
		// Backtrack: Swap back to restore the array to its state before the recursive call,
        // allowing other permutations to be generated correctly for the current level.
		temp = mutable_array[mutable_index_current];
		mutable_array[mutable_index_current] = mutable_array[i];
		mutable_array[i] = temp;
	}
}

// Main function to solve the Traveling Salesman Problem.
// (the skeleton function has been provided, you need to fill in the blanks.)
// array: A pointer to an array of city coordinates ([x, y] pairs).
// size: The number of cities in the array.
// Returns the length of the shortest possible closed path visiting all cities.
float tsp(float (*array)[2], ssize_t size)
{
    float best_distance;
    
	
	// ... YOUR CODE STARTS HERE 


	best_distance = FLT_MAX; // initialise best distance to a very large number 
	
	 // Handle edge cases for 0 or 1 city: the path length is 0.
    if (size <= 1) {
        return 0.0f;
    }
	// Create an integer array ranging from 0 to size - 1.
    // This array will hold the indices of cities and will be permuted.
	int *mutable_array = malloc(sizeof(int) * size);
	if (!mutable_array)
		return FLT_MAX; // return a very large number to signify error
	
	for (int i = 0; i < size; i++)
		mutable_array[i] = i;

	// Generate permutations and find the best distance.
    // Optimization: Start generating permutations from index 1 (mutable_index_current = 1)
    // while implicitly fixing the city at index 0 in mutable_array[0].
    // This reduces the number of permutations from N! to (N-1)! for a closed loop.
	int mutable_index_start = 1;
	generate_perms(array, mutable_array, size, mutable_index_start, &best_distance);
	free(mutable_array);


	// ... YOUR CODE ENDS 


    return (best_distance);
}


/* YOUR FUNCTIONS END HERE */


// Function to determine the number of lines (cities) in a file.
// file: A pointer to the FILE stream.
// Returns the number of lines, or -1 on error.
ssize_t    file_size(FILE *file)
{
    char    *buffer = NULL;
    size_t    n = 0;
    ssize_t ret;

    errno = 0;
	// Read lines one by one to count them.
    for (ret = 0; getline(&buffer, &n, file) != -1; ret++);

    free(buffer); // Free the buffer allocated by getline
    if (errno || fseek(file, 0, SEEK_SET))
        return -1;
    return ret;
}

// Function to read city coordinates from a file into an array.
// array: A pointer to an array of float[2] where coordinates will be stored.
// 		It is a 2D array where each "row" has exactly 2 columns 
// 		(e.g., float coordinates[N][2]). 
// 		Each float[2] represents a single city's [x, y] coordinates.
// file: A pointer to the FILE stream to read from.
// Returns 0 on success, -1 on error.
int        retrieve_file(float (*array)[2], FILE *file)
{
    int tmp;
	// Loop through the file, reading two floats per line.
    for (size_t i = 0; (tmp = fscanf(file, "%f, %f\n", array[i] + 0, array[i] + 1)) != EOF; i++)
        if (tmp != 2) // If fscanf didn't read exactly two floats, it's an error.
        {
            errno = EINVAL;
            return -1;
        }
	// Check for any other file reading errors (e.g., I/O error).
    if (ferror(file))
        return -1;
    return 0;
}

int        main(int ac, char **av)
{
    char *filename = "stdin"; // Default input is standard input.
    FILE *file = stdin; // Default file pointer is stdin.
	// If a filename is provided as a command-line argument, open that file.
    if (ac > 1)
    {
        filename = av[1];
        file = fopen(filename, "r");
    }
	// Check if the file was opened successfully.
    if (!file)
    {
        fprintf(stderr, "Error opening %s: %m\n", filename);
        return 1;
    }
	// Determine the number of cities (lines) in the file.
    ssize_t size = file_size(file);
    if (size == -1)
    {
        fprintf(stderr, "Error reading %s: %m\n", filename);
        fclose(file);
        return 1;
    }
	// Allocate memory for the array to store city coordinates.
    float (*array)[2] = calloc(size, sizeof (float [2]));
    if (!array)
    {
        fprintf(stderr, "Error: %m\n");
        fclose(file);
        return 1;
    }
	// Retrieve city coordinates from the file into the array.
    if (retrieve_file(array, file) == -1)
    {
        fprintf(stderr, "Error reading %s: %m\n", av[1]);
        fclose(file);
        free(array);
        return 1;
    }
	// Close the file if it was opened (i.e., not stdin).
    if (ac > 1)
        fclose(file);

    // Calculate and print the shortest path length, formatted to two decimal places.
    printf("%.2f\n", tsp(array,	 size));
    free(array);
    return (0);
}



#include <stdio.h>   // For fprintf, perror
#include <string.h>  // For strlen
#include <unistd.h>  // For read, write, STDIN_FILENO, STDOUT_FILENO
#include <stdlib.h>  // For malloc, free

// Define the maximum buffer size. We add +1 for the null terminator,
// ensuring we can store up to 10k bytes of actual content safely.
#define MAX_INPUT_BUFFER_SIZE (10000 + 1)

// Custom ft_strncmp function:
// Compares the first 'n' characters of two strings.
// Returns 1 if all 'n' characters match, 0 otherwise.
// Note: This is a simplified strncmp that only checks for equality,
// not lexicographical order, which is sufficient for this problem.
int ft_strncmp(char *s1, char *s2, int n) {
    int i = 0;
    // Loop as long as 'i' is within 'n' bounds and characters at s1[i] and s2[i] are identical.
    while (i < n && s1[i] == s2[i]) {
        i++;
    }
    // If 'i' reached 'n', it means all 'n' characters matched.
    if (i == n) {
        return 1;
    } else {
        return 0; // Mismatch found or 'n' characters not reached.
    }
}

int main(int ac, char **av) {
    // --- 1. Argument Handling (IMPORTANT ERROR HANDLING) ---
    // The program requires exactly one argument (argc == 2).
    // The argument must not be NULL and its length must be greater than 0.
    if (ac != 2 || av[1] == NULL || strlen(av[1]) == 0) {
        return 1; // Return 1 as specified for incorrect argument usage.
    }

    // --- 2. Memory Allocation ---
    // Allocate a large buffer to store the entire input from stdin.
    // MAX_INPUT_BUFFER_SIZE includes space for the null terminator.
    char *buff = (char *)malloc(MAX_INPUT_BUFFER_SIZE);

    // --- Malloc Error Handling (IMPORTANT ERROR HANDLING) ---
    // Check if malloc failed. If it returns NULL, memory allocation failed.
    if (buff == NULL) {
        fprintf(stderr, "Error: "); // Print "Error: " to standard error.
        perror("");                 // Print the system's error message (e.g., "Cannot allocate memory").
        return 1;                   // Return 1 as specified for malloc errors.
    }

    char *search_str = av[1];           // Pointer to the search string (e.g., "bonjour")
    char current_char;                  // Temporary storage for a single character read from stdin
    ssize_t bytes_read_result;          // Stores the return value of read() (number of bytes read, 0 for EOF, -1 for error)
    int buff_idx = 0;                   // Index to track the current position in 'buff' while reading
    int search_len = strlen(search_str); // Length of the search string

    // --- 3. First Loop: Read all input from stdin into 'buff' ---
    // Reads one character at a time until EOF (bytes_read_result == 0),
    // an error occurs (bytes_read_result == -1), or the buffer is full.
    while ((bytes_read_result = read(STDIN_FILENO, &current_char, 1)) > 0) {
        // Prevent buffer overflow: Stop reading if we're about to exceed the allocated space.
        // MAX_INPUT_BUFFER_SIZE - 1 ensures we always have space for the null terminator.
        if (buff_idx >= MAX_INPUT_BUFFER_SIZE - 1) {
            break; // Buffer is full, stop reading further input.
        }
        buff[buff_idx++] = current_char; // Store the character in 'buff' and increment index.
    }

    // --- Read Error Handling (IMPORTANT) ---
    // After the reading loop, check if the last read operation resulted in an error.
    if (bytes_read_result == -1) {
        fprintf(stderr, "Error: "); // Print "Error: " to standard error.
        perror("");                 // Print the system's error message.
        free(buff);                 // Free the allocated memory before exiting.
        return 1;                   // Return 1 as specified for read errors.
    }

    // --- Null-terminate the buffer ---
    // This is crucial for string functions like ft_strncmp that rely on string boundaries.
    // 'buff_idx' now holds the total number of characters successfully read.
    buff[buff_idx] = '\0';

    // --- 4. Second Loop: Process 'buff' and write to stdout ---
    int process_idx = 0; // Index for iterating through 'buff' for processing and output.
    while (buff[process_idx] != '\0') { // Loop until the null terminator is reached (end of valid input).
        // Check for a match of 'search_str' starting at 'buff[process_idx]':
        // 1. Ensure there are enough characters remaining in the *valid part* of 'buff'
        //    for a full 'search_str' match. (process_idx + search_len <= buff_idx)
        // 2. Call ft_strncmp to compare the substring with 'search_str'.
        if (process_idx + search_len <= buff_idx &&
            ft_strncmp(&buff[process_idx], search_str, search_len) == 1)
        {
            // If a match is found:
            // Write 'search_len' number of asterisks to standard output.
            for (int y = 0; y < search_len; y++) {
                write(STDOUT_FILENO, "*", 1); // write one '*' at a time.
            }
            // Advance the processing index past the matched string.
            process_idx += search_len;
        } else {
            // If no match at the current position:
            // Write the current character from 'buff' to standard output.
            write(STDOUT_FILENO, &buff[process_idx], 1); // write the character itself.
            // Advance the processing index by one character.
            process_idx++;
        }
    }

    // --- 5. Memory Cleanup ---
    free(buff); // Free the dynamically allocated memory before exiting.

    return 0; // Program executed successfully.
}

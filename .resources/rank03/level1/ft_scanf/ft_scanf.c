#include <stdarg.h>
#include <stdio.h>
#include <ctype.h>

/* YOUR FUNCTIONS START HERE (function signatures have been provided) */


/*
 * match_space: Consumes leading whitespace characters from the input stream.
 * @f: The file stream to read from (e.g., stdin).
 * Returns: 0 on success (whitespace consumed or no whitespace found),
 * -1 if EOF or an error occurs while reading.
 */
int match_space(FILE *f)
{
	int c; // variable to hold the character read using fgetc()
	while ((c = fgetc(f)) != EOF) // Read a character from the stream till EOF
	{
		if (!isspace(c)) // If it's not a whitespace character
		{
			ungetc(c, f); // Put the character back into the stream
			return 0; // Successfully consumed leading whitespace (or found none)
		}
	}
	if (ferror(f)) // loop terminated due to EOF triggered, check read errors
		return -1;
	// If it's just EOF and no error, we've successfully consumed all possible spaces
    return (0);
}

/*
 * match_char: Reads a single character from the input stream and compares it
 * to a specified character.
 * @f: The file stream to read from.
 * @c: The character to match.
 * Returns: 1 if the character matches and is consumed,
 * 0 if the character does not match (and is put back),
 * -1 if EOF or an error occurs.
 */
int match_char(FILE *f, char c)
{
	int c_read = fgetc(f); // the char read from input stream
	if (c_read == EOF) // if the char read is EOF
	{
		if (ferror(f)) // check for read errors
			return -1;
		return 0; // If it's just EOF and no error, no match found
	}
	if (c_read == c)
		return 1; // match found and consumed
	else
	{
		ungetc(c_read, f); // put the char back to the file stream
		return (0);  // no match found
	}
}

/*
 * scan_char: Reads a single character from the input stream and stores it
 * into the char pointer provided via va_list.
 * Does not skip leading whitespace.
 * @f: The file stream to read from.
 * @ap: The va_list containing the argument pointer (char *).
 * Returns: 1 on successful scan,
 * 0 if no character could be read (e.g., EOF immediately),
 * -1 if an error occurs.
 */
int scan_char(FILE *f, va_list ap)
{
    int c = fgetc(f); // read a character
	if (c == EOF)
	{
		if (ferror(f)) // check for read errors
			return -1;
		return 0; // If it's just EOF and no error, means no character available to read
	}
	char *c_ptr = va_arg(ap, char *); // Get the char* argument from va_list
	*c_ptr = (char)c; // Store the character
    return (1); // Successfully scanned one character
}

/*
 * scan_int: Reads an integer from the input stream and stores it
 * into the int pointer provided via va_list.
 * Assumes leading whitespace has already been handled by match_space.
 * @f: The file stream to read from.
 * @ap: The va_list containing the argument pointer (int *).
 * Returns: 1 on successful scan,
 * 0 if no valid integer could be read (e.g., no digits found),
 * -1 if an error occurs.
 * NOTE! no need to handle overflows as the original scanf's behavior 
 * on overflow is undefined.
 */
int scan_int(FILE *f, va_list ap)
{
    int c = fgetc(f); // read a character

	// Step 0: check EOF & read errors
	if (c == EOF)
	{
		if (ferror(f)) // check for read errors
			return -1;
		return 0; // If it's just EOF and no error, means no character available to read
	}

	// Step 1: sign processing
	// check if the character read represents a sign character '+'/'-'
	int sign = 1; // initialise it to positive
	if (c == '+' || c == '-')
	{
		if (c == '-') // only modify the sign when encountering '-'
			sign = -1;
	}
	else
		ungetc(c, f); // Not a sign, put it back for digit processing later
	
	// Step 2: digits processing
	int value = 0; 
	int digits_read = 0; // keep track of how many digits have been read
	while ((c = fgetc(f)) != EOF)
	{
		if (isdigit(c))
		{
			value = value * 10 + (c - '0');
			digits_read++;
		}
		else
		{
			ungetc(c, f); // not a digit, put it back
			break ; // stop reading
		}
	}

	// loop ends, check if it was due to read errors
	if (ferror(f))
		return -1;

	if (digits_read == 0) // check if no digits have been read
		return 0;
	
	// Step 3: store the converted integer
	int *num_ptr = va_arg(ap, int *); // get the int * argument
	*num_ptr = value * sign; // Store the scanned integer

    return (1); // Successfully scanned an integer
}

int scan_string(FILE *f, va_list ap)
{
    int c = fgetc(f); // read a character

	// Step 0: check EOF & read errors
	if (c == EOF)
	{
		if (ferror(f)) // check for read errors
			return -1;
		return 0; // If it's just EOF and no error, means no character available to read
	}
	ungetc(c, f); // if not EOF, put it back

	char *s = va_arg(ap, char *);
	int char_read = 0; // keep track of how many characters have been read
	while ((c = fgetc(f)) != EOF)
	{
		if (isspace(c))
		{
			ungetc(c, f);
			break ;
		}
		*s = (char)c;
		s++;
		char_read++;
	}
	if (ferror(f)) // check for read errors
		return -1;

	if (!char_read) // No non-whitespace characters were read
		return 0;

	*s = '\0'; // null terminate the string
    return (1); // Successfully scanned a string
}


/* YOUR FUNCTIONS END HERE */ 



/*
 * match_conv: Dispatches to the appropriate scan function based on the format specifier.
 * @f: The file stream.
 * @format: The conversion specifier character ('c', 'd', 's').
 * @ap: The va_list.
 * Returns: 1 on successful conversion,
 * 0 if input does not match the conversion (e.g., no digits for %d),
 * -1 if EOF or an error occurs during scanning.
 */
int	match_conv(FILE *f, const char **format, va_list ap)
{
	switch (**format)
	{
		case 'c':
			return scan_char(f, ap);
		case 'd':
			match_space(f);
			return scan_int(f, ap);
		case 's':
			match_space(f);
			return scan_string(f, ap);
		case EOF:
			return -1;
		default:
			return -1;
	}
}

/*
 * ft_vfscanf: The core function that parses the format string and reads from the stream.
 * Similar to vfscanf.
 * @f: The file stream to read from.
 * @format: The format string.
 * @ap: The va_list containing the arguments.
 * Returns: The number of successfully matched and assigned input items,
 * EOF if an input failure occurs before any data could be successfully read.
 */
int ft_vfscanf(FILE *f, const char *format, va_list ap)
{
	int nconv = 0;

	int c = fgetc(f);
	if (c == EOF)
		return EOF;
	ungetc(c, f);

	while (*format)
	{
		if (*format == '%')
		{
			format++;
			if (match_conv(f, &format, ap) != 1)
				break;
			else
				nconv++;
		}
		else if (isspace(*format))
		{
			if (match_space(f) == -1)
				break;
		}
		else if (match_char(f, *format) != 1)
			break;
		format++;
	}
	
	if (ferror(f))
		return EOF;
	return nconv;
}


/* YOU NEED TO DECLARE, INITIALISE AND CLEAN UP THE VA_LIST IN THE BELOW FUNCTION */


/*
 * ft_scanf: Mimics the behavior of scanf, reading formatted input from stdin.
 * @format: The format string.
 * @...: Variable arguments corresponding to the format specifiers.
 * Returns: The number of successfully matched and assigned input items,
 * EOF if an input failure occurs before any data could be successfully read.
 */
int ft_scanf(const char *format, ...)
{
	va_list ap; // Declare a va_list variable
	va_start(ap, format); // Initialize va_list to point to the first variadic argument
	int ret = ft_vfscanf(stdin, format, ap);
	va_end(ap); // Clean up va_list
	return ret;
}

// The main() is FOR TESTING ONLY!!! 

// int main()
// {
// 	int number;
// 	char character;
// 	char string[500];
// 	// ft_scanf("%d", &number);
// 	// ft_scanf("%c", &character);
// 	// ft_scanf("%s", &string);
// 	ft_scanf("%d %c %s", &number, &character, &string);
// 	printf("the number you entered is %d\n", number);
// 	printf("the character you entered is %c\n", character);
// 	printf("the string you entered is %s\n", string);
// 	return 0;
// }

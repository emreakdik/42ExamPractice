void	write_string(char *str);

int	main(int argc, char **argv)
{
	if (argc > 1)
		write_string(argv[1]);
	else
		write_string(0);
	return (0);
}

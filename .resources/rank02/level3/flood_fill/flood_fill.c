
typedef struct 	s_point {
	int			x;				// x : Width  | x-axis
	int			y;				// y : Height | y-axis
}				t_point;
 
void fill(char **tab, t_point size, int x, int y, char target)
{
    if(x < 0 || y < 0 || x>= size.x || y>= size.y)
        return ;
    if( tab[y][x] != target)
        return ;
    
    tab[y][x] = 'F';

    fill(tab, size, x+1, y, target);
    fill(tab, size, x-1, y, target);
    fill(tab, size, x, y+1, target);
    fill(tab, size, x, y-1, target);
}

void flood_fill(char **tab, t_point size, t_point begin)
{
    char target=tab[begin.y][begin.x];
    fill(tab, size, begin.x, begin.y, target);

}

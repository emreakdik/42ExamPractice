#include <stdlib.h>


int ft_strlen(char *str){

    int i = 0;
    while(str[i])
        i++;
    return i;
}

char	*ft_strncpy(char *dest, char *src, unsigned int n)
{
	unsigned int	i;

	i = 0;
	while (i < n && src[i] != '\0')
	{
		dest[i] = src[i];
		++i;
	}
	while (i < n)
	{
		dest[i] = '\0';
		i++;
	}
	return (dest);
}

char **ft_split(char *str){

    int i = 0;
    int j = 0;
    int k = 0;
    int word_count = 0;
    int len = ft_strlen(str);

    while(i < len){

        while (str[i] && (str[i] == ' ' || str[i] == '\t' || str[i] == '\n'))
            i++;
        if(str[i]){
            word_count++;
            while(str[i] && !(str[i] == ' ' || str[i] == '\t' || str[i] == '\n'))
                i++;
        }
    }
    char **result = (char **)malloc(sizeof(char) * (word_count + 1));
    if(!result)
        return 0;
    i = 0;
    while (i < len){
        while (str[i] && (str[i] == ' ' || str[i] == '\t' || str[i] == '\n'))
            i++;
        if(str[i]){
            j = i;
            while (str[j] && (str[j] != ' ' && str[j] != '\t' && str[j] != '\n')) 
                j++;
            result[k] = (char *)malloc(sizeof(char) * (j - i + 1));
            if(!result[k])
                return 0;
            ft_strncpy(result[k], str + i, j - i);
            result[k][j - i] = '\0';
            k++;
            i = j;
        }
    }
    result[k] = '\0';
    return result;
}
char    *ft_strdup(char *src){

    int i = 0;
    
    while (src[i])
        i++;
    char *dest = (char *)malloc(sizeof(char) * (i + 1));
    i = 0;
    while (src[i]){
        dest[i] = src[i];
        i++;
    }
    dest[i] = '\0';
    return (dest);
}
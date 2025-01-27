/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: xmatute- <xmatute-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/12/03 15:09:59 by xmatute-          #+#    #+#             */
/*   Updated: 2025/01/27 18:55:23 by xmatute-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

# include <stddef.h>
# include <stdlib.h>

extern size_t   ft_strlen(const char *s);
extern char     *ft_strcpy(char *dst, const char *src);
extern int      ft_strcmp(const char *s1, const char *s2);
extern ssize_t  ft_write(int fd, const void *buf, size_t count);
extern ssize_t  ft_read(int fd, void *buf, size_t count);
extern char     *ft_strdup(const char *s);

#include <stdio.h>
#include <string.h>

int strlen_test(char *str)
{
    printf("str: %s\n", str);
    printf("strlen: %zu\n", strlen(str));
    printf("ft_strlen: %zu\n", ft_strlen(str));
    if (ft_strlen(str) == strlen(str))
    {
        printf("ft_strlen: OK\n");
        return (1);
    }
    else
    {
        printf("ft_strlen: KO\n");
        return (0);
    }
}

int strcpy_test(char *str)
{
    char *cpy = malloc(strlen(str) + 1);
    char *ft_cpy = malloc(strlen(str) + 1);

    printf("str: %s\n", str);
    printf("strcpy: %s\n", strcpy(cpy, str));
    printf("ft_strcpy: %s\n", ft_strcpy(ft_cpy, str));
    printf("ft_strcpy: %s\n", ft_cpy);
    if (strcmp(cpy, ft_cpy) == 0)
    {
        printf("ft_strcpy: OK\n");
        free(cpy);
        free(ft_cpy);
        return (1);
    }
    else
    {
        printf("ft_strcpy: KO\n");
        free(cpy);
        free(ft_cpy);
        return (0);
    }
}

int strcmp_test(char *s1, char *s2)
{
    printf("s1: %s\n", s1);
    printf("s2: %s\n", s2);
    printf("strcmp: %d\n", strcmp(s1, s2));
    printf("ft_strcmp: %d\n", ft_strcmp(s1, s2));
    if (ft_strcmp(s1, s2) == strcmp(s1, s2))
    {
        printf("ft_strcmp: OK\n");
        return (1);
    }
    else
    {
        printf("ft_strcmp: KO\n");
        return (0);
    }
}

int main()
{
    char *str = strdup("Agur Pallete!");

    strlen_test(str);
    strcpy_test(str);
    strcmp_test(str, str);
    strcmp_test(str, "Hola Manolo!");
    
    printf("\n");
    free(str);
    
    char *empty_str = strdup("");

    strlen_test(empty_str);
    strcpy_test(empty_str);
    strcmp_test(empty_str, empty_str);

    free(empty_str);
    
    return (0);
}